using System;
using System.Web;
using System.Web.Routing;

namespace VmkLearningKit.Core
{
    public class AuthenticatedConstraint : IRouteConstraint
    {
        private string roles;

        public AuthenticatedConstraint(string roles)
        {
            this.roles = roles;
        }

        public bool Match(HttpContextBase httpContext, Route route,
            string parameterName, RouteValueDictionary values,
            RouteDirection routeDirection)
        {
            var userRole = httpContext.Session[Constants.SESSION_USER_ROLE];
            foreach (string definedRole in roles.Split(','))
            {
                if (userRole != null && userRole.ToString().Trim().Equals(definedRole))
                {
                    return true;
                }
            }

            return false;
        }
    }
}
