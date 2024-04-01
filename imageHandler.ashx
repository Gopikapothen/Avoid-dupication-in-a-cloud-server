<%@ WebHandler Language="C#" Class="imageHandler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web.Configuration;

public class imageHandler : IHttpHandler
{
    public string connstr = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    public string insertquery;
    public void ProcessRequest (HttpContext context) {
        string imageid = context.Request.QueryString["ImID"];
        int wid = 0, hei = 0;
        //wid = Convert.ToInt32(context.Request.QueryString["w"]);
      //  wid = context
        //if ((wid == 0))
        //{
        //    wid = 200;
        //    //hei = 200;
        //}
        //else
        //{
        //    wid = Convert.ToInt32(context.Request.QueryString["w"]);
        //}
            insertquery = "select imgpath from filedet where Id='" + imageid + "'";
           SqlConnection connection = new SqlConnection(connstr);
        connection.Open();

        SqlCommand command = new SqlCommand(insertquery, connection);
        SqlDataReader dr = command.ExecuteReader();
        dr.Read();

        Stream str = new MemoryStream((Byte[])dr[0]);
       

        Bitmap loBMP = new Bitmap(str);
        Bitmap bmpOut = new Bitmap(250, 250);

        Graphics g = Graphics.FromImage(bmpOut);
        g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
        g.FillRectangle(Brushes.White, 0, 0, 250, 250);
        g.DrawImage(loBMP, 0, 0, 250, 250);
       
        MemoryStream ms = new MemoryStream();
        bmpOut.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
        byte[] bmpBytes = ms.GetBuffer();
        bmpOut.Dispose();
        ms.Close();


        // byte[] bmpBytes = (byte[])System.ComponentModel.TypeDescriptor.GetConverter(bmpOut).ConvertTo(bmpOut, typeof(byte[]));

        context.Response.BinaryWrite(bmpBytes);

        connection.Close();
        context.Response.End();

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}