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

            string temp = "";

            writer.WriteStartDocument();
            writer.WriteStartElement("disciplineProgram");

            writer.WriteStartElement("title");
            writer.WriteString("Программная инженерия");
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

                            /*writer.WriteStartElement("p");
                            writer.WriteString(text[j]);
                            writer.WriteEndElement(); // p
                             */
                            temp += "<p>";
                            temp += text[j];
                            temp += "</p>";
                            
                        }

                        writer.WriteCData(temp);
                        
                        writer.WriteEndElement(); // applicationDomain

                        break;

                    case "2. Цели и задачи дисциплины":

                        writer.WriteStartElement("purposes");
                        writer.WriteAttributeString("title", "Цели и задачи дисцмплины");

                        temp = "";
                        for (int j = i + 1; j < text.Count; j++, i++)
                        {
                            if (text[j].IndexOf("3.") != -1) break;

                            /*writer.WriteStartElement("p");
                            writer.WriteString(text[j]);
                            writer.WriteEndElement(); // p
                             */
                            temp += "<p>";
                            temp += text[j];
                            temp += "</p>";

                        }

                        writer.WriteCData(temp);

                        writer.WriteEndElement(); // purposes

                        break;

                    case "3. Требования к уровню освоения содержания дисциплины":

                        writer.WriteStartElement("requirements");
                        writer.WriteAttributeString("title", "Требования к уровню освоения содержания дисциплины");

                        temp = "";
                        for (int j = i + 1; j < text.Count; j++, i++)
                        {
                            if (text[j].IndexOf("4.") != -1) break;

                            /*writer.WriteStartElement("p");
                            writer.WriteString(text[j]);
                            writer.WriteEndElement(); // p
                             */
                            temp += "<p>";
                            temp += text[j];
                            temp += "</p>";
                        }

                        writer.WriteCData(temp);
                        
                        writer.WriteEndElement(); // requirements

                        break;

                    case "4.Объем дисциплины и виды учебной работы":

                        temp = "";

                        writer.WriteStartElement("disciplineVolume");

                        writer.WriteAttributeString("title", "Объем дисциплины и виды учебной работы");
                        //writer.WriteStartElement("p");                       
                        temp += "<p>";
                        //writer.WriteStartElement("table");
                        temp += "<table>";
                        //writer.WriteStartElement("thead");
                        temp += "<thead>";
                        //writer.WriteStartElement("tr");
                        temp += "<tr>";
                        //writer.WriteStartElement("td");
                        temp += "<td>";
                        //writer.WriteString("Виды учебной работы");
                        temp += "Виды учебной работы";
                        //writer.WriteEndElement(); //td
                        temp += "</td>";
                        //writer.WriteStartElement("td");
                        temp += "<td>";
                        //writer.WriteString("Всего часов");
                        temp += "Всего часов";
                        //writer.WriteEndElement(); // td
                        temp += "</td>";

                        //writer.WriteStartElement("td");
                        temp += "<td>";
                        //writer.WriteString("Семестры");
                        temp += "Семестры";
                        //writer.WriteEndElement(); //td
                        temp += "</td>";

                        //writer.WriteEndElement(); // tr
                        temp += "</tr>";

                        //writer.WriteEndElement(); // thead
                        temp += "</thead>";

                        //writer.WriteStartElement("tbody");
                        temp += "<tbody>";

                        int count = 4;
                        for (int k = 1; k < table.Rows.Count; k++)
                        {
                            //writer.WriteStartElement("tr");
                            temp += "<tr>";
                            for (int l = 0; l < table.Columns.Count; l++)
                            {
                                Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                //writer.WriteStartElement("td");
                                temp += "<td>";
                                //writer.WriteString(cell.Text.Replace("\r\a", ""));
                                temp += cell.Text.Replace("\r\a", "");
                                //writer.WriteEndElement(); // td
                                temp += "</td>";
                                count++;
                            }
                            //writer.WriteEndElement(); //tr
                            temp += "</tr>";
                            count++;
                        }

                        //writer.WriteEndElement(); // tbody
                        temp += "</tbody>";

                        //writer.WriteEndElement(); // table
                        temp += "</table>";

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

                        //writer.WriteEndElement(); // p
                        temp += "</p>";

                        writer.WriteCData(temp);

                        writer.WriteEndElement(); // disciplineVolume
                        break;

                    case "5.1. Разделы дисциплины и виды занятий":

                        temp = "";

                        writer.WriteStartElement("disciplineContent");
                        writer.WriteAttributeString("title", "Содержание дисциплины");

                        writer.WriteStartElement("disciplineRazdels");
                        writer.WriteAttributeString("title", "Разделы дисциплины и виды занятий");
                        
                        //writer.WriteStartElement("p");
                        temp += "<p>";

                        table = tables[2];

                        //writer.WriteStartElement("table");
                        temp += "<table>";
                        //writer.WriteStartElement("thead");
                        temp += "<thead>";
                        //writer.WriteStartElement("tr");
                        temp += "<tr>";
                        //writer.WriteStartElement("td");
                        temp += "<td>";
                        //writer.WriteString("№п/п");
                        temp += "№п/п";
                        //writer.WriteEndElement(); //td
                        temp += "</td>";
                        //writer.WriteStartElement("td");
                        temp += "<td>";
                        //writer.WriteString("Раздел дисциплины");
                        temp += "Раздел дисциплины";
                        //writer.WriteEndElement(); //td
                        temp += "</td>";

                        //writer.WriteStartElement("td");
                        temp += "<td>";
                        //writer.WriteString("Лекции");
                        temp += "Лекции";
                        //writer.WriteEndElement(); // td
                        temp += "</td>";

                        //writer.WriteStartElement("td");
                        temp += "<td>";
                        //writer.WriteString("ПЗ (или С)");
                        temp += "ПЗ (или С)";
                        //writer.WriteEndElement();
                        temp += "</td>";

                        //writer.WriteStartElement("td");
                        temp += "<td>";
                        //writer.WriteString("ЛР");
                        temp += "ЛР";
                        //writer.WriteEndElement(); //td
                        temp += "</td>";

                        //writer.WriteEndElement(); // tr
                        temp += "</tr>";

                        // writer.WriteEndElement(); // thead
                        temp += "</thead>";

                        //writer.WriteStartElement("tbody");
                        temp += "<tbody>";
                        int count2 = 5;

                        for (int k = 1; k < table.Rows.Count; k++)
                        {
                            //writer.WriteStartElement("tr");
                            temp += "<tr>";
                            for (int l = 0; l < table.Columns.Count; l++)
                            {
                                Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                if (l == 1) razdels.Add(cell.Text.Replace("\r\a","").Trim());
                                //writer.WriteStartElement("td");
                                temp += "<td>";
                                //writer.WriteString(cell.Text.Replace("\r\a", ""));
                                temp += cell.Text.Replace("\r\a", "");
                                //writer.WriteEndElement(); //td
                                temp += "</td>";
                                count2++;
                            }
                            //writer.WriteEndElement();
                            temp += "</tr>";
                            count2++;
                        }

                        //writer.WriteEndElement(); // tbody
                        temp += "</tbody>";

                        //writer.WriteEndElement(); // table
                        temp += "</table>";

                        i += count2;

                        //writer.WriteEndElement(); // p
                        temp += "</p>";

                        writer.WriteCData(temp);

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

                        temp = "";

                        writer.WriteStartElement("labPractice");
                        writer.WriteAttributeString("title", "Лабораторный практикум");
                        //writer.WriteStartElement("p");
                        temp += "<p>";

                        table = tables[3];

                        //writer.WriteStartElement("table");
                        temp += "<table>";

                        //writer.WriteStartElement("thead");
                        temp += "<thead>";

                        //writer.WriteStartElement("tr");
                        temp += "<tr>";
                        
                        //writer.WriteStartElement("td");
                        temp += "<td>";
                       // writer.WriteString("№п/п");
                        temp += "№п/п";
                        //writer.WriteEndElement();
                        temp += "</td>";

                        //writer.WriteStartElement("td");
                        temp += "<td>";
                        //writer.WriteString("№ раздела дисциплины");
                        temp += "№ раздела дисциплины";
                        //writer.WriteEndElement();
                        temp += "</td>";

                        //writer.WriteStartElement("td");
                        temp += "<td>";
                        //writer.WriteString("Наименование лабораторных работ");
                        temp += "Наименование лабораторных работ";
                        //writer.WriteEndElement();
                        temp += "</td>";

                        //writer.WriteEndElement(); // tr
                        temp += "</tr>";

                       // writer.WriteEndElement(); // thead
                        temp += "</thead>";

                        //writer.WriteStartElement("tbody");
                        temp += "<tbody>";
                        int count3 = 4;

                        for (int k = 1; k < table.Rows.Count; k++)
                        {
                           // writer.WriteStartElement("tr");
                            temp += "<tr>";
                            for (int l = 0; l < table.Columns.Count; l++)
                            {
                                Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                //writer.WriteStartElement("td");
                                temp += "<td>";
                               // writer.WriteString(cell.Text.Replace("\r\a", ""));
                                temp += cell.Text.Replace("\r\a", "");
                               // writer.WriteEndElement();
                                temp += "</td>";
                                count3++;
                            }
                            //writer.WriteEndElement(); //tr
                            temp += "</tr>";
                            count3++;
                        }

                        //writer.WriteEndElement(); // tbody
                        temp += "</tbody>";

                        //writer.WriteEndElement(); // table
                        temp += "</table>";

                        i += count3;

                        //writer.WriteEndElement(); // p
                        temp += "</p>";

                        writer.WriteCData(temp);

                        writer.WriteEndElement(); // labPractice

                        break;

                    case "а) основная литература:":

                        temp = "";

                        writer.WriteStartElement("disciplineMaintenance");
                        writer.WriteAttributeString("title", "Учебно-методическое обеспечение дисциплины");
                        writer.WriteStartElement("literature");
                        writer.WriteAttributeString("title", "Рекомендуемая литература");
                        //writer.WriteStartElement("p");
                        temp += "<p>";
                        //writer.WriteString("а) основная литература:");
                        temp += "а) основная литература:";
                        //writer.WriteStartElement("ol");
                        temp += "<ol>";

                        for (int j = i+1; j < text.Count; j++,i++)
                        {
                            if (text[j].IndexOf("дополнительная") != -1) break;
                            //writer.WriteStartElement("li");
                            temp += "<li>";
                           // writer.WriteString(text[j]);
                            temp += text[j];
                            //writer.WriteEndElement();
                            temp += "</li>";
                        }
                        //writer.WriteEndElement(); // ol
                        temp += "</ol>";
                        //writer.WriteEndElement(); // p
                        temp += "</p>";

                        writer.WriteCData(temp);

                        break;

                    case "б) дополнительная литература:":

                        temp = "";

                        //writer.WriteStartElement("p");
                        temp += "<p>";
                        //writer.WriteString("б) дополнительная литература:");
                        temp += "б) дополнительная литература:";
                        //writer.WriteStartElement("ol");
                        temp += "<ol>";

                        for (int j = i + 1; j < text.Count; j++,i++)
                        {
                            if (text[j].IndexOf("контроля") != -1) break;
                            //writer.WriteStartElement("li");
                            temp += "<li>";
                            //writer.WriteString(text[j]);
                            temp += text[j];
                            //writer.WriteEndElement();
                            temp += "</li>";
                        }
                        //writer.WriteEndElement(); // ol
                        temp += "</ol>";
                        //writer.WriteEndElement(); // p
                        temp += "</p>";

                        writer.WriteCData(temp);

                        writer.WriteEndElement(); // literature
                        writer.WriteEndElement(); // disciplineMaintenance
                        break;

                    case "Вопросы для контроля":

                        temp = "";

                        writer.WriteStartElement("questions");
                        writer.WriteAttributeString("title", "Вопросы для контроля");
                        //writer.WriteStartElement("p");
                        temp += "<p>";
                        //writer.WriteStartElement("ol");
                        temp += "<ol>";
                        for (int j = i + 1; j < text.Count; j++,i++)
                        {
                            if (text[j].IndexOf("9.") != -1) break;
                            //writer.WriteStartElement("li");
                            temp += "<li>";
                            //writer.WriteString(text[j]);
                            temp += text[j];
                            //writer.WriteEndElement(); //li
                            temp += "</li>";
                        }
                        //writer.WriteEndElement(); // ol
                        temp += "</ol>";
                        //writer.WriteEndElement(); // p
                        temp += "</p>";

                        writer.WriteCData(temp);

                        writer.WriteEndElement(); // questions
                        break;

                    case "9. Критерии оценок":

                        temp = "";

                        writer.WriteStartElement("markCriterias");
                        writer.WriteAttributeString("title", "Критерии оценок");
                        //writer.WriteStartElement("p");
                        temp += "<p>";
                        //writer.WriteStartElement("table");
                        temp += "<table>";

                        table = tables[4];
                        for (int k = 0; k < table.Rows.Count; k++)
                        {
                            //writer.WriteStartElement("tr");
                            temp += "<tr>";
                            for (int l = 0; l < table.Columns.Count; l++)
                            {
                                Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                if (l == 0 && k == 0)
                                {                                 
                                    //writer.WriteStartElement("td");
                                    temp += "<td>";
                                    //writer.WriteString("Зачтено");
                                    temp += "Зачтено";
                                    //writer.WriteEndElement(); //td
                                    temp += "</td>";
                                }

                                else if (l == 0 && k == 1)
                                {
                                    //writer.WriteStartElement("td");
                                    temp += "<td>";
                                    //writer.WriteString("Незачтено");
                                    temp += "Незачтено";
                                    //writer.WriteEndElement(); //td
                                    temp += "</td>";
                                }

                                else
                                {
                                    //writer.WriteStartElement("td");
                                    temp += "<td>";
                                    //writer.WriteString(cell.Text.Replace("\r\a",""));
                                    temp += cell.Text.Replace("\r\a", "");
                                    //writer.WriteEndElement(); //td
                                    temp += "</td>";
                                }

                            }
                            //writer.WriteEndElement(); //tr
                            temp += "</tr>";
                        }

                       // writer.WriteEndElement(); // table
                        temp += "</table>";

                        table = tables[5];
                        //writer.WriteStartElement("table");
                        temp += "<table>";

                        for (int k = 0; k < table.Rows.Count; k++)
                        {
                            //writer.WriteStartElement("tr");
                            temp += "<tr>";
                            for (int l = 0; l < table.Columns.Count; l++)
                            {
                                Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                if (l == 0 && k == 0)
                                {
                                    //writer.WriteStartElement("td");
                                    temp += "<td>";
                                   // writer.WriteString("Превосходно");
                                    temp += "Превосходно";
                                    //writer.WriteEndElement(); //td
                                    temp += "</td>";
                                }

                                else if (l == 0 && k == 1)
                                {
                                    //writer.WriteStartElement("td");
                                    temp += "<td>";
                                    //writer.WriteString("Отлично");
                                    temp += "Отлично";
                                   // writer.WriteEndElement(); //td
                                    temp += "</td>";
                                }

                                else if (l == 0 && k == 2)
                                {
                                    //writer.WriteStartElement("td");
                                    temp += "<td>";
                                    //writer.WriteString("Очень хорошо");
                                    temp += "Очень хорошо";
                                   // writer.WriteEndElement(); //td
                                    temp += "</td>";
                                }

                                else if (l == 0 && k == 3)
                                {
                                    //writer.WriteStartElement("td");
                                    temp += "<td>";
                                    //writer.WriteString("Хорошо");
                                    temp += "Хорошо";
                                    //writer.WriteEndElement(); //td
                                    temp += "</td>";
                                } 

                                else if (l == 0 && k == 4)
                                {
                                    //writer.WriteStartElement("td");
                                    temp += "<td>";
                                    //writer.WriteString("Удовлетворительно");
                                    temp += "Удовлетворительно";
                                    //writer.WriteEndElement(); //td
                                    temp += "</td>";
                                }

                                else if (l == 0 && k == 5)
                                {
                                    //writer.WriteStartElement("td");
                                    temp += "<td>";
                                    //writer.WriteString("Неудовлетворительно");
                                    temp += "Неудовлетворительно";
                                    //writer.WriteEndElement(); //td
                                    temp += "</td>";
                                }

                                else
                                {
                                    //writer.WriteStartElement("td");
                                    temp += "<td>";
                                   // writer.WriteString(cell.Text.Replace("\r\a", ""));
                                    temp += cell.Text.Replace("\r\a", "");
                                    //writer.WriteEndElement(); //td
                                    temp += "</td>";
                                }

                            }
                            //writer.WriteEndElement(); //tr
                            temp += "</tr>";
                        }

                        //writer.WriteEndElement(); // table
                        temp += "</table>";
                        //writer.WriteEndElement(); // p
                        temp += "</p>";

                        writer.WriteCData(temp);

                        writer.WriteEndElement(); // markCriterias
                        break;
                }
            }

            writer.WriteStartElement("reporting");
            writer.WriteAttributeString("title", "Примерная тематика курсовых работ и критерии их оценки");
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
