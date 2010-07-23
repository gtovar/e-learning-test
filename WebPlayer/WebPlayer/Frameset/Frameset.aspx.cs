using System;
using System.Globalization;
using System.Text;

using Microsoft.LearningComponents;
using Microsoft.LearningComponents.Storage;
using Resources;
using System.IO;

namespace Microsoft.LearningComponents.Frameset
{
    /// <summary>
    /// This is the top-level frameset for display views of a package. 
    /// The URL to this page differs based on the view requested.
    /// Query parameters are:
    /// View: The integer that corresponds to the SessionView value for the session.
    /// AttemptId: The attempt to be displayed. This is required if the view is based on an attempt. It must already
    ///     exist in LearningStore. It must correspond to an attempt in a state that is appropriate for the view. For instance,
    ///     if View=0 (Execute), the attempt must be active.
    /// </summary>
    public partial class Frameset_Frameset : FramesetPage
    {
        private FramesetHelper m_framesetHelper;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                m_framesetHelper = new FramesetHelper();
                m_framesetHelper.ProcessPageLoad(PStore, ProcessViewParameter, ProcessAttemptIdParameter, ProcessViewRequest);
            }
            catch (System.Threading.ThreadAbortException)
            {
                // Do nothing
            }
            catch (FileNotFoundException)
            {
                Response.StatusCode = 404;
                Response.StatusDescription = "Not Found";
            }
            catch (System.Web.HttpException)
            {
                // Something wrong with the http connection, so in this case do not set the response
                // headers.
                RegisterError(FramesetResources.FRM_NotAvailableTitleHtml, FramesetResources.FRM_NotAvailableHtml, false);
            }
            catch (Exception)
            {
                // Doesn't matter why.
                Response.StatusCode = 500;
                Response.StatusDescription = "Internal Server Error";
                RegisterError(FramesetResources.FRM_NotAvailableTitleHtml, FramesetResources.FRM_NotAvailableHtml, false);
            }
        }

        /// <summary>
        /// Gets the title for the frameset. The one that goes into the title bar of the browser window.
        /// </summary>
        public string PageTitleHtml
        {
            get
            {
                PlainTextString text = new PlainTextString(ResHelper.GetMessage(FramesetResources.FRM_Title));
                HtmlString html = new HtmlString(text);
                return html.ToString();
            }
        }

        /// <summary>
        /// Gets the version of SCORM used in the current attempt.
        /// </summary>
        public string ScormVersionHtml
        {
            get { return m_framesetHelper.ScormVersionHtml; }
        }

        /// <summary>
        /// Returns "true" if the Rte is required on the first activity. "false" otherwise. (No quotes in the string.)
        /// </summary>
        public string RteRequired
        {
            get { return m_framesetHelper.RteRequired; }
        }

        public string HiddenFrameUrl
        {
            get
            {
                string strUrl = String.Format(CultureInfo.CurrentCulture, "Hidden.aspx?{0}={1}&{2}={3}&{4}=1",
                    FramesetQueryParameter.View, Convert.ToInt32(m_framesetHelper.View),
                    FramesetQueryParameter.AttemptId, m_framesetHelper.AttemptId.GetKey().ToString(),
                    FramesetQueryParameter.Init);
                UrlString hiddenUrl = new UrlString(strUrl);
                return hiddenUrl.ToAscii();
            }
        }

        public string TocFrameUrl
        {
            get
            {
                string strUrl = String.Format(CultureInfo.CurrentCulture, "Toc.aspx?View={0}&AttemptId={1}", 
                    m_framesetHelper.View.ToString(), m_framesetHelper.AttemptId.GetKey().ToString());
                UrlString hiddenUrl = new UrlString(strUrl);
                return hiddenUrl.ToAscii();
            }
        }
    }
}