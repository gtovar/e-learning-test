using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

using Microsoft.Office.Interop;
using Microsoft.Office.Interop.Word;

using Word = Microsoft.Office.Interop.Word;

namespace QWord
{
    public class QReader
    {
        /// <summary>
        /// Поле result: результат разбора документа
        /// </summary>
        public QResult result = new QResult();

        #region Private Fields

        /// <summary>
        /// Поле wordDocument: word-документ
        /// </summary>
        private Document wordDocument;

        /// <summary>
        /// Поле wordApplication: word-приложение
        /// </summary>
        private Word.Application wordApplication;

        /// <summary>
        /// Поле testQuestions: список тестовых вопросов (в документе)
        /// </summary>
        private TestQuestionList testQuestions;

        /// <summary>
        /// Поле wordParagraphs: набор параграфов word-документа
        /// </summary>
        private Paragraphs wordParagraphs;

        /// <summary>
        /// Поле wordPath: путь к word-документу
        /// </summary>
        private string wordPath;

        /// <summary>
        /// Поле pictureIndex: номер картинки для сохранения
        /// </summary>
        private int pictureIndex;

        /// <summary>
        /// Поле imageServerDir: путь к директории (на сервере) для хранения изображений
        /// </summary>
        private string imageServerDir;

        /// <summary>
        /// Поле imageServerAddr: путь к директории (на сервере) для хранения изображений
        /// </summary>
        private string imageServerAddr;

        /// <summary>
        /// Поле answerListType: тип списка, использующийся для выделения ответов на вопросы в word-документе
        /// </summary>
        private WdListType answerListType;

        #endregion

        #region Constructors

        /// <summary>
        /// Конструктор QReader
        /// </summary>
        /// <param name="wordPath">путь к word документу</param>
        /// <param name="processingType">способ обработки баллов за ответы на вопросы</param>
        /// <param name="imageServerDir">путь к директории (на сервере) для хранения изображений</param>
        /// <param name="imageServerAddr">путь к директории (на сервере) для хранения изображений</param>
        public QReader(string wordPath, string imageServerDir, string imageServerAddr)
        {
            this.wordPath        = wordPath;
            this.imageServerDir  = imageServerDir;
            this.imageServerAddr = imageServerAddr;

            testQuestions       = new TestQuestionList();
            pictureIndex        = 0;
            answerListType      = WdListType.wdListSimpleNumbering;
        }

        #endregion

        #region Private Methods

        /// <summary>
        /// Метод OpenWordDocument: открыть word-документ
        /// </summary>
        private void OpenWordDocument()
        {
            wordApplication         = new Word.Application();
            wordApplication.Visible = false;

            Object filename              = wordPath;
            Object confirmConversions    = true;
            Object readOnly              = true;
            Object addToRecentFiles      = false;
            Object passwordDocument      = Type.Missing;
            Object passwordTemplate      = Type.Missing;
            Object revert                = false;
            Object writePasswordDocument = Type.Missing;
            Object writePasswordTemplate = Type.Missing;
            Object format                = Type.Missing;
            Object encoding              = Type.Missing;
            Object visible               = Type.Missing;
            Object openConflictDocument  = Type.Missing;
            Object openAndRepair         = Type.Missing;
            Object documentDirection     = Type.Missing;
            Object noEncodingDialog      = false;
            Object xmlTransform          = Type.Missing;

            try
            {
                wordDocument = wordApplication.Documents.Open(
                                                              ref filename,
                                                              ref confirmConversions,
                                                              ref readOnly,
                                                              ref addToRecentFiles,
                                                              ref passwordDocument,
                                                              ref passwordTemplate,
                                                              ref revert,
                                                              ref writePasswordDocument,
                                                              ref writePasswordTemplate,
                                                              ref format,
                                                              ref encoding,
                                                              ref visible,
                                                              ref openAndRepair,
                                                              ref documentDirection,
                                                              ref noEncodingDialog,
                                                              ref xmlTransform
                                                             );
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при открытии документа", exc);
            }
        }

