using System;
using System.Collections.Generic;
using System.Collections;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Text;

namespace UnnLearningKitLibrary
{
    class LocalTestVariantTable : ITestVariantTable
    {
        public LocalTestVariantTable()
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
            TestVariant testVariant = (TestVariant)obj;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "INSERT INTO [TestVariant] ( discipline_part_id, path, title ) VALUES ( @discipline_part_id, @path, @title )";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@title", SqlDbType.VarChar, 255);
                    command.Parameters.Add("@path", SqlDbType.VarChar, 255);
                    command.Parameters.Add("@discipline_part_id", SqlDbType.Int, 4);
                    command.Parameters["@title"].Value = testVariant.Title;
                    command.Parameters["@path"].Value = testVariant.Path;
                    command.Parameters["@discipline_part_id"].Value = testVariant.DisciplinePartId;
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
            TestVariant testVariant = (TestVariant)obj;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "UPDATE [TestVariant] SET discipline_part_id = @discipline_part_id WHERE id = @id";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@discipline_part_id", SqlDbType.Int, 4);
                    command.Parameters.Add("@id", SqlDbType.Int, 4);
                    command.Parameters["@discipline_part_id"].Value = testVariant.DisciplinePartId;
                    command.Parameters["@id"].Value = testVariant.Id;
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
                string bodySql = "UPDATE [TestVariant] SET is_deleted = 1 WHERE id = @id";
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
                string bodySql = "SELECT * FROM [TestVariant]";
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
            TestVariant testVariant = null;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "SELECT * FROM [TestVariant] WHERE id = @id";
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
                        string path = result["path"].ToString();
                        int discipline_part_id = Convert.ToInt32(result["discipline_part_id"].ToString());

                        testVariant = new TestVariant(id, discipline_part_id, title, path);
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
            return testVariant;
        }
    }
}
