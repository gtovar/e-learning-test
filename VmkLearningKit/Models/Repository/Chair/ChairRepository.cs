using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class ChairRepository : Repository<Chair>, IChairRepository
    {
        public ChairRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public Chair GetById(long id)
        {
            return DataContext.Chairs.SingleOrDefault(ch => ch.Id == id);
        }

        public IEnumerable<Chair> GetAll(string departmentAlias)
        {
            return DataContext.Chairs.Where(ch => (ch.Department.Alias == departmentAlias /*&& ch.Title != VLKConstants.FIELD_EMPTY*/));
        }

        public long GetMaxId()
        {
            try
            {
                IEnumerable<Chair> list = DataContext.Chairs.OrderByDescending(ch => ch.Id);
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

        public Chair GetByAlias(string alias)
        {
            Chair obj = null;
            try
            {
                obj = DataContext.Chairs.SingleOrDefault(s => s.Alias == alias);
            }
            catch (Exception ex)
            {
                // FIXME: add some handler
            }

            return obj;
        }


        public Chair GetByAliasAndDepartment(string alias,long idDepartment)
        {
            Chair obj = null;
            try
            {
                obj = DataContext.Chairs.SingleOrDefault(s => s.Alias == alias && s.DepartmentId == idDepartment);
            }
            catch (Exception ex)
            {
                // FIXME: add some handler
            }

            return obj;
        }
        /*
        public Chair GetByTitle(string title)
        {
            Chair obj = null;
            try
            {
                obj = DataContext.Chairs.SingleOrDefault(s => s.Title == title);
            }
            catch (Exception ex)
            {
                // FIXME: add some handler
            }

            return obj;
        }
        */
        public Chair GetByAbbreviation(string abbreviation)
        {
            Chair obj = null;
            try
            {
                obj = DataContext.Chairs.SingleOrDefault(s => s.Abbreviation == abbreviation);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Chair Table in Database contains more then one entry with the same abbreviation: " + abbreviation + "!!!!", ex);
            }

            return obj;
        }
        /*
        public bool IsEntryWithAliasExisted(string alias)
        {
            Chair chair = DataContext.Chairs.SingleOrDefault(s => s.Alias == alias);
            if (null != chair)
            {
                return true;
            }
            return false;
        }
        */
        public Chair Add(Chair obj)
        {
            Chair objWithTheSameAlias = GetByAlias(obj.Alias);

            if(null != objWithTheSameAlias &&
               objWithTheSameAlias.DepartmentId == obj.DepartmentId && 
               objWithTheSameAlias.Abbreviation.Equals(obj.Abbreviation) &&
               objWithTheSameAlias.Title.Equals(obj.Title))
            {
                return objWithTheSameAlias;
            }

            //Chair objWithTheSameTitle = GetByTitle(obj.Title);
            //Chair objWithTheSameAbbreviation = GetByAbbreviation(obj.Abbreviation);
            /*
            if (null == objWithTheSameAlias ||
               null == objWithTheSameTitle ||
               null == objWithTheSameAbbreviation)
            {
                /*
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
                DataContext.Chairs.InsertOnSubmit(obj);
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
                
                DataContext.Chairs.InsertOnSubmit(obj);
                DataContext.SubmitChanges();
                return obj;
            }
           */
        }

        public void Delete(Chair obj)
        {
            DataContext.Chairs.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Chairs.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }

        public IEnumerable<Chair> Add(IEnumerable<Chair> chairs)
        {
            try
            {
                List<Chair> addedChairs = new List<Chair>();

                if (null != chairs)
                {
                    foreach (Chair chair in chairs)
                    {
                        if (null == GetByAlias(chair.Alias))
                        {
                            DataContext.Chairs.InsertOnSubmit(chair);

                            addedChairs.Add(chair);
                        }
                    }
                    
                    DataContext.SubmitChanges();

                    return addedChairs.AsEnumerable<Chair>();
                }
            }
            catch (Exception exc)
            {
                Utility.WriteToLog("ERROR", exc);
            }

            return null;
        }


        public void UpdateByAlias(string updatedObjId, Chair newObj)
        {
            Chair updatedObj = GetByAlias(updatedObjId);

            updatedObj.Title = newObj.Title;
            updatedObj.Alias = newObj.Alias;
            updatedObj.Abbreviation = newObj.Abbreviation;
            updatedObj.Description = newObj.Description;

            DataContext.SubmitChanges();
        }

    }
}
