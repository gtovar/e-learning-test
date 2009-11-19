using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
public class Department : Obj
{
    protected string _title = String.Empty;

    public Department(int id, string title)
        : base(id)
    {
        _title = title;
    }

    public Department(Department department)
        : base(department.Id)
    {
        _title = department.Title;
    }

    public string Title
    {
        get { return _title; }
        set { _title = value; }
    }

    public override string ToString()
    {
        return _title;
    }
}
}
