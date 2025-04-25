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
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        int i;
        Class1 cs;
        string thu,pre;

        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }
        //public void thumbnailupload()
        //{
        //    if (thumbnail.HasFile)
        //    {
        //        thu = "entities/thumbnails/" + thumbnail.FileName;
        //        thumbnail.SaveAs(Server.MapPath(thu));
        //    }
        //}
        //public void previewlupload()
        //{
        //    if (thumbnail.HasFile)
        //    {
        //        pre = "entities/previews/" + thumbnail.FileName;
        //        thumbnail.SaveAs(Server.MapPath(pre));
        //    }
        //}

        public void thumbnailupload()
        {
            if (thumbnail.HasFile)
            {
                thu = "entities/thumbnails/" + thumbnail.FileName;
                thumbnail.SaveAs(Server.MapPath(thu));
            }
        }

        public void previewlupload()
        {
            if (previewvideo.HasFile)
            {
                pre = "entities/previews/" + previewvideo.FileName;
                previewvideo.SaveAs(Server.MapPath(pre));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"].ToString() == "Sachin")
            {
                
            }
            else
            {
                Response.Redirect("index.aspx");

            }

        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            startcon();
            con = cs.getcon();
            previewlupload();
            thumbnailupload();
            cs.uploadvideo(name.Text,thu,pre,cetegoryid.SelectedValue);
            
            Response.Redirect("index.aspx");
        }
    }
}