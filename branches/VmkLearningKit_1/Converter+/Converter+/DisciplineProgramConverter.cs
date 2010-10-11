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

        public override void ConvertDocument(string docPath, string xmlPath, List<string> structDocument = null)
        {
            Word.Application program = OpenDocFile(docPath);
            try
            {

                Word.Document doc = new Word.Document();
                doc = program.Documents.Application.ActiveDocument;

                text = new List<string>();

                Word.Paragraphs paragrahs = doc.Paragraphs;
                foreach (Word.Paragraph p in paragrahs)
                {
                    string str = p.Range.Text.Replace("\r\a", "");
                    str = str.Trim();
                    text.Add(str);
                }

                text.Add("*EndOfDocument*");

                Word.Tables tables = doc.Tables;
                int countTables = 1;
                Word.Table table;

                List<string> razdels = new List<string>();

                XmlTextWriter writer = new XmlTextWriter(xmlPath, System.Text.Encoding.Default);

                string temp = "";
                string prog = "";
                bool fl = false;

                writer.WriteStartDocument();
                writer.WriteStartElement("disciplineProgram");



                structDocument.Add("*EndOfDocument*");

                List<string> structDocumentLower = new List<string>();

                for (int i = 0; i < structDocument.Count; i++)
                {
                    structDocumentLower.Add(structDocument[i].Replace(" ", "").ToLower());
                }

                for (int i = 0; i < text.Count; i++)
                {
                    string str = text[i].Replace(" ", "").ToLower();
                    if (str == "") { continue; }
                    string breakAnaliz = "";

                    for (int l = 0; l < structDocument.Count - 1; l++)
                    {
                        if (str.IndexOf(structDocumentLower[l]) != -1)
                        {
                            text[i] = structDocument[l];
                            breakAnaliz = structDocumentLower[l + 1];

                            break;
                        }
                    }

                    string jj = text[i];
                    if (!fl)
                    {
                        if (jj.ToLower().IndexOf("учебная") != -1)
                        {
                            string title = "";
                            int idx1 = text[i + 2].IndexOf("«");
                            int idx2 = text[i + 2].IndexOf("»");
                            if (idx1 < idx2)
                            {
                                title = text[i + 2].Substring(idx1 + 1, idx2 - idx1 -1);
                            }
                            else
                            {
                                this.Message.Add("Не удалось распознать название дисциплины");
                            }
                            writer.WriteStartElement("title");
                            writer.WriteString(title);
                            writer.WriteEndElement(); // title
                            fl = true;
                            continue;
                        }
                    }

                    if (jj.Replace(" ", "").ToLower().IndexOf("программасоставлена") != -1)
                    {
                        prog = jj;
                        jj = "Программа";
                    }

                    switch (jj)
                    {
                        case "Область применения":

                            writer.WriteStartElement("applicationDomain");
                            writer.WriteAttributeString("title", "Область применения");

                            for (int j = i + 1; j < text.Count; j++, i++)
                            {
                                string h = text[j].Replace(" ", "").ToLower();
                                if (h.IndexOf(breakAnaliz) != -1) break;

                                temp += "<p>";
                                temp += text[j];
                                temp += "</p>";
                            }

                            writer.WriteCData(temp);

                            writer.WriteEndElement(); // applicationDomain

                            break;

                        case "Цели и задачи дисциплины":

                            writer.WriteStartElement("purposes");
                            writer.WriteAttributeString("title", "Цели и задачи дисцмплины");

                            temp = "";
                            for (int j = i + 1; j < text.Count; j++, i++)
                            {
                                string h = text[j].Replace(" ", "").ToLower();
                                if (h.IndexOf(breakAnaliz) != -1) break;

                                temp += "<p>";
                                temp += text[j];
                                temp += "</p>";
                            }

                            writer.WriteCData(temp);

                            writer.WriteEndElement(); // purposes

                            break;

                        case "Цель и задачи курса":

                            writer.WriteStartElement("purposes");
                            writer.WriteAttributeString("title", "Цели и задачи дисцмплины");

                            temp = "";
                            for (int j = i + 1; j < text.Count; j++, i++)
                            {
                                string h = text[j].Replace(" ", "").ToLower();
                                if (h.IndexOf(breakAnaliz) != -1) break;

                                temp += "<p>";
                                temp += text[j];
                                temp += "</p>";
                            }

                            writer.WriteCData(temp);

                            writer.WriteEndElement(); // purposes

                            break;

                        case "Требования к уровню освоения содержания дисциплины":

                            writer.WriteStartElement("requirements");
                            writer.WriteAttributeString("title", "Требования к уровню освоения содержания дисциплины");

                            temp = "";
                            for (int j = i + 1; j < text.Count; j++, i++)
                            {
                                string h = text[j].Replace(" ", "").ToLower();
                                if (h.IndexOf(breakAnaliz) != -1) break;

                                temp += "<p>";
                                temp += text[j];
                                temp += "</p>";
                            }

                            writer.WriteCData(temp);

                            writer.WriteEndElement(); // requirements

                            break;

                        case "Объем дисциплины и виды учебной работы":

                            temp = "";

                            writer.WriteStartElement("disciplineVolume");

                            writer.WriteAttributeString("title", "Объем дисциплины и виды учебной работы");

                            temp += "<p>";
                            temp += "<table>";
                            temp += "<thead>";
                            temp += "<tr>";
                            temp += "<td>";
                            temp += "Виды учебной работы";
                            temp += "</td>";
                            temp += "<td>";
                            temp += "Всего часов";
                            temp += "</td>";
                            temp += "<td>";
                            temp += "Семестры";
                            temp += "</td>";
                            temp += "</tr>";
                            temp += "</thead>";
                            temp += "<tbody>";

                            int count = 4;

                            if (countTables > tables.Count)
                            {
                                this.Message.Add("Документ не содержит нужной таблицы");
                            }
                            else
                            {
                                table = tables[countTables];

                                countTables++;


                                for (int k = 1; k < table.Rows.Count; k++)
                                {
                                    temp += "<tr>";
                                    for (int l = 0; l < table.Columns.Count; l++)
                                    {
                                        Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                        temp += "<td>";
                                        temp += cell.Text.Replace("\r\a", "");
                                        temp += "</td>";
                                        count++;
                                    }
                                    temp += "</tr>";
                                    count++;
                                }
                            }

                            temp += "</tbody>";
                            temp += "</table>";

                            i += count;

                            temp += "</p>";

                            writer.WriteCData(temp);

                            writer.WriteEndElement(); // disciplineVolume
                            break;

                        case "Разделы дисциплины и виды занятий":

                            temp = "";

                            writer.WriteStartElement("disciplineContent");
                            writer.WriteAttributeString("title", "Содержание дисциплины");

                            writer.WriteStartElement("disciplineRazdels");
                            writer.WriteAttributeString("title", "Разделы дисциплины и виды занятий");

                            temp += "<p>";
                            temp += "<table>";
                            temp += "<thead>";
                            temp += "<tr>";
                            temp += "<td>";
                            temp += "№п/п";
                            temp += "</td>";
                            temp += "<td>";
                            temp += "Раздел дисциплины";
                            temp += "</td>";
                            temp += "<td>";
                            temp += "Лекции";
                            temp += "</td>";
                            temp += "<td>";
                            temp += "ПЗ (или С)";
                            temp += "</td>";
                            temp += "<td>";
                            temp += "ЛР";
                            temp += "</td>";
                            temp += "</tr>";
                            temp += "</thead>";
                            temp += "<tbody>";

                            int count2 = 5;

                            if (countTables > tables.Count)
                            {
                                this.Message.Add("Документ не содержит нужной таблицы");
                            }
                            else
                            {
                                table = tables[countTables];

                                countTables++;

                                for (int k = 1; k < table.Rows.Count; k++)
                                {
                                    temp += "<tr>";
                                    for (int l = 0; l < table.Columns.Count; l++)
                                    {
                                        Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                        if (l == 1) razdels.Add(cell.Text.Replace("\r\a", "").Trim());
                                        temp += "<td>";
                                        temp += cell.Text.Replace("\r\a", "");
                                        temp += "</td>";
                                        count2++;
                                    }

                                    temp += "</tr>";
                                    count2++;
                                }

                                temp += "</tbody>";
                                temp += "</table>";
                            }

                            i += count2;

                            temp += "</p>";

                            writer.WriteCData(temp);

                            writer.WriteEndElement(); // disciplineRazdels
                            break;

                        case "Содержание разделов дисциплины":

                            writer.WriteStartElement("disciplineRazdelsContent");
                            writer.WriteAttributeString("title", "Содержание разделов дисциплины");
                            writer.WriteEndElement(); //disciplineRazdelsContent

                            char[] chrs = { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.' };

                            writer.WriteStartElement("topics");

                            for (int j = i + 2; j < text.Count; j++, i++)
                            {
                                string kk = text[j];
                                if (kk.ToLower().IndexOf("семестр") != -1) continue;
                                if (kk == "") continue;
                                if (kk.Replace(" ", "").ToLower().IndexOf(breakAnaliz) != -1) break;
                                writer.WriteStartElement("topic");
                                bool flag = false;
                                foreach (string s in razdels)
                                {
                                    if (text[j].ToLower().IndexOf(s.ToLower()) != -1)
                                    {
                                        flag = true;
                                        text[j] = s;
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
                                    text[j] = text[j].TrimStart(chrs);
                                    text[j] = text[j].Trim();
                                }

                                writer.WriteAttributeString("title", text[j]);

                                writer.WriteEndElement(); // topic

                            }

                            writer.WriteEndElement(); // topics
                            writer.WriteEndElement(); // disciplineContent
                            break;

                        case "Лабораторный практикум":

                            temp = "";

                            writer.WriteStartElement("labPractice");
                            writer.WriteAttributeString("title", "Лабораторный практикум");

                            temp += "<p>";
                            temp += "<table>";
                            temp += "<thead>";
                            temp += "<tr>";
                            temp += "<td>";
                            temp += "№п/п";
                            temp += "</td>";
                            temp += "<td>";
                            temp += "№ раздела дисциплины";
                            temp += "</td>";
                            temp += "<td>";
                            temp += "Наименование лабораторных работ";
                            temp += "</td>";
                            temp += "</tr>";
                            temp += "</thead>";
                            temp += "<tbody>";

                            int count3 = 7;

                            if (countTables > tables.Count)
                            {
                                this.Message.Add("Документ не содержит нужной таблицы");
                            }
                            else
                            {
                                table = tables[countTables];

                                countTables++;

                                for (int k = 1; k < table.Rows.Count; k++)
                                {
                                    temp += "<tr>";
                                    for (int l = 0; l < table.Columns.Count; l++)
                                    {
                                        Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                        temp += "<td>";
                                        temp += cell.Text.Replace("\r\a", "");
                                        temp += "</td>";
                                        count3++;
                                    }
                                    temp += "</tr>";
                                    count3++;
                                }

                                temp += "</tbody>";
                                temp += "</table>";

                            }

                            i += count3;
                            temp += "</p>";

                            writer.WriteCData(temp);

                            writer.WriteEndElement(); // labPractice

                            break;

                        case "Основная литература":

                            temp = "";

                            writer.WriteStartElement("disciplineMaintenance");
                            writer.WriteAttributeString("title", "Учебно-методическое обеспечение дисциплины");
                            writer.WriteStartElement("literature");
                            writer.WriteAttributeString("title", "Рекомендуемая литература");
                            temp += "<p>";
                            temp += "а) основная литература:";
                            temp += "<ol>";

                            for (int j = i + 1; j < text.Count; j++, i++)
                            {
                                if (text[j].Replace(" ", "").ToLower().IndexOf(breakAnaliz) != -1) break;
                                temp += "<li>";
                                temp += text[j];
                                temp += "</li>";
                            }
                            temp += "</ol>";
                            temp += "</p>";

                            writer.WriteCData(temp);

                            break;

                        case "Дополнительная литература":

                            temp = "";
                            temp += "<p>";
                            temp += "б) дополнительная литература:";
                            temp += "<ol>";

                            for (int j = i + 1; j < text.Count; j++, i++)
                            {
                                if (text[j].Replace(" ", "").ToLower().IndexOf(breakAnaliz) != -1) break;
                                temp += "<li>";
                                temp += text[j];
                                temp += "</li>";
                            }
                            temp += "</ol>";
                            temp += "</p>";

                            writer.WriteCData(temp);

                            writer.WriteEndElement(); // literature
                            writer.WriteEndElement(); // disciplineMaintenance
                            break;

                        case "Вопросы для контроля":

                            temp = "";

                            writer.WriteStartElement("questions");
                            writer.WriteAttributeString("title", "Вопросы для контроля");
                            temp += "<p>";
                            temp += "<ol>";
                            for (int j = i + 1; j < text.Count; j++, i++)
                            {
                                if (text[j].IndexOf("9.") != -1) break;
                                temp += "<li>";
                                temp += text[j];
                                temp += "</li>";
                            }
                            temp += "</ol>";
                            temp += "</p>";

                            writer.WriteCData(temp);

                            writer.WriteEndElement(); // questions
                            break;

                        case "Критерии оценок":

                            temp = "";

                            writer.WriteStartElement("markCriterias");
                            writer.WriteAttributeString("title", "Критерии оценок");

                            temp += "<p>";
                            temp += "<table>";

                            if (countTables > tables.Count)
                            {
                                this.Message.Add("Документ не содержит нужной таблицы");
                            }
                            else
                            {
                                table = tables[countTables];

                                countTables++;

                                for (int k = 0; k < table.Rows.Count; k++)
                                {
                                    temp += "<tr>";
                                    for (int l = 0; l < table.Columns.Count; l++)
                                    {
                                        Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                        if (l == 0 && k == 0)
                                        {
                                            temp += "<td>";
                                            temp += "Зачтено";
                                            temp += "</td>";
                                        }

                                        else if (l == 0 && k == 1)
                                        {
                                            temp += "<td>";
                                            temp += "Незачтено";
                                            temp += "</td>";
                                        }

                                        else
                                        {
                                            temp += "<td>";
                                            temp += cell.Text.Replace("\r\a", "");
                                            temp += "</td>";
                                        }

                                    }
                                    temp += "</tr>";
                                }
                            }
                            temp += "</table>";

                            if (countTables > tables.Count)
                            {
                                this.Message.Add("Документ не содержит нужной таблицы");
                            }
                            else
                            {
                                table = tables[countTables];

                                countTables++;

                                temp += "<table>";

                                for (int k = 0; k < table.Rows.Count; k++)
                                {
                                    temp += "<tr>";
                                    for (int l = 0; l < table.Columns.Count; l++)
                                    {
                                        Word.Range cell = table.Cell(k + 1, l + 1).Range;
                                        if (l == 0 && k == 0)
                                        {
                                            temp += "<td>";
                                            temp += "Превосходно";
                                            temp += "</td>";
                                        }

                                        else if (l == 0 && k == 1)
                                        {
                                            temp += "<td>";
                                            temp += "Отлично";
                                            temp += "</td>";
                                        }

                                        else if (l == 0 && k == 2)
                                        {
                                            temp += "<td>";
                                            temp += "Очень хорошо";
                                            temp += "</td>";
                                        }

                                        else if (l == 0 && k == 3)
                                        {
                                            temp += "<td>";
                                            temp += "Хорошо";
                                            temp += "</td>";
                                        }

                                        else if (l == 0 && k == 4)
                                        {
                                            temp += "<td>";
                                            temp += "Удовлетворительно";
                                            temp += "</td>";
                                        }

                                        else if (l == 0 && k == 5)
                                        {
                                            temp += "<td>";
                                            temp += "Неудовлетворительно";
                                            temp += "</td>";
                                        }

                                        else
                                        {
                                            temp += "<td>";
                                            temp += cell.Text.Replace("\r\a", "");
                                            temp += "</td>";
                                        }

                                    }
                                    temp += "</tr>";
                                }

                                temp += "</table>";
                                temp += "</p>";
                            }
                            writer.WriteCData(temp);

                            writer.WriteEndElement(); // markCriterias
                            break;
                        case "Примерная тематика курсовых работ и критерии их оценки":

                            temp = "";
                            breakAnaliz = "программасоставлена";

                            writer.WriteStartElement("reporting");
                            writer.WriteAttributeString("title", "Примерная тематика курсовых работ и критерии их оценки");                           

                            for (int j = i + 1; j < text.Count; j++, i++)
                            {
                                string h = text[j].Replace(" ", "").ToLower();
                                if (h.IndexOf(breakAnaliz) != -1) break;

                                temp += "<p>";
                                temp += text[j];
                                temp += "</p>";
                            }

                            writer.WriteCData(temp);

                            writer.WriteEndElement(); // reporting

                            break;

                        case "Программа":

                            temp = "";

                            writer.WriteStartElement("additional");
                            for (int j = i; j < text.Count; j++, i++)
                            {
                                if (text[j] == "*EndOfDocument*") break;
                                temp += "<p>";
                                temp += text[j];
                                temp += "</p>";
                            }
                            writer.WriteCData(temp);
                            writer.WriteEndElement();
                            break;
                    }
                }

                writer.WriteEndElement(); // disciplineProgram
                writer.WriteEndDocument();
                writer.Close();

                this.Message.Add("Конвертирование выполнено");

                CloseDocFile(program);
            }
            catch
            {
                this.Message.Add("Во время конвертирования произошла ошибка");
            }
            finally
            {
                CloseDocFile(program);
            }
        }
    }
}

