using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;



namespace WebApplication2
{
    public partial class Browss_Results : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();
            dt = (DataTable) Session["datatable"]; //session variables always need casting
            BrowseResultsGridView.DataSource = dt;
            BrowseResultsGridView.DataBind();
            BrowseResultsGridView.Visible = false;
            int nrows = dt.Rows.Count;

            for (int i = 0; i < nrows; i++)
            {
                HtmlGenericControl div = new HtmlGenericControl("div");
                div.Attributes["class"] = "divThumbs";
                div.InnerHtml = "Dr. " + dt.Rows[i][1].ToString() + " " + dt.Rows[i][2].ToString();
                //div.ID = "div" + i.ToString();
                HtmlGenericControl pAddrs = new HtmlGenericControl("p");
                HtmlGenericControl pTele = new HtmlGenericControl("p");
                pAddrs.InnerHtml = "Address: " + dt.Rows[i][3] + ", " + dt.Rows[i][5] + ", " + dt.Rows[i][4];
                pTele.InnerHtml = "Telephone: " + dt.Rows[i][8];

                //WebControl timedate = new WebControl("")

                div.Controls.Add(pAddrs); //by that i added a new tag to the tag i just created "div"
                div.Controls.Add(pTele);

                dynamicPanel.Controls.Add(div);
                dynamicPanel.Controls.Add(new LiteralControl("<br />"));

            }
        }
    }
}