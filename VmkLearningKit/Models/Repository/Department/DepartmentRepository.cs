using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class DepartmentRepository : Repository<Department>, IDepartmentRepository
    {
        public DepartmentRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        #region Get

        /* Получить объект факультета по идентификатору */
        public Department GetById(long id)
        {
            return DataContext.Departments.SingleOrDefault(d => d.Id == id);
        }

        public Department GetByAlias(string alias)
        {
            Department obj = null;
            try
            {
                obj = DataContext.Departments.SingleOrDefault(d => d.Alias == alias);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Department Table in Database contains more then one entry with the same alias: " + alias + "!!!!", ex);
            }

            return obj;
        }
        
        public Department GetByAbbreviation(string abbreviation)
        {
            Department obj = null;
            try
            {
                obj = DataContext.Departments.SingleOrDefault(d => d.Abbreviation == abbreviation);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Department Table in Database contains more then one entry with the same abbreviation: " + abbreviation + "!!!!", ex);
            }

            return obj;
        }

        public long GetMaxId()
        {
            try
            {
                IEnumerable<Department> list = DataContext.Departments.OrderByDescending(d => d.Id);
                if (null != list && list.Count() > 0)
                {
                    return list.First().Id;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get max id from Department table in database !!!!", ex);
            }
            return 0;
        }

        /*
        public Department GetByTitle(string title)
        {
            Department obj = null;
            try
            {
                obj = DataContext.Departments.SingleOrDefault(d => d.Title == title);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Department Table in Database contains more then one entry with the same title: " + title + "!!!!", ex);
            }

            return obj;
        }
        */
        public IEnumerable<Department> GetAll()
        {
            return DataContext.Departments.AsEnumerable<Department>();
        }

        #endregion

        #region Set

        public Department Add(Department obj)
        {
            Department objWithTheSameAlias = GetByAlias(obj.Alias);
            if(null != objWithTheSameAlias &&
               objWithTheSameAlias.Abbreviation.Equals(obj.Abbreviation) &&
               objWithTheSameAlias.Title.Equals(obj.Title))
            {
                return objWithTheSameAlias;
            }
            //Department objWithTheSameTitle = GetByTitle(obj.Title);
            //Department objWithTheSameAbbreviation = GetByAbbreviation(obj.Abbreviation);
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
                DataContext.Departments.InsertOnSubmit(obj);
                DataContext.SubmitChanges();
                return obj;
            /*
            }
            return objWithTheSameTitle;
            */
        }

        public void UpdateById(long updatedObjId, string newObjTitle)
        {
            Department updatedObj = GetById(updatedObjId);

            updatedObj.Title = newObjTitle;

            DataContext.SubmitChanges();
        }

        public void UpdateByAlias(string updatedObjId,Department newObj)
        {
            Department updatedObj = GetByAlias(updatedObjId);

            updatedObj.Title = newObj.Title;
            updatedObj.Alias = newObj.Alias;
            updatedObj.Abbreviation = newObj.Abbreviation;
            updatedObj.Description = newObj.Description;

            DataContext.SubmitChanges();
        }

        #endregion

        #region Delete

        public void Delete(Department obj)
        {
            DataContext.Departments.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Departments.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }

        #endregion
    }
}
