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
