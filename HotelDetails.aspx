<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HotelDetails.aspx.cs" Inherits="HotelDetails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .style1
        {
            width: 750px;
        }
        .style3
        {
        }
        .CheckCol1
        {
        	height: 45px;
            width: 180px;
            width: 232px;
        }
        .style6
        {
            font-weight: bold;
            font-size: large;
            text-transform: capitalize;
            width: 180px;
        }
        .style7
        {
            font-weight: bold;
            font-size: large;
            text-transform: capitalize;
            width: 146px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table class="style1">
        <caption class="ReviewDetailCaption">
            Display Hotel Details</caption>
        <tr>
            <td class="style6">
                City</td>
            <td class="CheckCol1">
                <asp:Label ID="lblCity" runat="server"></asp:Label>
            </td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Arrival Date</td>
            <td class="CheckCol1">
                <asp:Label ID="lblArrivalDate" runat="server"></asp:Label>
            </td>
            <td class="style7">
                depart Date</td>
            <td>
                <asp:Label ID="lblDeptDate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Deluxe Rooms</td>
            <td class="CheckCol1">
                <asp:Label ID="lblDelRooms" runat="server"></asp:Label>
            </td>
            <td class="style7">
                EXE Rooms</td>
            <td>
                <asp:Label ID="lblExeRooms" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="4">
                
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="4">
                
                <asp:GridView ID="dgvDisplayDetails" runat="server" 
                    
                    style="z-index: 1; left: 13px; top: 234px; position: static; height: 133px; width: 187px" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    onselectedindexchanged="dgvDisplayDetails_SelectedIndexChanged" 
                    DataSourceID="ObjectDataSource1" AutoGenerateColumns="False">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="HotelName" HeaderText="Hotel Name" />
                        <asp:BoundField DataField="Location" HeaderText="Location" />
                        <asp:CommandField ButtonType="Button" EditText="edit " SelectText="Book This" 
                            ShowSelectButton="True" />
                    </Columns>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                
                <br />
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="FindHotelByLocation" TypeName="HotelDataBaseLayer">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="City_Name" SessionField="City" 
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <br />
                
            </td>
        </tr>
        </table>

</asp:Content>

