using System;
using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using Microsoft.LearningComponents;
using Microsoft.LearningComponents.Storage;
using System.IO;
using System.Web.UI;
using Resources;

namespace Microsoft.LearningComponents.Frameset
{
    public partial class Frameset_TOC : FramesetPage
    {
        TocHelper m_tocHelper; 

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                m_tocHelper = new TocHelper();
                m_tocHelper.ProcessPageLoad(Response, PStore, ProcessViewParameter, 
                                    ProcessAttemptIdParameter, ProcessViewRequest, RegisterError, 
                                    FramesetResources.TOC_SubmitAttempt);
            }
            catch (Exception ex)
            {
                RegisterError(ResHelper.GetMessage(FramesetResources.FRM_UnexpectedErrorTitle),
                                ResHelper.GetMessage(FramesetResources.FRM_UnexpectedError, HttpUtility.HtmlEncode(ex.Message)), false);
            }
        }

        /// <summary>
        /// Write the html for the table of contents to the response.
        /// </summary>
        /// <returns></returns>
        public void WriteToc()
        {
            m_tocHelper.TocElementsHtml();
        }

        /// <summary>
        /// Return the version of the frameset files. This is used to compare to the version of the js file, to ensure the js
        /// file is not being cached from a previous version.
        /// </summary>
        public static string TocVersion
        {
            get
            {
                return TocHelper.TocVersion;
            }
        }

        /// <summary>
        /// Return the message to display if the js version doesn't match the aspx version.
        /// </summary>
        public static string InvalidVersionHtml
        {
            get
            {
                return TocHelper.InvalidVersionHtml;
            }
        }
    }
}