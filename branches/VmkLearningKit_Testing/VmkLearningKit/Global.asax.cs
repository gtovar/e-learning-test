using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using VmkLearningKit.Core;

namespace VmkLearningKit
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default",                                                      // Route name
                "{controller}/{action}/{alias}/{additional}",                 // URL with parameters
                new { controller = "Home", action = "Index", alias = "", additional = ""}    // Parameter defaults
            );
            routes.MapRoute(
                "ProfessorCabinet",                                             // Route name
                "Cabinet/" + Constants.PROFESSOR_ROLE,                          // URL with parameters
                new { controller = "Cabinet", action = Constants.PROFESSOR_ROLE },
                new { authenticated = new AuthenticatedConstraint(Constants.PROFESSOR_ROLE) }  // Parameter defaults
            );
            routes.MapRoute(
                "StudentCabinet",                                               // Route name
                "Cabinet/" + Constants.STUDENT_ROLE,                            // URL with parameters
                new { controller = "Cabinet", action = Constants.STUDENT_ROLE },
                new { authenticated = new AuthenticatedConstraint(Constants.STUDENT_ROLE) }    // Parameter defaults
            );
            routes.MapRoute(
                "MetodistCabinet",                                              // Route name
                "Cabinet/" + Constants.METODIST_ROLE,                           // URL with parameters
                new { controller = "Cabinet", action = Constants.METODIST_ROLE },
                new { authenticated = new AuthenticatedConstraint(Constants.METODIST_ROLE) }   // Parameter defaults
            );
            routes.MapRoute(
                "AdminCabinet",                                                 // Route name
                "Cabinet/" + Constants.ADMIN_ROLE,                              // URL with parameters
                new { controller = "Cabinet", action = Constants.ADMIN_ROLE },
                new { authenticated = new AuthenticatedConstraint(Constants.ADMIN_ROLE) }      // Parameter defaults
            );
            routes.MapRoute(
                "Error404",                                                     // Route name
                "Home/Error/{id}",                                              // URL with parameters
                new { controller = "Home", action = "Error", id = 404 }         // Parameter defaults
            );

            //
            routes.MapRoute(
                "qwerty",                                                      // Route name
                "{controller}/{action}/{alias}/{additional}/{param1}/{param2}",                   // URL with parameters
                new { controller = "PlanGeneration", action = "Add", alias = "", additional = "", param1 = "", param2 = "" }              // Parameter defaults
             
            );
            routes.MapRoute(
               "qwerty2",                                                      // Route name
               "{controller}/{action}/{alias}/{additional}/{param1}",                   // URL with parameters
                         
               new { controller = "Admin", action = "", alias = "", additional = "", param1 = ""}       // Parameter defaults
           );
           
        }

        protected void Application_Start()
        {
            RegisterRoutes(RouteTable.Routes);
        }
    }
}