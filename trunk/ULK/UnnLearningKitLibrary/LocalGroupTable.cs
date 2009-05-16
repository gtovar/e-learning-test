using System;
using System.Collections.Generic;
using System.Collections;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Text;

namespace UnnLearningKitLibrary
{
    class LocalGroupTable : IGroupTableImp
    {
        public LocalGroupTable()
        {
            //FIXME: добавить некоторый код
        }

        public void Init()
        {
            //FIXME: добавить некоторый код
        }

        public void Destroy()
        {
            //FIXME: добавить некоторый код
        }

        public void Add(Obj obj)
        {
            Group group = (Group)obj;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "INSERT INTO [Group] ( department_id, title, description ) VALUES ( @department_id, @title, @description )";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@title", SqlDbType.VarChar, 255);
                    command.Parameters.Add("@department_id", SqlDbType.Int, 4);
                    command.Parameters.Add("@description", SqlDbType.Text);
                    command.Parameters["@title"].Value = group.Title;
                    command.Parameters["@department_id"].Value = group.DepartmentId;
                    command.Parameters["@description"].Value = group.Description;
                    command.CommandType = CommandType.Text;
                    // открываем соединение
                    connection.Open();
                    try
                    {
                        // выполняем sql запрос
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        //FIXME: добавить обработчик
                    }
                    finally
                    {
                        // закрываем соединение
                        connection.Close();
                    }
                }
            }
        }

        public void Update(Obj obj)
        {
            Group group = (Group)obj;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "UPDATE [Group] SET title = @title, description = @description, department_id = @department_id WHERE id = @id";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@title", SqlDbType.VarChar, 255);
                    command.Parameters.Add("@department_id", SqlDbType.Int, 4);
                    command.Parameters.Add("@description", SqlDbType.Text);
                    command.Parameters.Add("@id", SqlDbType.Int, 4);
                    command.Parameters["@title"].Value = group.Title;
                    command.Parameters["@description"].Value = group.Description;
                    command.Parameters["@department_id"].Value = group.DepartmentId;
                    command.Parameters["@id"].Value = group.Id;
                    command.CommandType = CommandType.Text;
                    // открываем соединение
                    connection.Open();
                    try
                    {
                        // выполняем sql запрос
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        //FIXME: добавить обработчик
                    }
                    finally
                    {
                        // закрываем соединение
                        connection.Close();
                    }
                }
            }
        }

        public void Delete(int id)
        {
            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "DELETE FROM [Group] WHERE id = @id";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@id", SqlDbType.Int, 4);
                    command.Parameters["@id"].Value = id;
                    command.CommandType = CommandType.Text;
                    // открываем соединение
                    connection.Open();

                    try
                    {
                        // выполняем sql запрос
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        //FIXME: добавить обработчик
                    }
                    finally
                    {
                        // закрываем соединение
                        connection.Close();
                    }
                }
            }
        }

        public List<Obj> GetAll()
        {
            // результат выполнения метода - список факультетов
            List<Obj> objects = null;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "SELECT * FROM [Group]";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.CommandType = CommandType.Text;
                    // открываем соединение
                    connection.Open();
                    // результат выполнения запроса
                    SqlDataReader result = null;
                    try
                    {
                        // выполняем sql запрос
                        result = command.ExecuteReader();

                        // возвращаемый список факультетов
                        objects = new List<Obj>();
                        // обрабатываем результат sql запроса
                        while (result.Read())
                        {
                            // получаем данных из запроса
                            int id = Convert.ToInt32(result["id"]);
                            int department_id = Convert.ToInt32(result["department_id"]);
                            string title = result["title"].ToString();
                            string description = result["description"].ToString();
                            Obj obj = new Group(id, department_id, title, description);

                            // добавляем его в результирующий список
                            objects.Add(obj);
                        }
                    }
                    catch (Exception ex)
                    {
                        //FIXME: добавить обработчик
                    }
                    finally
                    {
                        // заканчиваем обрабатывать результат запроса
                        if (null != result) { result.Close(); }
                        // закрываем соединение
                        if (null != connection) { connection.Close(); }
                    }
                }
            }

            return objects;
        }

        public List<Obj> GetAllByDepartmentId(int departmentId)
        {
            // результат выполнения метода - список факультетов
            List<Obj> objects = null;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "SELECT * FROM [Group] WHERE department_id = @department_id";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@department_id", SqlDbType.Int, 4);
                    command.Parameters["@department_id"].Value = departmentId;
                    // открываем соединение
                    connection.Open();
                    // результат выполнения запроса
                    SqlDataReader result = null;
                    try
                    {
                        // выполняем sql запрос
                        result = command.ExecuteReader();

                        // возвращаемый список факультетов
                        objects = new List<Obj>();
                        // обрабатываем результат sql запроса
                        while (result.Read())
                        {
                            // получаем данных из запроса
                            int id = Convert.ToInt32(result["id"]);
                            string title = result["title"].ToString();
                            string description = result["description"].ToString();
                            Obj obj = new Group(id, departmentId, title, description);

                            // добавляем его в результирующий список
                            objects.Add(obj);
                        }
                    }
                    catch (Exception ex)
                    {
                        //FIXME: добавить обработчик
                    }
                    finally
                    {
                        // заканчиваем обрабатывать результат запроса
                        if (null != result) { result.Close(); }
                        // закрываем соединение
                        if (null != connection) { connection.Close(); }
                    }
                }
            }

            return objects;
        }

        public Obj GetByGroupTitle(string title)
        {
            // результат выполнения метода - список факультетов
            Group group = null;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "SELECT * FROM [Group] WHERE title = @title";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@title", SqlDbType.VarChar, 255);
                    command.Parameters["@title"].Value = title;
                    command.CommandType = CommandType.Text;
                    // результат выполнения запроса
                    SqlDataReader result = null;
                    try
                    {
                        command.CommandType = CommandType.Text;
                        // открываем соединение
                        connection.Open();

                        // выполняем sql запрос
                        result = command.ExecuteReader();

                        // обрабатываем результат sql запроса
                        result.Read();

                        // получаем данных из запроса
                        int id = Convert.ToInt32(result["id"]);
                        int department_id = Convert.ToInt32(result["department_id"]);
                        string description = result["description"].ToString();
                        group = new Group(id, department_id, title, description);
                    }
                    catch (Exception ex)
                    {
                        //FIXME: добавить обработчик
                    }
                    finally
                    {
                        // заканчиваем обрабатывать результат запроса
                        if (null != result) { result.Close(); }
                        // закрываем соединение
                        if (null != connection) { connection.Close(); }
                    }
                }
            }
            return group;
        }

        public Obj GetById(int id)
        {
            // результат выполнения метода - список факультетов
            Group group = null;
        
            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "SELECT * FROM [Group] WHERE id = @id";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@id", SqlDbType.Int, 4);
                    command.Parameters["@id"].Value = id;
                    command.CommandType = CommandType.Text;
                    // результат выполнения запроса
                    SqlDataReader result = null;
                    try
                    {
                        command.CommandType = CommandType.Text;
                        // открываем соединение
                        connection.Open();

                        // выполняем sql запрос
                        result = command.ExecuteReader();

                        // обрабатываем результат sql запроса
                        result.Read();

                        // получаем данных из запроса
                        string title = result["title"].ToString();
                        int department_id = Convert.ToInt32(result["department_id"]);
                        string description = result["description"].ToString();
                        group = new Group(id, department_id, title, description);
                    }
                    catch (Exception ex)
                    {
                        //FIXME: добавить обработчик
                    }
                    finally
                    {
                        // заканчиваем обрабатывать результат запроса
                        if (null != result) { result.Close(); }
                        // закрываем соединение
                        if (null != connection) { connection.Close(); }
                    }
                }
            }
            return group;
        }
    }
}
