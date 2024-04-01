using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
public partial class requestdet : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string query;
    protected void Page_Load(object sender, EventArgs e)
    {
        lbluser.Text = Session["user"].ToString();
        if (!Page.IsPostBack)
        {
            GridView1.DataBind();
        }
       
    }
    public void data()
    {
        string connstring = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        con = new SqlConnection(connstring);
        con.Open();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int epid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString());
        data();
        query = "update reqdet set tdel='yes',status='Cancelled' where Id='" + epid + "'";
        cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        con.Close();
        data();
        query = "delete from reqdet where Id=0";
        SqlDataSource1.DeleteCommand = query;
        SqlDataSource1.Delete();
        con.Close();
   
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string reqfrom = GridView1.SelectedRow.Cells[0].Text.ToString();
        string reqdate = GridView1.SelectedRow.Cells[5].Text.ToString();
        string reqtime = GridView1.SelectedRow.Cells[6].Text.ToString();
        string imgname = GridView1.SelectedRow.Cells[4].Text.ToString();
        string descrip = GridView1.SelectedRow.Cells[3].Text.ToString();
        data();
        query = "update reqdet set status='Accepted' where imgname='" + imgname + "' and descrip='" + descrip + "' and fromuser='" + reqfrom.ToString() + "' and reqdate='" + reqdate + "' and reqtime='" + reqtime + "'";
        cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.DataBind();
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int epid = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0].ToString());
        data();
        query = "update reqdet set sdel='yes',status='Cancelled' where Id='" + epid + "'";
        cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        con.Close();
        data();
        query = "delete from reqdet where Id=0";
        SqlDataSource2.DeleteCommand = query;
        SqlDataSource2.Delete();
        con.Close();
        GridView2.DataBind();
    }
}