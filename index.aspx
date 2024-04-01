<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="mainstyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 128px;
        }
        .auto-style2 {
            width: 461px;
        }
    </style>
</head>
<body style="background-color: #f8f8ff; height: 631px;">
    <a href="index.aspx">index.aspx</a>
    <form id="form1" runat="server" style="background-color: #f8f8ff; height: 630px;">
    <div>
    <table style="width: 1350px; height: 77px; background-color: #f8f8ff;">
        <tr>
            <td align="center" style="font-size: x-large; color: #000000">
               Auditing by a third party to eliminate duplication in a central cloud server
            </td>
        </tr>
    </table>
         <table style="width: 1350px; height: 16px; background-color: #f8f8ff;">
        <tr>
            <td align="center">
               
            </td>
        </tr>
    </table>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table style="width: 875px">
            <tr>
                <td align="center" class="auto-style2">

                    <asp:Image ID="Image1" runat="server" Height="205px" Width="197px" ImageUrl="~/projimg/login.png" />

                </td>
                <td>
                    <fieldset style="height: 190px; width: 358px">
                        <legend>
                            Login
                                     </legend>
                        <table style="height: 159px; width: 271px" align="center">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button1" runat="server" Text="Login" Font-Bold="True" Font-Names="Cambria" OnClick="Button1_Click" />
                                </td>
                                <td class="auto-style1">
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button2" runat="server" Text="Cancel" Font-Bold="True" Font-Names="Cambria" />
                                </td>
                            </tr>
                            <tr>
                                <td>

                                </td>
                                <td class="auto-style1">
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/usersignup.aspx">Signup</asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
