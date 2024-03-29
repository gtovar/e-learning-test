﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class SpecialityDisciplineRepository : Repository<SpecialityDiscipline>, ISpecialityDisciplineRepository
    {
        public SpecialityDisciplineRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public SpecialityDiscipline GetById(long id)
        {
            return DataContext.SpecialityDisciplines.SingleOrDefault(s => s.Id == id);
        }

        public SpecialityDiscipline GetdBySpecialityDisciplineTopicId(long specialityDisciplineTopicId)
        {
           SpecialityDisciplineTopic sdt = DataContext.SpecialityDisciplineTopics.SingleOrDefault(t => t.Id == specialityDisciplineTopicId);
           return GetById(sdt.SpecialityDisciplineId);
        }

        public IEnumerable<SpecialityDiscipline> GetAll(string specialityAlias)
        {
            try
            {
                return DataContext.SpecialityDisciplines.Where(s => s.Speciality.Alias == specialityAlias).OrderBy(s => s.Category);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get SpecialityDisciplines by specialityAlias !!!!", ex);
            }
            return null;
        }

        public IEnumerable<SpecialityDiscipline> GetBySpecialityId(long specialityId)
        {
            try
            {
                return DataContext.SpecialityDisciplines.Where(s => s.SpecialityId == specialityId);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get SpecialityDisciplines by specialityId: " + specialityId, ex);
            }
            return null;
        }

        public IEnumerable<SpecialityDiscipline> GetAllByProfessor(string professorNickName)
        {
            try
            {
                return DataContext.SpecialityDisciplines.Where(s => s.Professor.User.NickName == professorNickName);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get SpecialityDisciplines by professorNickName: " + professorNickName, ex);
            }
            return null;
        }

        public IEnumerable<SpecialityDiscipline> GetAll(string specialityAlias, string educationPlanAlias, string chairAlias, string professorNickName)
        {
            return DataContext.SpecialityDisciplines.Where(s => s.Speciality.Alias == specialityAlias &&
                                                                s.EducationPlan.Alias == educationPlanAlias &&
                                                                s.Chair.Alias == chairAlias &&
                                                                s.Professor.User.NickName == professorNickName
                                                           );
        }

        public long GetMaxId()
        {
            try
            {
                IEnumerable<SpecialityDiscipline> list = DataContext.SpecialityDisciplines.OrderByDescending(d => d.Id);
                if (null != list && list.Count() > 0)
                {
                    return list.First().Id;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get max id from SpecialityDiscipline table in database !!!!", ex);
            }
            return 0;
        }

        public SpecialityDiscipline Add(SpecialityDiscipline obj)
        {
            try
            {
                SpecialityDiscipline specialityDiscipline = GetByAlias(obj.Alias);
                if (null == specialityDiscipline)
                {
                    DataContext.SpecialityDisciplines.InsertOnSubmit(obj);
                    DataContext.SubmitChanges();
                    return obj;
                }
                return specialityDiscipline;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't add SpecialityDiscipline's entry to database !!!!", ex);
            }
            return null;
        }

        /*
        public bool IsEntryWithAliasExisted(string alias)
        {
            SpecialityDiscipline specialityDiscipline = DataContext.SpecialityDisciplines.SingleOrDefault(s => s.Alias == alias);
            if (null != specialityDiscipline)
            {
                return true;
            }
            return false;
        }
        */
        public SpecialityDiscipline GetByAlias(string alias)
        {
            SpecialityDiscipline obj = null;
            try
            {
                obj = DataContext.SpecialityDisciplines.SingleOrDefault(ed => ed.Alias == alias);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT SpecialityDiscipline Table in Database contains more then one entry with the same alias: " + alias + "!!!!", ex);
            }

            return obj;
        }

        public SpecialityDiscipline GetByTitle(string title)
        {
            SpecialityDiscipline obj = null;
            try
            {
                obj = DataContext.SpecialityDisciplines.SingleOrDefault(ed => ed.Title == title);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT SpecialityDiscipline Table in Database contains more then one entry with the same title: " + title + "!!!!", ex);
            }

            return obj;
        }

        public void Delete(SpecialityDiscipline obj)
        {
            DataContext.SpecialityDisciplines.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.SpecialityDisciplines.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
