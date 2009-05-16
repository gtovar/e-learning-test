using System;
using System.Collections.Generic;
using System.Web;
using Resources;
using UnnLearningKitLibrary;

/// <summary>
/// Сводное описание для UsersRules
/// </summary>
public class UsersRules
{
    public static void IsUserAdmin(System.Security.Principal.IPrincipal user, HttpResponse response)
    {
        if (!user.IsInRole(Resources.Constants.AdminRoleName))
        {
            string url = UrlConstants.LoginUrl;
            response.Redirect(url);
        }
    }

    public static void IsUserMetodist(System.Security.Principal.IPrincipal user, HttpResponse response)
    {
        if (!user.IsInRole(Resources.Constants.MetodistRoleName))
        {
            string url = UrlConstants.LoginUrl;
            response.Redirect(url);
        }
    }

    public static void IsUser(System.Security.Principal.IPrincipal user, HttpResponse response)
    {
        if (!user.IsInRole(Resources.Constants.UserRoleName))
        {
            string url = UrlConstants.LoginUrl;
            response.Redirect(url);
        }
    }

    public static void IsUserLogin(System.Security.Principal.IPrincipal user, HttpResponse response)
    {
        if (!user.IsInRole(Resources.Constants.UserRoleName)&&
            !user.IsInRole(Resources.Constants.MetodistRoleName)&&
            !user.IsInRole(Resources.Constants.AdminRoleName))
        {
            string url = UrlConstants.LoginUrl;
            response.Redirect(url);
        }
    }
}
