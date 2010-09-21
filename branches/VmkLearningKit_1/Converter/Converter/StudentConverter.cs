using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using Excel = Microsoft.Office.Interop.Excel;

namespace Converter
{
    class StudentConverter: Converter
    {
        public override void ConvertDocument(string docPath, string xmlPath)
        {
            Excel.Application program;
            Excel.Workbook book = OpenExcelFile(docPath, out program);
            Excel.Sheets sheets = book.Sheets;
            Excel.Worksheet sheet = (Excel.Worksheet)sheets.get_Item(1);

            XmlTextWriter writer = new XmlTextWriter(xmlPath, System.Text.Encoding.Default);

            writer.WriteStartDocument();
            writer.WriteStartElement("students");

            bool flag = true;
            int i = 2; 
            while(flag)
            {
                Excel.Range cell1 = sheet.get_Range("A" + i, Type.Missing);
                Excel.Range cell2 = sheet.get_Range("C" + i, Type.Missing);
                Excel.Range cell3 = sheet.get_Range("E" + i, Type.Missing);

                string s1 = Convert.ToString(cell1.Value2);
                string s2 = Convert.ToString(cell2.Value2);
                string s3 = Convert.ToString(cell3.Value2);

                if (s1 == null && s2 == null && s3 == null)
                {
                    flag = false;
                    continue;
                }
                writer.WriteStartElement("student");

                if (s1 != null)
                {
                    s1 = s1.Trim();

                    string groupNumber = s1.Substring(0, s1.IndexOf(" "));
                    writer.WriteAttributeString("groupNumber", groupNumber);

                    string specializationAbbreviation = s1.Replace(groupNumber, "");
                    specializationAbbreviation = specializationAbbreviation.Trim();
                    writer.WriteAttributeString("specializationAbbreviation", specializationAbbreviation);
                }

                if (s2 != null)
                {
                    s2 = Convert.ToString(cell2.Value);

                    string lastName = s2.Substring(0, s2.IndexOf(" "));
                    writer.WriteAttributeString("lastName", lastName);
                    s2 = s2.Replace(lastName, "");
                    s2 = s2.Trim();
                    string firstName = s2.Substring(0, s2.IndexOf(" "));
                    writer.WriteAttributeString("firstName", firstName);
                    s2 = s2.Replace(firstName, "");
                    s2 = s2.Trim();
                    writer.WriteAttributeString("patronymic", s2);
                }

                if (s3 != null)
                {
                    writer.WriteAttributeString("chairAbbreviation", s3);
                }

                writer.WriteEndElement();

                i++;
            }

            writer.WriteEndElement();
            writer.WriteEndDocument();
            writer.Close();

            this.Message.Add("Конвертирование выполнено");

            CloseExcelFile(program);
        }
    }
}
