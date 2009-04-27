using System;
using System.Collections.Generic;
using System.Collections;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    class LocalDisciplinePartTable : IDisciplinePartTableImp
    {
        public LocalDisciplinePartTable()
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
            DisciplinePart disciplinePart = (DisciplinePart)obj;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "INSERT INTO [DisciplinePart] ( title ) VALUES ( @title )";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@title", SqlDbType.VarChar, 255);
                    command.Parameters["@title"].Value = disciplinePart.Title;
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
            DisciplinePart disciplinePart = (DisciplinePart)obj;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "UPDATE [DisciplinePart] SET title = @title WHERE id = @id";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@title", SqlDbType.VarChar, 255);
                    command.Parameters.Add("@id", SqlDbType.Int, 4);
                    command.Parameters["@title"].Value = disciplinePart.Title;
                    command.Parameters["@id"].Value = disciplinePart.Id;
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
                string bodySql = "DELETE FROM [DisciplinePart] WHERE id = @id";
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
                string bodySql = "SELECT * FROM [DisciplinePart]";
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
                            string title = result["title"].ToString();
                            Obj obj = new Department(id, title);

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

        public Obj GetById(int id)
        {
            // результат выполнения метода - список факультетов
            DisciplinePart disciplinePart = null;
        
            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "SELECT * FROM [DisciplinePart] WHERE id = @id";
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

                        disciplinePart = new DisciplinePart(id, title);
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
            return disciplinePart;
        }
    }
}
