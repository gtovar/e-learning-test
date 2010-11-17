using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Word = Microsoft.Office.Interop.Word;
using System.Xml;

namespace Converter
{
    class TeacherConvertor : Converter
    {
        public override void ConvertDocument(string docPath, string xmlPath)
        {
            Word.Application program = OpenDocFile(docPath);

            Word.Document doc = new Word.Document();
            doc = program.Documents.Application.ActiveDocument;

            List<string> text = new List<string>();

            Word.Paragraphs paragrahs = doc.Paragraphs;
            foreach (Word.Paragraph p in paragrahs)
            {
                string str = p.Range.Text.Replace("\r\a", "");
                str = str.Trim();
                if (str != "") text.Add(str);
            }

            Word.Tables tables = doc.Tables;

            if (tables.Count == 0)
            {
                this.Message.Add("Документ не содержит ни одной таблицы");
                return;
            }

            List<int> black = new List<int>();
            for (int i = 1; i < tables.Count; i++)
            {
                Word.Table table = tables[i];

                if (table.Columns.Count > 4)
                {
                    Word.Range c1 = table.Cell(1, 1).Range;
                    string s1 = c1.Text.Replace("\r\a", "").Trim().ToLower().Replace(" ", "");

                    Word.Range c2 = table.Cell(1, 2).Range;
                    string s2 = c2.Text.Replace("\r\a", "").Trim().ToLower().Replace(" ", "");

                    Word.Range c3 = table.Cell(1, 3).Range;
                    string s3 = c3.Text.Replace("\r\a", "").Trim().ToLower().Replace(" ", "");

                    Word.Range c4 = table.Cell(1, 4).Range;
                    string s4 = c4.Text.Replace("\r\a", "").Trim().ToLower().Replace(" ", "");

                    Word.Range c5 = table.Cell(1, 5).Range;
                    string s5 = c5.Text.Replace("\r\a", "").Trim().ToLower().Replace(" ", "");

                    if (s1 != "№" || s2 != "фио" || s3 != "уч.степ." || s4 != "звание" || s5 != "должн.")
                    {
                        this.Message.Add("Таблица №" + i + " не соответствует шаблону");
                        black.Add(i);
                    }
                }
                else
                {
                    this.Message.Add("Таблица №" + i + " не соответствует шаблону");
                    black.Add(i);
                }

            }

            int chairCount = 0;
            List<string> chairStr = new List<string>();

            XmlTextWriter writer = new XmlTextWriter(xmlPath, System.Text.Encoding.UTF8);

            writer.WriteStartDocument();
            writer.WriteStartElement("teachers");
            int seachIndex = 0;
            bool flag;

            for (int i = 0; i < text.Count - 4; i++)
            {
                string s1 = text[i].ToLower();
                s1 = s1.Replace(" ", "");
                s1 = s1.Trim();

                string s2 = text[i + 1].ToLower();
                s2 = s2.Replace(" ", "");
                s2 = s2.Trim();

                string s3 = text[i + 2].ToLower();
                s3 = s3.Replace(" ", "");
                s3 = s3.Trim();

                string s4 = text[i + 3].ToLower();
                s4 = s4.Replace(" ", "");
                s4 = s4.Trim();

                string s5 = text[i + 4].ToLower();
                s5 = s5.Replace(" ", "");
                s5 = s5.Trim();

                if (s1 == "№" && s2 == "фио" && s3 == "уч.степ." && s4 == "звание" && s5 == "должн.")
                {
                    chairCount++;
                    flag = false;
                    for (int j = i - 1; j >= seachIndex; j--)
                    {
                        string str = text[j].ToLower();
                        if (str.IndexOf("кафедра") != -1)
                        {
                            string chair = text[j].Replace(text[j].Substring(str.IndexOf("кафедра"), 7), "");
                            chair = chair.Trim();
                            chairStr.Add(chair);
                            text.RemoveAt(j);
                            flag = true;
                            break;
                        }
                    }
                    seachIndex = i + 5;
                    if (!flag) chairStr.Add("Отсутствует");
                }
            }


            for (int i = 1; i <= tables.Count; i++)
            {
                if (black.IndexOf(i) == -1)
                {
                    Word.Table table = tables[i];

                    for (int j = 1; j < table.Rows.Count; j++)
                    {
                        writer.WriteStartElement("teacher");
                        if (chairStr[i - 1] != "Отсутствует")
                        {
                            writer.WriteAttributeString("chairAbbreviation", chairStr[i - 1]);
                        }

                        for (int k = 1; k < table.Columns.Count; k++)
                        {
                            Word.Range cell = table.Cell(j + 1, k + 1).Range;
                            switch (k)
                            {
                                case 1:
                                    string str1 = cell.Text.Replace("\r\a", "");
                                    if (str1 != "")
                                    {
                                        string lastName = str1.Substring(0, str1.IndexOf(" "));
                                        if (lastName != "")
                                        {
                                            writer.WriteAttributeString("lastName", lastName);
                                        }
                                        str1 = str1.Replace(lastName, "");
                                        str1 = str1.Trim();
                                        string firstName = str1.Substring(0, str1.IndexOf(" "));
                                        if (firstName != "")
                                        {
                                            writer.WriteAttributeString("firstName", firstName);
                                        }
                                        str1 = str1.Replace(firstName, "");
                                        str1 = str1.Trim();
                                        if (str1 != "")
                                        {
                                            writer.WriteAttributeString("patronymic", str1);
                                        }
                                    }
                                    break;
                                case 2:
                                    string str2 = cell.Text.Replace("\r\a", "");
                                    str2 = str2.Trim();
                                    if (str2 != "")
                                    {
                                        writer.WriteAttributeString("degree", str2);
                                    }
                                    break;
                                case 3:
                                    string str3 = cell.Text.Replace("\r\a", "");
                                    str3 = str3.Trim();
                                    if (str3 != "")
                                    {
                                        writer.WriteAttributeString("rank", str3);
                                    }
                                    break;
                                case 4:
                                    string str4 = cell.Text.Replace("\r\a", "");
                                    str4 = str4.Trim();
                                    if (str4 != "")
                                    {
                                        writer.WriteAttributeString("position", str4);
                                    }
                                    break;
                            }
                        }

                        writer.WriteEndElement();
                    }
                }
            }

            writer.WriteEndElement();
            writer.WriteEndDocument();
            writer.Close();

            this.Message.Add("Конвертирование выполнено");

            CloseDocFile(program);
        }

    }
}
