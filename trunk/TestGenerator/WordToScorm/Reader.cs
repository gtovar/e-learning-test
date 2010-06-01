using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using Common.Logging;
using System.Web;

using Microsoft.Office.Interop;
using Microsoft.Office.Interop.Word;
using Word = Microsoft.Office.Interop.Word;

namespace WordToScorm
{
    /// <summary>
    /// Перечесление, показывающее как будут обрабатываться баллы за ответы на вопросы
    /// </summary>
    public enum ProcessingQuestion
    {
        /// <summary>
        /// Разрешаются только положительные баллы
        /// </summary>
        withOnlyPositiveMark,
        /// <summary>
        /// Разрешаются и отрицательные баллы
        /// </summary>
        withNegativeMark
    }

    public class Reader
    {
        #region Private Fields

        /// <summary>
        /// Word - документ
        /// </summary>
        private Document wordDocument;

        /// <summary>
        /// Word - приложение
        /// </summary>
        private Word.Application wordApplication;

        /// <summary>
        /// Набор вопросов, прочитанных из документа
        /// </summary>
        private AllQuestions allQuestions = new AllQuestions();

        /// <summary>
        /// Набор параграфов документа word
        /// </summary>
        private Paragraphs wordParagraphs;

        /// <summary>
        /// Путь к word документу
        /// </summary>
        private string wordPath = string.Empty;

        /// <summary>
        /// Начальный номер картинки
        /// </summary>
        /// 
        private const int startIndexOfPicture = 0;
        /// <summary>
        /// Номер картинки для сохранения
        /// </summary>
        private int indexOfPicture = startIndexOfPicture;

        /// <summary>
        /// Путь к временной директории
        /// </summary>
        private string tempDir = "..\\Images";

        /// <summary>
        /// Способ обработки баллов за ответы на вопросы
        /// </summary>
        private ProcessingQuestion processQuestion;

        /// <summary>
        /// Тип списка, использующийся для выделения ответов на вопросы в word документе
        /// </summary>
        private WdListType answerListType = WdListType.wdListSimpleNumbering;

        /// <summary>
        /// Объект для логирования всех действий Reader'a
        /// </summary>
        private ILog log = Environment.GetLog;

        #endregion

        #region Constructors

        /// <summary>
        /// Конструктор
        /// </summary>
        /// <param name="WordDoc">путь к word документу</param>
        public Reader(string wordPath, ProcessingQuestion processQuestion)
        {
            this.wordPath = wordPath;
            this.processQuestion = processQuestion;
        }

        #endregion

        #region Work With Word Document

        #region Open Word Document

        /// <summary>
        /// Открыть word документ
        /// </summary>
        public void OpenWordDocument()
        {
            wordApplication = new Word.Application();
            wordApplication.Visible = false;

            Object filename = wordPath;
            Object confirmConversions = true;
            Object readOnly = false;
            Object addToRecentFiles = true;
            Object passwordDocument = Type.Missing;
            Object passwordTemplate = Type.Missing;
            Object revert = false;
            Object writePasswordDocument = Type.Missing;
            Object writePasswordTemplate = Type.Missing;
            Object format = Type.Missing;
            Object encoding = Type.Missing; ;
            Object oVisible = Type.Missing;
            Object openConflictDocument = Type.Missing;
            Object openAndRepair = Type.Missing;
            Object documentDirection = Type.Missing;
            Object noEncodingDialog = false;
            Object xmlTransform = Type.Missing;
            try
            {
                wordDocument = wordApplication.Documents.Open(ref filename,
               ref confirmConversions, ref readOnly, ref addToRecentFiles,
               ref passwordDocument, ref passwordTemplate, ref revert,
               ref writePasswordDocument, ref writePasswordTemplate,
               ref format, ref encoding, ref oVisible,
               ref openAndRepair, ref documentDirection, ref noEncodingDialog, ref xmlTransform);
            }
            catch (Exception ex)
            {
                log.Fatal("!!!!ОШИБКА во время открытия документа выброшено исключение !!!!", ex);
            }
            if (null == wordDocument)
            {
                log.Fatal("!!!!ОШИБКА документ не был открыт !!!!");
            }
            else
            {
                log.Trace("====================================================================================");
                log.Trace("=========================Начата обработка нового документа==========================");
                log.Trace(wordPath);
                log.Trace("====================================================================================");
            }
        }

        #endregion

        #region Close Word Document

