using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace VmkLearningKit.Models.Repository
{
    public class Builder
    {
        private GeneratedTestVariant gtv;
        private string FileName = "";
        private string FilePath = "";
        private int number;
        FileStream fs;
        StreamWriter sw;

        public Builder(string Name, string Path, GeneratedTestVariant variant, int num)
        {
            FileName = Name;
            FilePath = Path;
            gtv = variant;
            number = num;
        }

        private string BuilderImages(string text)
        {
            if (text.IndexOf("<img src=\"") != -1)
            {
                int k = text.IndexOf("<img src=\"");
                int start = k + 10;
                int finish = 0;
                for (int i = start; i < text.Length; i++)
                {
                    if (Convert.ToString(text[i]) == "\"") finish = i - 1;
                }

                char[] c = new char[finish - start + 1];
                int t = 0;
                for (int i = start; i < finish + 1; i++)
                {
                    c[t] = text[i];
                    t++;
                }

                string path = new string(c);

                int s = path.LastIndexOf("/") + 1;

                char[] g = new char[path.Length - s + 1];

                int r = 0;

                for (int i = s; i < path.Length; i++)
                {
                    g[r] = path[i];
                    r++;
                }

                string name = new string(g);

                DirectoryInfo d = new DirectoryInfo(path);
                //d.MoveTo();
            }

            return text;
        }

        private void WriteHtmlHeader()
        {
            //sw.WriteLine("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
            sw.WriteLine("<html>");/*xmlns=\"http://www.w3.org/1999/xhtml\">*/
            sw.WriteLine("<head>");
            sw.WriteLine("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
            sw.WriteLine("<title>Test</title>");
            sw.WriteLine("</head>");
            sw.WriteLine("<body>");
            sw.WriteLine("<p><label>");
            sw.WriteLine("<div align=\"center\"><b>Тестовый вариант №" + (number-1) + "</b></div>");
            sw.WriteLine("</label>");
            sw.WriteLine("<div align=\"center\">&nbsp;</div>");
            sw.WriteLine("</p>");
        }

        void WriteQuestion(string text, int n)
        {
            sw.WriteLine("<p>");
            sw.WriteLine("<label>" + n + ". " + text + "<br />");
            //sw.WriteLine("<br />");
        }

        void WritePostQuestion()
        {
        sw.WriteLine("</label>");
        sw.WriteLine("</p>");
        }


        void WriteAnswer(int type, string text, int l, int index)
        {
            text = BuilderImages(text);

            switch (type)
            {
                case 0:
                    {
                        sw.WriteLine("<input type=\"text\" name=\"answer" + index + "\" id=\"answer" + index + "\" />");
                        break;
                    }
                case 1:
                    {
                        sw.WriteLine("<label>");
                        sw.WriteLine("<input type=\"radio\" name=\"RadioGroup" + index + "\" value=\"radio" + l + "\" id=\"RadioGroup1_" + l + "\" />");
                        sw.WriteLine(text + "</label>");
                        sw.WriteLine("<br />");
                        break;
                    }
                case 2:
                    {
                        sw.WriteLine("<label>");
                        sw.WriteLine("<input type=\"checkbox\" name=\"CheckboxGroup"+ index + "\" value=\"checkbox" + l + "\" id=\"CheckboxGroup1_" + l + "\" />");
                        sw.WriteLine(text + "</label>");
                        sw.WriteLine("<br />");
                        break;
                    }
            }
        }

        void WriteHtmlFooter()
        {
            sw.WriteLine("</body>");
            sw.WriteLine("</html>");
        }



        public void WritePage()
        {
            fs = new FileStream(FilePath + "\\" + FileName, FileMode.Create);
            sw = new StreamWriter(fs);

            WriteHtmlHeader();

            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
            IGeneratedQuestionRepository generatedQuestionRepository = repositoryManager.GetGeneratedQuestionRepository;
            IQuestionRepository questionRepository = repositoryManager.GetQuestionRepository;

            IEnumerable<GeneratedQuestion> generatedQuestion = generatedQuestionRepository.GetAllGeneratedQuestionsByGeneratedTestVariantId(gtv.Id);

            int index = 1;
            foreach (GeneratedQuestion gq in generatedQuestion)
            {
                string text = BuilderImages(gq.Question.Text);

                WriteQuestion(text, index);

                int count = questionRepository.GetAnswersCountByQuestionId(gq.QuestionId);
                IEnumerable<Answer> answers = questionRepository.GetAllAnswersByQuestionId(gq.QuestionId);

                int l = 0;

                foreach (Answer an in answers)
                {
                    WriteAnswer(gq.Question.Type, an.Text, l, index);
                    l++;
                }

                WritePostQuestion();
                index++;
            }

            WriteHtmlFooter();
            sw.Close();
            fs.Close();
        }
    }
}
