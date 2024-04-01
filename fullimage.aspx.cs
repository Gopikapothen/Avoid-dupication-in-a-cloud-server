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
using System.Windows.Forms;
public partial class fullimage : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string query,a;
    string imageid;
    string imgname,touser,fname;
    protected void Page_Load(object sender, EventArgs e)
    {
        imageid = Request.QueryString["ImID"].ToString();
        imgname = Request.QueryString["profileid"].ToString();
        lblid.Text = Request.QueryString["ImID"].ToString();
        a = Session["user"].ToString();
        //data();
        //string selectquery = "select * from filedet where Id='" + imageid + "'";
        //SqlDataAdapter da = new SqlDataAdapter(selectquery, con);
        //DataSet ds = new DataSet();
        //da.Fill(ds);
        //imageDataList.DataSource = ds;
        //imageDataList.DataBind();
        //con.Close();
        if (!Page.IsPostBack)
        {
            data();
            query = "select pcount from filedet where imgname='" + imgname + "'";
            cmd = new SqlCommand(query, con);
            SqlDataReader rd1 = cmd.ExecuteReader();
            while (rd1.Read())
            {
                data();
                query = "update filedet set pcount=" + (Convert.ToInt32(rd1[0].ToString()) + 1) + " where imgname='" + imgname + "'";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            rd1.Close();
            con.Close();
        }
          
      
    }
    public void data()
    {
        string connstring = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        con = new SqlConnection(connstring);
        con.Open();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewotherimage.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        data();
        query = "select uname,orgfilename from filedet where Id=" + lblid.Text + "";
        cmd = new SqlCommand(query, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            touser = rd[0].ToString();
            fname = rd[1].ToString();
        }
        rd.Close();
        con.Close();

        data();
        query = "insert into reqdet(fromuser,email,phone,descrip,imgname,touser,reqdate,reqtime,status,sdel,tdel)values('" + a.ToString() + "','" + txtemail.Text + "','" + txtphone.Text + "','" + txtdescription.Text + "','" + fname + "','" + touser + "','" + System.DateTime.Today.ToShortDateString() + "','" + System.DateTime.Now.ToShortTimeString() + "','Not Accepted','no','no')";
        cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        con.Close();
        MessageBox.Show("Request Sent");
        txtdescription.Text = "";
        txtemail.Text = "";
        txtphone.Text = "";
    }
}