using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Models.Repository;
using System.Xml;
using System.Xml.Schema;

namespace VmkLearningKit.Core.XmlConverter
{
    public struct LogRecord
    {
        public string   Message;
        public int      LineNumber;
        public int      LinePosition;

        public LogRecord(string message, int lineNumber, int linePosition)
        {
            Message         = message;
            LineNumber      = lineNumber;
            LinePosition    = linePosition;
        }
    }
    
    public abstract class XmlAbstractParser
    {
        #region Private Fields

        private string schemaUrl;

        private List<LogRecord> xmlStructureErrorLog    = new List<LogRecord>();
        private List<LogRecord> xmlStructureWarningLog  = new List<LogRecord>();
        private List<LogRecord> xmlDataErrorLog         = new List<LogRecord>();

        #endregion

        #region Protected Fields

        protected RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

        #endregion

        #region Properties

        public string SchemaUrl
        {
            get 
            {
                return schemaUrl;
            }
        }

        public List<LogRecord> XmlStructureErrorLog
        {
            get
            {
                return xmlStructureErrorLog;
            }
            set
            {
                xmlStructureErrorLog = value;
            }
        }

        public List<LogRecord> XmlStructureWarningLog
        {
            get
            {
                return xmlStructureWarningLog;
            }
            set
            {
                xmlStructureWarningLog = value;
            }
        }

        public List<LogRecord> XmlDataErrorLog
        {
            get
            {
                return xmlDataErrorLog;
            }
            set
            {
                xmlDataErrorLog = value;
            }
        }

        #endregion

        #region Constructors & Destructors

        public XmlAbstractParser() 
        {
            schemaUrl = String.Empty;
        }

        public XmlAbstractParser(string schemaUrl)
        {
            this.schemaUrl = schemaUrl;
        }
        
        #endregion
        
        #region Public Methods

        public bool ValidateXml(string xmlUrl)
        {
            XmlStructureWarningLog.Clear();
            XmlStructureErrorLog.Clear();
            
            XmlTextReader       xmlReader           = new XmlTextReader(xmlUrl);
            XmlValidatingReader xmlValidatingReader = new XmlValidatingReader(xmlReader);
            
            xmlValidatingReader.Schemas.Add("", SchemaUrl);
            xmlValidatingReader.ValidationType = ValidationType.Schema;
            xmlValidatingReader.ValidationEventHandler += new ValidationEventHandler(SchemaValidationEventHandler);

            while (xmlValidatingReader.Read());

            if (0 == XmlStructureErrorLog.Count)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void SchemaValidationEventHandler(object sender, System.Xml.Schema.ValidationEventArgs e)
        {
            switch (e.Severity)
            {
                case XmlSeverityType.Error :
                    XmlStructureErrorLog.Add(new LogRecord(e.Message, e.Exception.LineNumber, e.Exception.LinePosition));
                    break;

                case XmlSeverityType.Warning :
                    XmlStructureWarningLog.Add(new LogRecord(e.Message, e.Exception.LineNumber, e.Exception.LinePosition));
                    break;
            }
        }

        #endregion

        #region Abstract Methods

        public abstract bool ValidateData(string xmlUrl);

        public abstract void ParseXml(string xmlUrl);

        #endregion
    }
}