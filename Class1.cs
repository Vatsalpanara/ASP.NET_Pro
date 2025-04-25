using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Web.UI.WebControls;


namespace fineflix
{
    public class Class1
    {
        SqlConnection con;
        SqlDataAdapter da,pr,ca;
        SqlCommand cmd;
        DataSet ds, pre,cet,getcet;
        

        public SqlConnection getcon()
        {
            string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\preet\Downloads\fineflix-20250409T063044Z-001 (2)\fineflix-20250409T063044Z-001\fineflix\App_Data\Fineflix_db.mdf"";Integrated Security=True";
            con = new SqlConnection(s);
            con.Open();
            return con;
        }
        public void insert(string fnm, string lnm, string unm, string eml, string pass)
        {
            cmd = new SqlCommand("insert into Users(FirstName,LastName,UserName,Email,Password)values('" + fnm + "','" + lnm + "','" + unm + "','" + eml + "','" + pass + "')", con);
            cmd.ExecuteNonQuery();
        }
        public DataSet select_login(string username,string password)
        {
            da = new SqlDataAdapter("select * from Users where Username='"+username+"' and Password='"+password+"'", con);
            ds = new DataSet();
            da.Fill(ds);

            return ds;
        }
        public DataSet select_session(string username)
        {
            da = new SqlDataAdapter("select * from Users where Username='" + username + "'", con);
            ds = new DataSet();
            da.Fill(ds);
 
            return ds;
        }
        public void update_detail(string  user, string fnm, string lnm, string eml)
        {
            cmd = new SqlCommand("update Users set FirstName='" + fnm + "',LastName='" + lnm + "',Email='" + eml + "' where Username='" + user + "' ", con);
            cmd.ExecuteNonQuery();
        }
        public void update_password(string user, string newpass)
        {
            cmd = new SqlCommand("update Users set Password='" + newpass + "'  where Username='" + user + "' ", con);
            cmd.ExecuteNonQuery();
        }
        public DataSet get_preview()
        {
            pr = new SqlDataAdapter("SELECT TOP 1 * FROM Entities ORDER BY NEWID()", con);
            pre = new DataSet();
            pr.Fill(pre);

            return pre;
        }
        public DataSet get_cetegory(int id)
        {
            pr = new SqlDataAdapter("SELECT *from Entities where categoryId='"+id+"'", con);
            cet = new DataSet();
            pr.Fill(cet);

            return cet;
        }
        public DataSet get_all_cetegory()
        {
            ca = new SqlDataAdapter("SELECT *from Categories", con);
            getcet = new DataSet();
            ca.Fill(getcet);

            return getcet;
        }

        //public void uploadvideo(string name,string thumbnail,string preview,string cetid)
        //{
        //    cmd = new SqlCommand("insert into Entities(name,thumbnail,preview,categoryId)values('" + name + "','" + thumbnail + "','" + preview + "','" + cetid + "')", con);
        //    cmd.ExecuteNonQuery();
        //}

        public void uploadvideo(string name, string thumbnailPath, string previewPath, string categoryId)
        {
            using (SqlConnection con = getcon())
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                using (SqlCommand cmd = new SqlCommand("INSERT INTO Entities (name, thumbnail, preview, categoryId) VALUES (@name, @thumbnail, @preview, @categoryId)", con))
                {
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@thumbnail", thumbnailPath);
                    cmd.Parameters.AddWithValue("@preview", previewPath);
                    cmd.Parameters.AddWithValue("@categoryId", categoryId);
                    cmd.ExecuteNonQuery();
                }
            }
        }




    }
}