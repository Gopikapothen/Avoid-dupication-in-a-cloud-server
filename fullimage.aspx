<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="fullimage.aspx.cs" Inherits="fullimage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style4 {
        width: 502px;
    }
    .auto-style5 {
        width: 128px;
    }
        .auto-style6 {
            width: 120px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="&lt;&lt;&lt; Back " Font-Bold="True" Font-Names="Cambria" OnClick="Button1_Click" />
                <asp:Label ID="lblid" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    <table style="width: 892px">
        <tr>
            <td class="auto-style4">

          
    <asp:DataList ID="imageDataList" runat="server" DataSourceID="SqlDataSource1">
     <%--   <ItemTemplate>
             <%#Eval("imgname") %>
            <br />
            <img src="<%#"imageHandler.ashx?ImID="+ Eval("Id")+"" %>" style="width: 500px; height: 500px" />
          
           
        </ItemTemplate>--%>
          <ItemTemplate>
                    <div>
                        
                       <asp:Image ID="image1" runat="server" onmouseover="zoom(this)" ImageUrl='<%# Eval("imgpath") %>' Height="500px" Width="500px" />
                        <br />
                         <%#Eval("orgfilename") %>
                        </div>
                    </ItemTemplate>
                    <ItemStyle Width="50px" Height="50px" />
           </asp:DataList>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [orgfilename], [imgpath], [Id] FROM [filedet] WHERE ([Id] = @Id)">
                      <SelectParameters>
                          <asp:ControlParameter ControlID="lblid" Name="Id" PropertyName="Text" Type="Int32" />
                      </SelectParameters>
                </asp:SqlDataSource>
                  </td>
            <td style="border: thin ridge #999999; vertical-align: top">
                <table style="height: 178px; width: 355px; background-color: #f8f8ff;">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Contact to Owner"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtemail" ForeColor="White" ValidationGroup="ddup"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Invalid email" ForeColor="White" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="ddup"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                        <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Phone"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtphone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtphone" ForeColor="Red" ValidationGroup="ddup"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                        <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Description"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtdescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtdescription" ForeColor="Red" ValidationGroup="ddup"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                        <tr>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Send" Font-Bold="True" Font-Italic="False" Font-Names="Cambria" OnClick="Button2_Click" ValidationGroup="ddup" />
                        </td>
                        <td>
                            <asp:Button ID="Button3" runat="server" Text="Cancel" Font-Bold="True" Font-Italic="False" Font-Names="Cambria" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

