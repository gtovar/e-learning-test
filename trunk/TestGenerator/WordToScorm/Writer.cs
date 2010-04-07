using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace WordToScorm
{
    class Writer
    {
        string FileName = "";
        string FilePath = "";
        FileStream fs;
        StreamWriter sw;
        Test test;
        Random rnd = new Random(DateTime.Now.Millisecond);

        public Writer(Test test, string Path, string FileName)
        {
            this.FileName = FileName;
            this.FilePath = Path;
            this.test = test;
        }

        string ProcessTextWithImages(string Text, QuestionImages Images)
        {
            // текст с тэгами изображений
            StringBuilder NewText = new StringBuilder();
            // номер текущего изображения
            int CurrentImage = 0; // or i+5
            // генерируем число которое будет частью имени файла изображения
            int rndval = rnd.Next(100, 9999);
            for (int i = 0; i < Text.Length; i++)
            {
                // если в тексте встретилась подстрока вида #img:*#
                if ((Text[i] == '#') && (Text[i + 1] == 'i') && (Text[i + 2] == 'm') && (Text[i + 3] == 'g') && (Text[i + 4] == ':') && (Text[i + 6] == '#'))
                {
                    // заменяем её на html код изображения
                    NewText.Append("<img src=\"" + rndval + CurrentImage + ".jpg\">");
                    // и сохраняем само изображение
                    Images.SaveImage(CurrentImage, FilePath + "\\" + rndval + CurrentImage + ".jpg");
                    CurrentImage++;
                    // перискакиваем на 6 символов вперёд
                    i += 6; // or 7
                }
                else // иначе копируем символ и переходим к следующему
                    NewText.Append(Text[i]);
            }

            return NewText.ToString();
        }

        public void WritePage()
        {
            fs = new FileStream(FilePath + "\\" + FileName, FileMode.Create);
            sw = new StreamWriter(fs);
            WriteHtmlHeader_Page();

            for (int i = 0; i < test.Count; i++)
            {
                WritePreQuestion_Page();
                string Text = ProcessTextWithImages(test[i].Question.Text, test[i].Question.QuestionImages);
                WriteQuestion_Page(Text, 20, i + 1);
                for (int k = 0; k < test[i].AnswersCount; k++)
                {
                    string text = ProcessTextWithImages(test[i][k].Text, test[i][k].Images);
                    int score = test[i][k].Score;
                    QuestionType type = test[i].Type;
                    WriteAnswer_Page(text, score, type, i, k);
                }
                WritePostQuestion_Page();
            }

            WriteHtmlFooter_Page();
            sw.Close();
            fs.Close();
        }

        public void WriteIMSPage()
        {
            fs = new FileStream(FilePath + "\\" + FileName, FileMode.Create);
            sw = new StreamWriter(fs);

            WriteHtmlHeader_IMSPage();

            for (int i = 0; i < test.Count; i++)
            {
                WritePreQuestion_IMSPage();
                string Text = ProcessTextWithImages(test[i].Question.Text, test[i].Question.QuestionImages);
                WriteQuestion_IMSPage(Text, i + 1);
                for (int k = 0; k < test[i].AnswersCount; k++)
                {
                    string text = ProcessTextWithImages(test[i][k].Text, test[i][k].Images);
                    int score = test[i][k].Score;
                    QuestionType type = test[i].Type;
                    WriteAnswer_IMSPage(text, type, i, k);
                }
                WritePostQuestion_IMSPage();
            }

            WriteHtmlFooter_IMSPage();
            sw.Close();
            fs.Close();
        }

        // 1 - svoy otver
        // 2 - svobodniy otvet
        // 3 - radio
        // 4 - checkbox

        void WriteQuestion_Page(string text, int MaxScore, int QuestionNum)
        {
            sw.WriteLine("<tr style=\"VERTICAL-ALIGN: baseline\">");
		    sw.WriteLine("<td class=\"QNum\"><nobr>" + QuestionNum + ".</nobr></td>");
		    sw.WriteLine("<td class=\"QText\" style=\"WIDTH: 100%\" colspan=\"3\">" + text + "</td>");
		    sw.WriteLine("<td class=\"QPts\" style=\"TEXT-ALIGN: right\">");
            sw.WriteLine("<img src=\"http://localhost:3535/mslamrk,id=" + QuestionNum + ",type=5,maxpts=" + MaxScore + "\"></td>");
	        sw.WriteLine("</tr>");
        }

        void WriteAnswer_Page(string Text, int Score, QuestionType Type, int QID, int AID)
        {
            sw.WriteLine("<tr>");
            sw.WriteLine("<td></td>");
            switch (Type)
            {
                case QuestionType.Alternative:
                    {
                        sw.WriteLine("<td><img src=\"http://localhost:3535/mslamrk,id=" + (QID + 1) + ",type=3,maxpts=" + Score + "\"></td>");
                        sw.WriteLine("<td class=\"ANum\"><nobr>" + (AID + 1) + ".</nobr></td>");
                        sw.WriteLine("<td style=\"WIDTH: 100%\">" + Text + "</td>");
                        break;
                    }
                case QuestionType.Distributive:
                    {
                        sw.WriteLine("<td><img src=\"http://localhost:3535/mslamrk,id=" + (QID + 1) + ",type=4,maxpts=" + Score + "\"></td>");
                        sw.WriteLine("<td class=\"ANum\"><nobr>" + (AID + 1) + ".</nobr></td>");
                        sw.WriteLine("<td style=\"WIDTH: 100%\">" + Text + "</td>");
                        break;
                    }
                case QuestionType.YourAnswer:
                    {
                        //sw.WriteLine("<td><input type=\"text\" disabled name=\"Q" + QID + "_" + AID + "\" size=\"20\" value=\"\"></td>");
                        sw.WriteLine("<td><img src=\"http://localhost:3535/mslamrk,cols=20,id=" + (QID + 1) + ",type=1,akey=" + Text + ",maxpts=" + Score + "\"></td>");
                        //sw.WriteLine("<td class=\"ANum\"></td>");
                        //sw.WriteLine("<td style=\"WIDTH: 100%\"></td>");
                        break;
                    }
            }
            sw.WriteLine("<td></td>");
            sw.WriteLine("</tr>");
        }

        void WritePreQuestion_Page()
        {
            sw.WriteLine("<table class=\"QTable\" width=\"95%\" lreq2=\"3\">");
        }

        void WritePostQuestion_Page()
        {
            sw.WriteLine("</table>");
        }

        void WriteHtmlHeader_Page()
        {
            sw.WriteLine("<html>");
            sw.WriteLine("<head>");
            sw.WriteLine("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
            sw.WriteLine("<link rel=\"stylesheet\" type=\"text/css\" href=\"../Shared/themes.css\">");
            sw.WriteLine("</head>");
            sw.WriteLine("<body contenteditable=\"false\">");

            sw.WriteLine("<table class=\"bodytable\" height=\"100%\" width=\"85%\" align=\"center\">");
	        sw.WriteLine("<tr>");
		    sw.WriteLine("<td class=\"banner\"><span lrece=\"true\">" + test.UnitName +"</span></td>");
	        sw.WriteLine("</tr>");
	        sw.WriteLine("<tr>");
		    sw.WriteLine("<td class=\"bodycell\" valign=\"top\" height=\"100%\">");
		    sw.WriteLine("<span id=\"questionsTable\" lrece=\"true\">");
        }

        void WriteHtmlFooter_Page()
        {
            sw.WriteLine("</table>");
		    sw.WriteLine("</span></td>");
	        sw.WriteLine("</tr>");
            sw.WriteLine("</table>");
            sw.WriteLine("</body>");
            sw.WriteLine("</html>");
        }

        void WriteQuestion_IMSPage(string text, int QuestionNum)
        {
            sw.WriteLine("<tr style=\"VERTICAL-ALIGN: baseline\">");
            sw.WriteLine("<td class=\"QNum\"><nobr>" + QuestionNum + ".</nobr></td>");
            sw.WriteLine("<td class=\"QText\" style=\"WIDTH: 100%\" colspan=\"3\">" + text + "</td>");
            sw.WriteLine("<td class=\"QPts\" style=\"TEXT-ALIGN: right\">");
            sw.WriteLine("<font face=\"Arial,Helvetica,sans-serif\" size=\"2\"><nobr><b>MaxScore</b></nobr></font></td>");
            sw.WriteLine("</tr>");
        }

        void WriteAnswer_IMSPage(string Text, QuestionType Type, int QID, int AID)
        {
            sw.WriteLine("<tr>");
            sw.WriteLine("<td></td>");
            switch (Type)
            {
                case QuestionType.Alternative:
                    {
                        sw.WriteLine("<td><input type=\"radio\" disabled name=\"Q" + QID + "\" value=\"" + (AID + 1) + " \"></td>");
                        sw.WriteLine("<td class=\"ANum\"><nobr>" + (AID + 1) + ".</nobr></td>");
                        sw.WriteLine("<td class=\"AText\" width=\"100%\">" + Text + "</td>");
                        break;
                    }
                case QuestionType.Distributive:
                    {
                        sw.WriteLine("<td><input type=\"checkbox\" disabled name=\"Q" + QID + "\" value=\"" + (AID + 1) + " \"></td>");
                        sw.WriteLine("<td class=\"ANum\"><nobr>" + (AID + 1) + ".</nobr></td>");
                        sw.WriteLine("<td class=\"AText\" width=\"100%\">" + Text + "</td>");
                        break;
                    }
                case QuestionType.YourAnswer:
                    {
                        sw.WriteLine("<td><input type=\"text\" disabled name=\"Q" + QID + "_" + AID + "\" size=\"20\" value=\"\"></td>");
                        //sw.WriteLine("<td class=\"ANum\"></td>");
                        //sw.WriteLine("<td class=\"AText\" width=\"100%\"></td>");
                        break;
                    }
            }
            sw.WriteLine("<td></td>");
            sw.WriteLine("</tr>");
        }

        void WritePreQuestion_IMSPage()
        {
            sw.WriteLine("<table class=\"QTable\" width=\"95%\" lreq2=\"3\">");
        }

        void WritePostQuestion_IMSPage()
        {
            sw.WriteLine("</table>");
        }

        void WriteHtmlHeader_IMSPage()
        {
            sw.WriteLine("<html>");
            sw.WriteLine("<head>");
            sw.WriteLine("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
            sw.WriteLine("<meta http-equiv=\"Pragma\" content=\"no-cache\">");
            sw.WriteLine("<title>Test</title>");
            sw.WriteLine("<script language=\"javascript\">");
            sw.WriteLine("var ECS_ViewType = 5;");
            if (!test.NegativeMarks)
            {
                sw.WriteLine("function process() {");
                sw.WriteLine("currentElement = window.event.srcElement;");
                sw.WriteLine("id=currentElement.id;");
                sw.WriteLine("firstIndex = id.indexOf(\"_\");");
                sw.WriteLine("lastIndex = id.lastIndexOf(\"_\");");
                sw.WriteLine("groupNumber = id.slice(firstIndex+1, lastIndex);");
                sw.WriteLine("questionsGroupCount = document.getElementById(\"questionsGroup\" + groupNumber + \"Count\").value;");
                sw.WriteLine("currentAnswerCount=0;");
                sw.WriteLine("answerCount=document.getElementById(\"questionsGroup\" + groupNumber +\"TrueCount\").value;");
                sw.WriteLine("for(i=1; i<=questionsGroupCount; i++) {");
                sw.WriteLine("    if(document.getElementById(\"question_\" + groupNumber + \"_\" + i).checked) { currentAnswerCount++; } }");
                sw.WriteLine(" if(currentAnswerCount > answerCount) { currentElement.checked = false; } }");
            }
            sw.WriteLine("</script>");
            sw.WriteLine("<link rel=\"stylesheet\" type=\"text/css\" href=\"/CSInc/common.css\">");
            sw.WriteLine("<link rel=\"stylesheet\" type=\"text/css\" href=\"/CSWebapp/UIcss.aspx\">");
            sw.WriteLine("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
            sw.WriteLine("<link rel=\"stylesheet\" type=\"text/css\" href=\"../Shared/themes.css\">");;
            sw.WriteLine("</head>");
            sw.WriteLine("<body ecs_viewtype=\"5\" contenteditable=\"false\">");
            sw.WriteLine("<form name=\"frmPage\" method=\"post\" enctype=\"multipart/form-data\" style=\"height: 100%; width: 100%; border: none; margin: 0\">");

            if (!test.NegativeMarks)
            {
                int c = 0, v = 0;
                for (int i = 0; i < test.Count; i++)
                    if (test[i].Type == QuestionType.Distributive)
                    {
                        sw.WriteLine("<input type=\"hidden\" value=\"" + test[i].AnswersCount + "\" id=\"questionsGroup" + c + "Count\"/>");

                        for (int k = 0; k < test[i].AnswersCount; k++)
                            if (test[i][k].IsRight)
                                v++;
                        sw.WriteLine("<input type=\"hidden\" value=\"" + v + "\" id=\"questionsGroup" + c + "TrueCount\"/>");
                        c++;
                    }
            }

            sw.WriteLine("<table class=\"bodytable\" height=\"100%\" width=\"85%\" align=\"center\">");
		    sw.WriteLine("<tr>");
			sw.WriteLine("<td class=\"banner\"><span lrece=\"true\">" + test.UnitName + "</span></td>");
		    sw.WriteLine("</tr>");
		    sw.WriteLine("<tr>");
			sw.WriteLine("<td class=\"bodycell\" valign=\"top\" height=\"100%\">");
			sw.WriteLine("<span id=\"questionsTable\" lrece=\"true\">");

        }

        void WriteHtmlFooter_IMSPage()
        {
            sw.WriteLine("</span></td>");
		    sw.WriteLine("</tr>");
	        sw.WriteLine("</table>");

            sw.WriteLine("</form>");
            sw.WriteLine("</body>");
            sw.WriteLine("</html>");
        }
    }
}
