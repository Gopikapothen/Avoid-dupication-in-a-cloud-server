<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="userupload.aspx.cs" Inherits="userupload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 249px;
            height: 436px;
        }
        .auto-style3 {
            height: 436px;
        }
        .auto-style4 {
            height: 45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 753px; height: 287px;">
        <tr>
            <td class="auto-style2">
                <asp:Image ID="Image1" runat="server" Height="166px" ImageUrl="~/projimg/upload.png" Width="155px" />
            </td>
            <td class="auto-style3">
                <table style="height: 403px; width: 419px">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Hi,Welcome"></asp:Label>
            </td>
             <td>
                <asp:Label ID="lbluser" runat="server" Text="Label"></asp:Label>
                 !!!!</td>
        </tr>
                    <tr>
    <td>
        <asp:Label ID="Label6" runat="server" Text="Select Filesystem"></asp:Label>
    </td>
    <td>
        <asp:DropDownList ID="DropDownList1" runat="server" Font-Bold="True" 
            Font-Names="Cambria" ForeColor="Black">
            <asp:ListItem>Confidential</asp:ListItem>
            <asp:ListItem>Private</asp:ListItem>
            <asp:ListItem>Sensitive</asp:ListItem>
            <asp:ListItem>Public</asp:ListItem>
        </asp:DropDownList>
    </td>
</tr>
                    <tr>
                        <td>
                              <asp:Label ID="Label8" runat="server" Text="Filename"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtfilename" runat="server"></asp:TextBox>
                        </td>
                    </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Upload Image"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" Font-Bold="True" Font-Names="Cambria" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Text 1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txttag1" runat="server" Width="140px"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Text 2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txttag2" runat="server" Width="140px"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Text 3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txttag3" runat="server" Width="140px"></asp:TextBox>
            </td>
        </tr>
                      <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Description"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtdescrip" runat="server" Width="212px" Height="53px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Button ID="Button1" runat="server" Text="Upload" Font-Bold="True" Font-Names="Cambria" OnClick="Button1_Click" />
            </td>
            <td class="auto-style4">
                <asp:Button ID="Button2" runat="server" Text="Cancel" Font-Bold="True" Font-Names="Cambria" />
            </td>
        </tr>
    </table>
            </td>
        </tr>
    </table>
      
</asp:Content>

