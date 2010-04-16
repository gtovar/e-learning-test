using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class SpecializationRepository : Repository<Specialization>, ISpecializationRepository
    {
        public SpecializationRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public Specialization GetById(long id)
        {
            return DataContext.Specializations.SingleOrDefault(s => s.Id == id);
        }

        public IEnumerable<Specialization> GetAll(string specialityAlias, string educationPlanAlias, string chairAlias)
        {
            return DataContext.Specializations.Where(s => s.Speciality.Alias == specialityAlias &&
                                                          s.EducationPlan.Alias == educationPlanAlias &&
                                                          s.Chair.Alias == chairAlias);
        }
        /*
        public bool IsEntryWithAliasExisted(string alias)
        {
            Specialization specialization = DataContext.Specializations.SingleOrDefault(s => s.Alias == alias);
            if (null != specialization)
            {
                return true;
            }
            return false;
        }
        */
        public Specialization GetByAlias(string alias)
        {
            Specialization obj = null;
            try
            {
                obj = DataContext.Specializations.SingleOrDefault(s => s.Alias == alias);
            }
            catch (Exception ex)
            {
                // FIXME: add some handler
            }

            return obj;
        }

        public long GetMaxId()
        {
            try
            {
                IEnumerable<Specialization> list = DataContext.Specializations.OrderByDescending(d => d.Id);
                if (null != list && list.Count() > 0)
                {
                    return list.First().Id;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get max id from Specialization table in database !!!!", ex);
            }
            return 0;
        }
        
        public Specialization GetByTitle(string title)
        {
            Specialization obj = null;
            try
            {
                if (null != title && !title.Trim().Equals(String.Empty))
                {
                    obj = DataContext.Specializations.SingleOrDefault(s => s.Title.Trim().ToLower() == title.Trim().ToLower());
                }
            }
            catch (Exception ex)
            {
                // FIXME: add some handler
            }

            return obj;
        }
        
        public Specialization Add(Specialization obj)
        {
            Specialization objWithTheSameAlias = GetByAlias(obj.Alias);
            if(null != objWithTheSameAlias &&
               objWithTheSameAlias.ChairId == obj.ChairId &&
               objWithTheSameAlias.EducationPlanId == obj.EducationPlanId &&
               objWithTheSameAlias.SpecialityId == obj.SpecialityId &&
               objWithTheSameAlias.Title.Equals(obj.Title))
            {
                return objWithTheSameAlias;
            }
            //Specialization objWithTheSameTitle = GetByTitle(obj.Title);
            /*
            if (null == objWithTheSameAlias ||
               null == objWithTheSameTitle)
            {
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
                DataContext.Specializations.InsertOnSubmit(obj);
                DataContext.SubmitChanges();
                return obj;
            /*
            }
            
            if (objWithTheSameTitle.ChairId == obj.ChairId &&
                objWithTheSameTitle.EducationPlanId == obj.EducationPlanId &&
                objWithTheSameTitle.SpecialityId == obj.SpecialityId)
            {
                return objWithTheSameTitle;
            }
            else
            {
                if (null != objWithTheSameAlias)
                {
                    obj.Alias = obj.Alias + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                }
                if(null != objWithTheSameTitle)
                {
                    obj.Title = obj.Title + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                }
                DataContext.Specializations.InsertOnSubmit(obj);
                DataContext.SubmitChanges();
                return obj;
            }
            */
        }

        public void Delete(Specialization obj)
        {
            DataContext.Specializations.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Specializations.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
