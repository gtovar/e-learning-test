using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using Excel = Microsoft.Office.Interop.Excel;
using System.Windows.Forms;

namespace Converter
{
    class ScheduleConverter:Converter
    {
        private const int countPairs = 41;
        private string GetDownCell(string cell)
        {
            string numbers = "1234567890";
            int pos = -1;
            for (int i = 0; i < cell.Length; i++ )
            {
                if (numbers.IndexOf(cell[i]) != -1)
                {
                    pos = i;
                    break;
                }
            }
            if (pos != -1)
            {
                string s = cell.Substring(pos);
                int c = Convert.ToInt32(s);
                c++;
                cell = cell.Replace(s, c.ToString());
            }
            return cell;
        }
        private string GetUpCell(string cell)
        {
            string numbers = "1234567890";
            int pos = -1;
            for (int i = 0; i < cell.Length; i++)
            {
                if (numbers.IndexOf(cell[i]) != -1)
                {
                    pos = i;
                    break;
                }
            }
            if (pos != -1)
            {
                string s = cell.Substring(pos);
                int c = Convert.ToInt32(s);
                c--;
                cell = cell.Replace(s, c.ToString());
            }
            return cell;
        }
        private string GetRightCell(string cell)
        {
            string letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            int pos = -1;
            for (int i = 0; i < cell.Length; i++)
            {
                if (letters.IndexOf(cell[i]) == -1)
                {
                    pos = i - 1;
                    break;
                }
            }
            if (pos != -1)
            {
                string s = cell.Substring(0,pos+1);
                string r = "";
                if (s.Length == 1)
                {
                    if (s[0] == 'Z')
                    {
                        r = "AA";
                    }
                    else
                        r = letters[letters.IndexOf(s) + 1].ToString();
                }
                else if (s.Length == 2)
                {
                    if (s[1] == 'Z')
                    {
                        r = letters[letters.IndexOf(s[0]) + 1].ToString() + "A";
                    }
                    else
                        r = s[0] + letters[letters.IndexOf(s[1]) + 1].ToString();
                }
                cell = cell.Replace(s, r);
            }
            return cell;
        }

        private string GetSpecialityCourse(string startCell, Excel.Worksheet sheet, XmlTextWriter writer)
        {
            Excel.Range cell = sheet.get_Range(startCell, Type.Missing);
            Excel.Range cell2 = sheet.get_Range(GetDownCell(startCell), Type.Missing);

            string address = cell.MergeArea.Address; // адрес ячейки последней группы курса специальности

            if (address.IndexOf(":") != -1)
            {
                address = address.Substring(address.IndexOf(":") + 1);
            }

            string stop = sheet.get_Range(GetDownCell(address.Replace("$", "")), Type.Missing).Address;

            string ad1 = GetDownCell(startCell);

            string temp = null;
            do
            {
                cell = sheet.get_Range(ad1, Type.Missing);
                temp = Convert.ToString(cell.Value2);
                if (temp == null)
                {
                    ad1 = GetRightCell(ad1);
                    continue;
                }
                
                writer.WriteStartElement("group");
                writer.WriteAttributeString("number", temp);
                //вызов функции добавления группы
                GetGroup(cell.Address.Replace("$", ""), sheet, writer);
                writer.WriteEndElement();
                ad1 = GetRightCell(ad1);
            }
            while (cell.Address != stop);



            return address.Replace("$","");
        }

