using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UnnLearningKitLibrary;
using UnnLearningKit.App_Code;
using UnnLearningKit.Code;

namespace UnnLearningKit.Testing
{
    public partial class TestsGenerator : System.Web.UI.Page
    {
        private const string questionsWordDocFolder = @"C:\MLG\e-learning-test\ULKSample\UnnLearningKit\Data\QuestionsWordDocFiles\";
        private string questionsWordDocFilename = questionsWordDocFolder + DateTime.Now.ToString("yyyy-MM-dd") + ".doc";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void generateQuestions_Click(object sender, EventArgs e)
        {
            string filename = UploadWordDoc.FileName;
            // FIXME: проверить, что загружаемый файл имеет формат doc
            UploadWordDoc.SaveAs(questionsWordDocFilename);

            

            Response.Redirect(WebConstants.UploadWordDocResult);
        }
    }
}
