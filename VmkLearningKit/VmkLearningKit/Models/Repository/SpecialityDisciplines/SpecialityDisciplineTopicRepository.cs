﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class SpecialityDisciplineTopicRepository : Repository<SpecialityDisciplineTopic>, ISpecialityDisciplineTopicRepository
    {
        public SpecialityDisciplineTopicRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        #region Get

        public SpecialityDisciplineTopic GetById(long id)
        {
            return DataContext.SpecialityDisciplineTopics.SingleOrDefault(sp => sp.Id == id);
        }
        /*
        public SpecialityDisciplineTopic GetByAlias(string alias)
        {
            SpecialityDisciplineTopic obj = null;
            try
            {
                obj = DataContext.SpecialityDisciplineTopics.SingleOrDefault(sp => sp.Alias == alias);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT SpecialityDisciplineTopic Table in Database contains more then one entry with the same alias: " + alias + "!!!!", ex);
            }

            return obj;
        }
        */
        public long GetMaxId()
        {
            try
            {
                IEnumerable<SpecialityDisciplineTopic> list = DataContext.SpecialityDisciplineTopics.OrderByDescending(d => d.Id);
                if (null != list && list.Count() > 0)
                {
                    return list.First().Id;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get max id from SpecialityDisciplineTopic table in database !!!!", ex);
            }
            return 0;
        }

        public SpecialityDisciplineTopic GetByTitle(string title)
        {
            SpecialityDisciplineTopic obj = null;
            try
            {
                obj = DataContext.SpecialityDisciplineTopics.SingleOrDefault(sp => sp.Title == title);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT SpecialityDisciplineTopic Table in Database contains more then one entry with the same title: " + title + "!!!!", ex);
            }

            return obj;
        }

        public IEnumerable<SpecialityDisciplineTopic> GetAllBySpecialityDisciplineId(long specialityDisciplineId)
        {
            try
            {
                return DataContext.SpecialityDisciplineTopics.Where(sp => sp.SpecialityDisciplineId == specialityDisciplineId);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get specialityDisciplineTopics by specialityDisciplineId: " + specialityDisciplineId, ex);
            }
            return null;
        }

        public int GetRazdelCountBySpecialityDisciplineTopicId(long specialityDisciplineTopicId)
        {
            int count = 0;
            foreach (Razdel r in DataContext.Razdels)
            {
                if (r.SpecialityDisciplineTopicId == specialityDisciplineTopicId)
                    count++;
            }

            return count;
        }

        public int GetQuestionCountBySpecialityDisciplineTopicId(long specialityDisciplineTopicId)
        {
            int count = 0;
            foreach (Razdel r in DataContext.Razdels.Where(t => t.SpecialityDisciplineTopicId == specialityDisciplineTopicId))
            {
                foreach (Question q in DataContext.Questions.Where(s => s.RazdelId == r.Id))
                {
                    count++;
                }
            }

            return count;
        }

        public int GetQuestionCountInTestVariantBySpecialityDisciplineTopicId(long specialityDisciplineTopicId)
        {
            int count = 0;
            foreach (Razdel r in DataContext.Razdels.Where(t => t.SpecialityDisciplineTopicId == specialityDisciplineTopicId))
            {
                count += r.QuestionsCount;
            }

            return count;
        }

        #endregion

        #region Set

        public SpecialityDisciplineTopic Add(SpecialityDisciplineTopic obj)
        {
            /*
            SpecialityDisciplineTopic objWithTheSameAlias = GetByAlias(obj.Alias);
            if (null != objWithTheSameAlias &&
               objWithTheSameAlias.Title.Equals(obj.Title))
            {
                return objWithTheSameAlias;
            }
            */
            SpecialityDisciplineTopic objWithTheSameTitle = GetByTitle(obj.Title);
            /*
            if (null == objWithTheSameAlias ||
               null == objWithTheSameTitle)
            {
            */
            if (null != objWithTheSameTitle)
            {
                obj.Title = obj.Title;
            }

            /*
            if (null != objWithTheSameAlias && null == objWithTheSameTitle)
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
            DataContext.SpecialityDisciplineTopics.InsertOnSubmit(obj);
            DataContext.SubmitChanges();
            return obj;
            /*
            }
            return objWithTheSameTitle;
            */
        }

        public SpecialityDisciplineTopic SetTitle(long id, string title)
        {
            try
            {
                SpecialityDisciplineTopic topic = GetById(id);
                if (null != topic)
                {
                    topic.Title = title;
                    DataContext.SubmitChanges();
                    return topic;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get SpecialityDisciplineTopic by id: " + id + "!!!!", ex);
            }
            return null;
        }

        #endregion

        #region Delete

        public void Delete(SpecialityDisciplineTopic obj)
        {
            try
            {
                DataContext.SpecialityDisciplineTopics.DeleteOnSubmit(obj);

                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't delete specialityDisciplneTopic with id: " + obj.Id, ex);
            }
        }

        public void DeleteById(long id)
        {
            try
            {
                DataContext.SpecialityDisciplineTopics.DeleteOnSubmit(GetById(id));

                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't delete specialityDisciplneTopic by id: " + id, ex);
            }
        }

        #endregion
    }
}
