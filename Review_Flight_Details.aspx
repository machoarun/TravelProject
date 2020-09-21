<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Review_Flight_Details.aspx.cs" Inherits="Review_Flight_Details" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <div>
    
        
        <table  align ="center" class="ReviewTable1">
            <caption class="ReviewDetailCaption">
                Review Flight Details</caption>
            <tr>
                <td>
                    <asp:Label ID="lblSource" runat="server" Font-Bold="True"></asp:Label>
&nbsp;</td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;</b></td>
                <td>
                    <asp:Label ID="lblDestination" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr class="ReviewDetailTitleColumns">
                <td class ="ReviewDetailColumnDetails">
                    Flight No</td>
                <td class ="ReviewDetailColumnDetails">
                    AirLine</td>
                <td class ="ReviewDetailColumnDetails">
                    departure</td>
                <td class ="ReviewDetailColumnDetails">
                    ArrivaL</td>
                <td class ="ReviewDetailColumnDetails">
                    &nbsp;</td>
                <td class ="ReviewDetailColumnDetails">
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="lblFlightNo" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblAirlinesName" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblDepartureTime" runat="server" Font-Bold="True"> </asp:Label>
                    <asp:Label ID="lblDepartureDate" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td >
                    
                    <asp:Label ID="lblArrivalTime" runat="server" Font-Bold="True"></asp:Label>
                     <asp:Label ID="lblArrivalDate" runat="server" Font-Bold="True"></asp:Label>
                    
                </td>
                <td >
                   
                </td>
                <td>
                    &nbsp;</td>
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
                <td>
                    &nbsp;</td>
            </tr>
            <tr class="ReviewDetailCaption">
                <td colspan="6">
                    Review Fare Details</td>
            </tr>
            <tr class="ReviewDetailTitleColumns">
                <td class="ReviewDetailColumnDetails">
                    Traveller Type</td>
                <td class="ReviewDetailColumnDetails">
                    Quantity</td>
                <td class="ReviewDetailColumnDetails">
                    &nbsp;&nbsp; base
                    Fare</td>
                <td class="ReviewDetailColumnDetails">
                    Taxes</td>
                <td class="ReviewDetailColumnDetails" colspan="2">
                    Total Including Taxes</td>
            </tr>
            <tr>
                <td class="LabelStyle">
                    <asp:Label ID="lblAdults" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td class="LabelStyle">
                    <asp:Label ID="lblQuantityAdults" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td class="LabelStyle">
                    &nbsp;<b>Rs. </b><asp:Label ID="lblAdultFare" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td class="LabelStyle">
                    <b>Rs. </b><asp:Label ID="lblTaxesAdults" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td class="LabelStyle" colspan="2">
                   <b>Rs. </b><asp:Label ID="lblTotalAdultsFare" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="emptycellStyle">
                    <asp:Label ID="lblChildrens" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                <td class="emptycellStyle">
                    <asp:Label ID="lblQuantityChildrens" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                <td class="emptycellStyle">
                    &nbsp;<b>Rs. </b><asp:Label ID="lblChildFare" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                <td class="emptycellStyle"><b>Rs. </b>
                    <asp:Label ID="lblTaxesChildrens" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                <td class="emptycellStyle" colspan="2">
                    <b>Rs. </b><asp:Label ID="lblTotalChildFare" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="emptycellStyle" colspan="6">
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
                <td class="ReviewDetailTotalCalculation" colspan="2" rowspan="2">
                                        Grand Total &amp;&nbsp;&nbsp;
                    <b>Rs. </b><asp:Label ID="lblGrandTotal" runat="server" Font-Bold="True"></asp:Label>
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
                <td class="emptycellStyle" colspan="2" rowspan="2">
                    <asp:Button ID="btnBookFlight" runat="server" 
                        style="z-index: 1; left: 123px; top: 481px; position: static; width: 151px" 
                        Text=" Booking This Flight" onclick="btnBookFlight_Click" 
                        Font-Bold="True" BackColor="#99CCFF" />
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td colspan="2" class="emptycellStyle">
                    
                </td>
            </tr>
            <tr>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td colspan="2" class="emptycellStyle">
                    
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
                <td colspan="2" class="emptycellStyle">
                    
                </td>
            </tr>
            </table>
    
    </div>
</asp:Content>

