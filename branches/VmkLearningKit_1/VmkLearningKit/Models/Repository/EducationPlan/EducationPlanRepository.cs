using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class EducationPlanRepository : Repository<EducationPlan>, IEducationPlanRepository
    {
        public EducationPlanRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public EducationPlan GetById(long id)
        {
            return DataContext.EducationPlans.SingleOrDefault(ed => ed.Id == id);
        }

        public EducationPlan GetByAlias(string alias)
        {
            EducationPlan obj = null;
            try
            {
                obj = DataContext.EducationPlans.SingleOrDefault(ed => ed.Alias == alias);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT EducationPlan Table in Database contains more then one entry with the same alias: " + alias + "!!!!", ex);
            }

            return obj;
        }

        public long GetMaxId()
        {
            try
            {
                IEnumerable<EducationPlan> list = DataContext.EducationPlans.OrderByDescending(d => d.Id);
                if (null != list && list.Count() > 0)
                {
                    return list.First().Id;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get max id from EducationPlan table in database !!!!", ex);
            }
            return 0;
        }
        
        public EducationPlan GetByTitle(string title)
        {
            EducationPlan obj = null;
            try
            {
                obj = DataContext.EducationPlans.SingleOrDefault(ed => ed.Title == title);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT EducationPlan Table in Database contains more then one entry with the same title: " + title + "!!!!", ex);
            }

            return obj;
        }
        
        public IEnumerable<EducationPlan> GetAll()
        {
            return DataContext.EducationPlans.OrderBy(ed => ed.Id);
        }

        public EducationPlan Add(EducationPlan obj)
        {
            EducationPlan objWithTheSameAlias = GetByAlias(obj.Alias);
            if(null != objWithTheSameAlias &&
               objWithTheSameAlias.Title.Equals(obj.Title))
            {
                return objWithTheSameAlias;
            }
            //EducationPlan objWithTheSameTitle = GetByTitle(obj.Title);
            /*
            if (null == objWithTheSameAlias ||
               null == objWithTheSameTitle)
            {
                /*
                if (null != objWithTheSameTitle)
                {
                    obj.Title = obj.Title + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                }
                */
                if (null != objWithTheSameAlias /*&& null == objWithTheSameTitle*/)
                {
                    string alias = Transliteration.Front(obj.Title);
                    objWithTheSameAlias = GetByAlias(alias);
                    if (null == objWithTheSameAlias)
                    {
                        obj.Alias = alias;
                    }
                    else
                    {
                        obj.Alias = obj.Alias + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                    }
                }
                DataContext.EducationPlans.InsertOnSubmit(obj);
                DataContext.SubmitChanges();
                return obj;
            /*
            }
            return objWithTheSameTitle;
            */
        }

        public void Delete(EducationPlan obj)
        {
            DataContext.EducationPlans.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.EducationPlans.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
