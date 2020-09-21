<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Review_Vehicle_Details.aspx.cs" Inherits="Vehicle_Module_Review_Vehicle_Details" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        
        <table  align ="center" class="ReviewTable1">
            <caption class="ReviewDetailCaption">
                Review Vehicle Details</caption>
            <tr class="ReviewDetailTitleColumns">
                <td class ="ReviewDetailColumnDetails">
                    Car Name</td>
                <td class ="ReviewDetailColumnDetails">
                    Departure Date</td>
                <td class ="ReviewDetailColumnDetails">
                    Departure Time</td>
                <td class ="ReviewDetailColumnDetails">
                    Return Date</td>
                <td class ="ReviewDetailColumnDetails">
                    Arrival Time</td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="lblCarName" runat="server" Text="Label"></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblDepartureDate" runat="server" Text="Label"></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblDepaertureTime" runat="server" Text="Label"></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblReturnDate" runat="server" Text="Label"></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblArrivalTime" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr class="ReviewDetailCaption">
                <td colspan="5">
                    Review Fare Details</td>
            </tr>
            <tr class="ReviewDetailTitleColumns">
                <td class="ReviewDetailColumnDetails">
                    Travel Type</td>
                <td class="ReviewDetailColumnDetails">
                    Fare</td>
                <td class="ReviewDetailColumnDetails">
                    Taxes</td>
                <td class="ReviewDetailColumnDetails">
                    &nbsp;</td>
                <td class="ReviewDetailColumnDetails">
                    Total Including Taxes</td>
            </tr>
            <tr>
                <td class="LabelStyle">
                    <asp:Label ID="lblTravelType" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="LabelStyle">
                    <asp:Label ID="lblFare" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="LabelStyle">
                    <asp:Label ID="lblTaxes" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="LabelStyle">
                    &nbsp;</td>
                <td class="LabelStyle">
                    <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="ReviewDetailTotalCalculation" rowspan="2">
                    Grand Total :
                    <asp:Label ID="lblGrandTotal" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr class="emptycellStyle">
                <td>
                    </td>
                <td >
                    </td>
                <td >
                    </td>
                <td >
                    </td>
            </tr>
            <tr>
                <td class="emptycellStyle">
                    &nbsp;</td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td rowspan="3">
                    <asp:Button ID="btnContinueBooking" runat="server" 
                        style="z-index: 1; left: 758px; top: 420px; position: static; width: 151px" 
                        Text="Continue Booking" onclick="btnContinueBooking_Click" />
                </td>
            </tr>
            <tr>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
            </tr>
            <tr>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
            </tr>
            </table>
    
    
    </asp:Content>