        /// <summary>
        /// Закрытие документа word
        /// </summary>
        private void CloseWordDocument()
        {
            try
            {
                Object saveChanges = WdSaveOptions.wdPromptToSaveChanges;
                Object originalFormat = WdOriginalFormat.wdWordDocument;
                Object routeDocument = Type.Missing;
                ((Word._Application)wordApplication).Quit(ref saveChanges,
                                             ref originalFormat, ref routeDocument);
                log.Trace("====================================================================================");
                log.Trace(wordPath);
                log.Trace("========================Обработка документа завершена===============================");
                log.Trace("====================================================================================");
            }
            catch (Exception ex)
            {
                log.Error("!!!!ОШИБКА при закрытии документа выброшено сключение !!!!", ex);
            }
        }

        #endregion

        #region Gets and Sets

        /// <summary>
        /// Получить набор параграфов документа
        /// </summary>
        /// <returns>набор параграфов</returns>
        private Paragraphs GetParagraphs()
        {
            return wordDocument.Paragraphs;
        }

        /// <summary>
        /// Подсчитать общее число вопросов в документе
        /// </summary>
        /// <returns>общее число вопросов в документе</returns>
        private int GetQuestionsCount()
        {
            int count = 0;
            Paragraph paragraph;

            // итератор для обхода списка параграфов
            IEnumerator enumeratorParagraphs = wordParagraphs.GetEnumerator();
            enumeratorParagraphs.Reset();

            while (enumeratorParagraphs.MoveNext())
            {
                paragraph = (Paragraph)enumeratorParagraphs.Current;

                // каждый вопрос начинается с метки, что это за вопрос
                if (paragraph.Range.Text.ToString().IndexOf("Тип -") >= 0)
                {
                    count++;
                }
            }

            return count;
        }

        #endregion

        #region Word Document Navigation

        /// <summary>
        /// Перейти к следующему параграфу
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        /// <returns>Параграф, к которому был осуществен переход</returns>
        private Paragraph GoToNextParagraph(IEnumerator enumeratorParagraphs)
        {
            enumeratorParagraphs.MoveNext();
            Paragraph paragraph = (Paragraph)enumeratorParagraphs.Current;
            GoToNextParagraph();

            return paragraph;
        }


        /// <summary>
        /// Перевод курсора к следующему параграфу
        /// </summary>
        private void GoToNextParagraph()
        {
            Object unit = WdUnits.wdParagraph;
            Object count = 1;
            Object extend = WdMovementType.wdMove;
            wordApplication.Selection.MoveDown(ref unit, ref count,
            ref extend);
        }

        /// <summary>
        /// Переход к нумерованному списку с ответами
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        /// <returns>параграф - начало списка с ответами</returns>
        private Paragraph GoToList(IEnumerator enumeratorParagraphs)
        {
            enumeratorParagraphs.MoveNext();
            Paragraph paragraph = (Paragraph)enumeratorParagraphs.Current;

            while (paragraph.Range.ListFormat.ListType != answerListType)
            {
                enumeratorParagraphs.MoveNext();
                paragraph = (Paragraph)enumeratorParagraphs.Current;
            }

            return paragraph;
        }

        /// <summary>
        /// Перевод курсора к следующему слову
        /// </summary>
        private void GoToNextWord()
        {
            Object unit = WdUnits.wdWord;
            Object count = 1;
            Object extend = WdMovementType.wdMove;
            wordApplication.Selection.MoveRight(ref unit, ref count,
            ref extend);
        }

        /// <summary>
        /// Переход к ответу на простой вопрос
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        private Paragraph GoToAnswer(IEnumerator enumeratorParagraphs)
        {
            enumeratorParagraphs.MoveNext();
            Paragraph paragraph = (Paragraph)enumeratorParagraphs.Current;

            while (paragraph.Range.Text.IndexOf("#Ответ#") < 0)
            {
                enumeratorParagraphs.MoveNext();
                paragraph = (Paragraph)enumeratorParagraphs.Current;
            }

            return paragraph;
        }

        /// <summary>
        /// Распознавание маркера ответа на простой вопрос
        /// </summary>
        private void GoToAnswer()
        {
            if (wordApplication.Selection.Words.First.Text.IndexOf("#") >= 0)
            {
                GoToNextWord();
            }
            if (wordApplication.Selection.Words.First.Text.IndexOf("Ответ") >= 0)
            {
                GoToNextWord();
            }
            if (wordApplication.Selection.Words.First.Text.IndexOf("#") >= 0)
            {
                GoToNextWord();
            }
        }

        #endregion

        #region Work With Images

