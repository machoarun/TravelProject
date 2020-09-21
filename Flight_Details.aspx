<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Flight_Details.aspx.cs" Inherits="Flight_Details" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


 <table align ="center"  class="Datatable">
        <caption class="ReviewDetailCaption">
            Flight Details</caption>
        <tr>
            <td class="VehicleDetailsCol1">
                Ticket From</td>
            <td class="CheckCol1">
                <asp:Label ID="lblSource" runat="server" Font-Bold="True"></asp:Label>
            &nbsp;<b>To</b>
                <asp:Label ID="lblDestination" runat="server" 
                    style="position:static; right: 574px;" Font-Bold="True"></asp:Label>
            </td>
            <td class="ReviewDetailTitleColumns">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Travellers | </td>
            <td>
                <asp:Label runat="server" 
                    style="position:static; bottom: 452px; right: 334px;" ID="lblAdults" 
                    Font-Bold="True"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblChildrens" runat="server" 
                    style="position:static; top: 85px; left: 657px;" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="VehicleDetailsCol1">
                departure Date</td>
            <td class="CheckCol1">
                <asp:Label ID="lblDepartureDate" runat="server" Font-Bold="True"></asp:Label>
            </td>
            <td class="ReviewDetailTitleColumns">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="VehicleDetailsCol1">
                Departure Time Between</td>
            <td style ="width: 232px;">
                <asp:Label ID="lblDepTime1" runat="server" 
                    style="position:static; right: 669px;" Font-Bold="True"></asp:Label>
&nbsp;
                <b>&amp</b>&nbsp;
                <asp:Label ID="lblDepTime2" runat="server" 
                    style="position:static; top: 179px; left: 582px;" Font-Bold="True"></asp:Label>
                </td>
            <td style=" width: 120px; font-size: medium">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style ="  height: 23px;" colspan="4">
                
            </td>
        </tr>
        <tr>
            <td colspan="4">
                
                <asp:GridView ID="grdFlightDetails" runat="server" 
                    
                    style="z-index: 1; left: 13px; top: 234px; position: static; height: 133px; width: 187px" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    AutoGenerateColumns="False" 
                    onselectedindexchanged="grdFlightDetails_SelectedIndexChanged2" >
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="AirlinesName" HeaderText="FlightName" />
                        <asp:BoundField DataField="Source" HeaderText="Source" />
                        <asp:BoundField DataField="Destination" HeaderText="Destination" />
                        <asp:BoundField DataField="AdultFare" HeaderText="AdultFare" />
                        <asp:BoundField DataField="ChildFare" HeaderText="ChildFare" />
                        <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Button" 
                            ShowHeader="True" Text="Book This" />
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

