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

        public Professor GetByFullName(string fullName)
        {
            try
            {
                string secondName = String.Empty;
                string firstNameLetter = String.Empty;
                string patronymicLetter = String.Empty;

                if (!fullName.Trim().Equals(Constants.PROFESSOR_DEFAULT_NAME))
                {
                    string[] names = fullName.Split(' ');
                    if (null != names && names.Length >= 1)
                    {
                        secondName = names[0];
                    }
                    if (null != names && names.Length >= 2)
                    {
                        string[] letters = names[1].Split('.');
                        if (null != letters && letters.Length >= 1)
                        {
                            firstNameLetter = letters[0];
                        }
                        if (null != letters && letters.Length >= 2)
                        {
                            patronymicLetter = letters[1];
                        }
                    }
                    if (null != secondName && !secondName.Trim().Equals(String.Empty) &&
                        null != firstNameLetter && !firstNameLetter.Trim().Equals(String.Empty) &&
                        null != patronymicLetter && !patronymicLetter.Trim().Equals(String.Empty))
                    {
                        return DataContext.Professors.SingleOrDefault(p => p.User.SecondName == secondName &&
                                                                      p.User.Patronymic[0].ToString() == patronymicLetter &&
                                                                      p.User.FirstName[0].ToString() == firstNameLetter);
                    }
                }
                // Преподаватель по-умолчанию "Не указан" 
                // обрабатывается отдельно
                else
                {
                    secondName = fullName;
                }

                if (null != secondName && !secondName.Trim().Equals(String.Empty))
                {
                    return DataContext.Professors.SingleOrDefault(p => p.User.SecondName == secondName);
                    
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Professor's Table in Database contains more then one entry with the same FullName: " + fullName + "!!!!", ex);
            }
            return null;
        }

        public Professor GetByNickName(string nickName)
        {
            try
            {
                return DataContext.Professors.SingleOrDefault(p => p.User.NickName == nickName);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Professor's Table in Database contains more then one entry with the same NickName: " + nickName + "!!!!", ex);
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

        public Professor Update(Professor obj)
        {
            try
            {
                Professor professor = GetById(obj.UserId);
                if (null != professor)
                {
                    DataContext.SubmitChanges();
                    return professor;
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