        /// <summary>
        /// Является ли просматриваемый объект картинкой
        /// </summary>
        /// <param name="range">просматриваемый объект в документе</param>
        /// <returns>истина - является картинкой, ложь - не является картинкой</returns>
        private bool IsImage(Range range)
        {
            return range.InlineShapes.Count == 0 ? false : true;
        }

        /// <summary>
        /// Получение рисунка
        /// </summary>
        /// <param name="enumeratorInlineShapes">итератор для списка рисунков</param>
        /// <returns>рисунок</returns>
        private Image GetImage()
        {
            Image image = null;
            string imageFileName = tempDir + "\\Image" + indexOfPicture.ToString() + ".jpg";
            try
            {
                image = Image.FromFile(imageFileName);
                indexOfPicture++;
            }
            catch (Exception ex)
            {
                log.Error("!!!!ОШИБКА Во время получения картинки c ИНДЕКСОМ=" + indexOfPicture.ToString()  + " (по пути " + imageFileName + ") из файловой системы выбрашено исключение !!!!", ex);
            }

            return image;
        }

        /// <summary>
        /// Сохранение всех картинок на жесткий диск
        /// </summary>
        public void SaveAllImages()
        {
            InlineShape inlineShape;
            int index = startIndexOfPicture;

            // итератор для обхода списка рисунков
            IEnumerator enumeratorInlineShapes = wordDocument.InlineShapes.GetEnumerator();
            enumeratorInlineShapes.Reset();

            // создание временной директории для хранения рисунков
            DirectoryInfo imageDir = new DirectoryInfo(tempDir);
            if (imageDir.Exists)
                imageDir.Delete(true);
            imageDir.Create();

            try
            {

                // сохранение рисунков
                while (enumeratorInlineShapes.MoveNext())
                {
                    inlineShape = (InlineShape)enumeratorInlineShapes.Current;
                    if (null != inlineShape)
                    {
                        Clipboard.Clear();
                        inlineShape.Range.CopyAsPicture();
                        Image image = Clipboard.GetImage();
                        if (null != image)
                        {
                            image.Save(tempDir + "\\Image" + index.ToString() + ".jpg");
                            index++;
                        }
                        else 
                        {
                            log.Error("!!!!ОШИБКА не распознана картика с порядковым ИНДЕКСОМ=" + index.ToString() + " !!!!");
                        }
                    }
                    else
                    {
                        log.Trace("!!!!ОШИБКА не распознана картика с порядковым ИНДЕКСОМ=" + index.ToString() + " !!!!");
                    }
                }

                Clipboard.Clear();
            }
            catch (Exception ex)
            {
                log.Trace("!!!!ОШИБКА во время копирования картинки с ИНДЕКСОМ=" + index.ToString() + " в файловую систему выпало исключение !!!!", ex);
            }

        }

        #endregion

        #region Work With Question

        /// <summary>
        /// Чтение текста вопроса
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        /// <param name="enumeratorInlineShapes">итератор для списка рисунков</param>
        /// <returns>текст вопроса</returns>
        private Question ReadQuestion(IEnumerator enumeratorParagraphs)
        {
            QuestionImages questionImages = new QuestionImages();
            int index = 0;
            string questionStr = string.Empty;

            // переход к следующему параграфу
            Paragraph paragraph = GoToNextParagraph(enumeratorParagraphs);

            // обработка тела вопроса
            while (wordApplication.Selection.Words.First.ListFormat.ListType != answerListType)
            {
                // обработка картинки
                if (IsImage(wordApplication.Selection.Words.First))
                {
                    questionImages.AddImage(GetImage());
                    questionStr += " #img:" + index.ToString() + "# ";
                    log.Trace("Текст вопроса содержит картинку с порядковым ИНДЕКСОМ=" + index.ToString());
                    index++;
                }
                // обработка текста вопроса    
                else
                {
                    string st = wordApplication.Selection.Words.First.Text;
                    if (!st.Equals("\r"))
                    {
                        questionStr += HttpUtility.HtmlEncode(st.Trim('\n', '\r'));
                    }
                    else
                    {
                        questionStr += "<br /> ";
                    }
                }

                // переход к следующему слову в тексте вопроса
                GoToNextWord();
            }
            log.Trace("РАСПОЗНАННЫЙ ТЕКСТ ВОПРОСА: " + questionStr);

            // создание вопроса
            Question question = new Question(questionStr, questionImages);

            return question;
        }

