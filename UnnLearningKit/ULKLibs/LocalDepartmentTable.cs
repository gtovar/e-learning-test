using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace ULKLibs
{
    public class LocalDepartmentTable : IDepartmentTableImp
    {
        private ILog _logImg = null;
        private IConfig _configImp = null;

        public LocalDepartmentTable() 
        {
            //FIXME: �������� ��������� ���
        }

        public void LoadConfig()
        {
            _configImp = DbConfig.GetInstance();
            _configImp.Load();
        }

        public void UnLoadConfig()
        {
            _configImp.UnLoad();
        }

        public void InitLog()
        {
            _logImg = TextFileLog.GetInstance();
            _logImg.Init();
        }

        public void PutToLog(string subModuleTitle, string description)
        {
            LogObj tmpLogObj = new TextFileLogObj(GetType().FullName, subModuleTitle, description);
            _logImg.Put(tmpLogObj);
        }

        public void CloseLog()
        {
            _logImg.Close();
        }

        public void Initialize()
        {
            InitLog();
            LoadConfig();
        }

        public void Finalize()
        {
            CloseLog();
            UnLoadConfig();
        }

        public bool AddRecord(Record record)
        {
            DepartmentRecord departmentRecord = (DepartmentRecord)record;
            string subModuleTitle = "AddRecord(" + departmentRecord.ToString() + ")";
            
            // ��������� ���������� �������
            int result = 0;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "INSERT INTO " + DbConfig.LocalDepartmentTableName + " ( " + DbConfig.LocalDepartmentColumnTitleName + " ) VALUES ( @" + DbConfig.LocalDepartmentColumnTitleName  + " )";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@" + DbConfig.LocalDepartmentColumnTitleName, Title.DbType, Title.Length);
                    command.Parameters["@" + DbConfig.LocalDepartmentColumnTitleName].Value = departmentRecord.Title.Value;
                    command.CommandType = CommandType.Text;
                    // ��������� ����������
                    connection.Open();
                    try
                    {
                        // ��������� sql ������
                        PutToLog(subModuleTitle, command.CommandText);
                        result = command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        PutToLog(subModuleTitle, ex.Message + " " + ex.StackTrace);
                        //FIXME: �������� ����������
                    }
                    finally
                    {
                        // ��������� ����������
                        connection.Close();
                    }
                }
            }

            return result == 1 ? true : false;
        }

        public bool UpdateRecord(Record record)
        {
            DepartmentRecord departmentRecord = (DepartmentRecord)record;
            string subModuleTitle = "UpdateRecord(" + departmentRecord.ToString() + ")";
            
            // ��������� ���������� �������
            int result = 0;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "UPDATE " + DbConfig.LocalDepartmentTableName + " SET " + DbConfig.LocalDepartmentColumnTitleName + " = @" + DbConfig.LocalDepartmentColumnTitleName+ " WHERE " + DbConfig.LocalDepartmentColumnIdName + " = @" + DbConfig.LocalDepartmentColumnIdName;
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@" + DbConfig.LocalDepartmentColumnTitleName, Title.DbType, Title.Length);
                    command.Parameters.Add("@" + DbConfig.LocalDepartmentColumnIdName, Id.DbType, Id.Length);
                    command.Parameters["@" + DbConfig.LocalDepartmentColumnTitleName].Value = departmentRecord.Title.Value;
                    command.Parameters["@" + DbConfig.LocalDepartmentColumnIdName].Value = departmentRecord.Id.Value;
                    command.CommandType = CommandType.Text;
                    // ��������� ����������
                    connection.Open();
                    try
                    {
                        // ��������� sql ������
                        PutToLog(subModuleTitle, command.CommandText);
                        result = command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        PutToLog(subModuleTitle, ex.Message + " " + ex.StackTrace);
                        //FIXME: �������� ����������
                    }
                    finally
                    {
                        // ��������� ����������
                        connection.Close();
                    }
                }
            }

            return result == 1 ? true : false;
        }

        public bool DeleteRecord(Id id)
        {
            string subModuleTitle = "DeleteRecord(" + id.ToString() + ")";

            // ��������� ���������� �������
            int result = 0;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "DELETE FROM " + DbConfig.LocalDepartmentTableName + " WHERE " + DbConfig.LocalDepartmentColumnIdName + " = @" + DbConfig.LocalDepartmentColumnIdName;
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@" + DbConfig.LocalDepartmentColumnIdName, Id.DbType, Id.Length);
                    command.Parameters["@" + DbConfig.LocalDepartmentColumnIdName].Value = id.Value;
                    command.CommandType = CommandType.Text;
                    // ��������� ����������
                    connection.Open();

                    try
                    {
                        // ��������� sql ������
                        PutToLog(subModuleTitle, command.CommandText);
                        result = command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        PutToLog(subModuleTitle, ex.Message + " " + ex.StackTrace);
                        //FIXME: �������� ����������
                    }
                    finally
                    {
                        // ��������� ����������
                        connection.Close();
                    }
                }
            }

            return result == 1 ? true : false;
        }

        public List<Record> GetAllRecords()
        {
            string subModuleTitle = "GetAllRecords()";

            // ��������� ���������� ������ - ������ �����������
            List<Record> allDepartments = null;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "SELECT * FROM " + DbConfig.LocalDepartmentTableName;
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.CommandType = CommandType.Text;
                    // ��������� ����������
                    connection.Open();
                    // ��������� ���������� �������
                    SqlDataReader result = null;
                    try
                    {
                        // ��������� sql ������
                        PutToLog(subModuleTitle, command.CommandText);
                        result = command.ExecuteReader();
                        
                        // ������������ ������ �����������
                        allDepartments = new List<Record>();
                        // ������������ ��������� sql �������
                        while (result.Read())
                        {
                            // �������� ������ �� �������
                            Id tmpId = new Id(Convert.ToInt32(result[DbConfig.LocalDepartmentColumnIdName]));
                            Title tmpTitle = new Title(result[DbConfig.LocalDepartmentColumnTitleName].ToString());
                            Record tmpRecord = new DepartmentRecord(tmpId, tmpTitle);
                            
                            // ��������� ��� � �������������� ������
                            allDepartments.Add(tmpRecord);
                        }
                    }
                    catch (Exception ex)
                    {
                        PutToLog(subModuleTitle, ex.Message + " " + ex.StackTrace);
                        //FIXME: �������� ����������
                    }
                    finally
                    {
                        // ����������� ������������ ��������� �������
                        if (null != result) { result.Close(); }
                        // ��������� ����������
                        if (null != connection) { connection.Close(); }
                    }
                }
            }

            return allDepartments;
        }

        public Record GetRecordById(Id id)
        {
            string subModuleTitle = "GetRecordById(" + id.ToString() + ")";

            // ��������� ���������� ������ - ������ �����������
            Record departmentRecord = null;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "SELECT * FROM " + DbConfig.LocalDepartmentTableName + " WHERE " + DbConfig.LocalDepartmentColumnIdName + " = @"+ DbConfig.LocalDepartmentColumnIdName;
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@" + DbConfig.LocalDepartmentColumnIdName, Id.DbType, Id.Length);
                    command.Parameters["@" + DbConfig.LocalDepartmentColumnIdName].Value = id.Value;
                    command.CommandType = CommandType.Text;
                    // ��������� ���������� �������
                    SqlDataReader result = null;
                    try
                    {
                        command.CommandType = CommandType.Text;
                        // ��������� ����������
                        connection.Open();

                        // ��������� sql ������
                        PutToLog(subModuleTitle, command.CommandText);
                        result = command.ExecuteReader();

                        // ������������ ��������� sql �������
                        result.Read();

                        // �������� ������ �� �������
                        Id tmpId = new Id(Convert.ToInt32(result[DbConfig.LocalDepartmentColumnIdName]));
                        Title tmpTitle = new Title(result[DbConfig.LocalDepartmentColumnTitleName].ToString());

                        departmentRecord = new DepartmentRecord(tmpId, tmpTitle);
                    }
                    catch (Exception ex)
                    {
                        PutToLog(subModuleTitle, ex.Message + " " + ex.StackTrace );
                        //FIXME: �������� ����������
                    }
                    finally
                    {
                        // ����������� ������������ ��������� �������
                        if (null != result) { result.Close(); }
                        // ��������� ����������
                        if (null != connection) { connection.Close(); }
                    }
                }
            }
            return departmentRecord;
        }
    }
}