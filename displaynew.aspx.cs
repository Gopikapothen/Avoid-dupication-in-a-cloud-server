using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
public partial class displaynew : System.Web.UI.Page
{
    SqlConnection con;
    string destdir2, filename2, onlyfilename2, Onlyext2, orgfilename2, Destpath2, dpath2,Destpath;
    string avgR, avgG, avgB;
    SqlCommand cmd;
    string query;
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

        destdir2 = Server.MapPath("./img");
        filename2 = Path.GetFileName(FileUpload1.PostedFile.FileName);
        onlyfilename2 = Path.GetFileNameWithoutExtension(FileUpload1.PostedFile.FileName);
        Onlyext2 = Path.GetExtension(FileUpload1.PostedFile.FileName);
        orgfilename2 = onlyfilename2 + Onlyext2;
        Destpath2 = Path.Combine(destdir2, orgfilename2);
        Destpath = "~/img/" + orgfilename2;
        //FileUpload1.PostedFile.SaveAs(Destpath2);


        string tmpName = Guid.NewGuid().ToString();
        Bitmap original_image = new Bitmap(FileUpload1.FileContent);
        waterMarkImage(original_image, tmpName);
        if (original_image != null) original_image.Dispose();

        data();
        query = "insert into userfiledet(fname,fpath,uname)values('" + orgfilename2 + "','" + Destpath + "','" + TextBox1.Text + "')";
        cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        con.Close();

    }
    protected void waterMarkImage(Bitmap imgBmp, string tmpName)
    {
        string sWaterMark = TextBox1.Text;
        int fontsize = ((imgBmp.Width * 2) / (sWaterMark.Length * 3));
        int x = imgBmp.Width / 2;
        int y = imgBmp.Height * 4 / 10;

        StringFormat drawFormat = new StringFormat();
        drawFormat.Alignment = StringAlignment.Center;
        drawFormat.FormatFlags = StringFormatFlags.NoWrap;


        //drawing string on Image
        Graphics graphic = Graphics.FromImage(imgBmp);
        graphic.DrawString(sWaterMark, new Font("Verdana", fontsize, FontStyle.Bold), new SolidBrush(Color.FromArgb(80, 255, 255, 255)), x, y, drawFormat);

        imgBmp.Save(MapPath("~/img/" + orgfilename2));
       // imgResult.ImageUrl = "~/img/" + tmpName + Path.GetExtension(fpImage.FileName);

        if (graphic != null) graphic.Dispose();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataList1.DataBind();
    }
}