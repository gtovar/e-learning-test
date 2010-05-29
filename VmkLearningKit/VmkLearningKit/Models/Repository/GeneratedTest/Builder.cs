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
            string name = "";
            string path = "";
            string localPath = "";

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

                path = new string(c);

                int s = path.LastIndexOf("/") + 1;

                char[] g = new char[path.Length - s + 1];

                int r = 0;

                for (int i = s; i < path.Length; i++)
                {
                    g[r] = path[i];
                    r++;
                }

                name = new string(g);

                char[] h = new char[path.Length - 22];
                int y = 0;

                for (int i = 22; i < path.Length; i++)
                {
                    h[y] = path[i];
                    y++;
                }

                string temp = new string(h);
                localPath = "VmkLearningKit" + temp;

                //text.Replace(path,@"./"+ name);

                //DirectoryInfo d = new DirectoryInfo(localPath);
                //d.MoveTo("VmkLearningKit");           
            }
            return text;
        }

        private void WriteImsHtmlHeader()//+
        {
            string UnitName = "Тестовый вариант №" + (number - 1);
            
            sw.WriteLine("<html>");
            sw.WriteLine("<head>");
            sw.WriteLine("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
            sw.WriteLine("<meta http-equiv=\"Pragma\" content=\"no-cache\">");
            sw.WriteLine("<title>Test</title>");
            sw.WriteLine("<script language=\"javascript\">");
            sw.WriteLine("var ECS_ViewType = 5;");
            sw.WriteLine("</script>");
            sw.WriteLine("<link rel=\"stylesheet\" type=\"text/css\" href=\"/CSInc/common.css\">");            
            sw.WriteLine("<link rel=\"stylesheet\" type=\"text/css\" href=\"/CSWebapp/UIcss.aspx\">");
            sw.WriteLine("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
            sw.WriteLine("<link rel=\"stylesheet\" type=\"text/css\" href=\"../Shared/themes.css\">");
            sw.WriteLine("</head>");
            sw.WriteLine("<body ecs_viewtype=\"5\" contenteditable=\"false\">");
            sw.WriteLine("<form name=\"frmPage\" method=\"post\" enctype=\"multipart/form-data\" style=\"height: 100%; width: 100%; border: none; margin: 0\">");
            sw.WriteLine("<table class=\"bodytable\" height=\"100%\" width=\"85%\" align=\"center\">");
            sw.WriteLine("<tr>");
            sw.WriteLine("<td class=\"banner\"><span lrece=\"true\">" + UnitName + "</span></td>");
            sw.WriteLine("</tr>");
            sw.WriteLine("<tr>");
            sw.WriteLine("<td class=\"bodycell\" valign=\"top\" height=\"100%\">");
            sw.WriteLine("<span id=\"questionsTable\" lrece=\"true\">");
        }

        void WriteHtmlHeader()
        {
            string UnitName = "Тестовый вариант №" + (number - 1);

            sw.WriteLine("<html>");
            sw.WriteLine("<head>");
            sw.WriteLine("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
            sw.WriteLine("<link rel=\"stylesheet\" type=\"text/css\" href=\"../Shared/themes.css\">");
            sw.WriteLine("</head>");
            sw.WriteLine("<body contenteditable=\"false\">");

            sw.WriteLine("<table class=\"bodytable\" height=\"100%\" width=\"85%\" align=\"center\">");
            sw.WriteLine("<tr>");
            sw.WriteLine("<td class=\"banner\"><span lrece=\"true\">" + UnitName + "</span></td>");
            sw.WriteLine("</tr>");
            sw.WriteLine("<tr>");
            sw.WriteLine("<td class=\"bodycell\" valign=\"top\" height=\"100%\">");
            sw.WriteLine("<span id=\"questionsTable\" lrece=\"true\">");
        }

        void WriteImsPreQuestion()//+
        {
            sw.WriteLine("<table class=\"QTable\" width=\"95%\" lreq2=\"3\">");//+
        }

        void WritePreQuestion()
        {
            sw.WriteLine("<table class=\"QTable\" width=\"95%\" lreq2=\"3\">");
        }

        void WriteImsQuestion(string text, int n)//+
        {
            int QuestionNum = n;

            sw.WriteLine("<tr style=\"VERTICAL-ALIGN: baseline\">");
            sw.WriteLine("<td class=\"QNum\"><nobr>" + QuestionNum + ".</nobr></td>");
            sw.WriteLine("<td class=\"QText\" style=\"WIDTH: 100%\" colspan=\"3\">" + text + "</td>");
            sw.WriteLine("<td class=\"QPts\" style=\"TEXT-ALIGN: right\">");
            sw.WriteLine("<font face=\"Arial,Helvetica,sans-serif\" size=\"2\"><nobr><b>MaxScore</b></nobr></font></td>");
            sw.WriteLine("</tr>");
            //sw.WriteLine("<tr>");
            //sw.WriteLine("<td></td>");
        }

        void WriteQuestion(string text, double MaxScore, int n)
        {
            int QuestionNum = n;

            sw.WriteLine("<tr style=\"VERTICAL-ALIGN: baseline\">");
            sw.WriteLine("<td class=\"QNum\"><nobr>" + QuestionNum + ".</nobr></td>");
            sw.WriteLine("<td class=\"QText\" style=\"WIDTH: 100%\" colspan=\"3\">" + text + "</td>");
            sw.WriteLine("<td class=\"QPts\" style=\"TEXT-ALIGN: right\">");
            sw.WriteLine("<img src=\"http://localhost:12121/mslamrk,id=" + QuestionNum + ",type=5,maxpts=" + MaxScore + "\"></td>");
            sw.WriteLine("</tr>");
        }

        void WriteImsAnswer(int type, string text, int qid, int aid)//+
        {
            text = BuilderImages(text);

            switch (type)
            {
                case 0:
                    {
                        sw.WriteLine("<tr>");
                        sw.WriteLine("<td></td>");
                        sw.WriteLine("<td><input type=\"text\" disabled name=\"Q" + qid + "_" + aid + "\" size=\"20\" value=\"\"></td>");
                        break;
                    }
                case 1:
                    {
                        sw.WriteLine("<tr>");
                        sw.WriteLine("<td></td>");
                        sw.WriteLine("<td><input type=\"radio\" disabled name=\"Q" + qid + "\" value=\"" + (aid + 1) + " \"></td>");
                        sw.WriteLine("<td class=\"ANum\"><nobr>" + /*(aid + 1) +*/ "</nobr></td>");
                        sw.WriteLine("<td class=\"AText\" width=\"100%\">" + text + "</td>");
                        //sw.WriteLine("<br />");
                        break;
                    }
                case 2:
                    {
                        sw.WriteLine("<tr>");
                        sw.WriteLine("<td></td>");
                        sw.WriteLine("<td><input type=\"checkbox\" disabled name=\"Q" + qid + "\" value=\"" + (aid + 1) + " \"></td>");
                        sw.WriteLine("<td class=\"ANum\"><nobr>" + /*(aid + 1) +*/ "</nobr></td>");
                        sw.WriteLine("<td class=\"AText\" width=\"100%\">" + text + "</td>");
                        break;
                    }

                case 4:
                    {
                        sw.WriteLine("<tr>");
                        sw.WriteLine("<td></td>");
                        sw.WriteLine("<td><input type=\"text\" disabled name=\"Q" + qid + "_" + aid + "\" size=\"20\" id=\"Q" + qid + "_" + aid + "\" value=\"\"></td>");
                        break;
                    }
            }
            sw.WriteLine("<td></td>");
            sw.WriteLine("</tr>");
        }

        void WriteAnswer(int type, string text,int qid, int aid, double score)
        {
            sw.WriteLine("<tr>");
            sw.WriteLine("<td></td>");
            switch (type)
            {
                case 0:
                    {
                        sw.WriteLine("<td><img src=\"http://localhost:12121/mslamrk,cols=20,id=" + (qid + 1) + ",type=1,akey=" + text + ",maxpts=" + score + "\"></td>");
                        break;                      
                    }
                case 1:
                    {
                        sw.WriteLine("<td><img src=\"http://localhost:12121/mslamrk,id=" + (qid + 1) + ",type=3,maxpts=" + score + "\"></td>");
                        sw.WriteLine("<td class=\"ANum\"><nobr>" + /*(aid + 1) +*/".</nobr></td>");
                        sw.WriteLine("<td style=\"WIDTH: 100%\">" + text + "</td>");
                        
                        break;
                    }
                case 2:
                    {
                        sw.WriteLine("<td><img src=\"http://localhost:12121/mslamrk,id=" + (qid + 1) + ",type=4,maxpts=" + score + "\"></td>");
                        sw.WriteLine("<td class=\"ANum\"><nobr>" + /*(aid + 1) +*/".</nobr></td>");
                        sw.WriteLine("<td style=\"WIDTH: 100%\">" + text + "</td>");
                        break;
                    }

                case 3:
                    {
                        sw.WriteLine("<td><img src=\"http://localhost:12121/mslamrk,cols=20,id=" + (qid + 1) + ",type=1,akey=" + text + ",maxpts=" + score + "\"></td>");
                        break;
                    }
            }
            sw.WriteLine("<td></td>");
            sw.WriteLine("</tr>");
        }

        void WriteImsPostQuestion()//+
        {
            sw.WriteLine("</table>");
        }

        void WritePostQuestion()
        {
            sw.WriteLine("</table>");
        }

        void WriteImsHtmlFooter()//+
        {
            sw.WriteLine("</span></td>");
            sw.WriteLine("</tr>");
            sw.WriteLine("</table>");

            sw.WriteLine("</form>");
            sw.WriteLine("</body>");
            sw.WriteLine("</html>");
        }

        void WriteHtmlFooter()
        {
            sw.WriteLine("</table>");
            sw.WriteLine("</span></td>");
            sw.WriteLine("</tr>");
            sw.WriteLine("</table>");
            sw.WriteLine("</body>");
            sw.WriteLine("</html>");
        }


        public void WriteImsPage()
        {
            fs = new FileStream(FilePath + "\\" + FileName, FileMode.Create);
            sw = new StreamWriter(fs);

            WriteImsHtmlHeader();

            RepositoryManager repositoryManager                      = 
                RepositoryManager.GetRepositoryManager;
            IGeneratedQuestionRepository generatedQuestionRepository = 
                repositoryManager.GetGeneratedQuestionRepository;
            IQuestionRepository questionRepository                   = 
                repositoryManager.GetQuestionRepository;

            IEnumerable<GeneratedQuestion> generatedQuestion = 
                generatedQuestionRepository.GetAllGeneratedQuestionsByGeneratedTestVariantId(gtv.Id);

            int index = 1;

            foreach (GeneratedQuestion gq in generatedQuestion)
            {
                string text = BuilderImages(gq.Question.Text);

                WriteImsPreQuestion();

                WriteImsQuestion(text, index);

                int count = questionRepository.GetAnswersCountByQuestionId(gq.QuestionId);
                IEnumerable<Answer> answers = questionRepository.GetAllAnswersByQuestionId(gq.QuestionId);

                int l = 0;

                foreach (Answer an in answers)
                {
                    WriteImsAnswer(gq.Question.Type, an.Text, index, l);
                    l++;
                }

                WriteImsPostQuestion();
                index++;
            }

            WriteImsHtmlFooter();
            sw.Close();
            fs.Close();
        }

        public void WritePage()
        {
            fs = new FileStream(FilePath + "\\" + FileName, FileMode.Create);
            sw = new StreamWriter(fs);

            WriteHtmlHeader();

            RepositoryManager repositoryManager =
                RepositoryManager.GetRepositoryManager;
            IGeneratedQuestionRepository generatedQuestionRepository =
                repositoryManager.GetGeneratedQuestionRepository;
            IQuestionRepository questionRepository =
                repositoryManager.GetQuestionRepository;

            IEnumerable<GeneratedQuestion> generatedQuestion =
                generatedQuestionRepository.GetAllGeneratedQuestionsByGeneratedTestVariantId(gtv.Id);

            int index = 1;

            foreach (GeneratedQuestion gq in generatedQuestion)
            {
                string text = BuilderImages(gq.Question.Text);

                WritePreQuestion();

                double maxScore = questionRepository.GetMaxScoreQuestionByQuestionId(gq.Question.Id);

                WriteQuestion(text, maxScore, index);

                int count = questionRepository.GetAnswersCountByQuestionId(gq.QuestionId);
                IEnumerable<Answer> answers = questionRepository.GetAllAnswersByQuestionId(gq.QuestionId);

                int l = 0;

                foreach (Answer an in answers)
                {

                    WriteAnswer(gq.Question.Type, an.Text, index, l, an.Score);
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
