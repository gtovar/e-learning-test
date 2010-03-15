using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcULK_Editor.Models
{
    public class AnswerRepository : Repository<answer>
    {
        public AnswerRepository(MvcULKDataContext _dataContext) :
            base(_dataContext)
        {
        }
        
        public override IEnumerable<answer> GetAll()
        {
            return DataContext.answers.AsEnumerable<answer>();
        }

        public override answer GetById(int id)
        {
            return DataContext.answers.SingleOrDefault(t => t.id == id);
        }
    }
}
