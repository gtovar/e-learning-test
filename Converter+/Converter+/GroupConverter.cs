using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using Excel = Microsoft.Office.Interop.Excel;
using System.Windows.Forms;

namespace Converter
{
    class GroupConverter : Converter
    {
        public override void ConvertDocument(string docPath, string xmlPath, List<string> structDocument = null, ProgressBar bar = null)
        {
            Excel.Application program;
            Excel.Workbook book = OpenExcelFile(docPath, out program);

            try
            {

                List<string> specialities = new List<string>();
                List<string> abbreviation = new List<string>();
    
                specialities.Add("Информационные технологии");
                specialities.Add("Прикладная математика и информатика");
                specialities.Add("Прикладная информатика");

                abbreviation.Add("ИТ");
                abbreviation.Add("ПМИ");
                abbreviation.Add("ПИ");
                
                Excel.Sheets sheets = book.Sheets;
                Excel.Worksheet sheet = (Excel.Worksheet)sheets.get_Item("Сводный");
                Excel.Worksheet sheet2;
                Excel.Range cell;

                XmlTextWriter writer = new XmlTextWriter(xmlPath, System.Text.Encoding.Default);
                writer.Formatting = Formatting.Indented;

                writer.WriteStartDocument();
                writer.WriteStartElement("groups");

                List<string> groups = new List<string>();
                int i = 2;
                int countEmpty= 0;
                string number;
                string specialityAbbreviation;

                while (countEmpty !=5)
                {
                    cell = sheet.get_Range("A" + i, Type.Missing);

                    number = Convert.ToString(cell.Value2);

                    if (number == null)
                    {
                        i++;
                        countEmpty++;
                        continue;
                    }

                    number = number.Trim();

                    if (groups.IndexOf(number) == -1)
                    {
                        writer.WriteStartElement("group");

                        writer.WriteAttributeString("number", number);

                        if (number[0] != '0')
                        {
                            sheet2 = (Excel.Worksheet)sheets.get_Item("0" + number);                           
                        }
                        else
                        {
                            sheet2 = (Excel.Worksheet)sheets.get_Item(number);
                        }

                        cell = sheet2.get_Range("A1", Type.Missing);

                        bool fl = false;
                        if (cell.Value2 != null)
                        {
                            specialityAbbreviation = Convert.ToString(cell.Value2);
                            for (int j = 0; j < specialities.Count; j++ )
                            {
                                if (specialityAbbreviation.Replace(" ", "").ToLower().IndexOf(specialities[j].Replace(" ", "").ToLower()) != -1)
                                {
                                    writer.WriteAttributeString("specialityAbbreviation", abbreviation[j]);
                                    fl = true;
                                    break;
                                }
                            }

                        }  
                        if (!fl)
                            writer.WriteAttributeString("specialityAbbreviation", "Отсутствует");

                        writer.WriteEndElement();

                        groups.Add(number);
                        countEmpty++;
                    }

                    i++;
                }

                writer.WriteEndElement();
                writer.WriteEndDocument();
                writer.Close();

                this.Message.Add("Конвертирование выполнено");

                //CloseExcelFile(program);
            }
            catch
            {
                this.Message.Add("Во время конвертирования произошла ошибка");
            }
            finally
            {
                CloseExcelFile(program);
            }
        }
    }
}

