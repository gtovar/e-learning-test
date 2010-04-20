using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class StudentRepository : Repository<Student>, IStudentRepository
    {
        public StudentRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public Student GetById(long id)
        {
            try
            {
                return DataContext.Students.SingleOrDefault(s => s.UserId == id);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Student's Table in Database contains more then one entry with the same id: " + id + "!!!!", ex);
            }
            return null;
        }

        public Student GetByNickName(string NickName)
        {
            try
            {
                return DataContext.Students.SingleOrDefault(s => s.User.NickName == NickName);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Student's Table in Database contains more then one entry with the same NickName: " + NickName + "!!!!", ex);
            }
            return null;
        }

        public IEnumerable<Student> GetAll(string groupAlias)
        {
            try
            {
                return DataContext.Students.Where(s => s.Group.Alias == groupAlias);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get all entries from Student's table", ex);
            }
            return null;
        }

        public Student Add(Student obj)
        {
            try
            {
                Student student = GetById(obj.UserId);
                if (null == student)
                {
                    DataContext.Students.InsertOnSubmit(obj);
                    DataContext.SubmitChanges();
                    return obj;
                }
                return student;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't add Student's entry to database !!!!", ex);
            }
            return null;
        }

        public long GetMaxId()
        {
            try
            {
                IEnumerable<Student> list = DataContext.Students.OrderByDescending(s => s.UserId);
                if (null != list && list.Count() > 0)
                {
                    return list.First().UserId;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get max id from Student table in database !!!!", ex);
            }
            return 0;
        }

        public void Delete(Student obj)
        {
            try
            {
                DataContext.Students.DeleteOnSubmit(obj);

                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't delete Student's entry from database !!!!", ex);
            }
        }

        public void DeleteById(long id)
        {
            try
            {
                DataContext.Students.DeleteOnSubmit(GetById(id));

                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't delete by id Students's entry from database !!!!", ex);
            }
        }
    }
}
