using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fineflix
{
    public partial class Watch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {

            }
            string path = Request.QueryString["id"];
            string name = Request.QueryString["name"];
            video.InnerHtml = $"<source src='{path}'  type='video/mp4'>";
            name2.InnerHtml = name ;
        }
    }
}