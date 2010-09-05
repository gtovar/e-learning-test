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

        public List<string> GetVolume(long disciplineProgramId)
        {
            SpecialityDisciplineProgram sp = DataContext.SpecialityDisciplinePrograms.SingleOrDefault(t => t.SpecialityDisciplineId == disciplineProgramId);

            List<string> cells = new List<string>();

            string volume = sp.Volume;

            bool flag;
            flag = true;
            int index = volume.IndexOf("<tbody>");
            while (flag)
            {
                
                if (index != -1)
                {
                    string str = volume.Substring(index + 7, volume.IndexOf("</tbody>") - index - 7);
                    bool fl = true;
                    while (fl)
                    {
                        int idx = str.IndexOf("<td>");
                        if (idx != -1)
                        {
                            cells.Add(str.Substring(idx + 4, str.IndexOf("</td>") - idx - 4));
                            string s = str.Substring(idx, str.IndexOf("</td>") + 4 - idx);
                            str = str.Replace(s, "");

                        }
                        else
                        {
                            fl = false;
                            flag = false;
                        }
                    }
                }
                else
                    flag = false;
            }

            return cells;
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

                return program;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't add SpecialityDisciplineProgram's entry to database !!!!", ex);
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
