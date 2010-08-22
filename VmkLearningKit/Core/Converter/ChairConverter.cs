using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Word = Microsoft.Office.Interop.Word;
using System.Xml;

namespace Converter
{
    class ChairConvertor : Converter
    {
        public override void ConvertDocument(string docPath, string xmlPath)
        {
            Word.Application program = OpenDocFile(docPath);

            Word.Document doc = new Word.Document();
            doc = program.Documents.Application.ActiveDocument;

            Word.Tables tables = doc.Tables;
            if (tables.Count == 0)
            {
                // в документе нет таблиц
                return;
            }

            Word.Table table = tables[1];

            XmlTextWriter writer = new XmlTextWriter(xmlPath, System.Text.Encoding.UTF8);

            writer.WriteStartDocument();
            writer.WriteStartElement("chairs");

            for (int i = 1; i < table.Rows.Count; i++)
            {
                writer.WriteStartElement("chair");
                for (int j = 0; j < table.Columns.Count; j++)
                {
                    Word.Range cell = table.Cell(i + 1, j + 1).Range;
                    switch (j)
                    {
                        case 0:
                            string str1 = cell.Text.Replace("\r\a","");
                            str1 = str1.Trim();
                            if (str1 != "")
                            {
                                writer.WriteAttributeString("title", str1);
                            }
                            break;
                        case 1:
                            string str2 = cell.Text.Replace("\r\a","");
                            str2 = str2.Trim();
                            if (str2 != "")
                            {
                                writer.WriteAttributeString("abbreviation", str2);
                            }
                            break;
                    }
                }
                writer.WriteEndElement();
            }

            writer.WriteEndElement();
            writer.WriteEndDocument();
            writer.Close();

            CloseDocFile(program);
        }
    }
}
