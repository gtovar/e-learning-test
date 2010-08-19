using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class SpecialityRepository : Repository<Speciality>, ISpecialityRepository
    {
        public SpecialityRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public Speciality GetById(long id)
        {
            return DataContext.Specialities.SingleOrDefault(s => s.Id == id);
        }

        public IEnumerable<Speciality> GetAll(string departmentAlias)
        {
            return DataContext.Specialities.Where(s => s.Department.Alias == departmentAlias);

        }
        /*
        public bool IsEntryWithAliasExisted(string alias)
        {
            Speciality speciality = DataContext.Specialities.SingleOrDefault(s => s.Alias == alias);
            if (null != speciality)
            {
                return true;
            }
            return false;
        }
        */

        public long GetMaxId()
        {
            try
            {
                IEnumerable<Speciality> list = DataContext.Specialities.OrderByDescending(d => d.Id);
                if (null != list && list.Count() > 0)
                {
                    return list.First().Id;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get max id from Speciality table in database !!!!", ex);
            }
            return 0;
        }

        public Speciality GetByAlias(string alias)
        {
            Speciality obj = null;
            try
            {
                obj = DataContext.Specialities.SingleOrDefault(s => s.Alias == alias);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Speciality's Table in Database contains more then one entry with the same alias: " + alias + "!!!!", ex);
            }

            return obj;
        }
        
        public Speciality GetByAbbreviation(string abbreviation)
        {
            Speciality obj = null;
            try
            {
                obj = DataContext.Specialities.SingleOrDefault(s => s.Abbreviation == abbreviation);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Speciality's Table in Database contains more then one entry with the same abbreviation: " + abbreviation + "!!!!", ex);
            }

            return obj;
        }
        /*
        public Speciality GetByTitle(string title)
        {
            Speciality obj = null;
            try
            {
                obj = DataContext.Specialities.SingleOrDefault(s => s.Title == title);
            }
            catch (Exception ex)
            {
                // FIXME: add some handler
            }

            return obj;
        }
        */
        public Speciality Add(Speciality obj)
        {
            Speciality objWithTheSameAlias = GetByAlias(obj.Alias);
            if(null != objWithTheSameAlias &&
               objWithTheSameAlias.DepartmentId == obj.DepartmentId &&
               objWithTheSameAlias.Abbreviation.Equals(obj.Abbreviation) &&
               objWithTheSameAlias.Title.Equals(obj.Title))
            {
                return objWithTheSameAlias;
            }
            //Speciality objWithTheSameTitle = GetByTitle(obj.Title);
            //Speciality objWithTheSameAbbreviation = GetByAbbreviation(obj.Abbreviation);
            /*
            if (null == objWithTheSameAlias ||
                null == objWithTheSameTitle ||
                null == objWithTheSameAbbreviation)
            {
                if (null != objWithTheSameAbbreviation)
                {
                    obj.Abbreviation = obj.Abbreviation + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                }
                if (null != objWithTheSameTitle)
                {
                    obj.Title = obj.Title + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                }
            */
                if (null != objWithTheSameAlias /*&& null == objWithTheSameAbbreviation*/)
                {
                    string alias = Transliteration.Front(obj.Abbreviation);
                    objWithTheSameAlias = GetByAlias(alias);
                    if (null == objWithTheSameAlias)
                    {
                        obj.Alias = alias;
                    }
                    else
                    {
                        alias = Transliteration.Front(obj.Title);
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
                }
                /*
                else if (null == objWithTheSameTitle)
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
                */
                DataContext.Specialities.InsertOnSubmit(obj);
                DataContext.SubmitChanges();
                return obj;
            /*
            }
            
            if (objWithTheSameTitle.DepartmentId == obj.DepartmentId)
            {
                return objWithTheSameTitle;
            }
            else
            {
                if (null != objWithTheSameAlias)
                {
                    obj.Alias = obj.Alias + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                }
                if (null != objWithTheSameAbbreviation)
                {
                    obj.Abbreviation = obj.Abbreviation + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                }
                if(null != objWithTheSameTitle)
                {
                    obj.Title = obj.Title + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                }
                DataContext.Specialities.InsertOnSubmit(obj);
                DataContext.SubmitChanges();
                return obj;
            }
           */
        }

        public void Delete(Speciality obj)
        {
            DataContext.Specialities.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Specialities.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }

        public IEnumerable<Speciality> Add(IEnumerable<Speciality> specialities)
        {
            try
            {
                List<Speciality> addedSpecialities = new List<Speciality>();

                if (null != specialities)
                {
                    foreach (Speciality speciality in specialities)
                    {
                        if (null == GetByAbbreviation(speciality.Abbreviation))
                        {
                            DataContext.Specialities.InsertOnSubmit(speciality);

                            addedSpecialities.Add(speciality);
                        }
                    }

                    DataContext.SubmitChanges();

                    return addedSpecialities.AsEnumerable<Speciality>();
                }
            }
            catch (Exception exc)
            {
                Utility.WriteToLog("ERROR", exc);
            }

            return null;
        }
    }
}
