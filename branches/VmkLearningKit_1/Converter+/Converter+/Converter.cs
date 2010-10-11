using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using Word = Microsoft.Office.Interop.Word;
using Excel = Microsoft.Office.Interop.Excel;

namespace Converter
{
    abstract public class Converter
    {
        public List<string> Message { get; set; }

        public Converter()
        {
            Message = new List<string>();
        }
        protected Word.Application OpenDocFile(string path)
        {
            Object filename = path;
            Object confirmConversions = Type.Missing;
            Object readOnly = Type.Missing;
            Object addToRecentFiles = Type.Missing;
            Object passwordDocument = Type.Missing;
            Object passwordTemplate = Type.Missing;
            Object revert = Type.Missing;
            Object writePasswordDocument = Type.Missing;
            Object writePasswordTemplate = Type.Missing;
            Object format = Type.Missing;
            Object encoding = Type.Missing;
            Object visible = Type.Missing;
            Object openConflictDocument = Type.Missing;
            Object openAndRepair = Type.Missing;
            Object documentDirection = Type.Missing;
            Object noEncodingDialog = Type.Missing;
            Object xmlTransform = Type.Missing;

            Word.Application prog = new Microsoft.Office.Interop.Word.Application();
            prog.Documents.Open(ref filename, ref confirmConversions, ref readOnly,
            ref addToRecentFiles, ref passwordDocument, ref passwordTemplate, ref revert,
            ref writePasswordDocument, ref writePasswordTemplate, ref format, ref encoding,
            ref visible, ref openConflictDocument, ref openAndRepair, ref documentDirection,
            ref noEncodingDialog);

            return prog;
        }

        protected Excel.Workbook OpenExcelFile(string path, out Excel.Application prog)
        {
            Excel.Application program = new Excel.Application();

            Object UpdateLinks = Type.Missing;
            Object ReadOnly = Type.Missing;
            Object Format = Type.Missing;
            Object Password = Type.Missing;
            Object WriteResPassword = Type.Missing;
            Object IgnoreReadOnlyRecommended = Type.Missing;
            Object Origin = Type.Missing;
            Object Delimiter = Type.Missing;
            Object Editable = Type.Missing;
            Object Notify = Type.Missing;
            Object Converter = Type.Missing;
            Object AddToMRU = Type.Missing;
            Object Local = Type.Missing;
            Object CorruptLoad = Type.Missing;

            Excel.Workbook book = program.Workbooks.Open(path, UpdateLinks, ReadOnly,
            Format, Password, WriteResPassword, IgnoreReadOnlyRecommended, Origin,
            Delimiter, Editable, Notify, Converter, AddToMRU, Local, CorruptLoad);

            prog = program;

            return book;
        }

        protected void CloseDocFile(Word.Application program)
        {
            object sch = Type.Missing;
            object aq = Type.Missing;
            object ab = Type.Missing;

            ((Word._Application)program).Quit(ref sch, ref aq, ref ab);
        }

        protected void CloseExcelFile(Excel.Application program)
        {
            program.Quit();
        }

        public abstract void ConvertDocument(string docPath, string xmlPath, List<string> structDocument = null);
        //public virtual void rrr(string docPath, string xmlPath, List<string> structDocument) {}
    }
}
