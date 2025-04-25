//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Data;
//using System.Data.SqlClient;
//using System.IO;

//namespace fineflix
//{
//    public partial class index : System.Web.UI.Page
//    {
//        SqlConnection con;
//        SqlDataAdapter da;
//        SqlCommand cmd;
//        DataSet pre,cet;
//        Class1 cs;
//        string thumbnail, preview,name;



//        void startcon()
//        {
//            con = new SqlConnection();
//            cs = new Class1();
//            con = cs.getcon();
//        }


//        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
//        {

//            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
//            {

//                Repeater Repeater1 = (Repeater)e.Item.FindControl("Repeater1");
//                int id = Convert.ToInt32(e.Item.ItemIndex);
//                Repeater1.DataSource = cs.get_cetegory(id+1 );
//                Repeater1.DataBind();
//            }

//        }

//        protected void admin_Click(object sender, EventArgs e)
//        {
//            Response.Redirect("admin.aspx");   
//        }

//        protected void watch_button_Click(object sender, EventArgs e)
//        {
//            Response.Redirect("Watch.aspx?id=" + preview + "&name=" + name);
//        }


//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (Session["user"] == null)
//            {
//                Response.Redirect("login.aspx");
//            }
//            else
//            {

//            }
//            startcon();
//            con = cs.getcon();
//            pre = cs.get_preview();
//            thumbnail= pre.Tables[0].Rows[0][2].ToString();
//            preview = pre.Tables[0].Rows[0][3].ToString();
//            name = pre.Tables[0].Rows[0][1].ToString();
//            video.InnerHtml = $"<source src='{preview}' type='video/mp4' />";
//            name2.InnerHtml = $"{name}";
//            Image1.ImageUrl = thumbnail;
//            //Image1.Visible = false;
//            cet = cs.get_all_cetegory();
//            Repeater2.DataSource = cet;
//            Repeater2.DataBind();
//            if(Session["user"].ToString()== "dkachhadiya125")
//            {
//                admin.Visible = true;
//            }
//            else
//            {
//                admin.Visible = false;

//            }


//        }

//        protected void logout_Click(object sender, EventArgs e)
//        {
//            Session.Abandon();
//            Response.Redirect("login.aspx");
//        }
//    }
//}

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
    public partial class index : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet pre, cet;
        Class1 cs;
        string thumbnail, preview, name;

        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater Repeater1 = (Repeater)e.Item.FindControl("Repeater1");
                int id = Convert.ToInt32(e.Item.ItemIndex);
                Repeater1.DataSource = cs.get_cetegory(id + 1);
                Repeater1.DataBind();
            }
        }

        protected void admin_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }

        protected void watch_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("Watch.aspx?id=" + preview + "&name=" + name);
        }

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (Session["user"] == null)
        //    {
        //        Response.Redirect("login.aspx");
        //    }

        //    startcon();
        //    pre = cs.get_preview();

        //    thumbnail = pre.Tables[0].Rows[0][2].ToString();  // Just the file name like "grease.jpg"
        //    preview = pre.Tables[0].Rows[0][3].ToString();    // Just the file name like "2.mp4"
        //    name = pre.Tables[0].Rows[0][1].ToString();

        //    // ✅ Correcting the resource paths using ResolveUrl
        //    string thumbnailPath = ResolveUrl("~/entities/thumbnails/" + thumbnail);
        //    string videoPath = ResolveUrl("~/entities/previews/" + preview);

        //    Image1.ImageUrl = thumbnailPath;
        //    video.InnerHtml = $"<source src='{videoPath}' type='video/mp4' />";
        //    name2.InnerHtml = $"{name}";

        //    cet = cs.get_all_cetegory();
        //    Repeater2.DataSource = cet;
        //    Repeater2.DataBind();

        //    admin.Visible = Session["user"].ToString() == "dkachhadiya125";
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            startcon();
            pre = cs.get_preview();

            if (pre.Tables.Count > 0 && pre.Tables[0].Rows.Count > 0)
            {
                thumbnail = pre.Tables[0].Rows[0][2].ToString();  // grease.jpg
                preview = pre.Tables[0].Rows[0][3].ToString();    // 2.mp4
                name = pre.Tables[0].Rows[0][1].ToString();

                // ✅ Correct path resolving
                string thumbnailPath = ResolveUrl("~/entities/thumbnails/" + thumbnail);
                string videoPath = ResolveUrl("~/entities/previews/" + preview);

                Image1.ImageUrl = thumbnailPath;
                video.InnerHtml = $"<source src='{videoPath}' type='video/mp4' />";
                name2.InnerHtml = name;
            }
            else
            {
                // Fallback values or a message
                Image1.ImageUrl = "images/default.jpg";  // Use your own placeholder path
                video.InnerHtml = "<p>No preview available.</p>";
                name2.InnerHtml = "No content available.";
            }

            cet = cs.get_all_cetegory();
            Repeater2.DataSource = cet;
            Repeater2.DataBind();

            admin.Visible = Session["user"].ToString() == "Sachin";
        }


        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}
