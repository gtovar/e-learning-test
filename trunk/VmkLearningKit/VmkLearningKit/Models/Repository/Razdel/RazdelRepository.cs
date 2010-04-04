using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class RazdelRepository : Repository<Razdel>, IRazdelRepository
    {
        public RazdelRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        #region Get

        public Razdel GetById(long id)
        {
            return DataContext.Razdels.SingleOrDefault(t => t.Id == id);
        }


        public IEnumerable<Razdel> GetAll()
        {
            return DataContext.Razdels.AsEnumerable<Razdel>();
        }

        #endregion

        #region Set

        public void Add(Razdel obj)
        {
            DataContext.Razdels.InsertOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, long newObjTopicId, string newObjTitle, int newObjQuestionsCount)
        {
            Razdel updatedObj = GetById(updatedObjId);

            updatedObj.TopicId        = newObjTopicId;
            updatedObj.Title          = newObjTitle;
            updatedObj.QuestionsCount = newObjQuestionsCount;

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, string newObjTitle)
        {
            Razdel updatedObj = GetById(updatedObjId);

            updatedObj.Title = newObjTitle;
            
            DataContext.SubmitChanges();
        }

        #endregion

        #region Delete

        public void Delete(Razdel obj)
        {
            DataContext.Razdels.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Razdels.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }

        #endregion
    }
}