        /// <summary>
        /// Чтение текста простого вопроса
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        /// <returns>текст вопроса</returns>
        private Question ReadSimpleQuestion(IEnumerator enumeratorParagraphs)
        {
            QuestionImages questionImages = new QuestionImages();
            int index = 0;
            string questionStr = string.Empty;

            // переход к следующему параграфу
            Paragraph paragraph = GoToNextParagraph(enumeratorParagraphs);

            // обработка тела вопроса
            while (wordApplication.Selection.Words.First.Text.IndexOf("#") < 0)
            {
                // обработка картинки
                if (IsImage(wordApplication.Selection.Words.First))
                {
                    questionImages.AddImage(GetImage());
                    questionStr += " #img:" + index.ToString() + "# ";
                    log.Trace("Текст вопроса содержит картинку с порядковым ИНДЕКСОМ=" + index.ToString());
                    index++;
                }
                // обработка текста вопроса    
                else
                {
                    string st = wordApplication.Selection.Words.First.Text;
                    if (!st.Equals("\r"))
                    {
                        questionStr += HttpUtility.HtmlEncode(st.Trim('\n', '\r'));
                    }
                    else
                    {
                        questionStr += "<br /> ";
                    }
                }

                // переход к следующему слову в тексте вопроса
                GoToNextWord();
            }
            log.Trace("РАСПОЗНАННЫЙ ТЕКСТ ВОПРОСА: " + questionStr);
            // создание вопроса
            Question question = new Question(questionStr, questionImages);

            return question;
        }

        #endregion

        #region Work With Answer

        /// <summary>
        /// Получение оценки за ответ
        /// </summary>
        /// <param name="str">строка с ответом</param>
        /// <returns>оценка</returns>
        private int GetScore(string str)
        {
            log.Trace("    ОТВЕТ ИЗ ФАЙЛА: " + str);
            int score = 0;
            //положительное или отрицательное количество баллов
            bool sign = false;

            // поиск оценки в строке
            int firstIndex = str.LastIndexOf("(+");
            int lastIndex = str.LastIndexOf("бал");
            if (firstIndex < 0)
            {
                firstIndex = str.LastIndexOf("(-");
                sign = true;
            }
            if (firstIndex > 0 && lastIndex > 0)
            {
                try
                {
                    string scoreStr = str.Substring(firstIndex + 2, lastIndex - firstIndex - 2);
                    scoreStr.Trim('\n', '\r', ' ');
                    score = Convert.ToInt32(scoreStr);
                    if (sign) score = -score;
                    str = str.Substring(0, firstIndex);
                }
                catch(Exception ex)
                {
                    log.Error("!!!!ОШИБКА Неправильный формат балла в вопросе. \n" +
                                    "Проверьте правильность заполнения шаблона вопроса в документе !!!!", ex);
                }
            }
            log.Trace("    РАСПОЗНАННАЯ ОЦЕНКА: " + score.ToString() + " бал.");
            return score;
        }


        /// <summary>
        /// Чтение ответа вопроса
        /// </summary>
        /// <param name="paragraph">ответ, который нужно прочитать</param>
        /// <returns>прочитанный ответ</returns>
        private Answer ReadAnswer(Paragraph paragraph)
        {
            QuestionImages questionImages = new QuestionImages();
            int score = 0;
            int index = 0;
            string answerStr = string.Empty;

            // обработка оценки за ответ
            log.Trace("    ----------------------");
            score = GetScore(paragraph.Range.Text.ToString());

            // обработка текста ответа
            while (wordApplication.Selection.Words.First.Text.LastIndexOf("(+") < 0 &&
                wordApplication.Selection.Words.First.Text.LastIndexOf("(-") < 0 &&
                wordApplication.Selection.Words.First.ListFormat.ListType == answerListType &&
                !wordApplication.Selection.Words.First.Text.Equals("\r"))
            {
                // обработка картинки
                if (IsImage(wordApplication.Selection.Words.First))
                {
                    questionImages.AddImage(GetImage());
                    answerStr += " #img:" + index.ToString() + "# ";
                    log.Trace("    Текст ответа содержит картинку с порядковым ИНДЕКСОМ=" + index.ToString());
                    index++;
                }
                // обработка текста ответа    
                else
                {
                    string st = wordApplication.Selection.Words.First.Text;
                    if (!st.Equals("\r"))
                    {
                        answerStr += HttpUtility.HtmlEncode(st.Trim('\n', '\r'));
                    }
                    else
                    {
                        answerStr += "<br /> ";
                    }
                }

                // переход к следующему слову в тексте вопроса
                GoToNextWord();
            }
            log.Trace("    РАСПОЗНАННЫЙ ТЕКСТ ОТВЕТА: " + answerStr);
            log.Trace("    ----------------------");

            // если еще не достигли оценки за ответ, то переходим дальше
            if ((wordApplication.Selection.Words.First.Text.LastIndexOf("(+") < 0) &&
                (wordApplication.Selection.Words.First.Text.LastIndexOf("(-") < 0))
            {
                GoToNextWord();
            }

            // если достигли оценки за ответ, то переходим к следующей строке
            if (wordApplication.Selection.Words.First.Text.LastIndexOf("(+") >= 0)
            {
                GoToNextParagraph();
            }

            // если достигли оценки за ответ, то переходим к следующей строке
            if (wordApplication.Selection.Words.First.Text.LastIndexOf("(-") >= 0)
            {
                GoToNextParagraph();
            }

            // создаем ответ
            Answer answer = new Answer(answerStr, score, questionImages);

            return answer;
        }

