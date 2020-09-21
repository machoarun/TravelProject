<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Package_Payment.aspx.cs" Inherits="Package_Payment" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style9
        {
            width: 100%;
        }
        .style10
        {
            width: 147px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <table class="style9">
            <tr>
                <td class="style10">
                    <asp:Label ID="label1" runat="server" Text="Total Amount"></asp:Label>
                    :</td>
                <td>
                    Rs.
                    <asp:Label ID="lblTotalFare" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style10">
                    <asp:Label ID="Label6" runat="server" Text="Total Tax Amount"></asp:Label>
                    :</td>
                <td>
                    Rs.
                    <asp:Label ID="lblTotalTaxAmount" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style10">
                    <asp:Label ID="Label8" runat="server" Text="Amount To Be Paid"></asp:Label>
                    :</td>
                <td>
                    Rs.
                    <asp:Label ID="lblAmountToBePaid" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    </p>
    <p>
        <asp:Button ID="btnMakePayment" runat="server" onclick="btnMakePayment_Click" 
            Text="Make Payment" BackColor="#99CCFF" />
    </p>
    <p>
    </p>
</asp:Content>

