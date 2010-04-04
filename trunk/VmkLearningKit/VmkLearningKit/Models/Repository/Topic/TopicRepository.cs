using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class TopicRepository : Repository<Topic>, ITopicRepository
    {
        public TopicRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        #region Get

        public Topic GetById(long id)
        {
            return DataContext.Topics.SingleOrDefault(t => t.Id == id);
        }

        public IEnumerable<Topic> GetAll()
        {
            return DataContext.Topics.AsEnumerable<Topic>();
        }

        #endregion

        #region Set

        public void Add(Topic obj)
        {
            DataContext.Topics.InsertOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, long newObjDisciplineId, string newObjTitle)
        {
            Topic updatedObj = GetById(updatedObjId);

            updatedObj.DisciplineId = newObjDisciplineId;
            updatedObj.Title        = newObjTitle;

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, string newObjTitle)
        {
            Topic updatedObj = GetById(updatedObjId);

            updatedObj.Title = newObjTitle;

            DataContext.SubmitChanges();
        }

        #endregion

        #region Delete

        public void Delete(Topic obj)
        {
            DataContext.Topics.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Topics.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }

        #endregion
    }
}
