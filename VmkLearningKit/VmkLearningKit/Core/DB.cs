using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.SqlServer.Management;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Smo.Agent;
using Microsoft.SqlServer.Management.Smo.Broker;
using Microsoft.SqlServer.Management.Smo.Mail;
using Microsoft.SqlServer.Management.Smo.RegisteredServers;
using Microsoft.SqlServer.Management.Smo.Wmi;
using Microsoft.SqlServer.Management.Trace;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Sdk.Sfc;

namespace VmkLearningKit.Core
{
    public class DB
    {
        private static string connectionStr = ConfigurationManager.ConnectionStrings[Constants.CONNECTION_STRING_NAME].ConnectionString;
        private static string dataBaseName = ConfigurationSettings.AppSettings[Constants.DATABASE_NAME];

        public static void Backup(string destinationPath)
        {
            BackupDB(dataBaseName, connectionStr, destinationPath);
        }

        static void BackupDB(String databaseName, String connectionString, String destinationPath)
        {
            try
            {
                Backup sqlBackup = new Backup();

                sqlBackup.Action = BackupActionType.Database;
                sqlBackup.BackupSetDescription = "ArchiveDataBase:" + DateTime.Now.ToShortDateString();
                sqlBackup.BackupSetName = "Archive";

                sqlBackup.Database = databaseName;

                BackupDeviceItem deviceItem = new BackupDeviceItem(destinationPath, DeviceType.File);
                SqlConnection sqlConnection = new SqlConnection(connectionString);
                ServerConnection connection = new ServerConnection(sqlConnection);
                Server sqlServer = new Server(connection);

                Database db = sqlServer.Databases[databaseName];

                sqlBackup.Initialize = true;
                sqlBackup.Checksum = true;
                sqlBackup.ContinueAfterError = true;

                sqlBackup.Devices.Add(deviceItem);
                sqlBackup.Incremental = false;

                sqlBackup.ExpirationDate = DateTime.Now.AddDays(3);
                sqlBackup.LogTruncation = BackupTruncateLogType.Truncate;

                sqlBackup.FormatMedia = false;

                sqlBackup.Complete += new ServerMessageEventHandler(sqlBackup_Complete);
                sqlBackup.PercentCompleteNotification = 10;
                sqlBackup.PercentComplete += new PercentCompleteEventHandler(sqlBackup_PercentComplete);

                sqlBackup.SqlBackup(sqlServer);

                sqlConnection.Close();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("DB.backup: catch exception", ex);
            }
        }

        static void sqlBackup_Complete(object sender, ServerMessageEventArgs e)
        {
            if (null != e.Error)
            {
                Utility.WriteToLog(e.Error.Message, LogLevel.Error);
            }
            Utility.WriteToLog("Backup database: " + e.ToString() + "Done!");
        }
        static void sqlBackup_PercentComplete(object sender, PercentCompleteEventArgs e)
        {
            if (null != e.Error)
            {
                Utility.WriteToLog(e.Error.Message, LogLevel.Error);
            }
            Utility.WriteToLog("Backup database: " + e.Percent + "% Complete");
        }

        public static void Restore(string destinationPath)
        {
            string dataFilePath = ConfigurationSettings.AppSettings[Constants.DB_DATA_FILE_PATH];
            string logFilePath = ConfigurationSettings.AppSettings[Constants.DB_LOG_FILE_PATH];

            RestoreDB(dataBaseName, destinationPath, connectionStr, dataFilePath, logFilePath);
        }

        static void RestoreDB(String databaseName, String filePath, String connectionString, String dataFilePath, String logFilePath)
        {
            try
            {
                Restore sqlRestore = new Restore();

                BackupDeviceItem deviceItem = new BackupDeviceItem(filePath, DeviceType.File);
                sqlRestore.Devices.Add(deviceItem);
                sqlRestore.Database = databaseName;

                SqlConnection sqlConnection = new SqlConnection(connectionString);
                ServerConnection connection = new ServerConnection(sqlConnection);
                Server sqlServer = new Server(connection);

                Database db = sqlServer.Databases[databaseName];
                sqlRestore.Action = RestoreActionType.Database;
                String dataFileLocation = dataFilePath + databaseName + ".mdf";
                String logFileLocation = logFilePath + databaseName + "_Log.ldf";
                db = sqlServer.Databases[databaseName];
                RelocateFile rf = new RelocateFile(databaseName, dataFileLocation);

                sqlRestore.RelocateFiles.Add(new RelocateFile(databaseName, dataFileLocation));
                sqlRestore.RelocateFiles.Add(new RelocateFile(databaseName + "_log", logFileLocation));
                sqlRestore.ReplaceDatabase = true;
                sqlRestore.Complete += new ServerMessageEventHandler(sqlRestore_Complete);
                sqlRestore.PercentCompleteNotification = 10;
                sqlRestore.PercentComplete += new PercentCompleteEventHandler(sqlRestore_PercentComplete);

                sqlRestore.SqlRestore(sqlServer);

                db = sqlServer.Databases[databaseName];

                db.SetOnline();

                sqlServer.Refresh();

                sqlConnection.Close();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("DB.restore: catch exception", ex);
            }
        }

        static void sqlRestore_Complete(object sender, ServerMessageEventArgs e)
        {
            if (null != e.Error)
            {
                Utility.WriteToLog(e.Error.Message, LogLevel.Error);
            }
            Utility.WriteToLog("Restore database: " + e.ToString() + "Done!");
        }
        static void sqlRestore_PercentComplete(object sender, PercentCompleteEventArgs e)
        {
            if (null != e.Error)
            {
                Utility.WriteToLog(e.Error.Message, LogLevel.Error);
            }
            Utility.WriteToLog("Restore database: " + e.Percent + "% Complete");
        }
    }
}
