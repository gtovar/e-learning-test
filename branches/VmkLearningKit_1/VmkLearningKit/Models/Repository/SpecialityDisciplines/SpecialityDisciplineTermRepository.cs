using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class SpecialityDisciplineTermRepository : Repository<SpecialityDisciplineTerm>, ISpecialityDisciplineTermRepository
    {
        public SpecialityDisciplineTermRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public SpecialityDisciplineTerm GetById(long id)
        {
            return DataContext.SpecialityDisciplineTerms.SingleOrDefault(s => s.Id == id);
        }

        public long GetMaxId()
        {
            try
            {
                IEnumerable<SpecialityDisciplineTerm> list = DataContext.SpecialityDisciplineTerms.OrderByDescending(ch => ch.Id);
                if (null != list && list.Count() > 0)
                {
                    return list.First().Id;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get max id from Chair table in database !!!!", ex);
            }
            return 0;
        }

        public SpecialityDisciplineTerm Add(SpecialityDisciplineTerm obj)
        {
            try
            {
                SpecialityDisciplineTerm term = DataContext.SpecialityDisciplineTerms.SingleOrDefault(t => (t.SpecialityDisciplineId == obj.SpecialityDisciplineId && t.Term == obj.Term));

                if (term != null)
                {
                    term.LabVolume = obj.LabVolume;
                    term.LectureVolume = obj.LectureVolume;
                    term.PracticeVolume = obj.PracticeVolume;
                    term.Reporting = obj.Reporting;
                    term.SpecialityDisciplineId = obj.SpecialityDisciplineId;
                    term.Term = obj.Term;
                    term.WeeksVolume = obj.WeeksVolume;
                    
                    DataContext.SubmitChanges();
                    return term;
                }

                DataContext.SpecialityDisciplineTerms.InsertOnSubmit(obj);
                DataContext.SubmitChanges();
                return obj;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't add SpecialityDisciplineTerm's entry to database !!!!", ex);
            }
            return null;
        }

        public void Delete(SpecialityDisciplineTerm obj)
        {
            DataContext.SpecialityDisciplineTerms.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.SpecialityDisciplineTerms.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
