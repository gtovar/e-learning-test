using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using Excel = Microsoft.Office.Interop.Excel;
using System.Text.RegularExpressions;

namespace Converter
{

    enum degree { BACHELOR, MASTER };

    class EducationPlanConverter: Converter
    {
        degree educationPLanDegree = degree.BACHELOR;
        string educationPLanTitle = "";
        string category1Title = "";
        const int listNumber = 2;
        Excel.Application program;
        Excel.Workbook book ;
        Excel.Sheets sheets;
        Excel.Worksheet sheet;

        XmlTextWriter writer;

        List<Term> terms ;
        string specialityCode = "";
        int examCol = 0, testsCol = 0, cursProjCol = 0, cursWorkCol = 0, disciplineCodeCol = 0,disciplineNameCol = 0, teacherNameCol = 0;
                        
        int currentRow=0;
        int currentCol=0;

        int row_max;
        int column_max;

        public override void ConvertDocument(string docPath, string xmlPath, List<string> structDocument = null)
        {

             educationPLanDegree = degree.BACHELOR;
             educationPLanTitle = "";
             category1Title = "";
             book = OpenExcelFile(docPath, out program);
             sheets = book.Sheets;
            sheet = (Excel.Worksheet)sheets.get_Item(listNumber);

            writer = new XmlTextWriter(xmlPath, System.Text.Encoding.Default);
            writer.Formatting = Formatting.Indented;

             terms = new List<Term>();
            specialityCode = "";
            examCol = testsCol = cursProjCol = cursWorkCol =disciplineCodeCol = disciplineNameCol = teacherNameCol = 0;
                        
            currentRow=0;
            currentCol=0;

            row_max = sheet.Cells.SpecialCells(Excel.XlCellType.xlCellTypeLastCell).Row;
            column_max = sheet.Cells.SpecialCells(Excel.XlCellType.xlCellTypeLastCell).Column;


            try
            {
                specialityCode = Regex.Match(sheet.Cells.Find("по направлению").Value, @"\d\d\d+\.\d+").Value;
            }
            catch
            {
                try
                {
                    specialityCode = Regex.Match(sheet.Cells.Find("по направлению").Value, @"\d\d\d+").Value;
                }
                catch
                {

                    this.Message.Add("Ошибка в шаблоне - не найден код специальности");
                }
            }

            try
            {
                educationPLanTitle = sheet.Cells.Find("Степень - бакалавр").Value;
                educationPLanDegree = degree.BACHELOR;
            }
            catch
            {
                try
                {
                    educationPLanTitle = sheet.Cells.Find("Степень - магистр").Value + ". "+ sheet.Cells.Find("Магистерская программа").Value;
                    educationPLanDegree = degree.MASTER;
                }
                catch
                {
                    this.Message.Add("Ошибка в шаблоне - не найдена ученая степень");
                }
            }


            // разбираем количество семестров и недель в них
            Excel.Range tmpCell = sheet.Cells.Find("Распределение по курсам и семестрам");
            currentRow = tmpCell.Row;
            currentCol = tmpCell.Column;
            try 
            { 
                Regex.IsMatch(Convert.ToString(sheet.Cells[currentRow + 1, currentCol].Value), @"\d\s*курс"); 
            } 
            catch
            {
                this.Message.Add("Ошибка в шаблоне - 'распредедение по курсам и семестрам'(не указаны номера курсов )");
            }
            currentRow = currentRow + 2;

            Term tmpTerm;
            try
            {
                string nextTerm = Convert.ToString(Regex.Match(Convert.ToString(sheet.Cells[currentRow, currentCol].Value), @"\d+\s+семестр.*недель").Value);
                do
                {
                    tmpTerm.number = Convert.ToInt32(Regex.Match(Regex.Match(nextTerm, @"\d+\sсеместр").Value, @"\d+").Value);
                    tmpTerm.weeks = Convert.ToInt32(Regex.Match(Regex.Match(nextTerm, @"\d+\sнедель").Value, @"\d+").Value);
                    tmpTerm.columnInTable = currentCol;
                    terms.Add(tmpTerm);
                    currentCol += 3;
                    nextTerm = Regex.Match(Convert.ToString(sheet.Cells[currentRow, currentCol].Value), @"\d+\s+семестр.*\d+\s+недель").Value;
                } while (nextTerm != "");
            }
            catch
            {
                this.Message.Add("Ошибка в шаблоне - не найдена информация по количеству недель по семестрам");
            }
            
            // поиск столбцов с отчетнстью(экзамены/зачеты/курсовые)
            try
            {
                examCol = sheet.Cells.Find("экзаменов").Column;
                testsCol = sheet.Cells.Find("зачетов").Column;
                cursProjCol = sheet.Cells.Find("курс.проектов").Column;
                cursWorkCol = sheet.Cells.Find("курс.работ").Column;
                disciplineCodeCol = sheet.Cells.Find("№ пп").Column;
                disciplineNameCol = sheet.Cells.Find("Наименование дисциплин").Column;
                teacherNameCol = sheet.Cells.Find("ФИО").Column;

                if (sheet.Cells.Find("экзаменов").Row != currentRow || sheet.Cells.Find("зачетов").Row != currentRow)
                {
                    this.Message.Add("Ошибка в шаблоне - не совпададают стороки в 'шапке' таблицы ");
                }
            }
            catch
            {
                this.Message.Add("Ошибка в шаблоне - не найдены столбцы с отчетностью(экзамены/зачеты/курсовые) ");
            }


            //запись в XML файл
            writer.WriteStartDocument();

            if (this.Message.Count == 0)
            {

                writer.WriteStartElement("educationPlan");
                writer.WriteAttributeString("title", educationPLanTitle.Trim());
                writer.WriteStartElement("speciality");
                writer.WriteAttributeString("code", Convert.ToString(specialityCode));
                writer.WriteEndElement();
                writer.WriteStartElement("terms");

                foreach (Term curTerm in terms)
                {
                    writer.WriteStartElement("term");
                    writer.WriteAttributeString("number", Convert.ToString(curTerm.number));
                    writer.WriteAttributeString("weeks", Convert.ToString(curTerm.weeks));

                    writer.WriteEndElement();
                }
                writer.WriteEndElement();

                writer.WriteStartElement("categories");

                do
                {
                    
                    tmpCell = sheet.Cells.Find("Федеральный компонент", sheet.Cells[currentRow, 1]);
                    if (tmpCell.Row >= currentRow)
                    {
                        currentRow = tmpCell.Row;
                    }
                    else
                    {
                        break;
                    }
                    

                    currentCol = tmpCell.Column;

                    category1Title = Convert.ToString(sheet.Cells[currentRow - 1, currentCol].Value);
                    if (category1Title == "" || category1Title == null)
                    {
                        category1Title = Convert.ToString(sheet.Cells[currentRow - 1, currentCol - 1].Value);
                        if (category1Title == "" || category1Title == null)
                        {
                            category1Title = Convert.ToString(sheet.Cells[currentRow - 1, currentCol + 1].Value);
                        }
                    }

                    writer.WriteStartElement("category1");
                    writer.WriteAttributeString("title", category1Title);

                    ConvertCurrentSection(writer); // - для федерального компонента
                    tmpCell = sheet.Cells.Find("вузовский компонент", sheet.Cells[currentRow, 1]);
                    if (tmpCell.Row == currentRow + 1)
                    {
                        currentRow++;
                        ConvertCurrentSection(writer);
                    }
                   
                    if (educationPLanDegree == degree.MASTER)
                    {
                        tmpCell = sheet.Cells.Find("Специальные дисциплины", sheet.Cells[currentRow, 1]);
                        if (tmpCell.Row == currentRow + 1)
                        {
                            currentRow++;
                            ConvertCurrentSection(writer);
                        }
                    }

                    
                    if (educationPLanDegree == degree.BACHELOR)
                    {
                        tmpCell = sheet.Cells.Find("Курсы по выбору", sheet.Cells[currentRow, 1]);
                        if (tmpCell.Row == currentRow + 1)
                        {
                            currentRow++;
                            ConvertCurrentSection(writer);
                        }
                    }

                    writer.WriteEndElement();
                } while (true);

                if (educationPLanDegree == degree.BACHELOR)
                {
                    tmpCell = sheet.Cells.Find("Специальные дисциплины", sheet.Cells[currentRow, 1]);
                    if (tmpCell.Value != null)
                    {
                        writer.WriteStartElement("category1");
                        writer.WriteAttributeString("title", "Специальные дисциплины");
                        currentRow = tmpCell.Row;
                        ConvertCurrentSection(writer);
                        writer.WriteEndElement();
                    }
                    tmpCell = sheet.Cells.Find("Факультативные дисциплины", sheet.Cells[currentRow, 1]);
                    if (tmpCell.Value != null)
                    {
                        currentRow = tmpCell.Row;
                        writer.WriteStartElement("category1");
                        writer.WriteAttributeString("title", "Факультативные дисциплины");
                        ConvertCurrentSection(writer);
                        writer.WriteEndElement();
                    }

                    
                }
                

                writer.WriteEndElement();

                writer.WriteEndElement();
                this.Message.Add("Конвертирование документа прошло успешно!");

            }
            else
            {
                writer.WriteStartElement("Message");
                writer.WriteString("Во время конвертации плана произошли ошибки.");
                
                foreach (string err in this.Message)
                {
                    writer.WriteStartElement("Error");
                    writer.WriteString(err);
                    writer.WriteEndElement();
                }
                writer.WriteEndElement();
            }

            writer.WriteEndDocument();
            writer.Close();

            //book.Close();
            CloseExcelFile(program);
        }

