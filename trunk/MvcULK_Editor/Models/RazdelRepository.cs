using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcULK_Editor.Models
{
    public class RazdelRepository : Repository<razdel>
    {
        public RazdelRepository(MvcULKDataContext _dataContext) :
            base(_dataContext)
        {
        }
        
        public override IEnumerable<razdel> GetAll()
        {
            return DataContext.razdels.AsEnumerable<razdel>();
        }

        public override razdel GetById(int id)
        {
            return DataContext.razdels.SingleOrDefault(t => t.id == id);
        }
    }
}
