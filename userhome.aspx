<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="userhome.aspx.cs" Inherits="userhome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style4 {
        width: 112px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="height: 264px; width: 559px">
        <tr>
            <td>

    <table style="height: 161px; width: 230px">
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Label1" runat="server" Text="Hi, Welcome"></asp:Label>
            </td>
              <td>
                <asp:Label ID="lbluser" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
           <tr>
            <td class="auto-style4">
                <asp:Label ID="Label2" runat="server" Text="Date"></asp:Label>
            </td>
              <td>
                <asp:Label ID="lbldate" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
           <tr>
            <td class="auto-style4">
                <asp:Label ID="Label3" runat="server" Text="Time"></asp:Label>
            </td>
              <td>
                <asp:Label ID="lbltime" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
                
            </td>
            <td>
                <asp:Image ID="Image1" runat="server" Height="223px" ImageUrl="~/projimg/homeuser.png" Width="259px" />
            </td>
        </tr>
    </table>

</asp:Content>