        // разбирает все предметы текущего раздела.
        // currentRow и Col должны указывать на заголовок раздела
        // разбор идет до момента, когда встречается слово "Итого"
        // в процессе- сразу идет запись в XML
        private void ConvertCurrentSection(XmlTextWriter writer)
        {

            writer.WriteStartElement("category2");
            writer.WriteAttributeString("title", Convert.ToString(sheet.Cells[currentRow, currentCol].Value));
            writer.WriteStartElement("disciplines");
            int stopRow = sheet.Cells.Find("Итого", sheet.Cells[currentRow, 1]).Row;
            currentRow += 1;
            while (currentRow < stopRow)
            {
                if (Convert.ToString(sheet.Cells[currentRow, disciplineCodeCol].Value) == null)
                {
                    currentRow++;
                    continue;
                }
                writer.WriteStartElement("discipline");
                writer.WriteAttributeString("abbreviation", "N/A");
                writer.WriteAttributeString("code", Convert.ToString(sheet.Cells[currentRow, disciplineCodeCol].Value));
                writer.WriteAttributeString("title", Convert.ToString(sheet.Cells[currentRow, disciplineNameCol].Value));
                writer.WriteStartElement("teachers");
                writer.WriteStartElement("teacher");
                writer.WriteAttributeString("name", Convert.ToString(sheet.Cells[currentRow, teacherNameCol].Value));
                writer.WriteEndElement();
                writer.WriteEndElement();
                int lectionsNum = 0, practicesNum = 0, labsNum = 0;
                string reportings = "";
                foreach (Term curTerm in terms)
                {
                    reportings = "";
                    try
                    {
                        lectionsNum = Convert.ToInt32(sheet.Cells[currentRow, curTerm.columnInTable].Value);
                        practicesNum = Convert.ToInt32(sheet.Cells[currentRow, curTerm.columnInTable + 1].Value);
                        labsNum = Convert.ToInt32(sheet.Cells[currentRow, curTerm.columnInTable + 2].Value);
                    }
                    catch { }
                    if (!(lectionsNum == 0 && practicesNum == 0 && labsNum == 0))
                    {
                        writer.WriteStartElement("term");
                        writer.WriteAttributeString("number", Convert.ToString(curTerm.number));
                        writer.WriteAttributeString("lections", Convert.ToString(lectionsNum));
                        writer.WriteAttributeString("practices", Convert.ToString(practicesNum));
                        writer.WriteAttributeString("labs", Convert.ToString(labsNum));
                        try
                        {
                            if (Regex.IsMatch(Convert.ToString(sheet.Cells[currentRow, examCol].Value), curTerm.number + @"($|,)"))
                            {
                                reportings += "Экзамен, ";
                            }
                        }
                        catch { }
                        try
                        {
                            if (Regex.IsMatch(Convert.ToString(sheet.Cells[currentRow, testsCol].Value), curTerm.number + @"($|,)"))
                            {
                                reportings += "Зачет, ";
                            }
                        }
                        catch { }
                        try
                        {
                            if (Regex.IsMatch(Convert.ToString(sheet.Cells[currentRow, cursProjCol].Value), curTerm.number + @"($|,)"))
                            {
                                reportings += "Курсовой проект, ";
                            }
                        }
                        catch { }
                        try
                        {
                            if (Regex.IsMatch(Convert.ToString(sheet.Cells[currentRow, cursWorkCol].Value), curTerm.number + @"($|,)"))
                            {
                                reportings += "Курсовая работа, ";
                            }
                        }
                        catch { }
                        reportings = reportings.Trim(new char[] { ' ', ',' });
                        writer.WriteAttributeString("reportings", reportings);
                        writer.WriteEndElement();

                    }

                }
                writer.WriteEndElement();
                currentRow++;
            } 
            writer.WriteEndElement();
            writer.WriteEndElement();
        }

        private void ShowErrors(List<string> errorList)
        {
            if (errorList.Count > 0)
            {
                string errorString = "";

                foreach (string er in errorList)
                {
                    errorString += (er + "\n");
                }
                System.Windows.Forms.MessageBox.Show(errorString);
            }
            
        }
    }

    struct Term
    {
        public int number;
        public int weeks;
        public int columnInTable;
    }
}
