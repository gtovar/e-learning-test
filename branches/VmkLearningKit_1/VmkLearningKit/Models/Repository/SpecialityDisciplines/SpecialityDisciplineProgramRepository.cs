using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class SpecialityDisciplineProgramRepository : Repository<SpecialityDisciplineProgram>, ISpecialityDisciplineProgramRepository
    {
        public SpecialityDisciplineProgramRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public SpecialityDisciplineProgram GetById(long id)
        {
            return DataContext.SpecialityDisciplinePrograms.SingleOrDefault(s => s.SpecialityDisciplineId == id);
        }

        public List<string> GetTable(long disciplineProgramId, int fl)
        {
            SpecialityDisciplineProgram sp = DataContext.SpecialityDisciplinePrograms.SingleOrDefault(t => t.SpecialityDisciplineId == disciplineProgramId);

            List<string> cells = new List<string>();

            string text = null;

            switch (fl)
            {
                case 1:
                    text = sp.Volume;
                    break;
                case 2:
                    text = sp.Razdels;
                    break;
                case 3:
                    text = sp.LabPractice;
                    break;
                default:
                    text = sp.Volume;
                    break;
            }
            

            string str = default(string);
            string s = default(string);

            int index = text.IndexOf("<tbody>");
            int index2 = text.IndexOf("</tbody>");
            if (index < index2)
                str = text.Substring(index + "<tbody>".Length, index2 - index - "<tbody>".Length);
            if (str != null)
            {
                bool flag = false;
                int idx = str.IndexOf("<td>");
                int idx2 = str.IndexOf("</td>");
                if (idx < idx2)
                    flag = true;
                while (flag)
                {
                    s = str.Substring(idx + "<td>".Length, idx2 - idx - "<td>".Length);
                    cells.Add(s.Replace("\r\n\t\t\t\t", ""));
                    str = str.Remove(idx, "<td>".Length + s.Length + "</td>".Length);
                    idx = str.IndexOf("<td>");
                    idx2 = str.IndexOf("</td>");
                    if (idx >= idx2)
                        flag = false;
                }
            }

            return cells;
        }

        public List<string> GetTable2(long disciplineProgramId, out List<string> table2)
        {
            List<string> table = new List<string>();
            List<string> tb2 = new List<string>();

            SpecialityDisciplineProgram sp = DataContext.SpecialityDisciplinePrograms.SingleOrDefault(t => t.SpecialityDisciplineId == disciplineProgramId);

            string text = sp.MarkCriterias;
            int fake = 1;
            bool flag = true;

            while (flag)
            {
                int index = text.IndexOf("<table>");
                int index1 = text.IndexOf("</table>");
                if (index < index1)
                {
                    string str = text.Substring(index + "<table>".Length, index1 - index - "<table>".Length);
                    int count = str.Length;
     
                    bool fl = true;
                       while (fl)
                        {
                            int idx = str.IndexOf("<td>");
                            int idx1 = str.IndexOf("</td>");
                            if (idx < idx1)
                            {
                                string s = str.Substring(idx + "<td>".Length, idx1 - idx - "<td>".Length);

                                if (fake == 1)
                                {
                                    table.Add(s);
                                }
                                else
                                    tb2.Add(s);

                                str = str.Remove(idx, "<td>".Length + s.Length + "</td>".Length);
                            }
                            else
                                fl = false;
                        }
                    
                    text = text.Remove(index, "<table>".Length + count + "</table>".Length);
                    fake++;
                }

                else
                {
                    flag = false;
                }
            }
            table2 = tb2;
            return table;
        }

        public List<string> GetLiterature(long disciplineProgramId, out List<string> second)
        {
            List<string> first = new List<string>();
            List<string> sec = new List<string>();

            SpecialityDisciplineProgram sp = DataContext.SpecialityDisciplinePrograms.SingleOrDefault(t => t.SpecialityDisciplineId == disciplineProgramId);

            string text = sp.Literature;

            bool flag = true;

            while(flag)
            {
                int index = text.IndexOf("<p>");
                int index1 = text.IndexOf("</p>");
                if (index < index1)
                {
                    string str = text.Substring(index + "<p>".Length, index1 - index - "<p>".Length);
                    int count = str.Length;

                    if (str.IndexOf("основная") != -1)
                    {
                        bool fl = true;
                        while (fl)
                        {
                            int idx = str.IndexOf("<li>");
                            int idx1 = str.IndexOf("</li>");
                            if (idx < idx1)
                            {
                                string s = str.Substring(idx + "<li>".Length, idx1 - idx - "<li>".Length);
                                first.Add(s);
                                str = str.Remove(idx, "<li>".Length + s.Length + "</li>".Length);
                            }
                            else
                                fl = false;
                        }
                    }
                    else if (str.IndexOf("дополнительная") != -1)
                    {
                        bool fl = true;
                        while (fl)
                        {
                            int idx = str.IndexOf("<li>");
                            int idx1 = str.IndexOf("</li>");
                            if (idx < idx1)
                            {
                                string s = str.Substring(idx + "<li>".Length, idx1 - idx - "<li>".Length);
                                sec.Add(s);
                                str = str.Remove(idx, "<li>".Length + s.Length + "</li>".Length);
                            }
                            else
                                fl = false;
                        }

                        index1 = text.IndexOf("</p>");
                    }

                    text = text.Remove(index, "<p>".Length + count + "</p>".Length);
                }

                else
                {
                    flag = false;
                }
            }
            second = sec;
            return first;
        }

        public List<string> GetQuestions(long disciplineProgramId)
        {
            List<string> questions = new List<string>();

            SpecialityDisciplineProgram sp = DataContext.SpecialityDisciplinePrograms.SingleOrDefault(t => t.SpecialityDisciplineId == disciplineProgramId);

            string text = sp.Questions;

            int index = text.IndexOf("<p>");
            int index1 = text.IndexOf("</p>");
            if (index < index1)
            {
                string str = text.Substring(index + "<p>".Length, index1 - index - "<p>".Length);
                
                bool flag = true;
                while (flag)
                {
                    int idx = str.IndexOf("<li>");
                    int idx1 = str.IndexOf("</li>");
                    if (idx < idx1)
                    {
                        string s = str.Substring(idx + "<li>".Length, idx1 - idx - "<li>".Length);
                        questions.Add(s);
                        str = str.Remove(idx, "<li>".Length + s.Length + "</li>".Length);
                    }
                    else
                        flag = false;
                }
               
             }

            return questions;
        }

        public SpecialityDisciplineProgram Add(SpecialityDisciplineProgram obj)
        {
            try
            {
                SpecialityDisciplineProgram program = GetById(obj.SpecialityDisciplineId);

                if (program == null)
                {
                    DataContext.SpecialityDisciplinePrograms.InsertOnSubmit(obj);
                    DataContext.SubmitChanges();

                    return obj;
                }
                else
                {
                    program.Additional = obj.Additional;
                    program.ApplicationDomain = obj.ApplicationDomain;
                    program.LabPractice = obj.LabPractice;
                    program.Literature = obj.Literature;
                    program.MarkCriterias = obj.MarkCriterias;
                    program.Purposes = obj.Purposes;
                    program.Questions = obj.Questions;
                    program.Razdels = obj.Razdels;
                    program.RazdelsContent = obj.RazdelsContent;
                    program.Reporting = obj.Reporting;
                    program.Requirements = obj.Requirements;
                    program.Volume = obj.Volume;

                    DataContext.SubmitChanges();
                    
                    return program;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't add SpecialityDisciplineProgram's entry to database !!!!", ex);
            }
            return null;
        }

        public SpecialityDisciplineProgram Edit(SpecialityDisciplineProgram obj)
        {
            try
            {
                SpecialityDisciplineProgram program = GetById(obj.SpecialityDisciplineId);

                if (program == null)
                {
                    DataContext.SpecialityDisciplinePrograms.InsertOnSubmit(obj);
                    DataContext.SubmitChanges();

                    return obj;
                }
                else
                {
                    program.SpecialityDisciplineId = obj.SpecialityDisciplineId;
                    program.ApplicationDomain = obj.ApplicationDomain;
                    program.Purposes = obj.Purposes;
                    program.Requirements = obj.Requirements;
                    program.Volume = obj.Volume;
                    program.Razdels = obj.Razdels;
                    program.RazdelsContent = obj.RazdelsContent;
                    program.LabPractice = obj.LabPractice;
                    program.Literature = obj.Literature;
                    program.Questions = obj.Questions;
                    program.MarkCriterias = obj.MarkCriterias;
                    program.Reporting = obj.Reporting;
                    program.Additional = obj.Additional;

                    DataContext.SubmitChanges();

                    return obj;
                }

                //return program;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't edit SpecialityDisciplineProgram's entry to database !!!!", ex);
            }
            return null;
        }

        public void Delete(SpecialityDisciplineProgram obj)
        {
            DataContext.SpecialityDisciplinePrograms.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.SpecialityDisciplinePrograms.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
