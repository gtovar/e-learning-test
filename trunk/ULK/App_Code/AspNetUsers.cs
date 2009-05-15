using System;
using System.Collections.Generic;
using System.Web;
using UnnLearningKitLibrary;
using dataSetTableAdapters;
using Resources;

public class AspNetUsers
{
    /**
    public static void UpdateRoleId(string userId, string roleId)
    {
        Guid userGuid = new Guid(userId);
        Guid roleGuid = new Guid(roleId);

        UsersInRolesTableAdapter usersInRolesAdapter = new UsersInRolesTableAdapter();
        usersInRolesAdapter.UpdateRoleId(roleGuid, userGuid);
    }

    public static string GetRoleId(string userId)
    {
        Guid userGuid = new Guid(userId);
        UsersInRolesTableAdapter usersInRolesAdapter = new UsersInRolesTableAdapter();
        dataSet.UsersInRolesDataTable usersInRolesTable = usersInRolesAdapter.GetByUserId(userGuid);
        string role_id = usersInRolesTable.Rows[0].ItemArray[1].ToString();

        return role_id;
    }

    public static string GetUserEmail(string userId)
    {
        Guid userGuid = new Guid(userId);
        AccountsTableAdapter accountsAdapter = new AccountsTableAdapter();
        dataSet.AccountsDataTable accountsTable = accountsAdapter.GetUserContent(userGuid);
        string user_email = accountsTable.Rows[0].ItemArray[1].ToString();

        return user_email;
    }
    **/
    public static void UpdateUserName(string userId, string userName)
    {
        try
        {
            Guid userGuid = new Guid(userId);
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            userAdapter.UpdateUserName(userName, userName.ToLower(), userGuid);
        }
        catch (Exception ex)
        {
        }
    }

    public static void UpdateUserEmail(string userId, string userEmail)
    {
        try
        {
            Guid userGuid = new Guid(userId);
            MembershipTableAdapter membershipAdapter = new MembershipTableAdapter();
            membershipAdapter.UpdateEmail(userEmail, userEmail.ToLower(), userGuid);
        }
        catch (Exception ex)
        {
        }
    }
    
    public static string GetUsersRoleId()
    {
        try
        {
            RolesTableAdapter rolesAdapter = new RolesTableAdapter();
            dataSet.RolesDataTable rolesTable = rolesAdapter.GetRoleByRoleName(Resources.Constants.UserRoleName);
            string role_id = rolesTable.Rows[0].ItemArray[0].ToString();

            return role_id;
        }
        catch (Exception ex)
        {
        }
        return String.Empty;
    }
    
    public static void AddUserInRoles(string userId, string roleId)
    {
        try
        {
            Guid userGuid = new Guid(userId);
            Guid roleGuid = new Guid(roleId);
            UsersInRolesTableAdapter usersInRolesAdapter = new UsersInRolesTableAdapter();
            usersInRolesAdapter.AddUsersInRoles(userGuid, roleGuid);
        }
        catch (Exception ex)
        {
        }
    }
    
    public static string GetUserId(string userName)
    {
        try
        {
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            dataSet.UsersDataTable usersTable = userAdapter.GetUserId(userName);
            string user_id = usersTable.Rows[0].ItemArray[0].ToString();

            return user_id;
        }
        catch (Exception ex)
        {
        }
        return String.Empty;
    }
    
    public static void DeleteUserProfile(string userId)
    {
        try
        {
            Guid userGuid = new Guid(userId);
            ProfileTableAdapter profileAdapter = new ProfileTableAdapter();
            profileAdapter.DeleteUserProfile(userGuid);
        }
        catch (Exception ex)
        {
        }
    }

    public static void DeleteUserMembership(string userId)
    {
        try
        {
            Guid userGuid = new Guid(userId);
            MembershipTableAdapter membershipAdapter = new MembershipTableAdapter();
            membershipAdapter.DeleteUserMembership(userGuid);
        }
        catch (Exception ex)
        {
        }
    }

    public static void DeleteUserRoles(string userId)
    {
        try
        {
            Guid userGuid = new Guid(userId);
            UsersInRolesTableAdapter userRolesAdapter = new UsersInRolesTableAdapter();
            userRolesAdapter.DeleteUserRoles(userGuid);
        }
        catch (Exception ex)
        {
        }
    }

    public static void DeleteUserPersonalization(string userId)
    {
        try
        {
            Guid userGuid = new Guid(userId);
            PersonalizationPerUserTableAdapter userPersonalizationAdapter = new PersonalizationPerUserTableAdapter();
            userPersonalizationAdapter.DeleteUserPersonalization(userGuid);
        }
        catch (Exception ex)
        {
        }
    }

    public static void DeleteUser(string userId)
    {
        try
        {
            DeleteUserPersonalization(userId);
            DeleteUserRoles(userId);
            DeleteUserMembership(userId);
            DeleteUserProfile(userId);

            Guid userGuid = new Guid(userId);
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            userAdapter.DeleteUser(userGuid);
        }
        catch (Exception ex)
        {
        }
    }
}