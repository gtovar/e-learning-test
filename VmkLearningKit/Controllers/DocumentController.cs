﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VmkLearningKit.Models.Repository;
using Word = Microsoft.Office.Interop.Word;
using Excel = Microsoft.Office.Interop.Excel;
using VmkLearningKit.Core;
using System.IO;

namespace VmkLearningKit.Controllers
{
    //[AuthorizeFilter(Roles = "Admin")]
    public class DocumentController : AbstractController
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

            Object Filename = path;                                      //Имя сохраняемого файла
            Object FileFormat = Excel.XlFileFormat.xlExcel7;               //Формат сохраняемого файла
            Object Password = Type.Missing;                              //Пароль доступа к файлу до 15 символов
            Object WriteResPassword = Type.Missing;                              //Пароль на доступ на запись
            Object ReadOnlyRecommended = Type.Missing;                              //При true режим только для чтения 
            Object CreateBackup = Type.Missing;                              //Создать резервную копию файла при true           
            Object ConflictResolution = Type.Missing;                              //Способ разрешения конфликтов
            Object AddToMru = Type.Missing;                              //При true сохраненный документ добавляется в список ранее открытых файлов                             
            Object TextCodePage = Type.Missing;                              //Кодовая страница
            Object TextVisualLayout = Type.Missing;                              //Направление размещения текста
            Object Local = Type.Missing;                              //Идентификатор ExcelApplication

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
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = "Генерация образовательных документов";
            return View();
        }

        public FileResult Save(string alias, string additional)
        {
            try
            {
                DateTime dt   = DateTime.Now; 
                DateTime dt_2 = dt.AddSeconds(3.0);

                while (DateTime.Now < dt_2) ;

                DirectoryInfo targetDir = new DirectoryInfo(HttpContext.Server.MapPath("/Downloads"));
                string docName          = targetDir + "\\" + alias;
                 
                return File(docName, additional.Replace("_", "/"), alias);
            }
            catch(Exception exc)
            {
                return null;
            }
        }

        public ActionResult GetChairDocument()
        {
            try
            {
                GeneralMenu();
                RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
                IChairRepository chairRepositiry = repositoryManager.GetChairRepository;

                IEnumerable<Chair> _chairs = chairRepositiry.GetAll("VMK");
                List<Chair> chairs = new List<Chair>();

                foreach (Chair c in _chairs)
                {
                    chairs.Add(c);
                }

                Word.Application program;
                Word.Document document = CreateWordDocument(out program);

                Object oMissing = System.Reflection.Missing.Value;

                Word.Paragraph p = document.Paragraphs.Add(ref oMissing);
                p.Range.Text = "Список кафедр";

                document.Paragraphs.Add(ref oMissing);
                Word.Range range = document.Paragraphs[document.Paragraphs.Count].Range;

                Object defaultTableBehavior =
                 Word.WdDefaultTableBehavior.wdWord9TableBehavior;
                Object autoFitBehavior =
                 Word.WdAutoFitBehavior.wdAutoFitContent;
                Word.Table table = document.Tables.Add(range, chairs.Count + 1, 2,
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

                DirectoryInfo   targetDir   = new DirectoryInfo(HttpContext.Server.MapPath("/Downloads"));
                long            docIndex    = targetDir.GetFiles("*.doc").Length;
                string          docName     = targetDir + "\\" + docIndex.ToString() + ".doc";
                
                SaveWordDocument(docName, document, program);

                return RedirectToAction("Save", new { alias = docIndex.ToString() + ".doc", additional = "application_msword" });
            }
            catch
            {
                return RedirectToAction("Error", "Home");
            }
        }

        public ActionResult GetTeacherDocument()
        {
            try
            {
                GeneralMenu();
                RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
                IChairRepository chairRepositiry = repositoryManager.GetChairRepository;
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

                DirectoryInfo targetDir = new DirectoryInfo(HttpContext.Server.MapPath("/Downloads"));
                long docIndex = targetDir.GetFiles("*.doc").Length;
                string docName = targetDir + "\\" + docIndex.ToString() + ".doc";

                SaveWordDocument(docName, document, program);

                return RedirectToAction("Save", new { alias = docIndex.ToString() + ".doc", additional = "application_msword" });
            }
            catch
            {
                return RedirectToAction("Error", "Home");
            }
        }

        public ActionResult GetSpecialityDocument()
        {
            try
            {
                GeneralMenu();
                RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
                ISpecialityRepository specialityRepository = repositoryManager.GetSpecialityRepository;
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
                    switch (k)
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

                        document.Paragraphs.Add();
                        Word.Range range = document.Paragraphs[document.Paragraphs.Count].Range;

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

                        if (specialization.Count > 0)
                        {
                            document.Paragraphs.Add();
                            Word.Range ra = document.Paragraphs[document.Paragraphs.Count].Range;
                            ra.Text = name + " " + s.Abbreviation;

                            document.Paragraphs.Add();
                            Word.Range range = document.Paragraphs[document.Paragraphs.Count].Range;

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

                DirectoryInfo targetDir = new DirectoryInfo(HttpContext.Server.MapPath("/Downloads"));
                long docIndex = targetDir.GetFiles("*.doc").Length;
                string docName = targetDir + "\\" + docIndex.ToString() + ".doc";

                SaveWordDocument(docName, document, program);

                return RedirectToAction("Save", new { alias = docIndex.ToString() + ".doc", additional = "application_msword" });
            }
            catch
            {
                return RedirectToAction("Error", "Home");
            }
        }

        public ActionResult GetStudentDocument()
        {
            try
            {
                GeneralMenu();
                RepositoryManager repositorymanager = RepositoryManager.GetRepositoryManager;

                IStudentRepository studentRepository = repositorymanager.GetStudentRepository;

                Excel.Workbook book;
                Excel.Application program = CreateExcelDocument(out book);

                Excel.Sheets sheets = book.Worksheets;
                Excel.Worksheet sheet = (Excel.Worksheet)sheets.get_Item(1);

                IEnumerable<Student> students = studentRepository.GetAll();

                int i = 0;
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
                    cell = sheet.get_Range("A" + (i + 2));
                    if (s.Specialization.Abbreviation.StartsWith(VLKConstants.FIELD_EMPTY))
                        cell.Value = s.Group.Title;
                    else
                        cell.Value = s.Group.Title + " " + s.Specialization.Abbreviation;

                    cell = sheet.get_Range("C" + (i + 2));
                    cell.Value = s.User.SecondName + " " + s.User.FirstName + " " + s.User.Patronymic;

                    cell = sheet.get_Range("E" + (i + 2));
                    if (!s.Chair.Abbreviation.StartsWith(VLKConstants.FIELD_EMPTY))
                        cell.Value = s.Chair.Abbreviation;

                    i++;
                }

                DirectoryInfo   targetDir   = new DirectoryInfo(HttpContext.Server.MapPath("/Downloads"));
                long            docIndex    = targetDir.GetFiles("*.xls").Length;
                string          docName     = targetDir + "\\" + docIndex.ToString() + ".xls";
                
                SaveExcelDocument(docName, program, book);

                return RedirectToAction("Save", new { alias = docIndex.ToString() + ".xls", additional = "application_msexcel" });
            }
            catch
            {
                return RedirectToAction("Error", "Home");
            }
        }

        public ActionResult GetDisciplineProgramDocument(long specialityDisciplineId)
        {
            try
            {
                GeneralMenu();
                RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
                ISpecialityDisciplineProgramRepository specialityDisciplineProgramRepository
                    = repositoryManager.GetSpecialityDisciplineProgramRepository;
                ISpecialityDisciplineTopicRepository specialityDisciplineTopicRepository
                    = repositoryManager.GetSpecialityDisciplineTopicRepository;

                SpecialityDisciplineProgram disciplineProgram = specialityDisciplineProgramRepository.GetById(specialityDisciplineId);

                Word.Application program;
                Word.Document document = CreateWordDocument(out program);

                document.Content.Font.Size = 14;

                Object oMissing = System.Reflection.Missing.Value;
                Word.Range range;
                Word.Range cell;
                bool flag;

                //Титульный лист
            
                Word.Paragraph par = document.Paragraphs.Add(oMissing);
                par.Range.Text = "ФЕДЕРАЛЬНОЕ АГЕНТСТВО ПО ОБРАЗОВАНИЮ";              
                par.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;                
                range.Text = "Государственное образовательное учреждение";
            
                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;               
                range.Text = "высшего профессионального образования";
                
                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "«Нижегородский государственный университет им. Н.И. Лобачевского»";

                document.Paragraphs.Add(oMissing);

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "Факультет ВМК";

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "Кафедра математического обеспечения ЭВМ";

                document.Paragraphs.Add(oMissing);
                document.Paragraphs.Add(oMissing);

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "УТВЕРЖДАЮ";
                document.Paragraphs[document.Paragraphs.Count].Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;


                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "Декан факультета ВМК";

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "__________________В.П.Гергель";

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "«       »_____________2007г.";

                document.Paragraphs.Add(oMissing);
                document.Paragraphs.Add(oMissing);

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "Учебная программа";
                range.Font.Bold = 1;
                document.Paragraphs[document.Paragraphs.Count].Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "дисциплины «" + disciplineProgram.SpecialityDiscipline.Title + "»";
                range.Font.Bold = 0;

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "по направлению подготовки  010400.68 «Информационные технологии»";

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "по магистерской программе «Инженерия программного обеспечения»";

                document.Paragraphs.Add(oMissing);
                document.Paragraphs.Add(oMissing);
                document.Paragraphs.Add(oMissing); 
                document.Paragraphs.Add(oMissing);

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "Нижний Новгород";

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "2007 г.";               

                // Область применения

                string applicationDomain = disciplineProgram.ApplicationDomain;
                applicationDomain = applicationDomain.Replace("\r\n", "");

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Underline = Word.WdUnderline.wdUnderlineSingle;
                range.Text = "1. Область применения";
                document.Paragraphs[document.Paragraphs.Count].Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;

                flag = true;
                while (flag)
                {
                    int index = applicationDomain.IndexOf("<p>");
                    int index1 = applicationDomain.IndexOf("</p>");
                    if (index < index1 && index + 3 < index1)
                    {
                        document.Paragraphs.Add();
                        range = document.Paragraphs[document.Paragraphs.Count].Range;
                        range.Underline = Word.WdUnderline.wdUnderlineNone;
                        //document.Paragraphs[document.Paragraphs.Count].Alignment = Word.WdParagraphAlignment.wdAlignParagraphJustify;
                        string s = applicationDomain.Substring(index + "<p>".Length, index1 - index - "</p>".Length + 1);
                        range.Text = s;
                        applicationDomain = applicationDomain.Remove(index,"<p>".Length + s.Length + "</p>".Length);
                    }
                    else if (index != -1)
                    {
                        //document.Paragraphs.Add();
                        applicationDomain = applicationDomain.Remove(index, "<p>".Length + "</p>".Length);
                    }
                    else flag = false;
                }

                // Цели и задачи курса

                string purposes = disciplineProgram.Purposes;
                purposes = purposes.Replace("\r\n", "");

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Underline = Word.WdUnderline.wdUnderlineSingle;
                range.Text = "2. Цели и задачи дисциплины";

                flag = true;
                while (flag)
                {
                    int index = purposes.IndexOf("<p>");
                    int index1 = purposes.IndexOf("</p>");
                    if (index < index1 && index + 3 < index1)
                    {
                        document.Paragraphs.Add();
                        range = document.Paragraphs[document.Paragraphs.Count].Range;
                        range.Underline = Word.WdUnderline.wdUnderlineNone;
                        //document.Paragraphs[document.Paragraphs.Count].Alignment = Word.WdParagraphAlignment.wdAlignParagraphJustify;
                        string s = purposes.Substring(index + "<p>".Length, index1 - index - "</p>".Length + 1);
                        range.Text = s;
                        purposes = purposes.Remove(index, "<p>".Length + s.Length + "</p>".Length);
                    }
                    else if (index != -1)
                    {
                        //document.Paragraphs.Add();
                        purposes = purposes.Remove(index, "<p>".Length + "</p>".Length);
                    }
                    else flag = false;
                }

                // Требования к уровню освоения содержания дисциплины

                string requirements = disciplineProgram.Requirements;
                requirements = requirements.Replace("\r\n","");

                document.Paragraphs.Add();

                Word.Paragraph p = document.Paragraphs.Add(oMissing);
                p.Range.Underline = Word.WdUnderline.wdUnderlineSingle;
                p.Range.Text = "3. Требования к уровню освоения содержания дисциплины";

                flag = true;
                while (flag)
                {
                    int index = requirements.IndexOf("<p>");
                    int index1 = requirements.IndexOf("</p>");
                    if (index < index1 && index + 3 < index1)
                    {
                        document.Paragraphs.Add();
                        range = document.Paragraphs[document.Paragraphs.Count].Range;
                        range.Underline = Word.WdUnderline.wdUnderlineNone;
                        string s = requirements.Substring(index + "<p>".Length, index1 - index - "</p>".Length + 1);
                        //document.Paragraphs[document.Paragraphs.Count].Alignment = Word.WdParagraphAlignment.wdAlignParagraphJustify;
                        range.Text = s;
                        requirements = requirements.Remove(index, "<p>".Length + s.Length + "</p>".Length);
                    }
                    else if (index != -1)
                    {
                        //document.Paragraphs.Add();
                        requirements = requirements.Remove(index, "<p>".Length + "</p>".Length);
                    }
                    else flag = false;
                }

                // Объем дисциплины и виды учебной работы

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Underline = Word.WdUnderline.wdUnderlineSingle;
                range.Text = "4. Объем дисциплины и виды учебной работы";

                List<string> cells = specialityDisciplineProgramRepository.GetTable(disciplineProgram.SpecialityDisciplineId, 1);

                document.Paragraphs.Add(ref oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Underline = Word.WdUnderline.wdUnderlineNone;

                Object defaultTableBehavior =
                 Word.WdDefaultTableBehavior.wdWord9TableBehavior;
                Object autoFitBehavior =
                 Word.WdAutoFitBehavior.wdAutoFitContent;
                Word.Table table = document.Tables.Add(range, cells.Count / 3 + 1, 3,
                  ref defaultTableBehavior, ref autoFitBehavior);

                cell = table.Cell(1, 1).Range;
                cell.Text = "Виды учебной работы";

                cell = table.Cell(1, 2).Range;
                cell.Text = "Всего часов";

                cell = table.Cell(1, 3).Range;
                cell.Text = "Семестры";

                int l = 0;
                for (int i = 1; i <= cells.Count / 3; i++)
                {
                    for (int j = 0; j < 3; j++)
                    {
                        cell = table.Cell(i + 1, j + 1).Range;
                        cell.Text = cells[l];
                        l++;
                    }
                }

                //document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 12;
                range.Font.Italic = 1;
                range.Text = "(в первой графе таблицы указываются виды аудиторных работ и самостоятельных занятий студентов. Во второй графе указывается общая трудоемкость дисциплины в часах в соответствии с ГОС ВПО, объем аудиторных и объем самостоятельных занятий - в соответствии с примерным учебным планом. В третьей графе указываются номера семестров, в которых предусматривается каждый вид учебной работы и вид итогового контроля по дисциплине)";

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "Выше обозначенная таблица составляется отдельно для каждой из форм обучения, предусмотренных учебным планом.";

                // Содержание дисциплины

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 14;
                range.Font.Italic = 0;
                range.Underline = Word.WdUnderline.wdUnderlineSingle;
                range.Text = "5. Содержание дисциплины";

                // Разделы дисциплины и виды занятий
                string razdels = disciplineProgram.Razdels;
                razdels = razdels.Replace("\r\n","");

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Underline = Word.WdUnderline.wdUnderlineNone;
                range.Text = "5.1. Разделы дисциплины и виды занятий";

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 12;
                range.Font.Italic = 1;
                range.Text = "(допускается название п.4.1. «Тематический план»)";

                cells = specialityDisciplineProgramRepository.GetTable(disciplineProgram.SpecialityDisciplineId, 2);

                document.Paragraphs.Add(ref oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 14;
                range.Font.Italic = 0;

                table = document.Tables.Add(range, cells.Count / 5 + 1, 5,
                  ref defaultTableBehavior, ref autoFitBehavior);

                cell = table.Cell(1, 1).Range;
                cell.Text = "№п/п";

                cell = table.Cell(1, 2).Range;
                cell.Text = "Раздел дисциплины";

                cell = table.Cell(1, 3).Range;
                cell.Text = "Лекции";

                cell = table.Cell(1, 4).Range;
                cell.Text = "ПЗ (или С)";

                cell = table.Cell(1, 5).Range;
                cell.Text = "ЛР";

                l = 0;
                for (int i = 1; i <= cells.Count / 5; i++)
                {
                    for (int j = 0; j < 5; j++)
                    {
                        cell = table.Cell(i + 1, j + 1).Range;
                        range = table.Cell(i + 1, j + 1).Range;
                        if (j == 1)
                        {                        
                            range.Font.Size = 10;
                            range.Font.Italic = 1;
                        }
                        else
                        {
                            range.Font.Size = 14;
                            range.Font.Italic = 0;
                        }
                        cell.Text = cells[l];
                        l++;
                    }
                }

                //document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 12;
                range.Font.Italic = 1;
                range.Text = "(в таблице название раздела указывается в соответствии с обязательным минимумом содержания, изложенным в ГОС ВПО. В графах, обозначающих предусматриваемые виды занятий проставляется знак *)";
                
            // Содержание разделов дисциплины

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Underline = Word.WdUnderline.wdUnderlineNone;
                range.Font.Size = 14;
                range.Font.Italic = 0;
                range.Text = "5.2. Содержание разделов дисциплины";

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 12;
                range.Font.Italic = 1;
                range.Text = "(указывается название каждого раздела и его содержание)";

                IEnumerable<SpecialityDisciplineTopic> topics = specialityDisciplineTopicRepository.GetAllBySpecialityDisciplineId(1);

                List<string> top1 = new List<string>();
                List<string> top2 = new List<string>();
                top1.Add("temp111111111");
                top2.Add("temp222222222");

                string t1 = "";
                string t2 = "";
                foreach (SpecialityDisciplineTopic t in topics)
                {
                    t1 = t.Title.Substring(0, t.Title.IndexOf(":::"));
                    t1 = t1.Replace("\r\n","");
                    top1.Add(t1);
                    t2 = t.Title.Substring(t.Title.IndexOf(":::") + 3);
                    t2 = t2.Replace("\r\n", "");
                    top2.Add(t2);
                }

                int topicsCount = 1;
                int topic2Count = 1;
                for (int i = 1; i < top1.Count; i++)
                {
                    if (top1[i] != top1[i - 1])
                    {
                        document.Paragraphs.Add();
                        range = document.Paragraphs[document.Paragraphs.Count].Range;
                        range.Font.Size = 12;
                        range.Font.Italic = 0;
                        range.Font.Bold = 1;
                        range.Text = topicsCount + ". " + top1[i];
                        topicsCount++;

                        document.Paragraphs.Add();
                        range = document.Paragraphs[document.Paragraphs.Count].Range;
                        range.Font.Bold = 0;
                        range.Text = "   " + (topicsCount - 1) + ". "+ "1. " + top2[i];

                        topic2Count = 2;
                    }
                    else
                    {
                        document.Paragraphs.Add();
                        range = document.Paragraphs[document.Paragraphs.Count].Range;
                        range.Font.Bold = 0;
                        range.Text = "   " + (topicsCount - 1) + ". " + topic2Count +". " + top2[i];
                        topic2Count++;
                    }
                }

                // Лабораторный практикум

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 14;
                range.Font.Italic = 0;
                range.Underline = Word.WdUnderline.wdUnderlineSingle;
                range.Text = "6. Лабораторный практикум";

                cells = specialityDisciplineProgramRepository.GetTable(disciplineProgram.SpecialityDisciplineId, 3);

                document.Paragraphs.Add(ref oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Underline = Word.WdUnderline.wdUnderlineNone;
                
                table = document.Tables.Add(range, cells.Count / 3 + 1, 3,
                  ref defaultTableBehavior, ref autoFitBehavior);

                cell = table.Cell(1, 1).Range;
                cell.Text = "№п/п";

                cell = table.Cell(1, 2).Range;
                cell.Text = "№ раздела дисциплины";

                cell = table.Cell(1, 3).Range;
                cell.Text = "Наименование лабораторных работ";

                l = 0;
                for (int i = 1; i <= cells.Count / 3; i++)
                {
                    for (int j = 0; j < 3; j++)
                    {
                        cell = table.Cell(i + 1, j + 1).Range;
                        cell.Text = cells[l];
                        l++;
                    }
                }

                //document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 12;
                range.Font.Italic = 1;
                range.Text = "(в случае, если лабораторный практикум не предусматривается в п.5 делается запись - «не предусмотрен»)";


                // Учебно-методическое обеспечение дисциплины

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 14;
                range.Font.Italic = 0;
                range.Underline = Word.WdUnderline.wdUnderlineSingle;
                range.Text = "7. Учебно-методическое обеспечение дисциплины";

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Underline = Word.WdUnderline.wdUnderlineNone;
                range.Text = "7.1 Рекомендуемая литература";

                List<string> first, second;

                first = specialityDisciplineProgramRepository.GetLiterature(disciplineProgram.SpecialityDisciplineId, out second);

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Text = "а) основная литература:";
                for (int i = 0; i < first.Count; i++)
                {
                    document.Paragraphs.Add();
                    range = document.Paragraphs[document.Paragraphs.Count].Range;
                    range.Font.Size = 12;
                    range.Text = (i+1) + ". " + first[i];
                }

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 14;
                range.Text = "б) дополнительная литература:";
                for (int i = 0; i < second.Count; i++)
                {
                    document.Paragraphs.Add();
                    range = document.Paragraphs[document.Paragraphs.Count].Range;
                    range.Font.Size = 12;
                    range.Text = (i + 1) + ". " + second[i];
                }

                // Вопросы для контроля

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 14;
                range.Underline = Word.WdUnderline.wdUnderlineSingle;
                range.Text = "8. Вопросы для контроля";

                List<string> ques = specialityDisciplineProgramRepository.GetQuestions(disciplineProgram.SpecialityDisciplineId);
               
                for (int i = 0; i < ques.Count; i++)
                {
                    document.Paragraphs.Add();
                    range = document.Paragraphs[document.Paragraphs.Count].Range;
                    range.Underline = Word.WdUnderline.wdUnderlineNone;
                    range.Font.Size = 12;
                    range.Text = (i + 1) + ". " + ques[i];
                }

                // Критерии оценок

                document.Paragraphs.Add();
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 14;
                range.Underline = Word.WdUnderline.wdUnderlineSingle;
                range.Text = "9. Критерии оценок";

                List<string> table1, table2;
                table1 = specialityDisciplineProgramRepository.GetTable2(disciplineProgram.SpecialityDisciplineId, out table2);

                document.Paragraphs.Add(ref oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 14;
                range.Underline = Word.WdUnderline.wdUnderlineNone;

                table = document.Tables.Add(range, table1.Count / 2, 2,
                  ref defaultTableBehavior, ref autoFitBehavior);

                l = 0;
                for (int i = 0; i < table1.Count / 2; i++)
                {
                    for (int j = 0; j < 2; j++)
                    {
                        cell = table.Cell(i + 1, j + 1).Range;
                        cell.Text = table1[l];
                        l++;
                    }
                }

                //document.Paragraphs.Add(ref oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 12;
                range.Text = "Примечание – таблица заполняется, если формой итогового контроля предусмотрен зачет";

                document.Paragraphs.Add(ref oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 14;

                table = document.Tables.Add(range, table2.Count / 2, 2,
                  ref defaultTableBehavior, ref autoFitBehavior);

                l = 0;
                for (int i = 0; i < table2.Count / 2; i++)
                {
                    for (int j = 0; j < 2; j++)
                    {
                        cell = table.Cell(i + 1, j + 1).Range;
                        cell.Text = table2[l];
                        l++;
                    }
                }

                //document.Paragraphs.Add(ref oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 12;
                range.Text = "Примечание – таблица заполняется, если  формой итогового контроля предусмотрен экзамен";

                // Примерная тематика курсовых работ и критерии их оценки

                string reporting = disciplineProgram.Reporting;
                reporting = reporting.Replace("\r\n", "");

                document.Paragraphs.Add(oMissing);
                range = document.Paragraphs[document.Paragraphs.Count].Range;
                range.Font.Size = 14;
                range.Font.Underline = Word.WdUnderline.wdUnderlineSingle;
                range.Text = "9. Примерная тематика курсовых работ и критерии их оценки";
                document.Paragraphs[document.Paragraphs.Count].Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;

                flag = true;
                while (flag)
                {
                    int index = reporting.IndexOf("<p>");
                    int index1 = reporting.IndexOf("</p>");
                    if (index < index1 && index + 3 < index1)
                    {
                        document.Paragraphs.Add();
                        range = document.Paragraphs[document.Paragraphs.Count].Range;
                        range.Underline = Word.WdUnderline.wdUnderlineNone;
                        //document.Paragraphs[document.Paragraphs.Count].Alignment = Word.WdParagraphAlignment.wdAlignParagraphJustify;
                        string s = reporting.Substring(index + "<p>".Length, index1 - index - "</p>".Length + 1);
                        range.Text = s;
                        reporting = reporting.Remove(index, "<p>".Length + s.Length + "</p>".Length);
                    }
                    else if (index != -1)
                    {
                        //document.Paragraphs.Add();
                        reporting = reporting.Remove(index, "<p>".Length + "</p>".Length);
                    }
                    else flag = false;
                }

                // Дополнительно

                string additional = disciplineProgram.Additional;
                additional = additional.Replace("\r\n", "");
                additional = additional.Replace("\r", "");

                document.Paragraphs.Add();

                flag = true;
                while (flag)
                {
                    int index = additional.IndexOf("<p>");
                    int index1 = additional.IndexOf("</p>");
                    if (index < index1 && index + 3 < index1)
                    {
                        document.Paragraphs.Add();
                        range = document.Paragraphs[document.Paragraphs.Count].Range;
                        range.Underline = Word.WdUnderline.wdUnderlineNone;
                        string s = additional.Substring(index + "<p>".Length, index1 - index - "</p>".Length + 1);
                        //document.Paragraphs[document.Paragraphs.Count].Alignment = Word.WdParagraphAlignment.wdAlignParagraphJustify;
                        range.Text = s;
                        additional = additional.Remove(index, "<p>".Length + s.Length + "</p>".Length);
                    }
                    else if (index != -1)
                    {
                        //document.Paragraphs.Add();
                        additional = additional.Remove(index, "<p>".Length + "</p>".Length);
                    }
                    else flag = false;
                }

            //-----------------------------------------------    
                DirectoryInfo targetDir = new DirectoryInfo(HttpContext.Server.MapPath("/Downloads"));
                long docIndex = targetDir.GetFiles("*.doc").Length;
                string docName = targetDir + "\\" + docIndex.ToString() + ".doc";

                SaveWordDocument(docName, document, program);

                return RedirectToAction("Save", new { alias = docIndex.ToString() + ".doc", additional = "application_msword" });
            }
            catch
            {
                return RedirectToAction("Error", "Home");
            }
        }
    }
}