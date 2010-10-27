using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using Excel = Microsoft.Office.Interop.Excel;
using System.Windows.Forms;

namespace Converter
{
    class StudentConverter : Converter
    {
        public override void ConvertDocument(string docPath, string xmlPath, List<string> structDocument = null, ProgressBar bar = null)
        {
            Excel.Application program;
            Excel.Workbook book = OpenExcelFile(docPath, out program);

           // try
            {

                Excel.Sheets sheets = book.Sheets;
                Excel.Worksheet sheet = (Excel.Worksheet)sheets.get_Item("Сводный");

                XmlTextWriter writer = new XmlTextWriter(xmlPath, System.Text.Encoding.Default);
                writer.Formatting = Formatting.Indented;

                writer.WriteStartDocument();
                writer.WriteStartElement("students");

                int i = 2;

                Excel.Range cell1, cell2;
                char[] ch = { ' ' };
                int countEmpty = 0;
                string[] s;
                string group, fio;

                while (countEmpty!=5)
                {
                    cell1 = sheet.get_Range("A" + i, Type.Missing);
                    cell2 = sheet.get_Range("C" + i, Type.Missing);

                    group = (Convert.ToString(cell1.Value));
                    fio = Convert.ToString(cell2.Value);


                    if (group == null && fio == null)
                    {
                        i++;
                        countEmpty++;
                        continue;
                    }
                    else
                    {
                        writer.WriteStartElement("student");

                        writer.WriteAttributeString("specializationAbbreviation", "Отсутствует");

                        if (group != null)
                            writer.WriteAttributeString("groupNumber", group.Trim());
                        else
                            writer.WriteAttributeString("groupNumber", "Отсутствует");
                        if (fio != null)
                        {
                            fio = fio.Trim();
                            s = fio.Split(ch, StringSplitOptions.RemoveEmptyEntries);
                            switch (s.Length)
                            {
                                case 1:
                                    writer.WriteAttributeString("lastName",s[0]);
                                    writer.WriteAttributeString("firstName","Отсутствует");
                                    writer.WriteAttributeString("patronymic","Отсутствует");
                                    break;
                                case 2:
                                    writer.WriteAttributeString("lastName",s[0]);
                                    writer.WriteAttributeString("firstName",s[1]);
                                    writer.WriteAttributeString("patronymic","Отсутствует");
                                    break;
                                case 3:
                                    writer.WriteAttributeString("lastName",s[0]);
                                    writer.WriteAttributeString("firstName",s[1]);
                                    writer.WriteAttributeString("patronymic",s[2]);
                                    break;
                                default:
                                    writer.WriteAttributeString("lastName", "Отсутствует");
                                    writer.WriteAttributeString("firstName","Отсутствует");
                                    writer.WriteAttributeString("patronymic","Отсутствует");
                                    this.Message.Add("В " + i + "-ой строке неправильно заданы ФИО");
                                    break;
                            }
                        }
                        else
                        {
                            this.Message.Add("В " + i + "-ой строке пропущено ФИО студента");
                        }

                        writer.WriteAttributeString("chairAbbreviation","Отсутствует");
                        writer.WriteEndElement();

                        i++;
                        countEmpty = 0;
                    }
                        
                }
                                   

                writer.WriteEndElement();
                writer.WriteEndDocument();
                writer.Close();

                this.Message.Add("Конвертирование выполнено");
            
            //CloseExcelFile(program);
            }
            /*catch
            {
                this.Message.Add("Во время конвертирования произошла ошибка");
            }
            finally
            {
                CloseExcelFile(program);
            }*/

        }
    }
}

