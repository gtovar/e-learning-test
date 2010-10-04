using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class GroupRepository : Repository<Group>, IGroupRepository
    {
        public GroupRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public Group GetById(long id)
        {
            return DataContext.Groups.SingleOrDefault(gr => gr.Id == id);
        }

        public Group GetByAlias(string alias)
        {
            Group obj = null;
            try
            {
                obj = DataContext.Groups.SingleOrDefault(gr => gr.Alias == alias);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Group Table in Database contains more then one entry with the same alias: " + alias + "!!!!", ex);
            }

            return obj;
        }

        public long GetMaxId()
        {
            try
            {
                IEnumerable<Group> list = DataContext.Groups.OrderByDescending(gr => gr.Id);
                if (null != list && list.Count() > 0)
                {
                    return list.First().Id;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get max id from Group table in database !!!!", ex);
            }
            return 0;
        }

        public Group GetByTitle(string title)
        {
            Group obj = null;
            try
            {
                obj = DataContext.Groups.SingleOrDefault(ed => ed.Title == title);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Group Table in Database contains more then one entry with the same title: " + title + "!!!!", ex);
            }

            return obj;
        }

        public IEnumerable<Group> GetAll()
        {
            return DataContext.Groups.OrderBy(gr => gr.Id);
        }

        public IEnumerable<Group> GetAllByDepartmentId(long departmentId)
        {
            try
            {
                return DataContext.Groups.Where(gr => gr.DepartmentId == departmentId).OrderBy(gr => gr.Title);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("Can't get groups by departmentId = " + departmentId, ex);
            }
            return null;
        }

        public IEnumerable<Group> GetAllByDisciplineProfessor(long disciplineId, long professorId)
        {
            try
            {
                IEnumerable<LectureTimetable> lts = DataContext.LectureTimetables.Where
                    (lt => (lt.ProfessorId == professorId && lt.SpecialityDisciplineId == disciplineId)) ;
                if(0!=lts.Count())
                {
                    List<GroupsLectureTimetable> glts = new List<GroupsLectureTimetable>();
                    foreach (LectureTimetable itemTimetable in lts)
                    {
                        foreach (GroupsLectureTimetable itemGlt in DataContext.GroupsLectureTimetables.Where(grlts => grlts.LectureTimetableId == itemTimetable.Id))
                        glts.Add(itemGlt);
                    }
                    if (null != glts)
                    {
                        List<Group> groups = new List<Group>();
                        foreach (GroupsLectureTimetable itemGroupsLecture in glts)
                        {
                            groups.Add(DataContext.Groups.Single(gr => gr.Id == itemGroupsLecture.GroupId));
                        }
                        return groups.Distinct();
                    }
                    else return null;
                }
                else return null; 
            }
            catch (Exception ex)
            {
                //  Utility.WriteToLog("Can't get groups by departmentId = " + departmentId, ex);
            }
            return null;
        }


        public Group Add(Group obj)
        {
            Group objWithTheSameAlias = GetByAlias(obj.Alias);
            if (null != objWithTheSameAlias &&
               objWithTheSameAlias.Title.Equals(obj.Title))
            {
                return objWithTheSameAlias;
            }
            //Group objWithTheSameTitle = GetByTitle(obj.Title);
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
            DataContext.Groups.InsertOnSubmit(obj);
            DataContext.SubmitChanges();
            return obj;
            /*
            }
            return objWithTheSameTitle;
            */
        }

        public void Delete(Group obj)
        {
            DataContext.Groups.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            try
            {
                foreach (Student obj in DataContext.Students)
                {
                    if (obj.GroupId == id) RepositoryManager.GetRepositoryManager.GetUserRepository.DeleteStudent(obj.UserId);
                }

                foreach (PracticeAndLabTimetable obj in DataContext.PracticeAndLabTimetables)
                {
                    if (obj.GroupId == id) DataContext.PracticeAndLabTimetables.DeleteOnSubmit(obj);
                }

                foreach (GroupsLectureTimetable obj in DataContext.GroupsLectureTimetables)
                {
                    if (obj.GroupId == id) DataContext.GroupsLectureTimetables.DeleteOnSubmit(obj);
                }

                foreach (PracticePlan obj in DataContext.PracticePlans)
                {
                    if (obj.GroupId == id) DataContext.PracticePlans.DeleteOnSubmit(obj);
                }

                DataContext.Groups.DeleteOnSubmit(GetById(id));

                DataContext.SubmitChanges();
            }
            catch (Exception exc)
            {
                Utility.WriteToLog("ERROR!");
            }
        }

        public IEnumerable<Group> Add(IEnumerable<Group> groups)
        {
            try
            {
                List<Group> addedGroups = new List<Group>();

                if (null != groups)
                {
                    foreach (Group group in groups)
                    {
                        if (null == GetByAlias(group.Alias))
                        {
                            DataContext.Groups.InsertOnSubmit(group);

                            addedGroups.Add(group);
                        }
                    }

                    DataContext.SubmitChanges();

                    return addedGroups.AsEnumerable<Group>();
                }
            }
            catch (Exception exc)
            {
                Utility.WriteToLog("ERROR", exc);
            }

            return null;
        }

        public Group Update(Group obj)
        {
            try
            {
                Group group = GetByTitle(obj.Title);
                if (null != group)
                {
                    group.SpecialityId = obj.SpecialityId;
                    group.DepartmentId = obj.DepartmentId;
                    group.Alias = obj.Alias;
                    
                    DataContext.SubmitChanges();
                    return obj;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("Group can't add to database", ex);
            }
            return null;
        }
    }
}
