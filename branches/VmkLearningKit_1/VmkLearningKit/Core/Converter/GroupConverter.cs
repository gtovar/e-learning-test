using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using Excel = Microsoft.Office.Interop.Excel;

namespace Converter
{
    class GroupConverter: Converter
    {
        public override void ConvertDocument(string docPath, string xmlPath)
        {
            Excel.Application program;
            Excel.Workbook book = OpenExcelFile(docPath, out program);
            Excel.Sheets sheets = book.Sheets;
            Excel.Worksheet sheet = (Excel.Worksheet)sheets.get_Item(1);

            XmlTextWriter writer = new XmlTextWriter(xmlPath, System.Text.Encoding.UTF8);

            writer.WriteStartDocument();
            writer.WriteStartElement("groups");


            List<string> groups = new List<string>();
            bool flag = true;
            int i = 2; 
            while(flag)
            {
                Excel.Range cell1 = sheet.get_Range("A" + i, Type.Missing);

                string s1 = Convert.ToString(cell1.Value2);

                if (s1 == null)
                {
                    flag = false;
                    continue;
                }    
                
                s1 = s1.Trim();

                if (groups.IndexOf(s1) == -1)
                {
                    writer.WriteStartElement("group");

                    string groupNumber = s1.Substring(0, s1.IndexOf(" "));
                    writer.WriteAttributeString("groupNumber", groupNumber);

                    string speciality = s1.Replace(groupNumber, "");
                    speciality = speciality.Trim();
                    writer.WriteAttributeString("specializationAbbreviation", speciality);              

                    writer.WriteEndElement();

                    groups.Add(s1);
                }

                i++;
            }

            writer.WriteEndElement();
            writer.WriteEndDocument();
            writer.Close();

            CloseExcelFile(program);
        }
        }
    }
