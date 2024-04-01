<%@ Page Language="C#" AutoEventWireup="true" CodeFile="usersignup.aspx.cs" Inherits="usersignup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="mainstyle.css" rel="stylesheet" type="text/css" />
  
    <style type="text/css">
        .auto-style1 {
            width: 440px;
        }
        .auto-style2 {
            width: 78px;
        }
    </style>
  
</head>
<body style="background-color: #f8f8ff; height: 631px;">
    <form id="form1" runat="server" style="background-color: #f8f8ff; height: 630px;">
    <div>
    <table style="width: 1350px; height: 77px; background-color: #f8f8ff;">
        <tr>
            <td align="center" style="font-size: x-large; color: #000000;">
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
        <table style="width: 804px; height: 390px">
            <tr>
                <td class="auto-style1" align="center">

                    <asp:Image ID="Image1" runat="server" Height="351px" ImageUrl="~/projimg/user black.png" Width="327px" />

                </td>
                <td>
                    <fieldset style="height: 356px; width: 348px">
                        <legend>
                            User signup
                        </legend>
                        <table style="height: 160px; width: 347px">
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtname" ForeColor="Red" ValidationGroup="ddup"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label2" runat="server" Text="Gender"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButton ID="RadioButton1" runat="server" Text="Male" GroupName="gender" Checked="true" />
                                    <asp:RadioButton ID="RadioButton2" runat="server" Text="Female" GroupName="gender" />
                                </td>
                            </tr>
                             <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label3" runat="server" Text="Phone No"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtphone" runat="server" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtphone" ForeColor="Red" ValidationGroup="ddup"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtphone"
                                            ErrorMessage="10 digits" ValidationExpression="\d{10}" ForeColor="Red" ValidationGroup="ddup"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                             <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtemail" ForeColor="Red" ValidationGroup="ddup"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="invalid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="ddup"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            </table>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="Button3" runat="server" Text="Generate Username & Passsword" Font-Bold="True" Font-Names="Cambria" OnClick="Button3_Click" />
                                </td>
                            </tr>
                            </table>
                        <table style="height: 139px; width: 328px">
                             <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text="Username"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtusername" runat="server" BorderStyle="None" Enabled="False"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtpassword" runat="server" BorderStyle="None" Enabled="False"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="Save" Font-Bold="True" Font-Names="Cambria" Width="52px" OnClick="Button1_Click" ValidationGroup="ddup" />
                                </td>
                                <td>
                                    <asp:Button ID="Button2" runat="server" Text="Cancel" Font-Bold="True" Font-Names="Cambria" />
                                &nbsp;&nbsp;&nbsp;
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/index.aspx">&lt;&lt;&lt; Back to Login</asp:HyperLink>
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
