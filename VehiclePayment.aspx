<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VehiclePayment.aspx.cs" Inherits="Vehicle_Module_VehiclePayment" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align ="center"  class="ReviewTable1">
            <caption class="ReviewDetailCaption">
                Vehicle Payment</caption>
            <tr>
                <td style ="width: 275px;height: 23px">
                    </td>
                <td >
                    </td>
            </tr>
            <tr>
                <td class="ReviewDetailTitleColumns">
                    Amount</td>
                <td class="style4VehiclePayment">
                    <asp:Label ID="lblAmount" runat="server" Text="Label"></asp:Label>
                    
                    </td>
            </tr>
            <tr>
                <td class="ReviewDetailTitleColumns">
                    Total Tax Amount</td>
                <td class="style4VehiclePayment">
                    <asp:Label ID="lblTotalTaxAmount" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="ReviewDetailTitleColumns">
                    Total Amount</td>
                <td class="style4VehiclePayment">
                    <asp:Label ID="lblTotalAmount" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="ReviewDetailTitleColumns">
                    Discount %</td>
                <td class="style4VehiclePayment">
                    <asp:Label ID="lblDiscount" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="ReviewDetailTitleColumns">
                    Amount To Be Paid</td>
                <td class="style4VehiclePayment">
                    <asp:Label ID="lblAmountToBePaid" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="ReviewDetailTitleColumns">
                    &nbsp;</td>
                <td class="style4VehiclePayment">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3VehiclePayment" colspan="2">
                    <asp:Button ID="SavePaymentDetails" runat="server" 
                        style="z-index: 1; left: 133px; top: 338px; position: static; width: 188px; height: 33px;" 
                        Text="Save Payment Details" onclick="SavePaymentDetails_Click" />
                </td>
            </tr>
            </table>
</asp:Content>

