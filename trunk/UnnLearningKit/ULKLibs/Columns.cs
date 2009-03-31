using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace ULKLibs
{
    using Int = System.Int32;
    using Str = System.String;

    struct ColumnDbType
    {
        public const SqlDbType Id = SqlDbType.Int;
        public const SqlDbType Title = SqlDbType.VarChar;
    }

    struct ColumnLength
    {
        public const int Id = 4;
        public const int Title = 255;
    }

    public abstract class Column
    {
        protected object _value;
        protected static SqlDbType _dbType;
        protected static int _length;

        public Column(SqlDbType dbType, int length)
        {
            _dbType = dbType;
            _length = length;
        }

        public override string ToString()
        {
            return  GetType().FullName + " value = " + _value;
        }

        public static SqlDbType DbType
        {
            get { return _dbType; }
        }

        public static int Length
        {
            get { return _length; }
        }

        public object Value
        {
            get { return _value; }
            set { _value = value; }
        }
    }

    public class Id : Column
    {                
        public Id(Int value) : base(ColumnDbType.Id, ColumnLength.Id)
        {
            _value = value;
        }

        public Id(Id value) : base(ColumnDbType.Id, ColumnLength.Id)
        {
            _value = value.Value;
        }
    }

    public class Title : Column
    {
        public Title(Str value) : base(ColumnDbType.Title, ColumnLength.Title)
        {
            _value = value;
        }

        public Title(Title value) : base(ColumnDbType.Title, ColumnLength.Title)
        {
            _value = value.Value;
        }
    }
}
