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
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        Class1 cs;
        string user;
        string pass;
        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                user = Session["user"].ToString();
                startcon();
                con = cs.getcon();
                ds = cs.select_session(user);
                if (!IsPostBack) 
                {
                    fnm.Text = ds.Tables[0].Rows[0][1].ToString();
                    lnm.Text = ds.Tables[0].Rows[0][2].ToString();
                    eml.Text = ds.Tables[0].Rows[0][4].ToString();
                }
                pass = ds.Tables[0].Rows[0][5].ToString();
            }
            Label1.Visible = false;

          
          
        
        }
    
        protected void update_Click(object sender, EventArgs e)
            {
                startcon();
                con = cs.getcon();
                cs.update_detail(user,fnm.Text,lnm.Text,eml.Text);
                ds = cs.select_session(user);
                fnm.Text = ds.Tables[0].Rows[0][1].ToString();
                lnm.Text = ds.Tables[0].Rows[0][2].ToString();
                eml.Text = ds.Tables[0].Rows[0][4].ToString();
                pass = ds.Tables[0].Rows[0][5].ToString();
            }

        protected void updatepass_Click(object sender, EventArgs e)
        {
            if (pass == oldPassword.Text)
            {
                startcon();
                con = cs.getcon();
                cs.update_password(user,newPassword.Text);
            }
            else
            {
                Label1.Visible = true;
            }
            
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");

        }
    }
}