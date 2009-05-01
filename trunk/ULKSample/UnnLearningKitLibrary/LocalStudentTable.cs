using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace UnnLearningKitLibrary
{
    class LocalStudentTable : IStudentTableImp
    {
        public void LocalGroupTable()
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
            Student student = (Student)obj;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "INSERT INTO [Student] ( group_id, name, email, login, description ) VALUES ( @group_id, @name, @email, @login, @description )";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@name", SqlDbType.VarChar, 255);
                    command.Parameters.Add("@email", SqlDbType.VarChar, 255);
                    command.Parameters.Add("@login", SqlDbType.VarChar, 255);
                    command.Parameters.Add("@group_id", SqlDbType.Int, 4);
                    command.Parameters.Add("@description", SqlDbType.Text);
                    command.Parameters["@name"].Value = student.Name;
                    command.Parameters["@login"].Value = student.Login;
                    command.Parameters["@email"].Value = student.Email;
                    command.Parameters["@group_id"].Value = student.GroupId;
                    command.Parameters["@description"].Value = student.Description;
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
            Student student = (Student)obj;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "UPDATE [Student] SET name = @name, login = @login, email = @email, description = @description, group_id = @group_id WHERE id = @id";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@name", SqlDbType.VarChar, 255);
                    command.Parameters.Add("@login", SqlDbType.VarChar, 255);
                    command.Parameters.Add("@email", SqlDbType.VarChar, 255);
                    command.Parameters.Add("@group_id", SqlDbType.Int, 4);
                    command.Parameters.Add("@description", SqlDbType.Text);
                    command.Parameters.Add("@id", SqlDbType.Int, 4);
                    command.Parameters["@name"].Value = student.Name;
                    command.Parameters["@login"].Value = student.Login;
                    command.Parameters["@email"].Value = student.Email;
                    command.Parameters["@description"].Value = student.Description;
                    command.Parameters["@group_id"].Value = student.GroupId;
                    command.Parameters["@id"].Value = student.Id;
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
                string bodySql = "DELETE FROM [Student] WHERE id = @id";
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
            return objects;
        }

        public Obj GetById(int id)
        {
            // результат выполнения метода - список факультетов
            Student student = null;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "SELECT * FROM [Student] WHERE id = @id";
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
                        string name = result["name"].ToString();
                        string login = result["login"].ToString();
                        string email = result["email"].ToString();
                        int group_id = Convert.ToInt32(result["group_id"]);
                        string description = result["description"].ToString();
                        student = new Student(id, group_id, name, login, email, description);
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
            return student;
        }
    }
}
