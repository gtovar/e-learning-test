using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VmkLearningKit.Models.Repository;
using Word = Microsoft.Office.Interop.Word;
using Excel = Microsoft.Office.Interop.Excel;

namespace VmkLearningKit.Controllers
{
    public class DocumentController : Controller
    {
        private Word.Document CreateWordDocument(out Word.Application program)
        {
            Word.Application prog = new Word.Application();
            Object template = Type.Missing;
            Object newTemplate = false;
            Object documentType = Word.WdNewDocumentType.wdNewBlankDocument;
            Object visible = true;

            Word.Document document = prog.Documents.Add(ref template, ref newTemplate,
                                                            ref documentType, ref visible);

            document.Content.Font.Size = 12;
            document.Content.Font.Name = "Times New Roman";

            program = prog; 

            return document;
        }

        private Excel.Application CreateExcelDocument(out Excel.Workbook book)
        {
            Excel.Application program = new Excel.Application();
            program.SheetsInNewWorkbook = 1;
            Excel.Workbook b = program.Workbooks.Add();
            book = b;

            return program;
        }

        private void SaveExcelDocument(string path, Excel.Application program, Excel.Workbook book)
        {
            
            program.DefaultSaveFormat = Excel.XlFileFormat.xlExcel7;
            program.DisplayAlerts = false;
            book.Saved = true;

            Object Filename            = path;                                      //Имя сохраняемого файла
            Object FileFormat          = Excel.XlFileFormat.xlExcel7;               //Формат сохраняемого файла
            Object Password            = Type.Missing;                              //Пароль доступа к файлу до 15 символов
            Object WriteResPassword    = Type.Missing;                              //Пароль на доступ на запись
            Object ReadOnlyRecommended = Type.Missing;                              //При true режим только для чтения 
            Object CreateBackup        = Type.Missing;                              //Создать резервную копию файла при true           
            Object ConflictResolution  = Type.Missing;                              //Способ разрешения конфликтов
            Object AddToMru            = Type.Missing;                              //При true сохраненный документ добавляется в список ранее открытых файлов                             
            Object TextCodePage        = Type.Missing;                              //Кодовая страница
            Object TextVisualLayout    = Type.Missing;                              //Направление размещения текста
            Object Local               = Type.Missing;                              //Идентификатор ExcelApplication

            Excel.XlSaveAsAccessMode AccessMode = Excel.XlSaveAsAccessMode.xlNoChange;       //Режим доступа к рабочей книге

            book.SaveAs(Filename, FileFormat, Password, WriteResPassword, ReadOnlyRecommended, CreateBackup, AccessMode, ConflictResolution,
                AddToMru, TextCodePage, TextVisualLayout, Local);

            program.Quit();
        }

        private void SaveWordDocument(string name, Word.Document document, Word.Application program)
        {
            Object fileName = name;
            Object fileFormat = Word.WdSaveFormat.wdFormatDocument;
            Object lockComments = false;
            Object password = "";
            Object addToRecentFiles = false;
            Object writePassword = "";
            Object readOnlyRecommended = false;
            Object embedTrueTypeFonts = false;
            Object saveNativePictureFormat = false;
            Object saveFormsData = false;
            Object saveAsAOCELetter = Type.Missing;
            Object encoding = Type.Missing;
            Object insertLineBreaks = Type.Missing;
            Object allowSubstitutions = Type.Missing;
            Object lineEnding = Type.Missing;
            Object addBiDiMarks = Type.Missing;

            document.SaveAs(ref fileName, ref fileFormat, ref lockComments,
                        ref password, ref addToRecentFiles, ref writePassword,
                        ref readOnlyRecommended, ref embedTrueTypeFonts,
                        ref saveNativePictureFormat, ref saveFormsData,
                        ref saveAsAOCELetter, ref encoding, ref insertLineBreaks,
                        ref allowSubstitutions, ref lineEnding, ref addBiDiMarks);

            Object saveChanges = Word.WdSaveOptions.wdPromptToSaveChanges;
            Object originalFormat = Word.WdOriginalFormat.wdWordDocument;
            Object routeDocument = Type.Missing;

            ((Word._Application)program).Quit(ref saveChanges,
                             ref originalFormat, ref routeDocument);
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetChairDocument()
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
            IChairRepository  chairRepositiry   = repositoryManager.GetChairRepository;

            IEnumerable<Chair> _chairs = chairRepositiry.GetAll("VMK");
            List<Chair> chairs = new List<Chair>();

            foreach (Chair c in _chairs)
            {
                chairs.Add(c);
            }

            Word.Application program;
            Word.Document document = CreateWordDocument(out program);

            Object oMissing = System.Reflection.Missing.Value;

            document.Paragraphs.Add(ref oMissing);
            document.Paragraphs[document.Paragraphs.Count].Range.Text = "Список кафедр";

            document.Paragraphs.Add(ref oMissing);
            Word.Range range = document.Paragraphs[document.Paragraphs.Count].Range;

            Object defaultTableBehavior =
             Word.WdDefaultTableBehavior.wdWord9TableBehavior;
            Object autoFitBehavior =
             Word.WdAutoFitBehavior.wdAutoFitContent;
            Word.Table table = document.Tables.Add(range,chairs.Count + 1, 2,
              ref defaultTableBehavior, ref autoFitBehavior);

            Word.Range c1 = table.Cell(1, 1).Range;
            c1.Font.Bold = 1;
            c1.Text = "Название кафедры";

            Word.Range c2 = table.Cell(1, 2).Range;
            c2.Font.Bold = 1;
            c2.Text = "Сокращенное\n название";

            for (int i = 1; i <= chairs.Count; i++)
            {
                for (int j = 0; j < 2; j++)
                {
                    Word.Range cell = table.Cell(i + 1, j + 1).Range;
                    if (j == 0)
                    {
                        cell.Text = chairs[i - 1].Title;
                    }
                    else if (j == 1)
                    {
                        cell.Text = chairs[i - 1].Abbreviation;
                    }
                }
            }

            SaveWordDocument(@"C:\Users\orlov.leonid\Desktop\Новая папка\Список кафедр.doc", document, program);

            return RedirectToAction("Index");
        }

