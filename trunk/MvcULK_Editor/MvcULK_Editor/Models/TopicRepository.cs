using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcULK_Editor.Models
{
    public class TopicRepository : Repository<topic>
    {
        public TopicRepository(MvcULKDataContext _dataContext) :
            base(_dataContext)
        {
        }

        public override IEnumerable<topic> GetAll()
        {
            return DataContext.topics.AsEnumerable<topic>();
        }

        public override topic GetById(int id)
        {
            return DataContext.topics.SingleOrDefault(t => t.id == id);
        }
    }
}
