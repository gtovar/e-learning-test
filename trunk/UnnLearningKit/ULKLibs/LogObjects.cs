using System;
using System.Collections.Generic;
using System.Text;

namespace ULKLibs
{
    abstract public class LogObj
    {
        protected string _moduleTitle = null;
        protected string _subModuleTitle = null;
        protected string _description = null;

        public LogObj(string moduleTitle, string subModuleTitle, string description) 
        {
            _moduleTitle = moduleTitle;
            _subModuleTitle = subModuleTitle;
            _description = description;
        }

        public string Description
        {
            get { return _description; }
        }

        public string ModuleTitle
        {
            get { return _moduleTitle; }
        }

        public string SubModuleTitle
        {
            get { return _subModuleTitle; }
        }
    }

    public class TextFileLogObj : LogObj 
    {
        public TextFileLogObj(string moduleTitle, string subModuleTitle, string description)
            : base(moduleTitle, subModuleTitle, description) {}
    }
}