        /// <summary>
        /// Чтение ответа на простой вопрос
        /// </summary>
        /// <param name="paragraph">ответ, который нужно прочитать</param>
        /// <returns>прочитанный ответ</returns>
        private Answer ReadSimpleAnswer(Paragraph paragraph)
        {
            QuestionImages questionImages = new QuestionImages();
            int score = 0;
            int index = 0;
            string answerStr = string.Empty;

            // обработка оценки за ответ
            log.Trace("    ----------------------");
            score = GetScore(paragraph.Range.Text.ToString());

            // переход к слову, следующему за словом "Ответ:"
            GoToAnswer();

            // обработка текста ответа
            while (wordApplication.Selection.Words.First.Text.LastIndexOf("(+") < 0 &&
                wordApplication.Selection.Words.First.Text.LastIndexOf("(-") < 0 &&
                !wordApplication.Selection.Words.First.Text.Equals("\r"))
            {
                // обработка картинки
                if (IsImage(wordApplication.Selection.Words.First))
                {
                    questionImages.AddImage(GetImage());
                    answerStr += " #img:" + index.ToString() + "# ";
                    log.Trace("    Текст ответа содержит картинку с порядковым ИНДЕКСОМ=" + index.ToString());
                    index++;
                }
                // обработка текста ответа    
                else
                {
                    string st = wordApplication.Selection.Words.First.Text;
                    if (!st.Equals("\r") && st.IndexOf("#") != 0)
                    {
                        answerStr += HttpUtility.HtmlEncode(st);
                    }
                    else
                    {
                        if (st.Equals("\r"))
                        {
                            answerStr += "<br /> ";
                        }
                    }
                }
                log.Trace("    РАСПОЗНАННЫЙ ТЕКСТ ОТВЕТА: " + answerStr);
                log.Trace("    ----------------------");
                // переход к следующему слову в тексте вопроса
                GoToNextWord();
            }

            // если еще не достигли оценки за ответ, то переходим дальше
            if ((wordApplication.Selection.Words.First.Text.LastIndexOf("(+") < 0) &&
                (wordApplication.Selection.Words.First.Text.LastIndexOf("(-") < 0))
            {
                GoToNextWord();
            }

            // если достигли оценки за ответ, то переходим к следующей строке
            if (wordApplication.Selection.Words.First.Text.LastIndexOf("(+") >= 0)
            {
                GoToNextParagraph();
            }

            // если достигли оценки за ответ, то переходим к следующей строке
            if (wordApplication.Selection.Words.First.Text.LastIndexOf("(-") >= 0)
            {
                GoToNextParagraph();
            }
            // создаем ответ
            Answer answer = new Answer(answerStr, score, questionImages);

            return answer;
        }

        /// <summary>
        /// Подсчет общего количества баллов для дистрибутивного вопроса
        /// </summary>
        /// <param name="answersList">список ответов</param>
        /// <returns>общее количество баллов</returns>
        private int CalculateDistributiveMark(List<Answer> answersList)
        {
            IEnumerator enumeratorAnswer = answersList.GetEnumerator();
            enumeratorAnswer.Reset();

            int mark = 0;
            while (enumeratorAnswer.MoveNext())
            {
                mark += ((Answer)enumeratorAnswer.Current).Score;
            }
            log.Trace("КОЛИЧЕСТВО БАЛЛОВ ЗА ВОПРОС: " + mark.ToString());
            return mark;
        }

        /// <summary>
        /// Подсчет максимального балла за альтернативный вопрос
        /// </summary>
        /// <param name="answersList">список ответов</param>
        /// <returns>максимальный балл</returns>
        private int CalculateAlternativeMark(List<Answer> answersList)
        {
            IEnumerator enumeratorAnswer = answersList.GetEnumerator();
            enumeratorAnswer.Reset();

            int mark = 0;
            int currentMark = 0;
            while (enumeratorAnswer.MoveNext())
            {
                currentMark = ((Answer)enumeratorAnswer.Current).Score;
                if (currentMark > mark)
                {
                    mark = currentMark;
                }
            }
            log.Trace("КОЛИЧЕСТВО БАЛЛОВ ЗА ВОПРОС " + mark.ToString());
            return mark;
        }