        private string GetSpecialityCourse2(string startCell, Excel.Worksheet sheet, XmlTextWriter writer)
        {
            Excel.Range cell = sheet.get_Range(startCell, Type.Missing);
            Excel.Range cell2 = sheet.get_Range(GetDownCell(startCell), Type.Missing);

            string address = cell.MergeArea.Address; // адрес ячейки последней группы курса специальности

            if (address.IndexOf(":") != -1)
            {
                address = address.Substring(address.IndexOf(":") + 1);
            }

            List<string> chairs = new List<string>();

            string stop = sheet.get_Range(GetDownCell(address.Replace("$", "")), Type.Missing).Address;
            string stop1 = GetDownCell(stop);

            string ad1 = GetDownCell(startCell);

            string temp = null;
            do
            {
                cell = sheet.get_Range(ad1, Type.Missing);
                temp = Convert.ToString(cell.Value2);
                if (temp == null)
                {
                    ad1 = GetRightCell(ad1);
                    chairs.Add("Название отсутствует");
                    continue;
                }
                chairs.Add(temp);
                ad1 = GetRightCell(ad1);
            }
            while (cell.Address != stop);

            ad1 = GetDownCell(startCell);
            ad1 = GetDownCell(ad1);
            int j = 0;
            do
            {
                cell = sheet.get_Range(ad1, Type.Missing);
                temp = Convert.ToString(cell.Value2);
                if (temp == null)
                {
                    ad1 = GetRightCell(ad1);
                    continue;
                }

                writer.WriteStartElement("group");
                writer.WriteAttributeString("number", temp);
                //вызов функции добавления группы
                GetGroup(cell.Address.Replace("$", ""), sheet, writer, chairs);
                writer.WriteEndElement();
                ad1 = GetRightCell(ad1);
                j++;
            }
            while (cell.Address != stop1);

            return address.Replace("$", "");
        }

