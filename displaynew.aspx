<%@ Page Language="C#" AutoEventWireup="true" CodeFile="displaynew.aspx.cs" Inherits="displaynew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Upload Image"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                     <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" CellSpacing="15" DataSourceID="SqlDataSource1" Width="39px">

                           <ItemTemplate>
                    <div>
                       <asp:Image ID="image1" runat="server" onmouseover="zoom(this)" ImageUrl='<%# Eval("fpath") %>' Height="200px" Width="200px" />
                        <br />
                         <%#Eval("fname") %>
                        </div>
                    </ItemTemplate>
                         
                    
                    <ItemStyle Width="50px" Height="50px" />
                     </asp:DataList>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [fpath], [fname] FROM [userfiledet] WHERE ([uname] = @uname)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="TextBox1" Name="uname" PropertyName="Text" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                </td>
            </tr>
        </table>
       
    </div>
    </form>
</body>
</html>