        /// <summary>
        /// Назначение баллов за альтернативный вопрос.
        /// Альтернативный вопрос оценивается: <+балл> за правильный, <-балл> - за каждый неправильный. 
        /// При этом <-балл> может быть устанавлен преподавателм явно при описании вопроса, 
        /// если нет, то устанавливается генераторм автоматически по правилу: одинаковый  -<+балл> 
        /// за каждый неправильный вариант.
        /// </summary>
        /// <param name="answersList">список ответов</param>
        /// <param name="mark">назначаемый балл</param>
        private void AssignAlternativeMark(List<Answer> answersList, int mark)
        {
            IEnumerator enumeratorAnswer = answersList.GetEnumerator();
            enumeratorAnswer.Reset();
            log.Trace("НАЗНАЧЕНИЕ БАЛЛОВ");
            int currentMark = 0;
            int counter = 1;
            while (enumeratorAnswer.MoveNext())
            {
                currentMark = ((Answer)enumeratorAnswer.Current).Score;
                // за не правильные ответы на альтернативный вопрос назначается 0 баллов
                /*
                if (currentMark == 0)
                {
                    ((Answer)enumeratorAnswer.Current).Score = -mark;
                }
                */
                log.Trace("За " + counter.ToString() + " ответ назначен: " + ((Answer)enumeratorAnswer.Current).Score.ToString());
                counter++;
            }
        }

        /// <summary>
        /// Назначение баллов за дистрибутивный вопрос.
        /// Дистрибутивный вопрос оценивается: <+ балл> за правильный вариант, <-балл> - за каждый неправильный.
        /// При этом <-балл> может быть устанавлен преподавателм явно при описании вопроса, 
        /// если нет, то устанавливается генераторм автоматически по правилу: 
        /// сумма баллов по всем вариантам равна нулю.
        /// </summary>
        /// <param name="answersList">список ответов</param>
        /// <param name="mark">суммарный назначаемый балл</param>
        private void AssignDistributiveMark(List<Answer> answersList, int mark)
        {
            IEnumerator enumeratorAnswer = answersList.GetEnumerator();
            enumeratorAnswer.Reset();
            log.Trace("НАЗНАЧЕНИЕ БАЛЛОВ");
            int currentMark = 0;
            int countAnswerWithoutMark = 0;
            // подсчет числа не оцененных вопросов
            while (enumeratorAnswer.MoveNext())
            {
                currentMark = ((Answer)enumeratorAnswer.Current).Score;
                if (currentMark == 0)
                {
                    countAnswerWithoutMark++;
                }
            }

            // суммарный балл
            int totalMark = mark;
            // балл для каждого не оцененного вопроса
            mark = mark / countAnswerWithoutMark;
            // если остаток от деления суммарного балла на количество не оцененных вопросов не 0, то
            // рассчитываем добавок к каждому варианту ответа
            int additionMark = totalMark - mark * countAnswerWithoutMark;
            // добавок
            int addition = 1;
            int counter = 1;
            enumeratorAnswer.Reset();
            while (enumeratorAnswer.MoveNext())
            {
                currentMark = ((Answer)enumeratorAnswer.Current).Score;
                if (currentMark == 0)
                {
                    // если добавок и балл положительные
                    if (additionMark > 0 && mark > 0)
                    {
                        // назначаем балл и добавок
                        ((Answer)enumeratorAnswer.Current).Score = -mark - addition;
                        // уменьшаем добавок
                        additionMark--;
                    }
                    else
                    {
                        // если добавок исчерпан, то просто назначаем балл
                        if (mark > 0)
                        {
                            ((Answer)enumeratorAnswer.Current).Score = -mark;
                        }
                    }
                }
                log.Trace("За " + counter.ToString() + " ответ назначен: " + ((Answer)enumeratorAnswer.Current).Score.ToString());
                counter++;
            }
        }