        private void GetGroup(string startCell, Excel.Worksheet sheet, XmlTextWriter writer, List<string> chairs = null)
        {
            Excel.Range cell,cell1,cell2;
            string text1, text2;

            string[] days = { "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"};
            string[] time = { "8:00", "9:40", "11:20", "13:00", "14:40", "16:20", "18:00"};

            cell = sheet.get_Range(startCell, Type.Missing);

            string address = cell.MergeArea.Address;
            string stop = sheet.get_Range(GetDownCell(address.Substring(address.IndexOf(":")+1).Replace("$","")), Type.Missing).Address;
            
            bool flag = true;
            string curCell = sheet.get_Range(GetDownCell(startCell.Substring(startCell.IndexOf(":")+1)), Type.Missing).Address;
            int j = 0;
            string startCell1 = GetDownCell(startCell);
            do
            {
                if (curCell == stop) flag = false;
                writer.WriteStartElement("subgroup");
                if (chairs != null)
                {
                    writer.WriteAttributeString("title", chairs[0]);
                    chairs.RemoveAt(0);
                }
                else if (j == 0)
                    writer.WriteAttributeString("title", "Первая");
                else
                    writer.WriteAttributeString("title", "Вторая");

                int countColumns1, countColumns2 = 0;
                for (int i = 0; i < countPairs; i++,startCell1 = GetDownCell(startCell1))
                {
                    cell1 = sheet.get_Range(startCell1, Type.Missing);
                    countColumns1 = cell1.MergeArea.Columns.Count;

                    if (cell1.MergeArea.Rows.Count > 1)
                        text1 = Convert.ToString(cell1.MergeArea.Cells[1, 1].Value);
                    else
                        text1 = Convert.ToString(cell1.MergeArea.Columns[1].Value);

                    startCell1 = GetDownCell(startCell1);
    
                    cell2 = sheet.get_Range(startCell1, Type.Missing);
                    countColumns2 = cell2.MergeArea.Columns.Count;

                    if (cell2.MergeArea.Rows.Count > 1)
                        text2 = Convert.ToString(cell2.MergeArea.Cells[1, 1].Value);
                    else
                        text2 = Convert.ToString(cell2.MergeArea.Columns[1].Value);

                    if (text1 != null && (text1.Replace(" ", "").ToUpper() == "ФИЗВОСПИТАНИЕ" || text1.Replace(" ", "").ToUpper() == "ФИЗКУЛЬТУРА"))
                    {
                        writer.WriteStartElement("pair");
                        
                        writer.WriteAttributeString("dayOfWeek", days[i / 7]);
                        writer.WriteAttributeString("time", time[i % 7]);
                        writer.WriteAttributeString("type", "practice");
                        writer.WriteAttributeString("week", "Каждая");
                        writer.WriteAttributeString("discipline", "Физвоспитание");

                        writer.WriteEndElement();
                        continue;
                    }

                    if (text1 != null && text1.Replace(" ", "").ToUpper() == "ВОЕННАЯПОДГОТОВКА")
                    {
                        writer.WriteStartElement("pair");
                      
                        writer.WriteAttributeString("dayOfWeek", days[i / 7]);
                        writer.WriteAttributeString("time", time[i % 7]);
                        writer.WriteAttributeString("type", "lection");
                        writer.WriteAttributeString("week", "Каждая");
                        writer.WriteAttributeString("discipline", "Военная подготовка");
                        
                        writer.WriteEndElement();
                        continue;
                    }

                    if (text1 != null && text2 != null)
                    {
                        if (text1.Trim().ToLower() == "т/к")
                        {
                            writer.WriteStartElement("pair");

                            writer.WriteAttributeString("dayOfWeek", days[i / 7]);
                            writer.WriteAttributeString("time", time[i % 7]);                            
                            writer.WriteAttributeString("type", "terminal");
                            writer.WriteAttributeString("week", "Каждая");
                            writer.WriteAttributeString("teacher", text2.Trim());

                            writer.WriteEndElement();
                            continue;

                        }
                                                
                        char[] ch = {' '};
                        string[] s1 = text1.Split(ch, StringSplitOptions.RemoveEmptyEntries);
                        string[] s2 = text2.Split(ch, StringSplitOptions.RemoveEmptyEntries);

                        if (s1.Length == 2 && s2.Length == 1)
                        {
                            writer.WriteStartElement("pair");

                            writer.WriteAttributeString("dayOfWeek", days[i / 7]);
                            writer.WriteAttributeString("time", time[i % 7]);

                            if (countColumns1 > 2)
                                writer.WriteAttributeString("type", "lection");
                            else
                                writer.WriteAttributeString("type", "practice");

                            writer.WriteAttributeString("week", "Каждая");

                            writer.WriteAttributeString("discipline", s1[0]);
                            string building = "2";
                            if (s1[1].IndexOf("(") < s1[1].IndexOf(")") && s1[1].IndexOf("(") != -1)
                            {
                                building = s1[1].Substring(s1[1].IndexOf("(") + 1, s1[1].IndexOf(")") - s1[1].IndexOf("(") - 1);
                                s1[1] = s1[1].Replace("(" + building + ")", "");
                            }
                            writer.WriteAttributeString("room", s1[1]);
                            writer.WriteAttributeString("building", building);
                            writer.WriteAttributeString("teacher", s2[0]);

                            writer.WriteEndElement();
                            continue;

                        }

                        else if (s1.Length == 3 && s2.Length == 3)
                        {
                            writer.WriteStartElement("pair");

                            writer.WriteAttributeString("dayOfWeek", days[i / 7]);
                            writer.WriteAttributeString("time", time[i % 7]);

                            if (countColumns1 > 2)
                                writer.WriteAttributeString("type", "lection");
                            else
                                writer.WriteAttributeString("type", "practice");

                            writer.WriteAttributeString("week", "Верхняя");

                            writer.WriteAttributeString("discipline", s1[0]);
                            string building = "2";
                            if (s1[1].IndexOf("(") < s1[1].IndexOf(")") && s1[1].IndexOf("(") != -1)
                            {
                                building = s1[1].Substring(s1[1].IndexOf("(") + 1, s1[1].IndexOf(")") - s1[1].IndexOf("(") - 1);
                                s1[1] = s1[1].Replace("(" + building + ")", "");
                            }
                            writer.WriteAttributeString("room", s1[1]);
                            writer.WriteAttributeString("building", building);
                            writer.WriteAttributeString("teacher", s1[2]);

                            writer.WriteEndElement();

                            writer.WriteStartElement("pair");

                            writer.WriteAttributeString("dayOfWeek", days[i / 7]);
                            writer.WriteAttributeString("time", time[i % 7]);

                            if (countColumns1 > 2)
                                writer.WriteAttributeString("type", "lection");
                            else
                                writer.WriteAttributeString("type", "practice");

                            writer.WriteAttributeString("week", "Нижняя");

                            writer.WriteAttributeString("discipline", s2[0]);
                            string _building = "2";
                            if (s2[1].IndexOf("(") < s2[1].IndexOf(")") && s2[1].IndexOf("(") != -1)
                            {
                                _building = s2[1].Substring(s2[1].IndexOf("(") + 1, s2[1].IndexOf(")") - s2[1].IndexOf("(") - 1);
                                s2[1] = s2[1].Replace("(" + _building + ")", "");
                            }
                            writer.WriteAttributeString("room", s2[1]);
                            writer.WriteAttributeString("building", building);
                            writer.WriteAttributeString("teacher", s2[2]);

                            writer.WriteEndElement();
                            continue;
                        }

                        else
                        {
                            this.Message.Add("Ячейки " + startCell1 + " и " + GetUpCell(startCell1) + " не соответствуют шаблону");
                            continue;
                        }

                    }

                    if (text1!=null && text2==null)
                    {
                        char[] ch = { ' ' };
                        string[] s = text1.Split(ch, StringSplitOptions.RemoveEmptyEntries);
                                               
                        if (s.Length == 3)
                        {

                            writer.WriteStartElement("pair");

                            writer.WriteAttributeString("dayOfWeek", days[i / 7]);
                            writer.WriteAttributeString("time", time[i % 7]);

                            if (countColumns1 > 2)
                                writer.WriteAttributeString("type", "lection");
                            else
                                writer.WriteAttributeString("type", "practice");

                            writer.WriteAttributeString("week", "Верхняя");
                                                                                
                            writer.WriteAttributeString("discipline", s[0]);
                            string building = "2";
                               
                            if (s[1].IndexOf("(") < s[1].IndexOf(")") && s[1].IndexOf("(") != -1)                               
                            {                                
                                building = s[1].Substring(s[1].IndexOf("(") + 1, s[1].IndexOf(")") - s[1].IndexOf("(") - 1);                               
                                s[1] = s[1].Replace("(" + building + ")", "");                             
                            }
                               
                            writer.WriteAttributeString("room", s[1]);
                               
                            writer.WriteAttributeString("building", building);
                              
                            writer.WriteAttributeString("teacher", s[2]);

                            writer.WriteEndElement();
                            continue;
                        }
                        else
                        {
                            this.Message.Add("В ячейке " + startCell1 + " через пробел ожидается аббревиатура дисциплины, номер аудитории и фамилия преподавателя");
                            continue;
                        }                        
                    }

                    if (text1 == null && text2 != null)
                    {                       
                        char[] ch = { ' ' };
                        string[] s = text2.Split(ch, StringSplitOptions.RemoveEmptyEntries);
                        if (s.Length == 3)
                        {
                            writer.WriteStartElement("pair");

                            writer.WriteAttributeString("dayOfWeek", days[i / 7]);
                            writer.WriteAttributeString("time", time[i % 7]);

                            if (countColumns1 > 2)
                                writer.WriteAttributeString("type", "lection");
                            else
                                writer.WriteAttributeString("type", "practice");

                            writer.WriteAttributeString("week", "Нижняя");
                            writer.WriteAttributeString("discipline", s[0]);
                            string building = "2";
                            if (s[1].IndexOf("(") < s[1].IndexOf(")") && s[1].IndexOf("(") != -1)
                            {
                                building = s[1].Substring(s[1].IndexOf("(") + 1, s[1].IndexOf(")") - s[1].IndexOf("(") - 1);
                                s[1] = s[1].Replace("(" + building + ")", "");
                            }
                            writer.WriteAttributeString("room", s[1]);
                            writer.WriteAttributeString("building", building);
                            writer.WriteAttributeString("teacher", s[2]);

                            writer.WriteEndElement();
                            continue;
                        }
                        else
                        {
                            this.Message.Add("В ячейке " + startCell1 + " через пробел ожидается аббревиатура дисциплины, номер аудитории и фамилия преподавателя");
                            continue;
                        }                       
                    }
                }
                curCell = sheet.get_Range(GetRightCell(curCell.Replace("$", "")), Type.Missing).Address;
                startCell = GetRightCell(startCell);
                startCell1 = GetDownCell(startCell);

                j++;
                writer.WriteEndElement();

            }
            while(flag);
        }
        public override void ConvertDocument(string docPath, string xmlPath, List<string> structDocument = null, ProgressBar bar = null )
        {
            Excel.Application program;
            Excel.Workbook book = OpenExcelFile(docPath, out program);

            try
            {

                XmlTextWriter writer = new XmlTextWriter(xmlPath, System.Text.Encoding.Default);
                writer.WriteStartDocument();
                writer.WriteStartElement("specialities"); 

                Excel.Sheets sheets = book.Sheets;
                Excel.Worksheet sheet = (Excel.Worksheet)sheets.get_Item("Расписание"); 
            
                string startCell = "C5"; //начальная клетка разбора документа
                string starCell1 = "AN5";
                string endCell = "EH4";
                int count = 0;
                string s = null;
                while (startCell != starCell1)
                {
                    s = sheet.get_Range(startCell).MergeArea.Address;
                    if (sheet.get_Range(startCell, Type.Missing).Value != null) count++;
                    if (s.IndexOf(":") != -1)
                        s = s.Substring(s.IndexOf(":") + 1);
                    startCell = GetRightCell(s.Replace("$",""));
                    break;
                }
                /*startCell = GetUpCell(startCell);
                while (startCell != endCell) 
                {
                    s = sheet.get_Range(startCell).MergeArea.Address;
                    if (sheet.get_Range(startCell, Type.Missing).Value != null) count++;
                    startCell = GetRightCell(startCell);
                }*/

                bar.Maximum = count;

                startCell = "C5"; //начальная клетка разбора документа
                starCell1 = "AN5";

                while (startCell != starCell1)
                {
                    if (sheet.get_Range(startCell, Type.Missing).Value == null)
                    {
                        startCell = GetRightCell(startCell);
                        continue;
                    }
                    bar.PerformStep();
                    writer.WriteStartElement("speciality");
                    writer.WriteAttributeString("abbreviation", sheet.get_Range(startCell,Type.Missing).Value.ToString());

                    startCell = GetSpecialityCourse(startCell, sheet, writer);
                    startCell = GetRightCell(startCell);

                    writer.WriteEndElement();
                    break;
                }

                /*startCell = GetUpCell(startCell); //начальная клетка разбора документа
                while (startCell != endCell)
                {
                    if (sheet.get_Range(startCell, Type.Missing).Value == null)
                    {
                        startCell = GetRightCell(startCell);
                        continue;
                    }
                    bar.PerformStep();
                    writer.WriteStartElement("speciality");
                    writer.WriteAttributeString("abbreviation", sheet.get_Range(startCell, Type.Missing).Value.ToString());

                    startCell = GetSpecialityCourse2(startCell, sheet, writer);
                    startCell = GetRightCell(startCell);

                    writer.WriteEndElement();
                }*/

                writer.WriteEndElement();             
                writer.WriteEndDocument();
                writer.Close();

                this.Message.Add("Конвертирование выполнено");
                CloseExcelFile(program);
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
