<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PackageDetails.aspx.cs" Inherits="PackageDetails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style9
        {
            width: 90%;
            height: 42px;
        }
        .style12
        {
            width: 120px;
        }
        .style14
        {
            width: 76px;
        }
        .style16
        {
            width: 56px;
        }
        .style17
        {
            width: 119px;
        }
        .style18
        {
            width: 67px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align = "center" class="style9">
        <tr>
            <td class="style14">
                <asp:Label ID="Label1" runat="server" Text="City"></asp:Label>
            </td>
            <td class="style12">
                <asp:Label ID="lblCityname" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style16">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                <asp:Label ID="Label6" runat="server" Text="From Date"></asp:Label>
            </td>
            <td class="style12">
                <asp:Label ID="lblFromDate" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style16">
                <asp:Label ID="Label8" runat="server" Text="To Date"></asp:Label>
            </td>
            <td class="style17">
                <asp:Label ID="lblToDate" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style18">
                <asp:Label ID="Label10" runat="server" Text="Travelers"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblTravelers" runat="server" Text="Label"></asp:Label>
&nbsp;<asp:Label ID="Label12" runat="server" Text="Adults"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="gvPackages" runat="server" 
    onselectedindexchanged="gvPackages_SelectedIndexChanged" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
    GridLines="None" >
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="PackageId" HeaderText="PackageId" ReadOnly="True" 
                SortExpression="PackageId" />
            <asp:BoundField DataField="PackageName" HeaderText="PackageName" 
                ReadOnly="True" SortExpression="PackageName" />
            <asp:BoundField DataField="CityName" HeaderText="Location" ReadOnly="True" 
                SortExpression="CityName" />
            <asp:ButtonField ButtonType="Button" CommandName="Select" 
                HeaderText="Book This" ShowHeader="True" Text="Book This" />
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
</asp:GridView>
    <br />
    <br />
    <br />
</asp:Content>

