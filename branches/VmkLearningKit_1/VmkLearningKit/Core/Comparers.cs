using System;
using System.Collections.Generic;
using System.Linq;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core
{
    public class LecturePlanTopicIdComparer : IEqualityComparer<LecturePlan>
    {
        public bool Equals(LecturePlan x, LecturePlan y)
        {
            return (x.SpecialityDisciplineTopicId == y.SpecialityDisciplineTopicId);
        }

        public int GetHashCode(LecturePlan obj)
        {
            return obj.SpecialityDisciplineTopicId.GetHashCode();
        }
    }
}