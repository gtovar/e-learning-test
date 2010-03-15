using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcULK_Editor.Models
{
    public class DisciplineRepository : Repository<discipline>
    {
        public DisciplineRepository(MvcULKDataContext _dataContext) :
            base(_dataContext)
        {
        }

        public override IEnumerable<discipline> GetAll()
        {
            return DataContext.disciplines.AsEnumerable<discipline>();
        }

        public override discipline GetById(int id)
        {
            return DataContext.disciplines.SingleOrDefault(t => t.id == id);
        }
    }
}