        public ActionResult GetTeacherDocument()
        {
            RepositoryManager    repositoryManager   = RepositoryManager.GetRepositoryManager;
            IChairRepository     chairRepositiry     = repositoryManager.GetChairRepository;
            IProfessorRepository professorRepository = repositoryManager.GetProfessorRepository;
            

            IEnumerable<Chair> chairs = chairRepositiry.GetAll("VMK");

            Word.Application program;
            Word.Document document = CreateWordDocument(out program);

            Object oMissing = System.Reflection.Missing.Value;

            Word.Paragraph p = document.Paragraphs.Add(ref oMissing);
            p.Range.Text = "Список преподавателей";

            foreach (Chair c in chairs)
            {
                IEnumerable<Professor> _teachers = professorRepository.GetAll(c.Alias);
                List<Professor> teachers = new List<Professor>();
                foreach (Professor professor in _teachers)
                {
                    teachers.Add(professor);
                }

                if (teachers.Count > 0)
                {                 
                    document.Paragraphs.Add(ref oMissing);
                    document.Paragraphs[document.Paragraphs.Count].Range.Text = "Кафедра " + c.Abbreviation;

                    document.Paragraphs.Add(ref oMissing);
                    Word.Range range = document.Paragraphs[document.Paragraphs.Count].Range;

                    Object defaultTableBehavior =
                     Word.WdDefaultTableBehavior.wdWord9TableBehavior;
                    Object autoFitBehavior =
                     Word.WdAutoFitBehavior.wdAutoFitContent;
                    Word.Table table = document.Tables.Add(range, teachers.Count + 1, 5,
                      ref defaultTableBehavior, ref autoFitBehavior);

                    Word.Range c1 = table.Cell(1, 1).Range;
                    c1.Font.Bold = 1;
                    c1.Text = "№";

                    Word.Range c2 = table.Cell(1, 2).Range;
                    c2.Font.Bold = 1;
                    c2.Text = "ФИО";

                    Word.Range c3 = table.Cell(1, 3).Range;
                    c3.Font.Bold = 1;
                    c3.Text = "Уч.степ.";

                    Word.Range c4 = table.Cell(1, 4).Range;
                    c4.Font.Bold = 1;
                    c4.Text = "Звание";

                    Word.Range c5 = table.Cell(1, 5).Range;
                    c5.Font.Bold = 1;
                    c5.Text = "Должность";

                    for (int i = 1; i <= teachers.Count; i++)
                    {
                        for (int j = 0; j < 5; j++)
                        {
                            Word.Range cell = table.Cell(i + 1, j + 1).Range;

                            if (j == 0)
                            {
                                cell.Text = i.ToString();
                            }

                            else if (j == 1)
                            {
                                cell.Text = teachers[i - 1].User.SecondName + " " + teachers[i - 1].User.FirstName + " " + teachers[i - 1].User.Patronymic;
                            }

                            else if (j == 2)
                            {
                                cell.Text = teachers[i - 1].Degree;
                            }

                            else if (j == 3)
                            {
                                cell.Text = teachers[i - 1].Rank;
                            }

                            else if (j == 4)
                            {
                                cell.Text = teachers[i - 1].Position;
                            }
                        }
                    }
                }

            }

            SaveWordDocument(@"C:\Users\orlov.leonid\Desktop\Новая папка\Список преподавателей.doc", document, program);

            return RedirectToAction("Index");
        }