        /// <summary>
        /// Пересчет баллов за вопрос
        /// </summary>
        /// <param name="answersList">список ответов</param>
        /// <param name="questionType">тип вопроса</param>
        private void ReCalculateMark(List<Answer> answersList, QuestionType questionType)
        {
            int mark = 0;
            switch (questionType)
            {
                case QuestionType.Alternative:
                    {
                        // подсчет максимального балла за вопрос
                        mark = CalculateAlternativeMark(answersList);
                        // назначение баллов за неоцененные ответы
                        AssignAlternativeMark(answersList, mark);
                        break;
                    }
                case QuestionType.Distributive:
                    {
                        // подсчет суммарного балла за вопрос
                        mark = CalculateDistributiveMark(answersList);
                        // назначение баллов за неоцененные ответы
                        AssignDistributiveMark(answersList, mark);
                        break;
                    }
            }
        }

        /// <summary>
        /// Пересчет баллов за вопрос
        /// </summary>
        /// <param name="answersList">список ответов</param>
        private void ReCalculateMark(List<Answer> answersList)
        {
            IEnumerator enumeratorAnswer = answersList.GetEnumerator();
            enumeratorAnswer.Reset();
            log.Trace("ПЕРЕСЧЕТ БАЛЛОВ");
            int currentMark = 0;
            int counter = 1;
            while (enumeratorAnswer.MoveNext())
            {
                currentMark = ((Answer)enumeratorAnswer.Current).Score;
                if (currentMark < 0)
                {
                    ((Answer)enumeratorAnswer.Current).Score = 0;
                }
                log.Trace("За " + counter.ToString() + " ответ назначен: " + ((Answer)enumeratorAnswer.Current).Score.ToString());
                counter++;
            }
        }

        /// <summary>
        /// Чтение вопроса вместе с ответом
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        /// <param name="questionType">тип вопроса</param>
        /// <returns></returns>
        private TestQuestion ReadQuestionWithAnswer(IEnumerator enumeratorParagraphs, QuestionType questionType)
        {
            // чтение вопроса
            Question question = ReadQuestion(enumeratorParagraphs);

            // переход к списку ответов
            Paragraph paragraph = GoToList(enumeratorParagraphs);

            // обработка списка ответов
            List<Answer> answersList = new List<Answer>();
            while (paragraph != null && paragraph.Range.ListFormat.ListType == answerListType)
            {
                // чтение ответа вопроса и добавление его в список ответов
                answersList.Add(ReadAnswer(paragraph));

                // переход к следующему ответу
                enumeratorParagraphs.MoveNext();
                paragraph = (Paragraph)enumeratorParagraphs.Current;
            }

            // пересчет баллов за ответы на вопрос, если включена поддержка отрицательных баллов
            if (processQuestion == ProcessingQuestion.withNegativeMark)
            {
                if (questionType == QuestionType.Distributive)
                {
                    log.Trace("ПОДДЕРЖКА ОТРИЦ. БАЛЛОВ ВКЛЮЧЕНА, выполняем пересчет баллов");
                }
                ReCalculateMark(answersList, questionType);
            }

            // пересчет баллов за ответы на вопрос, если включена поддержка только положительных баллов
            if (processQuestion == ProcessingQuestion.withOnlyPositiveMark)
            {
                if (questionType == QuestionType.Distributive)
                {
                    log.Trace("ПОДДЕРЖИВАЮТСЯ ТОЛЬКО ПОЛОЖ. БАЛЛЫ, выполняем пересчет баллов");
                }
                ReCalculateMark(answersList);
            }

            // максимальное количество баллов за вопрос равно сумме баллов за ответы
            int questionMaxScore = 0;
            IEnumerator answerListEnumerator = answersList.GetEnumerator();
            answerListEnumerator.Reset();
            while (answerListEnumerator.MoveNext())
            {
                Answer answer = (Answer)answerListEnumerator.Current;
                questionMaxScore += answer.Score;
            }
            question.MaxScore = questionMaxScore;

            // создание тестового вопроса
            TestQuestion testQuestion = new TestQuestion(question, questionType, answersList);
            return testQuestion;
        }

        /// <summary>
        /// Чтение простого вопроса вместе с ответом
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        /// <param name="questionType">тип вопроса</param>
        /// <returns></returns>
        private TestQuestion ReadSimpleQuestionWithAnswer(IEnumerator enumeratorParagraphs, QuestionType questionType)
        {
            // чтение вопроса
            Question question = ReadSimpleQuestion(enumeratorParagraphs);

            Paragraph paragraph = GoToAnswer(enumeratorParagraphs);

            // обработка списка ответов
            List<Answer> answersList = new List<Answer>();
            // максимальное количество баллов за вопрос равно сумме баллов за ответы
            int questionMaxScore = 0;
            // признаком ответа на вопрос является слово "Ответ"
            while (paragraph != null && paragraph.Range.Text.IndexOf("#Ответ#") >= 0)
            {
                // чтение ответа вопроса и добавление его в список ответов
                if (!paragraph.Range.Text.Equals("\r"))
                {
                    Answer answer = ReadSimpleAnswer(paragraph);
                    questionMaxScore += answer.Score;
                    answersList.Add(answer);
                }

                // переход к следующему ответу
                enumeratorParagraphs.MoveNext();
                paragraph = (Paragraph)enumeratorParagraphs.Current;
            }
            question.MaxScore = questionMaxScore;

            // создание тестового вопроса
            TestQuestion testQuestion = new TestQuestion(question, questionType, answersList);
            return testQuestion;
        }

