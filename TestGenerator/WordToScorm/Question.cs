using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using System.Drawing;
using System.Drawing.Imaging;

namespace WordToScorm
{
    #region Enums

    // типы вопросов
    public enum QuestionType
    {
        Alternative,        // альтернативный
        Distributive,       // дистрибутивный
        YourAnswer,         // свой ответ
        None                // неопределённый
    }

    #endregion

    #region Classes

    public class QuestionImages
    {

        #region Private Fields

        private List<Image> imglst = new List<Image>();

        #endregion

        #region Constructors

        public QuestionImages()
        {

        }

        #endregion

        #region Public Mehtods

        public void AddImage(Image image)
        {
            imglst.Add(image);
        }

        public void AddImages(List<Image> lst)
        {
            for (int i = 0; i < lst.Count; i++)

                imglst.Add(lst[i]);
        }

        public void SaveImage(int ImageIndex, string FileName)
        {
            if (null != imglst && null != imglst[ImageIndex])
            {
                imglst[ImageIndex].Save(FileName,
                    ImageFormat.Jpeg);
            }
        }

        public void SaveImages(string FileName)
        {
            for (int i = 0; i < imglst.Count; i++)
            {
                if (null != imglst && null != imglst[i])
                {
                    imglst[i].Save(FileName + i,
                    ImageFormat.Jpeg);
                }
            }
        }

        #endregion

        #region Properties

        public int Count
        {
            get
            {
                return imglst.Count;
            }
        }

        public List<Image> Images
        {
            get
            {
                return imglst;
            }
        }

        #endregion

    }

    // ответ
    public class Answer
    {
        #region Private Fields

        // текст ответа
        private string answerText = string.Empty;

        // картинки содержащиеся в ответе
        private QuestionImages answerImages = new QuestionImages();

        // количество очков за ответ
        private int score = 0;

        #endregion

        #region Constructors

        public Answer()
        {
        }

        public Answer(string text, int score, QuestionImages images)
        {
            this.answerText = text;
            this.score = score;
            this.answerImages.AddImages(images.Images);
        }

        #endregion

        #region Properties

        // возвращает или устанавливает текст ответа
        public string Text 
        { 
            get
            {
                return answerText;
            }
            set
            {
                answerText = value;
            }
        }

        // возвращает или устанавливает количество очков за ответ
        public int Score
        {
            get
            {
                return score;
            }
            set
            {
                score = value;
            }
        }

        // возвращает верный ли ответ
        public bool IsRight
        {
            get
            {
                return (score > 0);
            }
        }

        // возвращает нобор картинок содержащихся в ответе
        public QuestionImages Images
        {
            get
            {
                return answerImages;
            }
        }

        #endregion
    }

    // вопрос
    public class Question
    {
        #region Private Fields

        // текст вопроса
        private string questionText = string.Empty;

        // максимальное количество баллов за ответ
        private int questionMaxScore = 0;

        // картинки содержащиеся в вопросе
        private QuestionImages questionImages = new QuestionImages();

        #endregion

        #region Constructors

        public Question()
        {
        }

        public Question(string text, QuestionImages images)
        {
            this.questionText = text;
            this.questionImages.AddImages(images.Images);
        }

        #endregion

        #region Properties

        // возвращает или устанавливает текст вопроса
        public int MaxScore
        {
            get
            {
                return questionMaxScore;
            }
            set
            {
                questionMaxScore = value;
            }
        }

        // возвращает или устанавливает максимальное количество баллов за вопроса
        public string Text
        {
            get
            {
                return questionText;
            }
            set
            {
                questionText = value;
            }
        }

        // возвращает нобор картинок содержащихся в вопросе
        public QuestionImages QuestionImages
        {
            get
            {
                return questionImages;
            }
        }

        #endregion
    }

    // полный вопрос
    public class TestQuestion
    {
        #region Private Fields

        // сам вопрос
        private Question question;

        // варианты ответов
        private List<Answer> answers = new List<Answer>();

