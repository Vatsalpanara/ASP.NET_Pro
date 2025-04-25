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
    public partial class Signup : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        int i;
        Class1 cs;

        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (Session["user"] != null)
            {
                Response.Redirect("index.aspx");
            }



        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            startcon();
            con = cs.getcon();
            cs.insert(Firstname.Text, Lastname.Text, username.Text,email.Text,password.Text);
            Session["user"] = username.Text;
            Response.Redirect("index.aspx");         

        }
    }
}