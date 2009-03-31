using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace ULKLibs
{
    public class TextFileLog : ITextFileLog
    {
        private FileStream _fileStream = null;
        private TextWriter _textWriter = null;

        private IConfig _configImp = null;

        private List<LogObj> _buffer = null;

        private static ILog _textFileLog = null;

        public void LoadConfig()
        {
            _configImp = LogConfig.GetInstance();
            _configImp.Load();
        }

        public void UnLoadConfig()
        {
            _configImp.UnLoad();
        }
        
        private TextFileLog() {}

        public static ILog GetInstance()
        {
            if (null == _textFileLog)
            {
                _textFileLog = new TextFileLog();
            }
            return _textFileLog;
        }

        public bool Init() 
        {
            LoadConfig();

            string fullLogFileName = LogConfig.LogFilePath + LogConfig.LogFileName;
            try
            {
                _fileStream = new FileStream(fullLogFileName, FileMode.Append);
                _textWriter = new StreamWriter(_fileStream);
            }
            catch (Exception ex)
            {
                //FIXME: TO DO SOMETHING
            }

            _buffer = new List<LogObj>(LogConfig.BufferLength);

            return true; 
        }

        public bool Put(LogObj logObj)
        {
            if (_buffer.Count < LogConfig.BufferLength)
            {
                try
                {
                    _buffer.Add(logObj);
                }
                catch (Exception ex)
                {
                    //FIXME: ADD SOMETHING HANDLER
                    return false;
                }
            }
            else
            {
                return Flush();
            }
            return true;
        }

        public bool Flush()
        {
            try
            {
                foreach (LogObj tmpLogObj in _buffer)
                {
                    string tmpLogString = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString() + " " + tmpLogObj.ModuleTitle + "." + tmpLogObj.SubModuleTitle + "-" + tmpLogObj.Description;
                    _textWriter.WriteLine(tmpLogString);
                    _textWriter.WriteLine();
                }
            }
            catch (Exception ex)
            {
                //FIXME: ADD SOMETHING HANDLER
                return false;
            }

            _buffer.Clear();
            return true;
        }

        public bool Close()
        {
            try
            {
                Flush();
                if (null != _textWriter)
                {
                    _textWriter.Flush();
                    _textWriter.Close();
                }
                if (null != _fileStream)
                {
                    _fileStream.Close();
                }
            }
            catch (Exception ex)
            {
                //FIXME: ADD SOMETHING HANDLER
                return false;
            }

            if (null != _configImp) { _configImp.UnLoad(); }

            _textFileLog = null;
            _buffer = null;
            return true;
        }
    }
}
