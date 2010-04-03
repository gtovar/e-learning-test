using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VmkLearningKit.Core
{
    public class Utility
    {
        public static void RedirectToErrorPage(string message, Exception exception, int? errorCode)
        {
            if(!errorCode.HasValue) 
            {
                new RedirectResult(Constants.ERROR_URL); 
            }
            else 
            {
                new RedirectResult(Constants.ERROR_URL + errorCode);
            }
        }

        public static void RedirectToErrorPage(string message)
        {
            RedirectToErrorPage(message, null, null);
        }

        public static void RedirectToErrorPage(string message, Exception exception)
        {
            RedirectToErrorPage(message, exception, null);
        }
    }
}