        /// <summary>
        /// Метод CloseWordDocument: закрыть word-документ
        /// </summary>
        private void CloseWordDocument()
        {
            Object saveChanges      = false;
            Object originalFormat   = Type.Missing;
            Object routeDocument    = Type.Missing;

            ((Word._Application)wordApplication).Quit(
                                                      ref saveChanges,
                                                      ref originalFormat, 
                                                      ref routeDocument
                                                     );
        }

        /// <summary>
        /// Метод GetParagraphs: получить набор параграфов документа
        /// </summary>
        /// <returns>набор параграфов</returns>
        private Paragraphs GetParagraphs()
        {
            return wordDocument.Paragraphs;
        }

        /// <summary>
        /// Метод GetQuestionsCount: подсчитать число тестовых вопросов в документе
        /// </summary>
        /// <returns>общее число вопросов в документе</returns>
        private int GetQuestionsCount()
        {
            // количество параграфов
            int count = 0;

            // текущий параграф
            Paragraph paragraph;

            // итератор для обхода списка параграфов
            IEnumerator enumeratorParagraphs = wordParagraphs.GetEnumerator();

            try
            {
                enumeratorParagraphs.Reset();

                while (enumeratorParagraphs.MoveNext())
                {
                    paragraph = (Paragraph)enumeratorParagraphs.Current;

                    // каждый вопрос начинается с метки "Тип - "
                    if (paragraph.Range.Text.IndexOf("Тип -") >= 0)
                    {
                        count++;
                    }
                }
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при подсчете числа вопросов", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }

            return count;
        }

        /// <summary>
        /// Метод GoToNextParagraph: переход к следующему параграфу
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        /// <returns>параграф, к которому был осуществен переход</returns>
        private Paragraph GoToNextParagraph(IEnumerator enumeratorParagraphs)
        {
            Paragraph paragraph = null;
            
            try
            {
                enumeratorParagraphs.MoveNext();

                paragraph = (Paragraph)enumeratorParagraphs.Current;

                GoToNextParagraph();
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при переходе к следующему параграфу", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }
            
            return paragraph;
        }
        
        /// <summary>
        /// Метод GoToNextParagraph: перевод курсора к следующему параграфу
        /// </summary>
        private void GoToNextParagraph()
        {
            Object unit   = WdUnits.wdParagraph;
            Object count  = 1;
            Object extend = WdMovementType.wdMove;

            wordApplication.Selection.MoveDown(ref unit, ref count, ref extend);
        }

        /// <summary>
        /// Метод GoToAnswerList: переход к нумерованному списку с ответами
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        /// <returns>параграф - начало списка с ответами</returns>
        private Paragraph GoToAnswerList(IEnumerator enumeratorParagraphs)
        {
            Paragraph paragraph = null;

            try
            {
                enumeratorParagraphs.MoveNext();
                paragraph = (Paragraph)enumeratorParagraphs.Current;

                while (paragraph.Range.ListFormat.ListType != answerListType)
                {
                    enumeratorParagraphs.MoveNext();
                    paragraph = (Paragraph)enumeratorParagraphs.Current;
                }
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при переходе к нумерованному списку с ответами", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }

            return paragraph;
        }

        /// <summary>
        /// Метод GoToNextWord: перевод курсора к следующему слову
        /// </summary>
        private void GoToNextWord()
        {
            Object unit   = WdUnits.wdWord;
            Object count  = 1;
            Object extend = WdMovementType.wdMove;

            wordApplication.Selection.MoveRight(ref unit, ref count, ref extend);
        }

        /// <summary>
        /// Метод GoToAnswerOnSimpleQuestion: переход к ответу на простой вопрос
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        private Paragraph GoToAnswerOnSimpleQuestion(IEnumerator enumeratorParagraphs)
        {
            Paragraph paragraph = null;

            try
            {
                enumeratorParagraphs.MoveNext();

                paragraph = (Paragraph)enumeratorParagraphs.Current;

                while (paragraph.Range.Text.IndexOf("#Ответ#") < 0)
                {
                    enumeratorParagraphs.MoveNext();

                    paragraph = (Paragraph)enumeratorParagraphs.Current;
                }
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при переходе к ответу на простой вопрос", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }

            return paragraph;
        }

        /// <summary>
        /// Метод GoToAnswerOnSimpleQuestion: распознавание маркера ответа на простой вопрос
        /// </summary>
        private void GoToAnswerOnSimpleQuestion()
        {
            try
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
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при распознавании маркера ответа на простой вопрос", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }
        }

        /// <summary>
        /// Метод IsImage: является ли просматриваемый объект картинкой
        /// </summary>
        /// <param name="range">просматриваемый объект в документе</param>
        /// <returns>истина - является картинкой, ложь - не является картинкой</returns>
        private bool IsImage(Range range)
        {
            return range.InlineShapes.Count == 0 ? false : true;
        }

        /// <summary>
        /// Метод ReadQuestion: чтение текста вопроса (альтернативного или дистрибутивного)
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        /// <returns>вопрос</returns>
        private Question ReadQuestion(IEnumerator enumeratorParagraphs)
        {
            string questionText = string.Empty;

            try
            {
                // переход к следующему параграфу
                Paragraph paragraph = GoToNextParagraph(enumeratorParagraphs);

                // обработка вопроса
                while (wordApplication.Selection.Words.First.ListFormat.ListType != answerListType)
                {
                    // обработка картинки
                    if (IsImage(wordApplication.Selection.Words.First))
                    {
                        questionText += " <img src=\"" +
                                        imageServerAddr +
                                        "/Image" +
                                        (pictureIndex).ToString() + ".jpg\" /> ";

                        pictureIndex++;
                    }
                    // обработка текста вопроса    
                    else
                    {
                        string text = wordApplication.Selection.Words.First.Text;

                        if (!text.Equals("\r"))
                        {
                            questionText += text.Trim('\n', '\r');
                        }
                        else
                        {
                            questionText += "<br /> ";
                        }
                    }

                    // переход к следующему слову в тексте вопроса
                    GoToNextWord();
                }
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при чтении альтернативного/дистрибутивного вопроса", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }
            
            // создание вопроса
            Question question = new Question(questionText);
            
            return question;
        }

        /// <summary>
        /// Метод ReadSimpleQuestion: чтение текста простого вопроса
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        /// <returns>текст вопроса</returns>
        private Question ReadSimpleQuestion(IEnumerator enumeratorParagraphs)
        {
            string questionText = string.Empty;

            try
            {
                // переход к следующему параграфу
                Paragraph paragraph = GoToNextParagraph(enumeratorParagraphs);

                // обработка вопроса
                while (wordApplication.Selection.Words.First.Text.IndexOf("#") < 0)
                {
                    // обработка картинки
                    if (IsImage(wordApplication.Selection.Words.First))
                    {
                        questionText += " <img src=\"" +
                                        imageServerAddr +
                                        "/Image" +
                                        (pictureIndex).ToString() + ".jpg\" /> ";

                        pictureIndex++;
                    }
                    // обработка текста вопроса    
                    else
                    {
                        string text = wordApplication.Selection.Words.First.Text;

                        if (!text.Equals("\r"))
                        {
                            questionText += text.Trim('\n', '\r');
                        }
                        else
                        {
                            questionText += "<br /> ";
                        }
                    }

                    // переход к следующему слову в тексте вопроса
                    GoToNextWord();
                }
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при чтении простого вопроса", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }

            // создание вопроса
            Question question = new Question(questionText);

            return question;
        }

        /// <summary>
        /// Метод GetScore: получение количества баллов за ответ
        /// </summary>
        /// <param name="str">строка с ответом</param>
        /// <returns>оценка</returns>
        private int GetScore(string str)
        {
            int score = 0;

            try
            {
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
                    string scoreStr = str.Substring(firstIndex + 2, lastIndex - firstIndex - 2);
                    scoreStr.Trim('\n', '\r', ' ');
                    score = Convert.ToInt32(scoreStr);

                    if (sign)
                    {
                        score = -score;
                    }

                    str = str.Substring(0, firstIndex);
                }
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при получении баллов за ответ", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }

            return score;
        }

        /// <summary>
        /// Метод ReadAnswer: чтение ответа вопроса (дистрибутивного или альтернативного)
        /// </summary>
        /// <param name="paragraph">ответ, который нужно прочитать</param>
        /// <returns>прочитанный ответ</returns>
        private QAnswer ReadAnswer(Paragraph paragraph)
        {
            int score              = 0;
            string answerText      = string.Empty;


            try
            {
                // обработка оценки за ответ
                score = GetScore(paragraph.Range.Text.ToString());

                // обработка ответа
                while (wordApplication.Selection.Words.First.Text.LastIndexOf("(+") < 0 &&
                       wordApplication.Selection.Words.First.Text.LastIndexOf("(-") < 0 &&
                       wordApplication.Selection.Words.First.ListFormat.ListType == answerListType &&
                       !wordApplication.Selection.Words.First.Text.Equals("\r"))
                {
                    // обработка картинки
                    if (IsImage(wordApplication.Selection.Words.First))
                    {
                        answerText += " <img src=\"" +
                                        imageServerAddr +
                                        "/Image" +
                                        (pictureIndex).ToString() + ".jpg\" /> ";

                        pictureIndex++;
                    }
                    // обработка текста ответа    
                    else
                    {
                        string text = wordApplication.Selection.Words.First.Text;

                        if (!text.Equals("\r"))
                        {
                            answerText += text.Trim('\n', '\r');
                        }
                        else
                        {
                            answerText += "<br /> ";
                        }
                    }

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
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при чтении ответа на альтернативный/дистрибутивный вопрос", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }

            // создаем ответ
            QAnswer answer = new QAnswer(answerText, score);

            return answer;
        }

        /// <summary>
        /// Метод ReadSimpleAnswer: чтение ответа на простой вопрос
        /// </summary>
        /// <param name="paragraph">ответ, который нужно прочитать</param>
        /// <returns>прочитанный ответ</returns>
        private QAnswer ReadSimpleAnswer(Paragraph paragraph)
        {
            int score              = 0;
            string answerText      = string.Empty;

            try
            {
                // обработка оценки за ответ
                score = GetScore(paragraph.Range.Text.ToString());

                // переход к ответу
                GoToAnswerOnSimpleQuestion();

                // обработка текста ответа
                while (wordApplication.Selection.Words.First.Text.LastIndexOf("(+") < 0 &&
                       wordApplication.Selection.Words.First.Text.LastIndexOf("(-") < 0 &&
                      !wordApplication.Selection.Words.First.Text.Equals("\r"))
                {
                    // обработка картинки
                    if (IsImage(wordApplication.Selection.Words.First))
                    {
                        answerText += " <img src=\"" +
                                        imageServerAddr +
                                        "/Image" +
                                        (pictureIndex).ToString() + ".jpg\" /> ";

                        pictureIndex++;
                    }
                    // обработка текста ответа    
                    else
                    {
                        string text = wordApplication.Selection.Words.First.Text;

                        if (!text.Equals("\r") && text.IndexOf("#") != 0)
                        {
                            answerText += text.Trim('\n', '\r');
                        }
                        else
                        {
                            answerText += "<br /> ";
                        }
                    }

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
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при чтении ответа на простой вопрос", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }
            // создаем ответ
            QAnswer answer = new QAnswer(answerText, score);

            return answer;
        }

        /// <summary>
        /// Метод ReadTestQuestion: чтение тестового вопроса (альтернативного или дистрибутивного) (вопрос + ответ)
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        /// <param name="questionType">тип вопроса</param>
        /// <returns></returns>
        private TestQuestion ReadTestQuestion(IEnumerator enumeratorParagraphs, QType questionType)
        {
            // чтение вопроса
            Question question = ReadQuestion(enumeratorParagraphs);

            // переход к списку ответов
            Paragraph paragraph = GoToAnswerList(enumeratorParagraphs);

            // обработка списка ответов
            List<QAnswer> answersList = new List<QAnswer>();

            try
            {
                while (paragraph != null && paragraph.Range.ListFormat.ListType == answerListType)
                {
                    // чтение ответа вопроса и добавление его в список ответов
                    answersList.Add(ReadAnswer(paragraph));

                    // переход к следующему ответу
                    enumeratorParagraphs.MoveNext();
                    paragraph = (Paragraph)enumeratorParagraphs.Current;
                }
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при чтении альтернативного/дистрибутивного тестового вопроса", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }

            // создание тестового вопроса
            TestQuestion testQuestion = new TestQuestion(question, questionType, answersList);

            return testQuestion;
        }

        /// <summary>
        /// Метод ReadSimpleTestQuestion: чтение простого тестового вопроса (вопрос + ответ)
        /// </summary>
        /// <param name="enumeratorParagraphs">итератор для списка параграфов</param>
        /// <param name="questionType">тип вопроса</param>
        /// <returns></returns>
        private TestQuestion ReadSimpleTestQuestion(IEnumerator enumeratorParagraphs, QType questionType)
        {
            // чтение вопроса
            Question question = ReadSimpleQuestion(enumeratorParagraphs);

            Paragraph paragraph = GoToAnswerOnSimpleQuestion(enumeratorParagraphs);

            // обработка списка ответов
            List<QAnswer> answersList = new List<QAnswer>();

            try
            {
                // признаком ответа на вопрос является слово "Ответ"
                while (paragraph != null && paragraph.Range.Text.IndexOf("#Ответ#") >= 0)
                {
                    // чтение ответа вопроса и добавление его в список ответов
                    if (!paragraph.Range.Text.Equals("\r"))
                    {
                        answersList.Add(ReadSimpleAnswer(paragraph));
                    }

                    // переход к следующему ответу
                    enumeratorParagraphs.MoveNext();
                    paragraph = (Paragraph)enumeratorParagraphs.Current;
                }
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при чтении простого тестового вопроса", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }

            // создание тестового вопроса
            TestQuestion testQuestion = new TestQuestion(question, questionType, answersList);
            
            return testQuestion;
        }
        
        #endregion

        #region Public Methods

        /// <summary>
        /// Метод SaveAllImages: сохранение всех картинок на жесткий диск (на сервере)
        /// </summary>
        public void SaveAllImages()
        {
            try
            {
                if (wordApplication == null)
                {
                    // открытие документа word
                    OpenWordDocument();
                }

                InlineShape inlineShape;

                // индекс картинки
                pictureIndex = GetStartImageIndex();

                int index = pictureIndex;

                // итератор для обхода списка рисунков
                IEnumerator enumeratorInlineShapes = wordDocument.InlineShapes.GetEnumerator();

                enumeratorInlineShapes.Reset();

                // создание директории для хранения рисунков
                DirectoryInfo imageDir = new DirectoryInfo(imageServerDir);

                if (!imageDir.Exists)
                {
                    imageDir.Create();
                }

                // сохранение рисунков
                while (enumeratorInlineShapes.MoveNext())
                {
                    // сохраняем изображение во временный файл
                    inlineShape = (InlineShape)enumeratorInlineShapes.Current;

                    byte[] imageBytes = (byte[])inlineShape.Range.EnhMetaFileBits;

                    FileStream imageFile = new FileStream(imageServerDir + "\\temp" + index.ToString() + ".jpg",
                                                          FileMode.Create,
                                                          FileAccess.Write);

                    imageFile.Write(imageBytes, 0, imageBytes.Length);

                    imageFile.Close();

                    // FIXME: ??? Картинки сохраняются в 75% масштабе, увеличиваем размер
                    inlineShape.ScaleWidth  = 400.0f / 3.0f;
                    inlineShape.ScaleHeight = 400.0f / 3.0f;

                    Bitmap bitmap = new Bitmap(Image.FromFile(imageServerDir + "\\temp" + index.ToString() + ".jpg"),
                                               (int)inlineShape.Width,
                                               (int)inlineShape.Height);

                    bitmap.Save(imageServerDir + "\\Image" + index.ToString() + ".jpg");

                    index++;
                }
                /*
                // закрытие документа word
                CloseWordDocument();

                // обнуление ссылок
                wordApplication = null;
                wordDocument    = null;
                wordParagraphs  = null;
                 * 
                 */
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при сохранении картинок на сервере", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }
        }

        /// <summary>
        /// Метод GetStartImageIndex: возвращает первый свободный номер для изображения
        /// </summary>
        /// <returns>номер изображения</returns>
        public int GetStartImageIndex()
        {
            int startIndex = 0;

            try
            {
                DirectoryInfo imageDir = new DirectoryInfo(imageServerDir);

                if (imageDir.Exists)
                {
                    FileInfo[] images = imageDir.GetFiles("Image*");

                    foreach (FileInfo image in images)
                    {
                        int imageNumber = Convert.ToInt32(image.Name.Substring(5,
                                                                               image.Name.LastIndexOf(image.Extension) - 5));


                        if (imageNumber > startIndex)
                        {
                            startIndex = imageNumber;
                        }
                    }

                    ++startIndex;
                }
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при получении стартового индекса изображений", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }

            return startIndex;
        }

        /// <summary>
        /// Метод ReadWordDocument: чтение word документа
        /// </summary>
        /// <returns>список прочитанных вопросов</returns>
        public TestQuestionList ReadWordDocument()
        {
            try
            {
                // Сохраняем картинки (SaveAllImages)

                if (wordApplication == null)
                {
                    // открытие документа word
                    OpenWordDocument();
                }

                InlineShape inlineShape;

                // индекс картинки
                pictureIndex = GetStartImageIndex();

                int index = pictureIndex;

                // итератор для обхода списка рисунков
                IEnumerator enumeratorInlineShapes = wordDocument.InlineShapes.GetEnumerator();

                enumeratorInlineShapes.Reset();

                // создание директории для хранения рисунков
                DirectoryInfo imageDir = new DirectoryInfo(imageServerDir);

                if (!imageDir.Exists)
                {
                    imageDir.Create();
                }

                // сохранение рисунков
                while (enumeratorInlineShapes.MoveNext())
                {
                    // сохраняем изображение во временный файл
                    inlineShape = (InlineShape)enumeratorInlineShapes.Current;

                    byte[] imageBytes = (byte[])inlineShape.Range.EnhMetaFileBits;

                    FileStream imageFile = new FileStream(imageServerDir + "\\temp" + index.ToString() + ".jpg",
                                                          FileMode.Create,
                                                          FileAccess.Write);

                    imageFile.Write(imageBytes, 0, imageBytes.Length);

                    imageFile.Close();

                    // FIXME: ??? Картинки сохраняются в 75% масштабе, увеличиваем размер
                    inlineShape.ScaleWidth = 400.0f / 3.0f;
                    inlineShape.ScaleHeight = 400.0f / 3.0f;

                    Bitmap bitmap = new Bitmap(Image.FromFile(imageServerDir + "\\temp" + index.ToString() + ".jpg"),
                                               (int)inlineShape.Width,
                                               (int)inlineShape.Height);

                    bitmap.Save(imageServerDir + "\\Image" + index.ToString() + ".jpg");

                    index++;
                }

                // Картинки сохранены (SaveAllImages)

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
                TestQuestionList testQuestionList = new TestQuestionList();
                QType questionType = QType.None;

                while (enumeratorParagraphs.MoveNext())
                {
                    paragraph = (Paragraph)enumeratorParagraphs.Current;

                    // обработка альтернативного вопроса
                    if (paragraph.Range.Text.ToString().IndexOf("Тип - альтернативный вопрос") >= 0)
                    {
                        // альтернативный вопрос
                        questionType = QType.Alternative;

                        // создание тестового вопроса и добавление его в список всех вопросов
                        testQuestionList.Add(ReadTestQuestion(enumeratorParagraphs, questionType));

                        questionNumber++;
                    }

                    // обработка дистрибутивного вопроса
                    if (paragraph.Range.Text.ToString().IndexOf("Тип - дистрибутивный вопрос") >= 0)
                    {
                        // дистрибутивный вопрос
                        questionType = QType.Distributive;

                        // создание тестового вопроса и добавление его в список всех вопросов
                        testQuestionList.Add(ReadTestQuestion(enumeratorParagraphs, questionType));

                        questionNumber++;
                    }

                    // обработка простого ответа
                    if (paragraph.Range.Text.ToString().IndexOf("Тип - простой вопрос") >= 0)
                    {
                        // простой вопрос
                        questionType = QType.Simple;

                        // создание тестового вопроса и добавление его в список всех вопросов
                        testQuestionList.Add(ReadSimpleTestQuestion(enumeratorParagraphs, questionType));

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
                wordDocument    = null;
                wordParagraphs  = null;

                return testQuestionList;
            }
            catch (Exception exc)
            {
                result = new QResult(QResultType.ERROR, "Ошибка при чтении документа", exc);

                if (wordApplication != null)
                {
                    CloseWordDocument();
                }
            }

            return null;
        }

        #endregion
    }
}