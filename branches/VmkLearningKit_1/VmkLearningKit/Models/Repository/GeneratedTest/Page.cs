using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Collections;

namespace VmkLearningKit.Models.Repository
{
    public class VariantView
    {
        private GeneratedTestVariant variant;
        private string fileName;
        private string filePath;
        private int number;
        private FileStream fs;
        private StreamWriter sw;

        public VariantView(string name, string path, GeneratedTestVariant gtv, int num)
        {
            fileName = name;
            filePath = path;
            variant = gtv;
            number = num;
            fs = new FileStream(filePath + "\\" + fileName, FileMode.Create);
            sw = new StreamWriter(fs);
        }        

        public void generateHtmlView()
        {
            PageView pw = new PageView();
            pw.generateHeader(number,sw);

            RepositoryManager repositoryManager =
                RepositoryManager.GetRepositoryManager;
            IGeneratedQuestionRepository generatedQuestionRepository =
                repositoryManager.GetGeneratedQuestionRepository;
            IQuestionRepository questionRepository =
                repositoryManager.GetQuestionRepository;

            IEnumerable<GeneratedQuestion> generatedQuestion =
                generatedQuestionRepository.GetAllGeneratedQuestionsByGeneratedTestVariantId(variant.Id);

            int questionNumber = 1;

            Question question;

            foreach (GeneratedQuestion gq in generatedQuestion)
            {
                question = questionRepository.GetById(gq.QuestionId);
                QuestionView questionView = new QuestionView(question);

                questionView.generateHtmlView(questionNumber, sw);
                questionNumber++;
            }

            pw.generateFooter(sw);

            sw.Close();
            fs.Close();
        }
    }

    public class PageView
    {
        public void generateHeader(int variantNumber, StreamWriter sw)
        {
            string pageName = "Тестовый вариант №" + variantNumber;

            sw.WriteLine("<html>");
            sw.WriteLine("<head>");
            sw.WriteLine("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
            sw.WriteLine("<link rel=\"stylesheet\" type=\"text/css\" href=\"../Shared/themes.css\">");
            sw.WriteLine("</head>");
            sw.WriteLine("<body contenteditable=\"false\">");

            sw.WriteLine("<table class=\"bodytable\" height=\"100%\" width=\"85%\" align=\"center\">");
            sw.WriteLine("<tr>");
            sw.WriteLine("<td class=\"banner\"><span lrece=\"true\">" + pageName + "</span></td>");
            sw.WriteLine("</tr>");
            sw.WriteLine("<tr>");
            sw.WriteLine("<td class=\"bodycell\" valign=\"top\" height=\"100%\">");
            sw.WriteLine("<span id=\"questionsTable\" lrece=\"true\">");
        }

        public void generateFooter(StreamWriter sw)
        {
            sw.WriteLine("</table>");
            sw.WriteLine("</span></td>");
            sw.WriteLine("</tr>");
            sw.WriteLine("</table>");
            sw.WriteLine("</body>");
            sw.WriteLine("</html>");
        }

    }

    public class QuestionView
    {
        private string text;
        private int type;
        private double maxScore = 0;
        private IEnumerable<Answer> answers;

        public QuestionView(Question question)
        {
            text = question.Text;
            type = question.Type;

            RepositoryManager   repositoryManager  = RepositoryManager.GetRepositoryManager;
            IAnswerRepository   answerRepository   = repositoryManager.GetAnswerRepository;
            IQuestionRepository questionRepository = repositoryManager.GetQuestionRepository;

            answers = answerRepository.GetAllAnswersByQuestionId(question.Id);

            maxScore = questionRepository.GetMaxScoreQuestionByQuestionId(question.Id);       
        }

        public void generateHtmlView(int questionNumber, StreamWriter sw)
        {
            sw.WriteLine("<table class=\"QTable\" width=\"95%\" lreq2=\"3\">");

            sw.WriteLine("<tr style=\"VERTICAL-ALIGN: baseline\">");
            sw.WriteLine("<td class=\"QNum\"><nobr>" + questionNumber + ".</nobr></td>");
            sw.WriteLine("<td class=\"QText\" style=\"WIDTH: 100%\" colspan=\"3\">" + text + "</td>");
            sw.WriteLine("<td class=\"QPts\" style=\"TEXT-ALIGN: right\">");
            sw.WriteLine("<img src=\"http://localhost:5061/mslamrk,id=" + questionNumber + ",type=5,maxpts=" + maxScore + "\"></td>");
            sw.WriteLine("</tr>");

            foreach (Answer a in answers)
            {
                sw.WriteLine("<tr>");
                sw.WriteLine("<td></td>");

                switch (type)
                {
                    case 0:
                        {
                            sw.WriteLine("<td><img src=\"http://localhost:5061/mslamrk,cols=20,id=" + questionNumber + ",type=1,akey=" + a.Text + ",maxpts=" + a.Score + "\"></td>");
                            break;
                        }
                    case 1:
                        {
                            sw.WriteLine("<td><img src=\"http://localhost:5061/mslamrk,id=" + questionNumber + ",type=3,maxpts=" + a.Score + "\"></td>");
                            sw.WriteLine("<td class=\"ANum\"><nobr></nobr></td>");
                            sw.WriteLine("<td style=\"WIDTH: 100%\">" + a.Text + "</td>");

                            break;
                        }
                    case 2:
                        {
                            sw.WriteLine("<td><img src=\"http://localhost:5061/mslamrk,id=" + questionNumber + ",type=4,maxpts=" + a.Score + "\"></td>");
                            sw.WriteLine("<td class=\"ANum\"><nobr></nobr></td>");
                            sw.WriteLine("<td style=\"WIDTH: 100%\">" + a.Text + "</td>");
                            break;
                        }

                    case 3:
                        {
                            sw.WriteLine("<td><img src=\"http://localhost:5061/mslamrk,cols=20,id=" + questionNumber + ",type=1,akey=" + text + ",maxpts=" + a.Score + "\"></td>");
                            break;
                        }
                }
                sw.WriteLine("<td></td>");
                sw.WriteLine("</tr>");
            }

            sw.WriteLine("</table>");
        }
    }
}
