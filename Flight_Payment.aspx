<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Flight_Payment.aspx.cs" Inherits="Flight_Payment" Title="Untitled Page" %>

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
            
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div>
    
        <table align ="center"  class="ReviewTable1">
            <caption class="ReviewDetailCaption">
                Flight Payment</caption>
            <tr>
                <td style ="width: 275px;height: 23px">
                    </td>
                <td >
                    </td>
            </tr>
            <tr>
                <td class="ReviewDetailTitleColumns">
                    Ticket From&nbsp;&nbsp;&nbsp; </td>
                <td class="style4">
                    <asp:Label ID="lblSource" runat="server" Font-Bold="True"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <b>To</b>
                    <asp:Label ID="lblDestination" runat="server" 
                        style="position:static; top: 89px; left: 665px;" Font-Bold="True"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td class="ReviewDetailTitleColumns">
                    Adults</td>
                <td class="style4">
                    <asp:Label ID="lblAdults" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="ReviewDetailTitleColumns">
                    Children</td>
                <td class="style4">
                    <asp:Label ID="lblChildrens" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="ReviewDetailTitleColumns">
                    Total Adult Fare</td>
                <td class="style4">
                    <b>Rs. </b><asp:Label ID="lblTotalAdultFare" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="ReviewDetailTitleColumns">
                    Total Child Fare</td>
                <td class="style4">
                    <b>Rs. </b><asp:Label ID="lblTotalChildFare" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="ReviewDetailTitleColumns">
                    tax Amount</td>
                <td class="style4">
                    <b>Rs. </b><asp:Label ID="lblTaxAmount" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="ReviewDetailTitleColumns">
                    Total Amount</td>
                <td class="style4">
                    <b>Rs. </b><asp:Label ID="lblTotalAmount" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3" colspan="2">
                    <asp:Button ID="btnMakePayment" runat="server" 
                        style="z-index: 1; left: 132px; top: 380px; position: static; width: 188px; height: 33px;" 
                        Text="Make Payment" Font-Bold="True" onclick="btnMakePayment_Click" 
                        BackColor="#99CCFF" />
                </td>
            </tr>
            </table>
    
    </div>

</asp:Content>

