using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Data;
using System.DirectoryServices;
using System.IO;
using System.Security.Principal;
using System.Web.Configuration;
using Microsoft.LearningComponents;
using Microsoft.LearningComponents.Storage;
using Schema = WebPlayer.Schema;

public class PageHelper : System.Web.UI.Page 
{
    ///////////////////////////////////////////////////////////////////////////
    // Private Properties
    //

	string m_lstoreConnectionString;
	LearningStore m_lstore;
	string m_pstoreDirectoryPath;

    FileSystemPackageStore m_pstore;

	///////////////////////////////////////////////////////////////////////////
	// Public Properties
	//

	public virtual string UserKey
	{
		get
		{
            return "WEB_PLAYER_KEY";
		}
	}

    public virtual string UserName
    {
        get
        {
            return "WEB_PLAYER_USER";
        }
    }

	public string LStoreConnectionString
	{
		get
		{
			if (m_lstoreConnectionString == null)
			{
				m_lstoreConnectionString = WebConfigurationManager.AppSettings["learningComponentsConnnectionString"];
			}
			return m_lstoreConnectionString;
		}
	}

	public LearningStore LStore
	{
		get
		{
			if (m_lstore == null)
			{
				m_lstore = new LearningStore(LStoreConnectionString, UserKey, ImpersonationBehavior.UseOriginalIdentity, true);
			}
			return m_lstore;
		}
	}

	public string PStoreDirectoryPath
	{
		get
		{
			if (m_pstoreDirectoryPath == null)
			{
				m_pstoreDirectoryPath = WebConfigurationManager.AppSettings["packageStoreDirectoryPath"];
			}
			return m_pstoreDirectoryPath;
		}
	}

	public FileSystemPackageStore PStore
	{
		get
		{
			if (m_pstore == null)
			{
				m_pstore = new FileSystemPackageStore(LStore, PStoreDirectoryPath, ImpersonationBehavior.UseOriginalIdentity);
			}
			return m_pstore;
		}
	}

	///////////////////////////////////////////////////////////////////////////
	// Public Methods
	//

    protected LStoreUserInfo GetCurrentUserInfo()
    {
        UserItemIdentifier userId;

        LearningStoreJob job = LStore.CreateJob();
        LearningStoreQuery query = LStore.CreateQuery(
            Schema.Me.ViewName);
        query.AddColumn(Schema.Me.UserId);
        query.AddColumn(Schema.Me.UserName);
        job.PerformQuery(query);

        ReadOnlyCollection<object> job_results = job.Execute();
        DataTable results_table = (DataTable)job_results[0];
        DataRowCollection results = results_table.Rows;

        if (results.Count == 0)
        {
            job = LStore.CreateJob();
            Dictionary<string, object> uniqueValues = new Dictionary<string, object>();
            uniqueValues[Schema.UserItem.Key] = UserKey;
            Dictionary<string, object> addValues = new Dictionary<string, object>();
            addValues[Schema.UserItem.Name] = UserName;
            job.AddOrUpdateItem(Schema.UserItem.ItemTypeName, uniqueValues, addValues, null, true);

            userId = new UserItemIdentifier(job.Execute<LearningStoreItemIdentifier>());
        }
        else
        {
            userId = new UserItemIdentifier((LearningStoreItemIdentifier)results[0][Schema.Me.UserId]);
        }

        return new LStoreUserInfo(userId, UserName, UserKey);
    }

    /// <summary>
    /// A delegate with no parameters and no return value.
    /// </summary>
    ///
    public delegate void VoidDelegate();

    /// <summary>
    /// Executes a supplied delegate while impersonating the application pool
    /// account.
    /// </summary>
    ///
    /// <param name="del">The delegate to execute.</param>
    ///
    public void ImpersonateAppPool(VoidDelegate del)
    {
        try
        {
            WindowsImpersonationContext context = null;
            try
            {
                context = WindowsIdentity.Impersonate(IntPtr.Zero);
                del();
            }
            finally
            {
                if (context != null)
                    context.Dispose();
            }
        }
        catch
        {
            // prevent exception filter exploits
            throw;
        }
    }

    /// <summary>
    /// Formats a message using <c>String.Format</c> and writes to the event
    /// log.
    /// </summary>
    ///
    /// <param name="type">The type of the event log entry.</param>
    ///
    /// <param name="format">A string containing zero or more format items;
    ///     for example, "An exception occurred: {0}".</param>
    /// 
    /// <param name="args">Formatting arguments.</param>
    ///
    public void LogEvent(EventLogEntryType type, string format,
        params object[] args)
    {
        ImpersonateAppPool(delegate()
        {
            EventLog.WriteEntry("WebPlayer", String.Format(format, args), type);
        });
    }
}

public class LStoreUserInfo
{
	UserItemIdentifier m_id;
	string m_name;
    string m_key;

	public UserItemIdentifier Id
	{
		get
		{
			return m_id;
		}
	}

	public string Name
	{
		get
		{
			return m_name;
		}
	}

    public string Key
    {
        get
        {
            return m_key;
        }
    }

	public LStoreUserInfo(UserItemIdentifier id, string name, string key)
	{
		m_id = id;
		m_name = name;
        m_key = key;
	}
}

