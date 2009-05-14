using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace UnnLearningKitLibrary
{
    class LocalTestTable : ITestTableImp
    {
        public LocalTestTable()
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
            Test test = (Test)obj;

            using (SqlConnection connection = new SqlConnection(DbConfig.ConnectionString))
            {
                string bodySql = "INSERT INTO [CurrentTest] ( student_id, test_variant_id ) VALUES ( @student_id, @test_variant_id )";
                string sql = DbConstants.BeginTransaction + bodySql + DbConstants.EndTransaction;
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = sql;
                    command.Parameters.Add("@student_id", SqlDbType.Int, 4);
                    command.Parameters["@student_id"].Value = test.StudentId;
                    command.Parameters.Add("@test_variant_id", SqlDbType.Int, 4);
                    command.Parameters["@test_variant_id"].Value = test.TestVariantId;
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
        }

        public void Delete(int id)
        {
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
            Test test = null;

            return test;
        }
    }
}
