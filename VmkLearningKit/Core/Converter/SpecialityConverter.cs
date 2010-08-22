using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Word = Microsoft.Office.Interop.Word;
using System.Xml;

namespace Converter
{
    class SpecialityConvertor : Converter
    {
        private bool IsSpec(string str)
        {
            string stroka = str.ToLower();
            if ((stroka.IndexOf("специалитет") != -1) || (stroka.IndexOf("бакалавриат") != -1) || (stroka.IndexOf("магистратура") != -1)) return true;
            return false;
         }

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

            int specialityCount = 0;
            int specializationCount = 0;

            List<string> specialityStr = new List<string>();
            List<string> specializationStr = new List<string>();

            XmlTextWriter writer = new XmlTextWriter(xmlPath, System.Text.Encoding.UTF8);

            writer.WriteStartDocument();
            writer.WriteStartElement("specialities");

            for(int i =0; i < text.Count - 3; i++)
            {
                string s1 = text[i].ToLower();
                s1 = s1.Replace(" ", "");
                s1 = s1.Trim();

                string s2 = text[i+1].ToLower();
                s2 = s2.Replace(" ", "");
                s2 = s2.Trim();

                string s3 = text[i+2].ToLower();
                s3 = s3.Replace(" ", "");
                s3 = s3.Trim();

                string s4 = text[i+3].ToLower();
                s4 = s4.Replace(" ", "");
                s4 = s4.Trim();

                if (s1 == "код" && s2 == "название" && (s3 == "сокращенноеназвание" || s3 == "сокращённоеназвание") && s4 != "кафедры")
                {
                    specialityCount++;
                    for (int j = i-1; j > 0; j--)
                    {
                        if (IsSpec(text[j]))
                        {
                            specialityStr.Add(text[j]);
                            text.RemoveAt(j);
                            break;
                        }
                    }
                }

                if (s1 == "код" && s2 == "название" && (s3 == "сокращенноеназвание" || s3 == "сокращённоеназвание") && s4 == "кафедры")
                {
                    specializationCount++;
                    for (int j = i - 1; j > 0; j--)
                    {
                        if (IsSpec(text[j]))
                        {
                            specializationStr.Add(text[j]);
                            text.RemoveAt(j);
                            break;
                        }
                    }
                }
                    
            }

            if (specialityCount + specializationCount != tables.Count)
            {
                //ошибка  в документе
            }

            for (int i = 1; i <= specialityCount; i++)
            {
                Word.Table table = tables[i];
                for (int j = 1; j < table.Rows.Count; j++)
                {
                    writer.WriteStartElement("speciality");
                    writer.WriteAttributeString("education plan", specialityStr[i-1]);
                    string abbreviation= "";
                    for (int k = 0; k < table.Columns.Count; k++)
                    {
                        Word.Range cell = table.Cell(j + 1, k + 1).Range;
                        switch (k)
                        {
                            case 0:
                                string str1 = cell.Text.Replace("\r\a","");
                                str1 = str1.Trim();
                                if (str1 != "")
                                {
                                    writer.WriteAttributeString("code", str1);
                                }
                                break;
                            case 1:
                                string str2 = cell.Text.Replace("\r\a","");
                                str2 = str2.Trim();
                                if (str2 != "")
                                {
                                    writer.WriteAttributeString("title", str2);
                                }
                                break;
                            case 2:
                                string str3 = cell.Text.Replace("\r\a","");
                                str3 = str3.Trim();
                                if (str3 != "")
                                {
                                    writer.WriteAttributeString("abbreviation", str3);
                                    abbreviation = str3;
                                }
                                break;
                        }
                    }

                    int q = 1;
                    foreach (string s in specializationStr)
                    {
                        if (s.IndexOf(specialityStr[i - 1]) != -1 && abbreviation != "" && s.IndexOf(abbreviation) != -1)
                        {
                            writer.WriteStartElement("specializations");
                            Word.Table tab = tables[specialityCount + q];
                            for (int l = 1; l < tab.Rows.Count; l++)
                            {
                                writer.WriteStartElement("specialization");
                                for (int m = 0; m < tab.Columns.Count; m++)
                                {
                                    Word.Range _cell = tab.Cell(l + 1, m + 1).Range;
                                    switch (m)
                                    {
                                        case 0:
                                            string s1 = _cell.Text.Replace("\r\a", "");
                                            s1 = s1.Trim();
                                            if (s1 != "")
                                            {
                                                writer.WriteAttributeString("code", s1);
                                            }
                                            break;
                                        case 1:
                                            string s2 = _cell.Text.Replace("\r\a", "");
                                            s2 = s2.Trim();
                                            if (s2 != "")
                                            {
                                                writer.WriteAttributeString("title", s2);
                                            }
                                            break;
                                        case 2:
                                            string s3 = _cell.Text.Replace("\r\a", "");
                                            s3 = s3.Trim();
                                            if (s3 != "")
                                            {
                                                writer.WriteAttributeString("abbreviation", s3);
                                            }
                                            break;
                                        case 3:
                                            string s4 = _cell.Text.Replace("\r\a", "");
                                            s4 = s4.Trim();
                                            if (s4 != "")
                                            {
                                                writer.WriteAttributeString("chair", s4);
                                            }
                                            break;
                                    }
                                }
                                writer.WriteEndElement();
                            }
                            writer.WriteEndElement();
                        }
                        
                        q++;
                    }
                    writer.WriteEndElement();
                }
            }

            writer.WriteEndElement();
            writer.WriteEndDocument();
            writer.Close();

            CloseDocFile(program);

        }
    }
}
