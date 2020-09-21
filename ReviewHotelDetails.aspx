<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReviewHotelDetails.aspx.cs" Inherits="ReviewHotelDetails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 53px;
            width: 98px;
        }
        .style2
        {
            width: 98px;
        }
        .style3
        {
            height: 23px;
            width: 98px;
        }
        .style4
        {
            height: 15px;
            width: 98px;
        }
        .style5
        {
            height: 53px;
        }
        .style6
        {
        }
        .style7
        {
            height: 23px;
            width: 107px;
        }
        .style8
        {
            height: 15px;
            width: 107px;
        }
        .style9
        {
            border-style: dashed none dashed none;
            font-weight: bold;
            text-transform: capitalize;
            width: 107px;
        }
        .style10
        {
            height: 35px;
        }
        .style11
        {
            height: 35px;
            width: 98px;
        }
        .style12
        {
            height: 23px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <div>
    
        
        <table  align ="center" class="ReviewTable1">
            <caption class="ReviewDetailCaption">
                Review Hotel Details</caption>
            <tr class="ReviewDetailTitleColumns">
                <td class ="ReviewDetailColumnDetails">
                    Hotel Name</td>
                <td class ="ReviewDetailColumnDetails">
                    Chk In Date</td>
                <td class ="ReviewDetailColumnDetails">
                    Chk Out Time</td>
                <td class ="style1">
                    DLX Rooms</td>
                <td class ="style5" colspan="2">
                    EXE Rooms </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="lblHotelName" runat="server"></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblCID" runat="server"></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblCOD" runat="server"></asp:Label>
                </td>
                <td class="style2" >
                    <asp:Label ID="lblDLX" runat="server"></asp:Label>
                </td>
                <td class="style6" colspan="2" >
                    <asp:Label ID="lblEXE" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
                <td class="style2" >
                    &nbsp;</td>
                <td class="style6" colspan="2" >
                    &nbsp;</td>
            </tr>
            <tr class="ReviewDetailCaption">
                <td colspan="5">
                    Review Fare Details</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr class="ReviewDetailTitleColumns">
                <td class="ReviewDetailColumnDetails">
                    Room Type</td>
                <td class="ReviewDetailColumnDetails">
                    Fare Per Day</td>
                <td class="ReviewDetailColumnDetails">
                    No of Rooms</td>
                <td class="style1">
                    Fare</td>
                <td class="style5">
                    Tax</td>
                <td class="ReviewDetailColumnDetails">
                    total Amount </td>
            </tr>
            <tr>
                <td class="LabelStyle">
                    <asp:Label ID="lblRoomType1" runat="server" Text="DLX"></asp:Label>
                </td>
                <td class="LabelStyle">
                    Rs.<asp:Label ID="lblFPD1" runat="server"></asp:Label>
                </td>
                <td class="LabelStyle">
                    <asp:Label ID="lblNOR1" runat="server"></asp:Label>
                </td>
                <td class="style3">
                    Rs.<asp:Label ID="lblFare1" runat="server"></asp:Label>
                </td>
                <td class="style7">
                    Rs.<asp:Label ID="lblTax1" runat="server"></asp:Label>
                </td>
                <td class="LabelStyle">
                    Rs.<asp:Label ID="lblAmount1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="emptycellStyle">
                    <asp:Label ID="lblRoomType2" runat="server" Text="EXE"></asp:Label>
                    </td>
                <td class="emptycellStyle">
                    Rs.<asp:Label ID="lblFPD2" runat="server"></asp:Label>
                    </td>
                <td class="emptycellStyle">
                    <asp:Label ID="lblNOR2" runat="server"></asp:Label>
                    </td>
                <td class="style4">
                    Rs.<asp:Label ID="lblFare2" runat="server"></asp:Label>
                    </td>
                <td class="style8">
                    Rs.<asp:Label ID="lblTax2" runat="server"></asp:Label>
                </td>
                <td class="emptycellStyle">
                    Rs.<asp:Label ID="lblAmount2" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style10">
                    </td>
                <td class="style10">
                    </td>
                <td class="style10">
                    </td>
                <td class="style11">
                    </td>
                <td class="style9" rowspan="2">
                    Grand Total :</td>
                <td class="ReviewDetailTotalCalculation" rowspan="2">
                    Rs.<asp:Label ID="lblGTotal" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="emptycellStyle">
                <td>
                    </td>
                <td >
                    </td>
                <td >
                    </td>
                <td class="style2" >
                    </td>
            </tr>
            <tr>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style3">
                    </td>
                <td rowspan="3" class="style6">
                    <asp:Button ID="btnContiBooking" runat="server" 
                        style="z-index: 1; left: 641px; top: 432px; position: static; width: 151px" 
                        Text="Continue Booking" onclick="btnContiBooking_Click" 
                        BackColor="#99CCFF" />
                </td>
                <td rowspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="style4">
                    </td>
            </tr>
            <tr>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="emptycellStyle">
                    </td>
                <td class="style4">
                    </td>
            </tr>
            </table>
    </div>

</asp:Content>

