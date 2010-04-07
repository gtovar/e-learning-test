﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class ChairRepository : Repository<Chair>, IChairRepository
    {
        public ChairRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public Chair GetById(long id)
        {
            return DataContext.Chairs.SingleOrDefault(ch => ch.Id == id);
        }

        public IEnumerable<Chair> GetAll(string departmentAlias)
        {
            return DataContext.Chairs.Where(ch => ch.Department.Alias == departmentAlias);
        }

        public Chair GetByAlias(string alias)
        {
            return DataContext.Chairs.SingleOrDefault(ch => ch.Alias == alias);
        }

        public bool IsEntryWithAliasExisted(string alias)
        {
            Chair chair = DataContext.Chairs.SingleOrDefault(s => s.Alias == alias);
            if (null != chair)
            {
                return true;
            }
            return false;
        }

        public void Delete(Chair obj)
        {
            DataContext.Chairs.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Chairs.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}