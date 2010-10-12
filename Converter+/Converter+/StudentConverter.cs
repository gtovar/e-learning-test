using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using Excel = Microsoft.Office.Interop.Excel;

namespace Converter
{
    class StudentConverter : Converter
    {
        public override void ConvertDocument(string docPath, string xmlPath, List<string> structDocument = null)
        {
            Excel.Application program;
            Excel.Workbook book = OpenExcelFile(docPath, out program);

            try
            {
                List<string> specialities = new List<string>();
                List<string> abbreviation = new List<string>();

                specialities.Add("Информационные технологии");
                specialities.Add("Прикладная математика и информатика");
                specialities.Add("Прикладная информатика");

                abbreviation.Add("ИТ");
                abbreviation.Add("ПМИ");
                abbreviation.Add("ПИ");

                Excel.Sheets sheets = book.Sheets;
                Excel.Worksheet sheet = (Excel.Worksheet)sheets.get_Item("Сводный");
                Excel.Worksheet sheet2;
                Excel.Range cell;

                XmlTextWriter writer = new XmlTextWriter(xmlPath, System.Text.Encoding.Default);

                writer.WriteStartDocument();
                writer.WriteStartElement("students");

                bool flag = true;
                int i = 2;

                string groupNumber = "";
                string fio = "";
                string chair = "";
                string specializationAbbreviation = "";

                while (flag)
                {
                    Excel.Range cell1 = sheet.get_Range("A" + i, Type.Missing);
                    Excel.Range cell2 = sheet.get_Range("C" + i, Type.Missing);
                    Excel.Range cell3 = sheet.get_Range("E" + i, Type.Missing);

                    groupNumber = Convert.ToString(cell1.Value2);
                    fio = Convert.ToString(cell2.Value2);
                    chair = Convert.ToString(cell3.Value2);

                    if (groupNumber == null && fio == null && chair == null)
                    {
                        flag = false;
                        continue;
                    }

                    writer.WriteStartElement("student");

                    if (groupNumber != null)
                    {
                        groupNumber = groupNumber.Trim();

                        writer.WriteAttributeString("groupNumber", groupNumber);

                        /*if (groupNumber[0] != '0')
                        {
                            sheet2 = (Excel.Worksheet)sheets.get_Item("0" + groupNumber);
                        }
                        else
                        {
                            sheet2 = (Excel.Worksheet)sheets.get_Item(groupNumber);
                        }

                        cell = sheet2.get_Range("A1", Type.Missing);

                        bool fl = false;
                        if (cell.Value2 != null)
                        {
                            specializationAbbreviation = Convert.ToString(cell.Value2);
                            for (int j = 0; j < specialities.Count; j++)
                            {
                                if (specializationAbbreviation.Replace(" ", "").ToLower().IndexOf(specialities[j].Replace(" ", "").ToLower()) != -1)
                                {
                                    writer.WriteAttributeString("specializationAbbreviation", abbreviation[j]);
                                    fl = true;
                                    break;
                                }
                            }

                        }
                        if (!fl)
                            writer.WriteAttributeString("specializationAbbreviation", "Отсутствует");*/
                    }

                    else
                    {
                        writer.WriteAttributeString("groupNumber", "Отсутствует");
                        //writer.WriteAttributeString("specializationAbbreviation", "Отсутствует");
                    }

                    writer.WriteAttributeString("specializationAbbreviation", "Отсутствует");

                    if (fio != null)
                    {
                        string lastName = "";
                        string firstName = "";
                        string patronymic = "";
                        fio = fio.Trim();
                        if (fio.IndexOf(" ") != -1)
                        {
                            lastName = fio.Substring(0, fio.IndexOf(" "));
                            writer.WriteAttributeString("lastName", lastName);
                            fio = fio.Replace(lastName, "");
                            fio = fio.Trim();
                        }
                        else if (fio != "")
                        {
                            lastName = fio;
                            writer.WriteAttributeString("lastName", lastName);
                            writer.WriteAttributeString("firstName", "Отсутствует");
                            writer.WriteAttributeString("patronymic", "Отсутствует");
                            fio = "";
                        }
                        else
                        {
                            writer.WriteAttributeString("lastName", "Отсутствует");
                            writer.WriteAttributeString("firstName", "Отсутствует");
                            writer.WriteAttributeString("patronymic", "Отсутствует");
                        }
                                            
                        if (fio.IndexOf(" ") != -1)
                        {
                            firstName = fio.Substring(0, fio.IndexOf(" "));
                            writer.WriteAttributeString("firstName", firstName);
                            fio = fio.Replace(firstName, "");
                            fio = fio.Trim();
                        }
                        else if (fio != "")
                        {
                            firstName = fio;
                            writer.WriteAttributeString("firstName", firstName);
                            writer.WriteAttributeString("patronymic", "Отсутствует");
                            fio = "";
                        }
                        else
                        {
                            writer.WriteAttributeString("firstName", "Отсутствует");
                            writer.WriteAttributeString("patronymic", "Отсутствует");
                        }
                        
                        if (fio != "")
                        {
                            patronymic = fio;
                            writer.WriteAttributeString("patronymic", patronymic);
                        }
                    }

                    writer.WriteAttributeString("chairAbbreviation", "Отсутствует");

                    if (chair != null)
                    {
                        // Где брать кафедру?!!!!                        
                    }
                   
                    writer.WriteEndElement();

                    i++;
                }

                writer.WriteEndElement();
                writer.WriteEndDocument();
                writer.Close();

                this.Message.Add("Конвертирование выполнено");
            
            //CloseExcelFile(program);
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

