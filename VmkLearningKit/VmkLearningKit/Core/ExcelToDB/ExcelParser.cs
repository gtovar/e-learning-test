using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using Microsoft.Office.Core;
using Excel = Microsoft.Office.Interop.Excel;

namespace VmkLearningKit.Core.ExcelToDB
{
    public class ExcelParser
    {
        Excel.Application excelApp = null;

        Excel.Workbook workbook = null;

        Excel.Sheets sheets = null;

        byte workSheetIndex = 1;
        Excel.Worksheet workSheet = null;

        static ExcelParser excelParser = null;

        private ExcelParser() { }

        public void Open() { }

        private bool Open(string filePath)
        {
            excelApp = new Excel.Application();
            if (null != excelApp)
            {
                workbook = excelApp.Workbooks.Open(filePath,
                Type.Missing, Type.Missing, Type.Missing, Type.Missing,

                Type.Missing, Type.Missing, Type.Missing, Type.Missing,

                Type.Missing, Type.Missing, Type.Missing, Type.Missing,

                Type.Missing, Type.Missing);
                if (null != workbook)
                {
                    sheets = workbook.Worksheets;
                    if (null != sheets)
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        public void SetWorkPage(byte index)
        {
            workSheetIndex = index;
            try
            {
                workSheet = (Excel.Worksheet)sheets.get_Item(workSheetIndex);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("ExcelParser.SetWorkPage: catch exception", ex);
            }
        }

        public int GetMaxColumnCount()
        {
            if (null != workSheet)
            {
                return workSheet.Columns.Count;
            }

            return -1;
        }

        public int GetMaxRowCount()
        {
            if (null != workSheet)
            {
                return workSheet.Rows.Count;
            }

            return -1;
        }

        public string GetCell(int rowIndex, int columnIndex)
        {
            string value = string.Empty;
            try
            {
                string index = Transliteration.Letters[(columnIndex - 1) % Transliteration.Letters.Length] + rowIndex;
                if (null != workSheet)
                {
                    Excel.Range range = workSheet.get_Range(index, index);
                    if (null != range)
                    {
                        value = range.Value2.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("ExcelParser.GetCell: catch exception", ex);
            }

            return value;
        }

        public void Close()
        {
            if (null != excelApp)
            {
                excelApp.Quit();
            }
        }

        public static ExcelParser GetExcelParser(string filePath)
        {
            if (null == excelParser)
            {
                if (null != filePath && !filePath.Trim().Equals(String.Empty) && File.Exists(filePath))
                {
                    excelParser = new ExcelParser();
                    if (!excelParser.Open(filePath))
                    {
                        excelParser = null;
                    }
                }
            }
            return excelParser;
        }
    }
}
