using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace fineflix
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        Class1 cs;
        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            islogin.Visible = false;
            if (Session["user"] != null)
            {
                Response.Redirect("index.aspx");
            }

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            startcon();
            con = cs.getcon();
            ds=cs.select_login(username.Text, Password.Text);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["user"] = ds.Tables[0].Rows[0][3].ToString();
                Response.Redirect("index.aspx");
            }
            else
            {
                islogin.Visible = true;

            }



        }
    }
}