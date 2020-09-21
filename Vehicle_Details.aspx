<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Vehicle_Details.aspx.cs" Inherits="Vehicle_Module_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <table align = "center"  class="datatable">
        <caption class="ReviewDetailCaption">
            Available Vehicles</caption>
        <tr>
            <td class="VehicleDetailsCol1">
                Journey Date</td>
            <td class="CheckCol1">
                <asp:Label ID="lblJourneyDate" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="ReviewDetailTitleColumns">
                City</td>
            <td>
                <asp:Label ID="lblCity" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="VehicleDetailsCol1">
                Journey Start Time</td>
            <td class="CheckCol1">
                <asp:Label ID="lblJourneyStartTime" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="ReviewDetailTitleColumns">
                Travel Type</td>
            <td>
                <asp:Label ID="lblTravelType" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="VehicleDetailsCol1">
                journey End Time</td>
            <td class="CheckCol1">
                <asp:Label ID="lblJourneyEndTime" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="VehicleDetailsCol2Width">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                
            </td>
        </tr>
        <tr>
            <td colspan="4">
                
                <asp:GridView ID="GridViewVehicleDetails" runat="server" 
                    
                    style="z-index: 1; left: 13px; top: 234px; position: static; height: 133px; width: 187px" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    onselectedindexchanged="GridViewVehicleDetails_SelectedIndexChanged" 
                    ShowFooter="True" AutoGenerateColumns="False" Width="214px">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="VehicleType" HeaderText="VehicleType" >
                            <HeaderStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CityName" HeaderText="City" >
                            <HeaderStyle Width="100px" />
                        </asp:BoundField>
                        <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Book" 
                            ShowHeader="True" Text="Select This" />
                    </Columns>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                
            </td>
        </tr>
        </table>



</asp:Content>

