using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcULK_Editor.Models
{
    public class QuestionRepository : Repository<question>
    {
        public QuestionRepository(MvcULKDataContext _dataContext) :
            base(_dataContext)
        {
        }
        
        public override IEnumerable<question> GetAll()
        {
            return DataContext.questions.AsEnumerable<question>();
        }

        public override question GetById(int id)
        {
            return DataContext.questions.SingleOrDefault(t => t.id == id);
        }
    }
}
