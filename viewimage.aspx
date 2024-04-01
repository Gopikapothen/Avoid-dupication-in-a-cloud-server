<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="viewimage.aspx.cs" Inherits="viewimage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:767px; height: 137px;">
         <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Welcome"></asp:Label>
           
                &nbsp;<asp:Label ID="lbluser" runat="server" Text="Label"></asp:Label>
                 !!!!</td>
        </tr>
 
        <tr>
            <td>
               <%-- <asp:DataList ID="imagedatalist" runat="server" RepeatColumns="5" CellSpacing="15" >
                     <ItemTemplate>
               <img src="<%#"imageHandler.ashx?ImID="+ Eval("Id")+"" %>" style="width:200px;height:200px;" />
                       <br />
                          <%#Eval("Id") %>
                         -
            <%#Eval("imgname") %>
                </ItemTemplate>
                </asp:DataList>--%>

                 <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" CellSpacing="15" DataSourceID="SqlDataSource2" Width="39px">

                           <ItemTemplate>
                    <div>
                       <asp:Image ID="image1" runat="server" onmouseover="zoom(this)" ImageUrl='<%# Eval("ownerpath") %>' Height="200px" Width="200px" />
                        <br />
                         <%#Eval("orgfilename") %>
                        </div>
                    </ItemTemplate>
                         
                    
                    <ItemStyle Width="50px" Height="50px" />
                     </asp:DataList>
   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT ownerpath, orgfilename FROM filedet WHERE (uname = @uname)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="lbluser" Name="uname" PropertyName="Text" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                       </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                Image Uploads:<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" OnRowDeleting="GridView1_RowDeleting" Width="575px">
                    <Columns>
                        <asp:BoundField DataField="orgfilename" HeaderText="Filename" SortExpression="orgfilename" />
                        <asp:BoundField DataField="uplodate" HeaderText="Uploaded Date" SortExpression="uplodate" />
                        <asp:BoundField DataField="uplotime" HeaderText="Uploaded Time" SortExpression="uplotime" />
                         <asp:BoundField DataField="imgred" HeaderText="R" SortExpression="imgred" />
                        <asp:BoundField DataField="imggreen" HeaderText="G" SortExpression="imggreen" />
                        <asp:BoundField DataField="imgblue" HeaderText="B" SortExpression="imgblue" />
                        
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [Id], [orgfilename], [uplodate], [uplotime], [imgred], [imgblue], [imggreen]  FROM [filedet] WHERE (([uname] = @uname) AND (([ftype] = @ftype) OR ([ftype] = @ftype2) OR ([ftype] = @ftype3)))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lbluser" Name="uname" PropertyName="Text" Type="String" />
                         <asp:Parameter DefaultValue=".jpg" Name="ftype" Type="String" />
                         <asp:Parameter DefaultValue=".bmp" Name="ftype2" Type="String" />
                         <asp:Parameter DefaultValue=".png" Name="ftype3" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                Files Uploads:<br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource3" GridLines="Vertical" Width="527px" DataKeyNames="Id" OnRowDeleting="GridView2_RowDeleting">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="filname" HeaderText="File Name" SortExpression="filname" />
                        <asp:BoundField DataField="fdescrip" HeaderText="File Description" SortExpression="fdescrip" />
                        <asp:BoundField DataField="ftype" HeaderText="File Type" SortExpression="ftype" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [Id], [filname], [fdescrip], [ftype] FROM [filedet] WHERE (([uname] = @uname) AND (([ftype] = @ftype) OR ([ftype] = @ftype2)))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lbluser" Name="uname" PropertyName="Text" Type="String" />
                        <asp:Parameter DefaultValue=".doc" Name="ftype" Type="String" />
                        <asp:Parameter DefaultValue=".txt" Name="ftype2" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
      
    </table>
    <table>
          <tr>
            <td>
                Similar Images
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource4" Width="885px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" OnRowDeleting="GridView3_RowDeleting">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                           <asp:TemplateField>
                     <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("imgpath") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <div>
                       <asp:Image ID="image1" runat="server" onmouseover="zoom(this)" ImageUrl='<%# Eval("imgpath") %>' />
                        </div>
                    </ItemTemplate>
                    <ControlStyle Height="100px" Width="100px" />
                    
                    <ItemStyle Width="100px" Height="100px" />
                    
                    </asp:TemplateField>
                        <asp:BoundField DataField="fsys" HeaderText="File System" SortExpression="fsys" />
                        <asp:BoundField DataField="filname" HeaderText="Imagename" SortExpression="filname" />
                        <asp:BoundField DataField="tag1" HeaderText="Tag1" SortExpression="tag1" />
                        <asp:BoundField DataField="tag2" HeaderText="Tag2" SortExpression="tag2" />
                        <asp:BoundField DataField="tag3" HeaderText="Tag3" SortExpression="tag3" />
                        <asp:BoundField DataField="imgred" HeaderText="R" SortExpression="imgred" />
                        <asp:BoundField DataField="imggreen" HeaderText="G" SortExpression="imggreen" />
                        <asp:BoundField DataField="imgblue" HeaderText="B" SortExpression="imgblue" />
                        <asp:BoundField DataField="uplodate" HeaderText="Date" SortExpression="uplodate" />
                           <asp:CommandField ShowDeleteButton="True">
                           <ItemStyle ForeColor="#3333FF" />
                           </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [imgname], [imgpath], [tag1], [tag2], [tag3], [imgred], [imggreen], [imgblue], [uplodate], [Id], [fsys], [filname] FROM [similarfile]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

