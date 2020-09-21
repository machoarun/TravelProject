<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchHotel.aspx.cs" Inherits="SearchHotel" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 788px;
            height: 393px;
        }
        .CheckCol2
        {
            height: 45px;
        }
        .CheckCol1
        {
            height: 45px;
            width: 216px;
        }
        .style8
        {
            height: 45px;
            width: 198px;
        }
        .style10
        {
            height: 45px;
            width:200px;
        }
     .style8449
     {
         font-weight: bold;
         font-size: large;
         text-transform: capitalize;
         height: 47px;
     }
     .style8450
     {
         height: 47px;
         width: 198px;
     }
     .style8451
     {
         height: 47px;
         width: 200px;
     }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align = "center" class="style1">
        <caption class="ReviewDetailCaption">
            Search Hotels</caption>
        <tr>
            <td class="ReviewDetailTitleColumns">
                City</td>
            <td class="style8" align="left" >
                <asp:DropDownList ID="ddlCity" runat="server" 
                    style="z-index: 1; left: 186px; top: 82px; position: static" 
                    onselectedindexchanged="ddlCity_SelectedIndexChanged" 
                    AppendDataBoundItems="True" BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="ddlCity" ErrorMessage="Select City">*</asp:RequiredFieldValidator>
                </td>
            <td class="ReviewDetailTitleColumns">
                </td>
            <td class="style10">
                </td>
        </tr>
        <tr>
            <td class="style8449">
                Customer Id</td>
            <td class="style8450">
                <asp:DropDownList ID="ddlCustID" runat="server" 
                    
                    
                    
                    
                    style="z-index: 1; left: 186px; top: 133px; position: static; bottom: 223px;" 
                    AppendDataBoundItems="True" BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ddlCustID" ErrorMessage="Select CustomerID">*</asp:RequiredFieldValidator>
            </td>
            <td class="style8449">
                </td>
            <td class="style8451">
                </td>
        </tr>
        <tr>
            <td class="ReviewDetailTitleColumns">
                Arrival Date</td>
            <td class="style8">
                
                <asp:TextBox ID="txtArrival" runat="server" 
                    
                    
                    style="z-index: 1; left: 186px; top: 178px; position: static; right: 880px;" 
                    ontextchanged="txtArrival_TextChanged1" ReadOnly="True" 
                    BackColor="#99CCFF"></asp:TextBox>
                    &nbsp;
                <asp:Button ID="btnArrival" runat="server" 
                    style="z-index: 1; left: 333px; top: 177px; position: static; height: 22px; width: 28px; right: 833px;" 
                    Text=">>" onclick="btnArrival_Click" CausesValidation="False" 
                    BackColor="#99CCFF" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtArrival" ErrorMessage="Select Arrival Date">*</asp:RequiredFieldValidator>
            &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtArrival" ErrorMessage="Invalid Arrival Date" 
                    Operator="GreaterThanEqual" Type="Date">*</asp:CompareValidator>
            </td>
            <td class="ReviewDetailTitleColumns">
                Departure Date</td>
            <td class="style10">
                <asp:TextBox ID="txtDepart" runat="server" 
                    style="z-index: 1; left: 535px; top: 179px; position: static" 
                    ontextchanged="txtDepart_TextChanged1" ReadOnly="True" BackColor="#99CCFF"></asp:TextBox>
                    &nbsp;
                <asp:Button ID="btnDepart" runat="server" 
                    style="z-index: 1; left: 693px; top: 178px; position: static; height: 22px; width: 28px; right: 473px;" 
                    Text="&gt;&gt;" onclick="btnDepart_Click" CausesValidation="False" 
                    BackColor="#99CCFF" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtDepart" ErrorMessage="Select Departure Date">*</asp:RequiredFieldValidator>
            &nbsp;<asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToCompare="txtArrival" ControlToValidate="txtDepart" 
                    ErrorMessage="Invalid Departure Date" Operator="GreaterThan" Type="Date">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="ReviewDetailTitleColumns">
                DEL Rooms</td>
            <td class="style8">
                <asp:Calendar ID="calArrival" runat="server" BackColor="#B7DBFF" 
                    
                    
                    style="z-index: 1; left: 451px; top: 586px; position: absolute; height: 188px; width: 211px" 
                    onselectionchanged="calArrival_SelectionChanged" Visible="False">
                </asp:Calendar>
                <asp:TextBox ID="txtDLXRooms" runat="server" 
                    ontextchanged="txtDLXRooms_TextChanged" BackColor="#99CCFF"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtDLXRooms" ErrorMessage="Select Deluxe Rooms">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtDLXRooms" ErrorMessage="Only Digit Allowed" 
                    ValidationExpression="[0-9]*">*</asp:RegularExpressionValidator>
            </td>
            <td class="ReviewDetailTitleColumns">
                EXE Rooms</td>
            <td class="style10">
                <asp:Calendar ID="calDepart" runat="server" BackColor="#B7DBFF" 
                    
                    style="z-index: 1; left: 741px; top: 587px; position: absolute; height: 188px; width: 212px" 
                    onselectionchanged="calDepart_SelectionChanged" Visible="False">
                </asp:Calendar>
                <asp:TextBox ID="txtEXERooms" runat="server" 
                    ontextchanged="txtEXERooms_TextChanged" BackColor="#99CCFF"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtEXERooms" ErrorMessage="Select Executive rooms">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtEXERooms" ErrorMessage="Only Digit Allowed" 
                    ValidationExpression="[0-9]*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="ReviewDetailTitleColumns" colspan="4">
                <asp:Button ID="btnSearch" runat="server" 
                    style="z-index: 1; left: 111px; top: 387px; position: static; width: 184px" 
                    Text="Search For Hotel" onclick="btnSearch_Click" BackColor="#99CCFF" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" />
            </td>
        </tr>
        </table>
</asp:Content>

