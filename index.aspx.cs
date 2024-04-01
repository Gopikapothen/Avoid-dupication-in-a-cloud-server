using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Collections;
using System.IO;
public partial class index : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string query;
    ArrayList fset = new ArrayList();
    ArrayList fpath = new ArrayList();
    ArrayList fpath1 = new ArrayList();
    DateTime cdate;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void data()
    {
        string connstring = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        con = new SqlConnection(connstring);
        con.Open();
    }
    string ftype;
    public void fdele()
    {
        data();
        query = "select imgname,image_path,id,ftype,owner_path from filedet where fsys='Private' AND uname='" + txtusername.Text + "' ";
        cmd = new SqlCommand(query, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            fset.Add(rd[2].ToString());
            // fpath.Add(rd[1].ToString());
            ftype = rd[3].ToString();
            if ((ftype == ".doc") || (ftype == ".txt"))
            {
                fpath.Add(rd[1].ToString());
              
                //fpath1.Add(Server.MapPath("./useruploads/") + rd[0].ToString());
            }
            else
            {
                fpath.Add(rd[1].ToString());
                fpath.Add(rd[4].ToString());

              
               // fpath1.Add(Server.MapPath("./img/") + rd[0].ToString());
               // fpath1.Add(Server.MapPath("./ownimage/") + rd[0].ToString());
            }
        }
        rd.Close();
        con.Close();

        // string[] files = Directory.GetFiles(Server.MapPath("./useruploads") + fset.ToString());

        foreach (string file in fpath)
        {
            data();
            query = "select uplodate from filedet where image_path='" + file.ToString() + "' or owner_path='" + file.ToString() + "'";
            cmd = new SqlCommand(query, con);
            SqlDataReader red = cmd.ExecuteReader();
            while (red.Read())
            {
                cdate = Convert.ToDateTime(red[0].ToString());
            }
            red.Close();
            con.Close();

            FileInfo fi = new FileInfo(file);
            if (cdate < DateTime.Now.AddMonths(-6))
            {
                fi.Delete();
                data();
                query = "delete from filedet where image_path='" + file.ToString() + "' or owner_path='" + file.ToString() + "'";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        foreach (string file in fset)
        {
            data();
            query = "select uplodate from filedet where id=" + Convert.ToInt32(file) + "";
            cmd = new SqlCommand(query, con);
            SqlDataReader red = cmd.ExecuteReader();
            while (red.Read())
            {
                cdate = Convert.ToDateTime(red[0].ToString());
            }
            red.Close();
            con.Close();
            // FileInfo fi = new FileInfo(file);
            if (cdate < DateTime.Now.AddMonths(-6))
            {
                //  fi.Delete();
                data();
                query = "delete from filedet where id=" + Convert.ToInt32(file) + "";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
    public void fpub()
    {
        data();
        query = "select imgname,image_path,id,ftype,owner_path from filedet where fsys='Public' AND uname='" + txtusername.Text + "' ";
        cmd = new SqlCommand(query, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            fset.Add(rd[2].ToString());
            // fpath.Add(rd[1].ToString());
            ftype = rd[3].ToString();
            if ((ftype == ".doc") || (ftype == ".txt"))
            {
                fpath.Add(rd[1].ToString());

                //fpath1.Add(Server.MapPath("./useruploads/") + rd[0].ToString());
            }
            else
            {
                fpath.Add(rd[1].ToString());
                fpath.Add(rd[4].ToString());


                // fpath1.Add(Server.MapPath("./img/") + rd[0].ToString());
                // fpath1.Add(Server.MapPath("./ownimage/") + rd[0].ToString());
            }
        }
        rd.Close();
        con.Close();

        // string[] files = Directory.GetFiles(Server.MapPath("./useruploads") + fset.ToString());

        foreach (string file in fpath)
        {
            data();
            query = "select uplodate from filedet where image_path='" + file.ToString() + "' or owner_path='" + file.ToString() + "'";
            cmd = new SqlCommand(query, con);
            SqlDataReader red = cmd.ExecuteReader();
            while (red.Read())
            {
                cdate = Convert.ToDateTime(red[0].ToString());
            }
            red.Close();
            con.Close();

            FileInfo fi = new FileInfo(file);
            if (cdate < DateTime.Now.AddMonths(-3))
            {
                fi.Delete();
                data();
                query = "delete from filedet where image_path='" + file.ToString() + "' or owner_path='" + file.ToString() + "'";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        foreach (string file in fset)
        {
            data();
            query = "select uplodate from filedet where id=" + Convert.ToInt32(file) + "";
            cmd = new SqlCommand(query, con);
            SqlDataReader red = cmd.ExecuteReader();
            while (red.Read())
            {
                cdate = Convert.ToDateTime(red[0].ToString());
            }
            red.Close();
            con.Close();
            // FileInfo fi = new FileInfo(file);
            if (cdate < DateTime.Now.AddMonths(-6))
            {
                //  fi.Delete();
                data();
                query = "delete from filedet where id=" + Convert.ToInt32(file) + "";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Array.ForEach(Directory.GetFiles(Server.MapPath("./userimg")), File.Delete);
        Array.ForEach(Directory.GetFiles(Server.MapPath("./usertemp")), File.Delete);
        data();
        query = "select uname,pwd from userdet where uname='" + txtusername.Text + "' and pwd='" + txtpassword.Text + "'";
        cmd = new SqlCommand(query, con);
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            fdele();
            fpub();
            Session["user"] = txtusername.Text.ToString();
            Response.Redirect("userhome.aspx");
        }
        else
        {
            MessageBox.Show("Invalid User");
        }
        rd.Close();
        con.Close();
    }
}