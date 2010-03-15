using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MvcULK_Editor.Models
{
    public interface IRepository<T>
    {
        IEnumerable<T> GetAll();

        T GetById(int id);
    }
}
