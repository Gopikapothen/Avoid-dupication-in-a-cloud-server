using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using System.Data;
using System.Collections;
public partial class viewimage : System.Web.UI.Page
{
    ArrayList sm = new ArrayList();
    SqlConnection con;
    SqlCommand cmd;
    string query;
    ArrayList filecount = new ArrayList();
    int r, g, h;
    int r1, r2, g1, g2, h1, h2;
    protected void Page_Load(object sender, EventArgs e)
    {
        lbluser.Text = Session["user"].ToString();
        //data();
        //string selectuserimage = "select Id,imgname from filedet where uname='" + lbluser.Text + "'";
        //SqlDataAdapter imgdata = new SqlDataAdapter(selectuserimage, con);
        //DataSet imgds = new DataSet();
        //imgdata.Fill(imgds);
        //imagedatalist.DataSource = imgds.Tables[0];
        //imagedatalist.DataBind();
        DataList1.DataBind();
        data();
        query = "delete from similarfile";
        cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        con.Close();
        similar();
    }
    public void similar()
    {

        data();
        query = "select id from filedet where uname='" + lbluser.Text + "' and imgred <> ' '";
        cmd = new SqlCommand(query, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            filecount.Add(rd[0].ToString());
        }
        rd.Close();
        con.Close();

        int f = filecount.Count;

        if (f > 0)
        {
            for (int i = 0; i < f; i++)
            {
                data();
                query = "select imgred,imggreen,imgblue from filedet where id=" + filecount[i].ToString() + "";
                cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    r = Convert.ToInt32(dr[0].ToString());
                    g = Convert.ToInt32(dr[1].ToString());
                    h = Convert.ToInt32(dr[2].ToString());
                }
                dr.Close();
                con.Close();



                r1 = r + 10;
                r2 = r - 10;

                g1 = g + 10;
                g2 = g - 10;

                h1 = h + 10;
                h2 = h - 10;


                data();
                //query = "select id from filedet where ((imgred > '" + r2 + "') and (imgred < '" + r1 + "')) and ((imggreen > '" + g2 + "') and (imggreen < '" + g1 + "')) and ((imgblue > '" + b2 + "')and (imgblue < '" + b1 + "')) and id <> " + filecount[i].ToString() + "";
                query = "select id from filedet where ((imgred > '" + r2 + "') and (imgred < '" + r1 + "')) and ((imggreen > '" + g2 + "') and (imggreen < '" + g1 + "')) and id <> " + filecount[i].ToString() + " and uname='" + lbluser.Text + "' ";
                // query = "select id from filedet where ((imgblue > '" + h2 + "') and (imgblue < '" + h1 + "')) and id <> " + filecount[i].ToString() + "";

                cmd = new SqlCommand(query, con);
                SqlDataReader fl = cmd.ExecuteReader();
                while (fl.Read())
                {
                    sm.Add(fl[0].ToString());
                }
                fl.Close();
                con.Close();
            }


        }

        for (int j = 0; j < sm.Count; j++)
        {
            data();
            query = "select Id,ftype,imgname,imgpath,tag1,tag2,tag3,fdescrip,imgred,imggreen,imgblue,uname,uplodate,filname,fsys from filedet where id=" + sm[j].ToString() + "";
            cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                data();
                query = "insert into similarfile(id,ftype,imgname,imgpath,tag1,tag2,tag3,fdescrip,imgred,imggreen,imgblue,uname,uplodate,filname,fsys)values(" + dr[0].ToString() + ",'" + dr[1].ToString() + "','" + dr[2].ToString() + "','" + dr[3].ToString() + "','" + dr[4].ToString() + "','" + dr[5].ToString() + "','" + dr[6].ToString() + "','" + dr[7].ToString() + "','" + dr[8].ToString() + "','" + dr[9].ToString() + "','" + dr[10].ToString() + "','" + dr[11].ToString() + "','" + dr[12].ToString() + "','" + dr[13].ToString() + "','" + dr[14].ToString() + "')";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();

            }
            dr.Close();
            con.Close();
        }
        GridView3.DataBind();

    }
    public void data()
    {
        string connstring = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        con = new SqlConnection(connstring);
        con.Open();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int imgid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString());
        data();
        query = "delete from filedet where Id=" + imgid + "";
        SqlDataSource1.DeleteCommand = query;
        SqlDataSource1.Delete();
        con.Close();
        GridView1.DataBind();
        Response.Redirect("viewimage.aspx");
      //  imagedatalist.DataBind();

    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    HttpContext.Current.Session["drop"] = DropDownList1.SelectedItem;
    //    Server.Transfer("imageHandler.ashx");
      //  data();
      //  string selectuserimage = "select Id,imgname from filedet where uname='" + lbluser.Text + "'";
      //  SqlDataAdapter imgdata = new SqlDataAdapter(selectuserimage, con);
      //  DataSet imgds = new DataSet();
      //  imgdata.Fill(imgds);
      //  imagedatalist.DataSource = imgds.Tables[0];
      //  imagedatalist.DataBind();

      ////  string.Format("newhand.ashx?ImID=" + lbluser.Text);
      //  string.Format("imageHandler.ashx?w=" + DropDownList1.SelectedItem);
      //  Response.Redirect("newhand.ashx?ImID=" +lbluser.Text);
        //Server.Transfer(string.Format("imageHandler.ashx?w=" + DropDownList1.SelectedItem));
   // }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int imgid = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0].ToString());
        data();
        query = "delete from filedet where Id=" + imgid + "";
        SqlDataSource2.DeleteCommand = query;
        SqlDataSource2.Delete();
        con.Close();
        GridView2.DataBind();
        Response.Redirect("viewimage.aspx");
    }
    protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ArrayList fh = new ArrayList();
        string fn = GridView3.DataKeys[e.RowIndex].Values[0].ToString();
        data();
        query = "select imgpath from filedet where Id='" + fn + "'";
        cmd = new SqlCommand(query, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            fh.Add(Server.MapPath(rd[0].ToString()));

        }
        rd.Close();
        con.Close();

        foreach (string file in fh)
        {
            FileInfo fi = new FileInfo(file);
            fi.Delete();
        }


        data();
        query = "delete from filedet where Id='" + fn.ToString() + "'";
        SqlDataSource4.DeleteCommand = query;
        SqlDataSource4.Delete();
        con.Close();
        GridView3.DataBind();
        Response.Redirect("viewimage.aspx");
    }
}
