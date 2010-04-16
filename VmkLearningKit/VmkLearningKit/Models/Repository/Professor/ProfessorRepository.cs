using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class ProfessorRepository : Repository<Professor>, IProfessorRepository
    {
        public ProfessorRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public Professor GetById(long id)
        {
            try
            {
                return DataContext.Professors.SingleOrDefault(p => p.UserId == id);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Professor's Table in Database contains more then one entry with the same id: " + id + "!!!!", ex);
            }
            return null;
        }

        public Professor GetByNickName(string NickName)
        {
            try
            {
                return DataContext.Professors.SingleOrDefault(p => p.User.NickName == NickName);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Professor's Table in Database contains more then one entry with the same NickName: " + NickName + "!!!!", ex);
            }
            return null;
        }

        public IEnumerable<Professor> GetAll(string chairAlias)
        {
            try
            {
                return DataContext.Professors.Where(p => p.Chair.Alias == chairAlias);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get all entries from Professor's table", ex);
            }
            return null;
        }

        public Professor Add(Professor obj)
        {
            try
            {
                Professor professor = GetById(obj.UserId);
                if (null == professor)
                {
                    DataContext.Professors.InsertOnSubmit(obj);
                    DataContext.SubmitChanges();
                    return obj;
                }
                return professor;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't add Professor's entry to database !!!!", ex);
            }
            return null;
        }

        public long GetMaxId()
        {
            try
            {
                IEnumerable<Professor> list = DataContext.Professors.OrderByDescending(p => p.UserId);
                if (null != list && list.Count() > 0)
                {
                    return list.First().UserId;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get max id from Professor table in database !!!!", ex);
            }
            return 0;
        }

        public void Delete(Professor obj)
        {
            try
            {
                DataContext.Professors.DeleteOnSubmit(obj);

                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't delete Professor's entry from database !!!!", ex);
            }
        }

        public void DeleteById(long id)
        {
            try
            {
                DataContext.Professors.DeleteOnSubmit(GetById(id));

                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't delete by id Professor's entry from database !!!!", ex);
            }
        }
    }
}
