using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Windows.Forms.VisualStyles;
public partial class usersignup : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string query, gender;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void data()
    {
        string connstring = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        con = new SqlConnection(connstring);
        con.Open();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RadioButton1.Checked == true)
        {
            gender = "male";
        }
        else
        {
            gender = "female";
        }
        data();
        query = "insert into userdet(name,gender,phone,email,uname,pwd)values('" + txtname.Text + "','" + gender + "','" + txtphone.Text + "','" + txtemail.Text + "','" + txtusername.Text + "','" + txtpassword.Text + "')";
        cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        con.Close();
        MessageBox.Show("User Created Successfully");
        txtemail.Text = "";
        txtname.Text = "";
        txtphone.Text = "";
        txtusername.Text = "";
        txtpassword.Text = "";
    }

    public int randomnumber(int min, int max)
    {
        Random random = new Random();
        return random.Next(min, max);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (txtname.Text.Length < 3)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Name should be > 3 chars');", true);
            return;
        }
        else
        {
            int a = randomnumber(011, 999);
            int b = randomnumber(11121, 99899);
            txtusername.Text = txtname.Text.Substring(0, 3) + a.ToString();
            txtpassword.Text = b.ToString();
        }
    }
}
