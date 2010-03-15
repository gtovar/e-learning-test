using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcULK_Editor.Models
{
    public class DepartmentRepository : Repository<department>
    {
        public DepartmentRepository(MvcULKDataContext _dataContext) : 
            base(_dataContext)
        {
        }

        public override IEnumerable<department> GetAll()
        {
            return DataContext.departments.AsEnumerable<department>();
        }

        public override department GetById(int id)
        {
            return DataContext.departments.SingleOrDefault(t => t.id == id);
        }
    }
}