        // тип вопроса
        private QuestionType questionType = QuestionType.None;

        #endregion

        #region Constructors

        public TestQuestion()
        {
        }

        public TestQuestion(Question question, QuestionType Type, List<Answer> answers)
        {
            this.question = question;
            this.questionType = Type;
            for (int i = 0; i < answers.Count; i++)
                this.answers.Add(answers[i]);
        }

        #endregion

        #region Properties

        // возвращает количество ответов на вопрос
        public int AnswersCount
        {
            get
            {
                return answers.Count;
            }
        }

        // возвращает вопрос
        public Question Question
        {
            get
            {
                return question;
            }
        }

        // возвращает ответ по номеру index
        public Answer this[int index]
        {
            get
            {
                return answers[index];
            }
        }

        // возвращает список ответов
        public List<Answer> Answers
        {
            get
            {
                return answers;
            }
        }

        // возвращает или устанавливает тип вопроса
        public QuestionType Type
        {
            get
            {
                return questionType;
            }
            set
            {
                questionType = value;
            }
        }

        #endregion
    }

    // набор вопросов
    public class AllQuestions
    {
        #region Private Fields

        // список вопросов
        private List<TestQuestion> questions = new List<TestQuestion>();

        #endregion

        #region Constructors

        public AllQuestions()
        {
        }

        #endregion

        #region Public Methods

        // вставляет новый вопрос
        public void InsertQuestion(TestQuestion testQuestion)
        {
            questions.Add(testQuestion);
        }

        #endregion

        #region Properties

        // возвращает вопрос по номеру index
        public TestQuestion this[int index]
        {
            get
            {
                return questions[index];
            }
        }
        // возвращает количество вопросов
        public int Count
        {
            get
            {
                return questions.Count;
            }
        }

        #endregion
    }

    // набор вопросов представляющий тест
    public class Test
    {
        #region Private Fields

        // список вопросов
        private List<TestQuestion> questions = new List<TestQuestion>();
        // язык теста
        string language = string.Empty;
        // автор теста
        string author = string.Empty;
        // название предмета
        string title = string.Empty;
        // название варианта
        string unitname = string.Empty;
        // мак количество баллов
        int maxscore = 0;
        // отрицательные баллы
        bool negativemarks = false;

        #endregion

        #region Constructors

        public Test() { }

        #endregion

        #region Public Methods

        // вставляет новый вопрос
        public void InsertQuestion(TestQuestion testQuestion)
        {
            questions.Add(testQuestion);
        }

        #endregion

        #region Properties

        // возвращает вопрос с номером index
        public TestQuestion this[int index]
        {
            get { return questions[index]; }
        }

        // возвращает список вопросов
        public List<TestQuestion> Questions
        {
            get { return questions; }
        }

        // возвращает количество вопросов
        public int Count
        {
            get { return questions.Count; }
        }

        public string Language
        {
            get { return language; }
            set { language = value; }
        }
        public string Title
        {
            get { return title; }
            set { title = value; }
        }
        public string UnitName
        {
            get { return unitname; }
            set { unitname = value; }
        }

        public string Author
        {
            get { return author; }
            set { author = value; }
        }

        public int MaxScore
        {
            get { return maxscore; }
            set { maxscore = value; }
        }

        public bool NegativeMarks
        {
            get { return negativemarks; }
            set { negativemarks = value; }
        }

        #endregion

    }

    // набор тестов
    public class TestsSet
    {
        #region Private Fieds

        // список тестов
        private List<Test> tests = new List<Test>();

        #endregion

        #region Constructors

        public TestsSet()
        {
        }

        #endregion

        #region Public Methods

        // добавляет тест в список тестов
        public void InsertTest(Test test)
        {
            tests.Add(test);
        }

        #endregion

        #region Properties

        // возвращает количество тестов
        public int Count
        {
            get
            {
                return tests.Count;
            }
        }

        // возвращает тест с номером index
        public Test this[int index]
        {
            get 
            {
                return tests[index];
            }
        }

        #endregion
    }
    #endregion
}
