<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="requestdet.aspx.cs" Inherits="requestdet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 784px; height: 410px;">
        <tr>
            <td style="vertical-align: top">
                <asp:Label ID="Label1" runat="server" Text="Hi, Welcome"></asp:Label>
                &nbsp;<asp:Label ID="lbluser" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top; color: #f8f8ff;">
                Sent Request:</td>
        </tr>
        <tr>
            <td style="vertical-align: top">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#f8f8ff" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" Width="770px" OnRowDeleting="GridView2_RowDeleting" DataKeyNames="Id">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="touser" HeaderText="Req To" SortExpression="touser" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                        <asp:BoundField DataField="descrip" HeaderText="Description" SortExpression="descrip" />
                        <asp:BoundField DataField="imgname" HeaderText="Req Image" SortExpression="imgname" />
                        <asp:BoundField DataField="reqdate" HeaderText="Req Date" SortExpression="reqdate" />
                        <asp:BoundField DataField="reqtime" HeaderText="Req Time" SortExpression="reqtime" />
                           <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" >
                        <ItemStyle ForeColor="Dark blue" />
                        </asp:BoundField>
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#f8f8ff" />
                    <HeaderStyle BackColor="#f8f8ff" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#f8f8ff" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#f8f8ff" />
                    <SelectedRowStyle BackColor="#00008b" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#f8f8ff" />
                    <SortedAscendingHeaderStyle BackColor="#f8f8ff" />
                    <SortedDescendingCellStyle BackColor="#f8f8ff" />
                    <SortedDescendingHeaderStyle BackColor="#f8f8ff" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT touser, email, phone, descrip, imgname, reqdate, reqtime,Id,status FROM reqdet WHERE (fromuser = @fromuser) AND (sdel = 'no')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lbluser" Name="fromuser" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
      
        <tr>
            <td style="vertical-align: top; color: #00008b;">
                Received Request:
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top">
                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#f8f8ff" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Width="842px" DataKeyNames="Id" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="fromuser" HeaderText="Req From" SortExpression="fromuser" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                        <asp:BoundField DataField="descrip" HeaderText="Description" SortExpression="descrip" />
                        <asp:BoundField DataField="imgname" HeaderText="Req Image" SortExpression="imgname" />
                        <asp:BoundField DataField="reqdate" HeaderText="Req Date" SortExpression="reqdate" />
                        <asp:BoundField DataField="reqtime" HeaderText="Req Time" SortExpression="reqtime" />
                          <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" >
                        <ItemStyle ForeColor="Maroon" />
                        </asp:BoundField>
                        <asp:CommandField SelectText="Accept" ShowSelectButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#f8f8ff" />
                    <HeaderStyle BackColor="#f8f8ffB" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#f8f8ff" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#00008b" />
                    <SelectedRowStyle BackColor="#f8f8ff" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#f8f8ff" />
                    <SortedAscendingHeaderStyle BackColor="#f8f8ff" />
                    <SortedDescendingCellStyle BackColor="#f8f8ff" />
                    <SortedDescendingHeaderStyle BackColor="#f8f8ff" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [fromuser], [email], [phone], [descrip], [imgname], [reqdate], [reqtime],[status],[Id] FROM [reqdet] WHERE ([touser] = @touser)AND tdel='no'">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lbluser" Name="touser" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
               
            </td>
        </tr>
    </table>
</asp:Content>

