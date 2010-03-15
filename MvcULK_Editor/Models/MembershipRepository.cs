using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace MvcULK_Editor.Models
{
    public class MembershipRepository
    {
        public MembershipUserCollection GetAll()
        {
            return Membership.GetAllUsers();
        }
    }
}