        public ActionResult GetSpecialityDocument()
        {
            RepositoryManager         repositoryManager        = RepositoryManager.GetRepositoryManager;
            ISpecialityRepository     specialityRepository     = repositoryManager.GetSpecialityRepository;
            ISpecializationRepository specializationRepository = repositoryManager.GetSpecializationRepository;

            Word.Application program;
            Word.Document document = CreateWordDocument(out program);

            Object oMissing = System.Reflection.Missing.Value;

            Word.Paragraph p = document.Paragraphs.Add(ref oMissing);
            p.Range.Text = "Список специальностей";

            document.Paragraphs.Add();
            Word.Range r1 = document.Paragraphs[document.Paragraphs.Count].Range;
            r1.Text = "";

            document.Paragraphs.Add();
            Word.Range r2 = document.Paragraphs[document.Paragraphs.Count].Range;
            r2.Font.Bold = 1;
            r2.Font.Name = "Arial";
            r2.Font.Size = 16;
            r2.Text = "Специальности и направления";

            document.Paragraphs.Add();
            Word.Range r3 = document.Paragraphs[document.Paragraphs.Count].Range;
            r3.Font.Bold = 0;
            r3.Font.Name = "Times New Roman";
            r3.Font.Size = 12;
            r3.Text = "";

            IEnumerable<Speciality> _specialities = default(IEnumerable<Speciality>);
            List<Speciality> specialities;
            string name = default(string);

            for (int k = 0; k < 3; k++)
            {
                switch(k)
                {
                    case 0:
                        _specialities = specialityRepository.GetAllByEducationPlanTitle("Специалитет");
                        name = "Специалитет";
                        break;
                    case 1:
                        _specialities = specialityRepository.GetAllByEducationPlanTitle("Бакалавриат");
                        name = "Бакалавриат";
                        break;
                    case 2:
                        _specialities = specialityRepository.GetAllByEducationPlanTitle("Магистратура");
                        name = "Магистратура";
                        break;                
                }

                specialities = new List<Speciality>();

                foreach (Speciality s in _specialities)
                {
                    specialities.Add(s);
                }

                if (specialities.Count > 0)
                {
                    document.Paragraphs.Add();
                    Word.Range ran = document.Paragraphs[document.Paragraphs.Count].Range;
                    ran.Text = name;
                    
                    Word.Range range = document.Paragraphs.Add().Range;

                    Object defaultTableBehavior =
                             Word.WdDefaultTableBehavior.wdWord9TableBehavior;
                    Object autoFitBehavior =
                     Word.WdAutoFitBehavior.wdAutoFitContent;
                    Word.Table table = document.Tables.Add(range, specialities.Count + 1, 3,
                      ref defaultTableBehavior, ref autoFitBehavior);

                    Word.Range c1 = table.Cell(1, 1).Range;
                    c1.Font.Bold = 1;
                    c1.Text = "Код";

                    Word.Range c2 = table.Cell(1, 2).Range;
                    c2.Font.Bold = 1;
                    c2.Text = "Название";

                    Word.Range c3 = table.Cell(1, 3).Range;
                    c3.Font.Bold = 1;
                    c3.Text = "Сокращенное\n название";

                    for (int i = 1; i <= specialities.Count; i++)
                    {
                        for (int j = 0; j < 3; j++)
                        {
                            Word.Range cell = table.Cell(i + 1, j + 1).Range;
                            if (j == 0)
                            {
                                cell.Text = specialities[i - 1].Code;
                            }

                            else if (j == 1)
                            {
                                cell.Text = specialities[i - 1].Title;
                            }

                            else if (j == 2)
                            {
                                cell.Text = specialities[i - 1].Abbreviation;
                            }
                        }
                    }
                }
            }

            document.Paragraphs.Add();
            Word.Range r4 = document.Paragraphs[document.Paragraphs.Count].Range;
            r4.Text = "";

            document.Paragraphs.Add();
            Word.Range r5 = document.Paragraphs[document.Paragraphs.Count].Range;
            r5.Font.Bold = 1;
            r5.Font.Name = "Arial";
            r5.Font.Size = 16;
            r5.Text = "Специализации";

            document.Paragraphs.Add();
            Word.Range r6 = document.Paragraphs[document.Paragraphs.Count].Range;
            r6.Font.Bold = 0;
            r6.Font.Name = "Times New Roman";
            r6.Font.Size = 12;
            r6.Text = "";

            IEnumerable<Specialization> _specialization = default(IEnumerable<Specialization>);
            List<Specialization> specialization;

            for (int i = 0; i < 3; i++)
            {
                switch (i)
                {
                    case 0:
                        _specialities = specialityRepository.GetAllByEducationPlanTitle("Специалитет");
                        name = "Специалитет";
                        break;
                    case 1:
                        _specialities = specialityRepository.GetAllByEducationPlanTitle("Бакалавриат");
                        name = "Бакалавриат";
                        break;
                    case 2:
                        _specialities = specialityRepository.GetAllByEducationPlanTitle("Магистратура");
                        name = "Магистратура";
                        break;
                }

                foreach (Speciality s in _specialities)
                {
                    _specialization = specializationRepository.GetAllBySpecialityIdAndEducationPlanTitle(s.Id, name);

                    specialization = new List<Specialization>();

                    foreach (Specialization sp in _specialization)
                    {
                        specialization.Add(sp);
                    }

                    Word.Range ra;
                    if (specialization.Count > 0)
                    {
                        document.Paragraphs.Add();
                        ra  = document.Paragraphs[document.Paragraphs.Count].Range; 
                        ra.Text = name + " " + s.Abbreviation;

                        Word.Range range = document.Paragraphs.Add().Range;

                        Object defaultTableBehavior =
                                 Word.WdDefaultTableBehavior.wdWord9TableBehavior;
                        Object autoFitBehavior =
                         Word.WdAutoFitBehavior.wdAutoFitContent;
                        Word.Table table = document.Tables.Add(range, specialization.Count + 1, 4,
                          ref defaultTableBehavior, ref autoFitBehavior);

                        Word.Range c1 = table.Cell(1, 1).Range;
                        c1.Font.Bold = 1;
                        c1.Text = "Код";

                        Word.Range c2 = table.Cell(1, 2).Range;
                        c2.Font.Bold = 1;
                        c2.Text = "Название";

                        Word.Range c3 = table.Cell(1, 3).Range;
                        c3.Font.Bold = 1;
                        c3.Text = "Сокращенное\n название";

                        Word.Range c4 = table.Cell(1, 4).Range;
                        c4.Font.Bold = 1;
                        c4.Text = "Кафедры";

                        for (int g = 1; g <= specialization.Count; g++)
                        {
                            for (int j = 0; j < 4; j++)
                            {
                                Word.Range cell = table.Cell(g + 1, j + 1).Range;
                                if (j == 0)
                                {
                                    cell.Text = specialization[g - 1].Code;
                                }

                                else if (j == 1)
                                {
                                    cell.Text = specialization[g - 1].Title;
                                }

                                else if (j == 2)
                                {
                                    cell.Text = specialization[g - 1].Abbreviation;
                                }

                                else if (j == 3)
                                {
                                    cell.Text = specialization[g - 1].Chair.Abbreviation;
                                }
                            }
                        }
                    }
                }

            }

            SaveWordDocument(@"C:\Users\orlov.leonid\Desktop\Новая папка\Список специальностей.doc", document, program);

            return RedirectToAction("Index");
        }

