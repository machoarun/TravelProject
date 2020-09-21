<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HotelPayment.aspx.cs" Inherits="HotelPayment" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
      
        .style3
        {
        	height: 85px;
        }
        .style4
        {
            height: 36px;
        }
       .style5
        {
            font-weight: bold;
            font-size: large;
            text-transform: capitalize;
            width: 387px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 
        <table align ="center"  class="ReviewTable1">
            <caption class="ReviewDetailCaption">
                Hotel Payment</caption>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    Amount</td>
                <td class="style4">
                    Rs.<asp:Label ID="lblAmount" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Total Tax Amount</td>
                <td class="style4">
                    Rs.<asp:Label ID="lblTaxAmount" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Total Amount </td>
                <td class="style4">
                    Rs.<asp:Label ID="lblTotalAmount" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Discount %</td>
                <td class="style4">
                    <asp:Label ID="lblDiscount" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Amount To Be Paid</td>
                <td class="style4">
                    Rs.<asp:Label ID="lblPaidAmount" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3" colspan="2">
                    <asp:Button ID="btnPayment" runat="server" 
                        style="z-index: 1; left: 141px; top: 290px; position: static; width: 188px; height: 33px;" 
                        Text="Save Payment Details" onclick="btnPayment_Click" 
                        BackColor="#99CCFF" />
                </td>
            </tr>
            </table>

</asp:Content>

