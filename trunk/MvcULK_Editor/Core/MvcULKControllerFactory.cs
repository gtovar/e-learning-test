using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using MvcULK_Editor.Models;

namespace MvcULK_Editor.Core
{
    public class MvcULKControllerFactory : DefaultControllerFactory
    {
        protected override IController GetControllerInstance(System.Web.Routing.RequestContext requestContext, Type controllerType)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ULKDBConnectionString"].ConnectionString;

            return Activator.CreateInstance(controllerType, new RepositoryManager(connectionString)) as IController;
        }
    }
}
