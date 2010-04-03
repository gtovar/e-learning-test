using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security;

namespace VmkLearningKit.Core
{
    public class AuthorizeFilter : ActionFilterAttribute
    {
        public string Roles { get; set; }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var userRole = filterContext.HttpContext.Session[Constants.SESSION_USER_ROLE];
            foreach (string definedRole in this.Roles.Split(','))
            {
                if (userRole != null && userRole.ToString().Trim().Equals(definedRole))
                {
                    return;
                }
            }

            filterContext.HttpContext.Response.Redirect(Constants.ERROR_404_URL);
        }
    }
}