        #endregion

        #endregion

        #region Read Word Document

        /// <summary>
        /// Чтение word документа
        /// </summary>
        /// <param name="worker">дочерний поток, в котором будем выполнятся чтение</param>
        /// <returns>список прочитанных вопросов</returns>
        public AllQuestions ReadWordDocument(BackgroundWorker worker)
        {
            if (wordApplication == null)
            {
                // открытие документа word
                OpenWordDocument();
            }
            // получение списка параграфов документа
            wordParagraphs = GetParagraphs();

            // получение общего количества вопросов в документе
            int count = GetQuestionsCount();
            int questionNumber = 1;

            Paragraph paragraph;

            // итератор для обхода списка параграфов
            IEnumerator enumeratorParagraphs = wordParagraphs.GetEnumerator();
            enumeratorParagraphs.Reset();

            // объявление необходимых переменных
            AllQuestions allQuestions = new AllQuestions();
            QuestionType questionType = QuestionType.None;

            // сохраняем время начала обработки
            DateTime startTime = DateTime.Now;

            while (enumeratorParagraphs.MoveNext())
            {
                paragraph = (Paragraph)enumeratorParagraphs.Current;

                // обработка альтернативного вопроса
                if (paragraph.Range.Text.ToString().IndexOf("Тип - альтернативный вопрос") >= 0)
                {
                    log.Trace("                                 ");
                    log.Trace("Начало обработки АЛЬТЕРНАТИВНОГО ВОПРОСА");
                    log.Trace("Текущий НОМЕР ВОПРОСА: " + questionNumber.ToString());
                    // альтернативный вопрос
                    questionType = QuestionType.Alternative;

                    // создание тестового вопроса и добавление его в список всех вопросов
                    allQuestions.InsertQuestion(ReadQuestionWithAnswer(enumeratorParagraphs, questionType));

                    //Обновление progressBar
                    worker.ReportProgress((int)(((100f / count) * questionNumber)), DateTime.Now - startTime);
                    questionNumber++;
                }

                // обработка дистрибутивного вопроса
                if (paragraph.Range.Text.ToString().IndexOf("Тип - дистрибутивный вопрос") >= 0)
                {
                    log.Trace("                                 ");
                    log.Trace("Начало обработки ДИСТРИБУТИВНОГО ВОПРОСА");
                    log.Trace("Текущий НОМЕР ВОПРОСА: " + questionNumber.ToString());
                    // дистрибутивный вопрос
                    questionType = QuestionType.Distributive;

                    // создание тестового вопроса и добавление его в список всех вопросов
                    allQuestions.InsertQuestion(ReadQuestionWithAnswer(enumeratorParagraphs, questionType));

                    //Обновление progressBar
                    worker.ReportProgress((int)(((100f / count) * questionNumber)), DateTime.Now - startTime);
                    questionNumber++;
                }

                // обработка простого ответа
                if (paragraph.Range.Text.ToString().IndexOf("Тип - простой вопрос") >= 0)
                {
                    log.Trace("                                 ");
                    log.Trace("Начало обработки ПРОСТОГО ВОПРОСА");
                    log.Trace("Текущий НОМЕР ВОПРОСА: " + questionNumber.ToString());
                    // простой вопрос
                    questionType = QuestionType.YourAnswer;

                    // создание тестового вопроса и добавление его в список всех вопросов
                    allQuestions.InsertQuestion(ReadSimpleQuestionWithAnswer(enumeratorParagraphs, questionType));

                    //Обновление progressBar
                    worker.ReportProgress((int)(((100f / count) * questionNumber)), DateTime.Now - startTime);
                    questionNumber++;
                }
                // если встретилась пустая строка, то переходим к следующей
                if (paragraph != null)
                {
                    GoToNextParagraph();
                }
            }


            // закрытие документа word
            CloseWordDocument();

            // обнуление ссылок
            wordApplication = null;
            wordDocument = null;
            wordParagraphs = null;

            return allQuestions;
        }

        #endregion
    }
}
