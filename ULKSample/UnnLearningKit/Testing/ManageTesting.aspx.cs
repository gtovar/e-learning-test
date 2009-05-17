using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UnnLearningKit.Testing
{
    public partial class Testing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewCurrentTests_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < viewCurrentTests.Rows.Count; i++)
            {
                Label numbers = (Label)viewCurrentTests.Rows[i].Cells[0].FindControl(WebConstants.NumbersLinesLabelName);
                numbers.Text = (i + 1).ToString();

                Label status = (Label)viewCurrentTests.Rows[i].Cells[0].FindControl(WebConstants.StatusLabelName);
                status.Text = Messages.Status;
            }
        }
    }
}
