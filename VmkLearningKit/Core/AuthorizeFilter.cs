using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security;
using VmkLearningKit.Models.Domain;

namespace VmkLearningKit.Core
{
    public class AuthorizeFilter : ActionFilterAttribute
    {
        public string Roles { get; set; }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                User user = (User)filterContext.HttpContext.Session[Constants.SESSION_USER];
                if (null != user)
                {
                    foreach (string definedRole in this.Roles.Split(','))
                    {
                        if (user.HasRole(definedRole.Trim()))
                        {
                            return;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Utility.RedirectToErrorPage("AuthorizeFilter: catch exception", ex);
            }

            filterContext.HttpContext.Response.Redirect(Constants.ERROR_404_URL);
        }
    }
}
