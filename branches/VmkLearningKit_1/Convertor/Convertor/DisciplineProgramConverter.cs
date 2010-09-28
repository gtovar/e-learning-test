using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Word = Microsoft.Office.Interop.Word;
using System.Xml;

namespace Converter
{
    class DisciplineProgramConverter : Converter
    {
        public List<string> text;

        public override void ConvertDocument(string docPath, string xmlPath)
        {
            Word.Application program = OpenDocFile(docPath);

            Word.Document doc = new Word.Document();
            doc = program.Documents.Application.ActiveDocument;

            text = new List<string>();

            Word.Paragraphs paragrahs = doc.Paragraphs;
            foreach (Word.Paragraph p in paragrahs)
            {
                string str = p.Range.Text.Replace("\r\a", "");
                str = str.Trim();
                /*if (str != "") */text.Add(str);
            }

            Word.Tables tables = doc.Tables;
            Word.Table table = tables[1];

            List<string> razdels = new List<string>();

            XmlTextWriter writer = new XmlTextWriter(xmlPath, System.Text.Encoding.Default);

            writer.WriteStartDocument();
            writer.WriteStartElement("disciplineProgram");

            writer.WriteStartElement("title");
            writer.WriteString("Инженерные основы информационных технологий");
            writer.WriteEndElement(); // title

            for (int i = 0; i < text.Count; i++)
            {
                string str = text[i].Replace(" ", "").ToLower(); 
                switch (text[i])
                {
                    case "1. Область применения":

                        writer.WriteStartElement("applicationDomain");
                        writer.WriteAttributeString("title", "Область применения");

                        for (int j = i + 1; j < text.Count; j++, i++)
                        {
                            if (text[j].IndexOf("2.") != -1) break;

                            writer.WriteStartElement("p");
                            writer.WriteString(text[j]);
                            writer.WriteEndElement(); // p
                            
                        }
                        
                        writer.WriteEndElement(); // applicationDomain

                        break;

                    case "2. Цели и задачи дисциплины":

                        writer.WriteStartElement("purposes");
                        writer.WriteAttributeString("title", "Цели и задачи дисцмплины");
                        

                        for (int j = i + 1; j < text.Count; j++, i++)
                        {
                            if (text[j].IndexOf("3.") != -1) break;

                            writer.WriteStartElement("p");
                            writer.WriteString(text[j]);
                            writer.WriteEndElement(); // p
                        }
                        
                        writer.WriteEndElement(); // purposes

                        break;

                    case "3. Требования к уровню освоения содержания дисциплины":

                        writer.WriteStartElement("requirements");
                        writer.WriteAttributeString("title", "Требования к уровню освоения содержания дисциплины");
                        
                        for (int j = i + 1; j < text.Count; j++, i++)
                        {
                            if (text[j].IndexOf("4.") != -1) break;

                            writer.WriteStartElement("p");
                            writer.WriteString(text[j]);
                            writer.WriteEndElement(); // p
                        }
                        
                        writer.WriteEndElement(); // requirements

                        break;

                    case "4.Объем дисциплины и виды учебной работы":

                        writer.WriteStartElement("disciplineVolume");

                        writer.WriteAttributeString("title", "Объем дисциплины и виды учебной работы");
                        writer.WriteStartElement("p");

                        writer.WriteStartElement("table");

                        writer.WriteStartElement("thead");

                        writer.WriteStartElement("tr");
                        
                        writer.WriteStartElement("td");
                        writer.WriteString("Виды учебной работы");
                        writer.WriteEndElement(); //td

                        writer.WriteStartElement("td");
                        writer.WriteString("Всего часов");
                        writer.WriteEndElement(); // td

                        writer.WriteStartElement("td");
                        writer.WriteString("Семестры");
                        writer.WriteEndElement(); //td

                        writer.WriteEndElement(); // tr

                        writer.WriteEndElement(); // thead

                        writer.WriteStartElement("tbody");

                        int count = 4;
                        for (int k = 1; k < table.Rows.Count; k++)
                        {
                            writer.WriteStartElement("tr");
                            for (int l = 0; l < table.Columns.Count; l++)
                            {
                                Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                writer.WriteStartElement("td");
                                writer.WriteString(cell.Text.Replace("\r\a", ""));
                                writer.WriteEndElement(); // td
                                count++;
                            }
                            writer.WriteEndElement(); //tr
                            count++;
                        }

                        writer.WriteEndElement(); // tbody

                        writer.WriteEndElement(); // table

                        i += count;

                        /*for (int j = i + 1; j < text.Count; j++)
                        {
                            if (text[j].IndexOf("5.") != -1) break;

                            if (text[j] != "")
                            {
                                writer.WriteStartElement("i");
                                writer.WriteString(text[j]);
                                writer.WriteEndElement(); // i
                            }
                        }*/

                        writer.WriteEndElement(); // p
                        writer.WriteEndElement(); // disciplineVolume
                        break;

                    case "5.1. Разделы дисциплины и виды занятий":

                        writer.WriteStartElement("disciplineContent");
                        writer.WriteAttributeString("title", "Содержание дисциплины");

                        writer.WriteStartElement("disciplineRazdels");
                        writer.WriteAttributeString("title", "Разделы дисциплины и виды занятий");
                        
                        writer.WriteStartElement("p");

                        table = tables[2];

                        writer.WriteStartElement("table");

                        writer.WriteStartElement("thead");

                        writer.WriteStartElement("tr");
                        
                        writer.WriteStartElement("td");
                        writer.WriteString("№п/п");
                        writer.WriteEndElement(); //td

                        writer.WriteStartElement("td");
                        writer.WriteString("Раздел дисциплины");
                        writer.WriteEndElement(); //td

                        writer.WriteStartElement("td");
                        writer.WriteString("Лекции");
                        writer.WriteEndElement(); // td

                        writer.WriteStartElement("td");
                        writer.WriteString("ПЗ (или С)");
                        writer.WriteEndElement();

                        writer.WriteStartElement("td");
                        writer.WriteString("ЛР");
                        writer.WriteEndElement(); //td

                        writer.WriteEndElement(); // tr

                        writer.WriteEndElement(); // thead

                        writer.WriteStartElement("tbody");
                        int count2 = 5;

                        for (int k = 1; k < table.Rows.Count; k++)
                        {
                            writer.WriteStartElement("tr");
                            for (int l = 0; l < table.Columns.Count; l++)
                            {
                                Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                if (l == 1) razdels.Add(cell.Text.Replace("\r\a","").Trim());
                                writer.WriteStartElement("td");
                                writer.WriteString(cell.Text.Replace("\r\a", ""));
                                writer.WriteEndElement(); //tr
                                count2++;
                            }
                            writer.WriteEndElement();
                            count2++;
                        }

                        writer.WriteEndElement(); // tbody

                        writer.WriteEndElement(); // table

                        i += count2;

                        writer.WriteEndElement(); // p
                        writer.WriteEndElement(); // disciplineRazdels
                        break;

                    case "5.2. Содержание разделов дисциплины":

                        writer.WriteStartElement("disciplineRazdelsContent");
                        writer.WriteAttributeString("title", "Содержание разделов дисциплины");
                        writer.WriteEndElement(); //disciplineRazdelsContent

                        writer.WriteStartElement("topics");

                        for (int j = i + 2; j < text.Count; j++,i++)
                        {
                            if (text[j].IndexOf("Лабораторный практикум") != -1) break;
                            writer.WriteStartElement("topic");
                            bool flag = false;
                            foreach (string s in razdels)
                            {
                                if (text[j].IndexOf(s) != -1)
                                {
                                    flag = true;
                                    break;
                                }
                            }
                            if (flag)
                            {
                                writer.WriteAttributeString("level", "1");
                            }
                            else
                            {
                                writer.WriteAttributeString("level", "2");
                            }

                            writer.WriteAttributeString("title", text[j]);

                            writer.WriteEndElement(); // topic
                            
                        }

                        writer.WriteEndElement(); // topics
                        writer.WriteEndElement(); // disciplineContent
                        break;

                    case "6. Лабораторный практикум.":

                        writer.WriteStartElement("labPractice");
                        writer.WriteAttributeString("title", "Лабораторный практикум");
                        writer.WriteStartElement("p");

                        table = tables[3];

                        writer.WriteStartElement("table");

                        writer.WriteStartElement("thead");

                        writer.WriteStartElement("tr");
                        
                        writer.WriteStartElement("td");
                        writer.WriteString("№п/п");
                        writer.WriteEndElement();

                        writer.WriteStartElement("td");
                        writer.WriteString("№ раздела дисциплины");
                        writer.WriteEndElement();

                        writer.WriteStartElement("td");
                        writer.WriteString("Наименование лабораторных работ");
                        writer.WriteEndElement();

                        writer.WriteEndElement(); // tr

                        writer.WriteEndElement(); // thead

                        writer.WriteStartElement("tbody");
                        int count3 = 4;

                        for (int k = 1; k < table.Rows.Count; k++)
                        {
                            writer.WriteStartElement("tr");
                            for (int l = 0; l < table.Columns.Count; l++)
                            {
                                Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                writer.WriteStartElement("td");
                                writer.WriteString(cell.Text.Replace("\r\a", ""));
                                writer.WriteEndElement();
                                count3++;
                            }
                            writer.WriteEndElement(); //tr
                            count3++;
                        }

                        writer.WriteEndElement(); // tbody

                        writer.WriteEndElement(); // table

                        i += count3;

                        writer.WriteEndElement(); // p
                        writer.WriteEndElement(); // labPractice

                        break;

                    case "а) основная литература:":

                        writer.WriteStartElement("disciplineMaintenance");
                        writer.WriteAttributeString("title", "Учебно-методическое обеспечение дисциплины");
                        writer.WriteStartElement("literature");
                        writer.WriteAttributeString("title", "Рекомендуемая литература");
                        writer.WriteStartElement("p");
                        writer.WriteString("а) основная литература:");
                        writer.WriteStartElement("ol");

                        for (int j = i+1; j < text.Count; j++,i++)
                        {
                            if (text[j].IndexOf("дополнительная") != -1) break;
                            writer.WriteStartElement("li");
                            writer.WriteString(text[j]);
                            writer.WriteEndElement();
                        }
                        writer.WriteEndElement(); // ol
                        writer.WriteEndElement(); // p
                        break;

                    case "б) дополнительная литература:":

                        writer.WriteStartElement("p");
                        writer.WriteString("б) дополнительная литература:");
                        writer.WriteStartElement("ol");

                        for (int j = i + 1; j < text.Count; j++,i++)
                        {
                            if (text[j].IndexOf("контроля") != -1) break;
                            writer.WriteStartElement("li");
                            writer.WriteString(text[j]);
                            writer.WriteEndElement();
                        }
                        writer.WriteEndElement(); // ol
                        writer.WriteEndElement(); // p
                        writer.WriteEndElement(); // literature
                        writer.WriteEndElement(); // disciplineMaintenance
                        break;

                    case "8. Вопросы для контроля":

                        writer.WriteStartElement("questions");
                        writer.WriteAttributeString("title", "Вопросы для контроля");
                        writer.WriteStartElement("p");
                        writer.WriteStartElement("ol");
                        for (int j = i + 1; j < text.Count; j++,i++)
                        {
                            if (text[j].IndexOf("9.") != -1) break;
                            writer.WriteStartElement("li");
                            writer.WriteString(text[j]);
                            writer.WriteEndElement(); //li
                        }
                        writer.WriteEndElement(); // ol
                        writer.WriteEndElement(); // p
                        writer.WriteEndElement(); // questions
                        break;

                    case "9. Критерии оценок":

                        writer.WriteStartElement("markCriterias");
                        writer.WriteAttributeString("title", "Критерии оценок");
                        writer.WriteStartElement("p");
                        writer.WriteStartElement("table");

                        table = tables[4];
                        for (int k = 0; k < table.Rows.Count; k++)
                        {
                            writer.WriteStartElement("tr");
                            for (int l = 0; l < table.Columns.Count; l++)
                            {
                                Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                if (l == 0 && k == 0)
                                {                                 
                                    writer.WriteStartElement("td");
                                    writer.WriteString("Зачтено");
                                    writer.WriteEndElement(); //td
                                }

                                else if (l == 0 && k == 1)
                                {
                                    writer.WriteStartElement("td");
                                    writer.WriteString("Незачтено");
                                    writer.WriteEndElement(); //td
                                }

                                else
                                {
                                    writer.WriteStartElement("td");
                                    writer.WriteString(cell.Text.Replace("\r\a",""));
                                    writer.WriteEndElement(); //td
                                }

                            }
                            writer.WriteEndElement(); //tr
                        }

                        writer.WriteEndElement(); // table
                        writer.WriteStartElement("br");
                        writer.WriteEndElement(); // br

                        table = tables[5];
                        writer.WriteStartElement("table");

                        for (int k = 0; k < table.Rows.Count; k++)
                        {
                            writer.WriteStartElement("tr");
                            for (int l = 0; l < table.Columns.Count; l++)
                            {
                                Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                if (l == 0 && k == 0)
                                {
                                    writer.WriteStartElement("td");
                                    writer.WriteString("Превосходно");
                                    writer.WriteEndElement(); //td
                                }

                                else if (l == 0 && k == 1)
                                {
                                    writer.WriteStartElement("td");
                                    writer.WriteString("Отлично");
                                    writer.WriteEndElement(); //td
                                }

                                else if (l == 0 && k == 2)
                                {
                                    writer.WriteStartElement("td");
                                    writer.WriteString("Очень хорошо");
                                    writer.WriteEndElement(); //td
                                }

                                else if (l == 0 && k == 3)
                                {
                                    writer.WriteStartElement("td");
                                    writer.WriteString("Хорошо");
                                    writer.WriteEndElement(); //td
                                } 

                                else if (l == 0 && k == 4)
                                {
                                    writer.WriteStartElement("td");
                                    writer.WriteString("Удовлетворительно");
                                    writer.WriteEndElement(); //td
                                }

                                else if (l == 0 && k == 5)
                                {
                                    writer.WriteStartElement("td");
                                    writer.WriteString("Неудовлетворительно");
                                    writer.WriteEndElement(); //td
                                }

                                else
                                {
                                    writer.WriteStartElement("td");
                                    writer.WriteString(cell.Text.Replace("\r\a", ""));
                                    writer.WriteEndElement(); //td
                                }

                            }
                            writer.WriteEndElement(); //tr
                        }

                        writer.WriteEndElement(); // table
                        writer.WriteEndElement(); // p
                        writer.WriteEndElement(); // markCriterias
                        break;
                }
            }

            writer.WriteStartElement("reporting");
            writer.WriteEndElement();

            writer.WriteStartElement("additional");
            writer.WriteEndElement();

            writer.WriteEndElement(); // disciplineProgram
            writer.WriteEndDocument();
            writer.Close();

            this.Message.Add("Конвертирование выполнено");

            CloseDocFile(program);
        }
    }
}