        public ActionResult GetStudentDocument()
        {
            RepositoryManager repositorymanager = RepositoryManager.GetRepositoryManager;

            IStudentRepository studentRepository = repositorymanager.GetStudentRepository;

            Excel.Workbook book;
            Excel.Application program = CreateExcelDocument(out book);

            Excel.Sheets sheets = book.Worksheets;
            Excel.Worksheet sheet = (Excel.Worksheet)sheets.get_Item(1);

            IEnumerable<Student> students = studentRepository.GetAll();

            int i = 0, j = 0 , k = 0;
            Excel.Range cell;

            cell = sheet.get_Range("A1");
            cell.Font.Italic = 1;
            cell.Font.Bold = 1;
            cell.Value = "Группа";

            cell = sheet.get_Range("C1");
            cell.Font.Italic = 1;
            cell.Font.Bold = 1;
            cell.Value = "ФИО";

            cell = sheet.get_Range("E1");
            cell.Font.Italic = 1;
            cell.Font.Bold = 1;
            cell.Value = "Каф";

            foreach (Student s in students)
            {
                cell = sheet.get_Range("A" + i + 2);
                cell.Value = s.Group.Title + " " + s.Specialization.Abbreviation;

                cell = sheet.get_Range("C" + j + 2);
                cell.Value = s.User.SecondName + " " + s.User.FirstName + " " + s.User.Patronymic;

                cell = sheet.get_Range("E" + k + 2);
                cell.Value = s.Chair.Abbreviation;

                i++; j++; k++;
            }

            SaveExcelDocument(@"C:\Users\orlov.leonid\Desktop\Новая папка\Список студентов.xls", program, book);

            return RedirectToAction("Index");
        }

    }
}
