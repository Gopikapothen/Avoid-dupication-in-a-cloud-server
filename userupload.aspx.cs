using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Collections;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Windows.Forms;
public partial class userupload : System.Web.UI.Page
{
    SqlConnection con;
    string destdir2, filename2, onlyfilename2, Onlyext2, orgfilename2, Destpath2, dpath2,Destpath,mfilename,Destpath1;
    string duplifile;
    string avgR, avgG, avgB;
    SqlCommand cmd;
    string query;
    int count;
    protected void Page_Load(object sender, EventArgs e)
    {
        lbluser.Text = Session["user"].ToString();
    }
    public void data()
    {
        string connstring = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        con = new SqlConnection(connstring);
        con.Open();
    }
    protected void waterMarkImage(Bitmap imgBmp, string tmpName)
    {
        string sWaterMark = lbluser.Text;
        int fontsize = ((imgBmp.Width * 2) / (sWaterMark.Length * 3));
        int x = imgBmp.Width / 2;
        int y = imgBmp.Height * 4 / 10;

        StringFormat drawFormat = new StringFormat();
        drawFormat.Alignment = StringAlignment.Center;
        drawFormat.FormatFlags = StringFormatFlags.NoWrap;


        //drawing string on Image
        Graphics graphic = Graphics.FromImage(imgBmp);
        graphic.DrawString(sWaterMark, new Font("Verdana", fontsize, FontStyle.Bold), new SolidBrush(Color.FromArgb(80, 255, 255, 255)), x, y, drawFormat);
        imgBmp.Save(MapPath("~/userimg/" + orgfilename2));

        //*********************************Duplication*********************
        Bitmap bmp = new Bitmap(1, 1);
        Bitmap orig = (Bitmap)Bitmap.FromFile(Destpath2);
        using (Graphics g = Graphics.FromImage(bmp))
        {
            g.DrawImage(orig, new Rectangle(0, 0, 1, 1));
        }
        Color pixel = bmp.GetPixel(0, 0);
        avgR = pixel.R.ToString();
        avgG = pixel.G.ToString();
        avgB = pixel.B.ToString();
        //*********************************Ends***********************************

      
        mfilename = tmpName + orgfilename2;
        Destpath = "~/img/" + tmpName + orgfilename2;
        imagepath = Server.MapPath("./img/") + mfilename;
        ownerimagepath = Server.MapPath("./ownimage/") + mfilename;
        data();
        query = "select imgred,imggreen,imgblue from filedet where imgred='" + avgR + "' and imggreen='" + avgG + "' and imgblue='" + avgB + "' and uname='" + lbluser.Text + "'";
        cmd = new SqlCommand(query, con);
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
           
            MessageBox.Show("Image Already Uploaded");
        }
        else
        {
            imgBmp.Save(MapPath("~/img/" + tmpName + orgfilename2));
            string ownpath = "~/ownimage/" + tmpName + orgfilename2;
            FileUpload1.PostedFile.SaveAs(Server.MapPath("./ownimage/") + tmpName + orgfilename2);
            data();
            query = "insert into filedet(uname,imgname,imgpath,uplodate,uplotime,tag1,tag2,tag3,imgred,imggreen,imgblue,orgfilename,pcount,ncount,ownerpath,ftype,fdescrip,filname,fsys,image_path,owner_path)values('" + lbluser.Text + "','" + mfilename + "','" + Destpath + "','" + System.DateTime.Today.ToShortDateString() + "','" + System.DateTime.Now.ToShortTimeString() + "','" + txttag1.Text + "','" + txttag2.Text + "','" + txttag3.Text + "','" + avgR + "','" + avgG + "','" + avgB + "','" + orgfilename2 + "',0,0,'" + ownpath + "','" + Onlyext2 + "','" + txtdescrip.Text + "','" + txtfilename.Text + "','" + DropDownList1.SelectedItem + "','" + imagepath.ToString() + "','" + ownerimagepath.ToString() + "')";
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            string n = tmpName + orgfilename2;
            //data();
            //query = "insert into imgcntdet(imgname,pcount,ncount,orgfilename)values('" + n.ToString() + "',0,0,'" + orgfilename2 + "')";
            //cmd = new SqlCommand(query, con);
            //cmd.ExecuteNonQuery();
            //con.Close();
            MessageBox.Show("Image Uploaded");
        }
        rd.Close();
        con.Close();
        if (graphic != null) graphic.Dispose();
    }
    ArrayList docname = new ArrayList();
    ArrayList filecount = new ArrayList();
    bool a, b;
    string imagepath, documentpath,ownerimagepath;
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Array.ForEach(Directory.GetFiles(Server.MapPath("./userimg")), File.Delete);

        destdir2 = Server.MapPath("./img");
        filename2 = Path.GetFileName(FileUpload1.PostedFile.FileName);
        onlyfilename2 = Path.GetFileNameWithoutExtension(FileUpload1.PostedFile.FileName);
        Onlyext2 = Path.GetExtension(FileUpload1.PostedFile.FileName);
        orgfilename2 = onlyfilename2 + Onlyext2;
       // Destpath2 = Path.Combine(destdir2, orgfilename2);
        Destpath2 = Server.MapPath("./userimg/")+orgfilename2;
        Destpath1 = Server.MapPath("./useruploads/") + orgfilename2;
        //FileUpload1.PostedFile.SaveAs(Destpath2);
        Onlyext2 = Path.GetExtension(FileUpload1.PostedFile.FileName);

      string tempdir = Server.MapPath("./usertemp");
      string tpath = Path.Combine(tempdir, orgfilename2);
      FileUpload1.PostedFile.SaveAs(tpath);

        if ((Onlyext2 == ".jpg") || (Onlyext2 == ".bmp") || (Onlyext2 == ".jpeg"))
        {
            string tmpName = Guid.NewGuid().ToString();
            Bitmap original_image = new Bitmap(FileUpload1.FileContent);
            waterMarkImage(original_image, tmpName);
            if (original_image != null) original_image.Dispose();
        }
        //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        //****************************************************************************************************
        //For doc
        if (Onlyext2 == ".doc")
        {

            data();
            query = "select imgname from filedet where uname='" + lbluser.Text + "' and ftype='.doc'";
            cmd = new SqlCommand(query, con);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                docname.Add(rd[0].ToString());
            }
            rd.Close();
            con.Close();
            count = docname.Count;

            if (count == 0)
            {
                FileUpload1.PostedFile.SaveAs(Destpath1);
                data();
                query = "insert into filedet(uname,imgname,uplodate,uplotime,tag1,tag2,tag3,ftype,fdescrip,filname,imgpath,fsys,image_path)values('" + lbluser.Text + "','" + orgfilename2 + "','" + System.DateTime.Today.ToShortDateString() + "','" + System.DateTime.Now.ToShortTimeString() + "','" + txttag1.Text + "','" + txttag2.Text + "','" + txttag3.Text + "','" + Onlyext2 + "','" + txtdescrip.Text + "','" + txtfilename.Text + "','" + Destpath1 + "','" + DropDownList1.SelectedItem + "','" + Destpath1 + "')";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("User File Uploaded");
            }
            else
            {
                for (int j = 0; j < count; j++)
                {
                    
                    a = FileEquals((Server.MapPath("useruploads/" + docname[j].ToString())), tpath);
                    if (a == true)
                    {
                        MessageBox.Show("File Already Exists");
                        Response.Redirect("userupload.aspx");
                        //System.Environment.Exit(1);

                    }
                    else
                    {
                        //FileUpload1.PostedFile.SaveAs(Destpath1);
                        //data();
                        //query = "insert into filedet(ftype,fname,filname,fpath,fext,ftag1,ftag2,ftag3,ftext,uname)values('" + DropDownList1.SelectedItem + "','" + txtfilename.Text + "','" + orgfilename1 + "','" + Destpath1 + "','" + Onlyext1 + "','" + txttag1.Text + "','" + txttag2.Text + "','" + txttag3.Text + "','" + txtfiletext.Text + "','" + uname + "')";
                        //cmd = new SqlCommand(query, con);
                        //cmd.ExecuteNonQuery();
                        //con.Close();
                        //MessageBox.Show("User File Uploaded");
                        ////MessageBox.Show("File not Exists");
                    }

                }
                FileUpload1.PostedFile.SaveAs(Destpath1);
                data();
                query = "insert into filedet(uname,imgname,uplodate,uplotime,tag1,tag2,tag3,ftype,fdescrip,filname,imgpath,fsys,image_path)values('" + lbluser.Text + "','" + orgfilename2 + "','" + System.DateTime.Today.ToShortDateString() + "','" + System.DateTime.Now.ToShortTimeString() + "','" + txttag1.Text + "','" + txttag2.Text + "','" + txttag3.Text + "','" + Onlyext2 + "','" + txtdescrip.Text + "','" + txtfilename.Text + "','" + Destpath1 + "','" + DropDownList1.SelectedItem + "','" + Destpath1 + "')";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("User File Uploaded");


            }


        }
        //******************************************************************************************************
        //For .txt
        if (Onlyext2 == ".txt")
        {

            data();
            query = "select imgname from filedet where uname='" + lbluser.Text + "' and ftype='.txt'";
            cmd = new SqlCommand(query, con);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                docname.Add(rd[0].ToString());
            }
            rd.Close();
            con.Close();
            count = docname.Count;

            if (count == 0)
            {
                FileUpload1.PostedFile.SaveAs(Destpath1);
                data();
                query = "insert into filedet(uname,imgname,uplodate,uplotime,tag1,tag2,tag3,ftype,fdescrip,filname,imgpath,fsys,image_path)values('" + lbluser.Text + "','" + orgfilename2 + "','" + System.DateTime.Today.ToShortDateString() + "','" + System.DateTime.Now.ToShortTimeString() + "','" + txttag1.Text + "','" + txttag2.Text + "','" + txttag3.Text + "','" + Onlyext2 + "','" + txtdescrip.Text + "','" + txtfilename.Text + "','" + Destpath1 + "','" + DropDownList1.SelectedItem + "','" + Destpath1 + "')";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("User File Uploaded");
            }
            else
            {
                for (int j = 0; j < count; j++)
                {
                    a = FileEquals((Server.MapPath("useruploads/" + docname[j].ToString())), tpath);
                    if (a == true)
                    {
                        MessageBox.Show("File Already Exists");
                        Response.Redirect("uploadcontents.aspx");
                        //System.Environment.Exit(1);

                    }
                    else
                    {

                    }

                }
                FileUpload1.PostedFile.SaveAs(Destpath1);
                data();
                query = "insert into filedet(uname,imgname,uplodate,uplotime,tag1,tag2,tag3,ftype,fdescrip,filname,imgpath,fsys,image_path)values('" + lbluser.Text + "','" + orgfilename2 + "','" + System.DateTime.Today.ToShortDateString() + "','" + System.DateTime.Now.ToShortTimeString() + "','" + txttag1.Text + "','" + txttag2.Text + "','" + txttag3.Text + "','" + Onlyext2 + "','" + txtdescrip.Text + "','" + txtfilename.Text + "','" + Destpath1 + "','" + DropDownList1.SelectedItem + "','" + Destpath1 + "')";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("User File Uploaded");
                //MessageBox.Show("File not Exists");


            }
        }
        //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        txttag1.Text = "";
        txttag2.Text = "";
        txttag3.Text = "";
        txtdescrip.Text = "";
        txtfilename.Text = "";

    }
    static bool FileEquals(string path1, string path2)
    {
        byte[] file1 = File.ReadAllBytes(path1);
        byte[] file2 = File.ReadAllBytes(path2);
        if (file1.Length == file2.Length)
        {
            for (int i = 0; i < file1.Length; i++)
            {
                if (file1[i] != file2[i])
                {
                    return false;
                }
            }
            return true;
        }
        return false;
    }
}