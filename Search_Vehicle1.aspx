<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search_Vehicle1.aspx.cs" Inherits="Vehicle_Module_Search_Vehicle1" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
    
    </div><p>&nbsp;</p>
    <p>&nbsp;</p>
    <table align = "center" class="Datatable">
        <caption class="ReviewDetailCaption">
            Search Vehicles</caption>
        <tr>
            <td class="ReviewDetailTitleColumns">
                Customer Id</td>
            <td class="VehSearchSelectCol1" align="left" >
                <asp:DropDownList ID="drpCustomerId" runat="server" 
                    style="z-index: 1; left: 186px; top: 82px; position: static" 
                    AppendDataBoundItems="True" 
                    DataSourceID="ObjectDataSource1" DataTextField="CustomerId" 
                    DataValueField="CustomerId" BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Please Specify CustomeID" ControlToValidate="drpCustomerId">*</asp:RequiredFieldValidator>
                </td>
            <td class="ReviewDetailTitleColumns">
                </td>
            <td class="VehSearchSelectCol2">
                </td>
        </tr>
        <tr>
            <td class="ReviewDetailTitleColumns">
                Travel Type</td>
            <td class="VehSearchSelectCol1">
                <asp:DropDownList ID="drpTravelType" runat="server" 
                    
                    
                    
                    style="z-index: 1; left: 186px; top: 133px; position: static; bottom: 223px;" 
                    AppendDataBoundItems="True" AutoPostBack="True" 
                    onselectedindexchanged="drpTravelType_SelectedIndexChanged" BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ErrorMessage="Please Specify Travel Type" 
                    ControlToValidate="drpTravelType">*</asp:RequiredFieldValidator>
            </td>
            <td class="ReviewDetailTitleColumns">
                &nbsp;</td>
            <td class="VehSearchSelectCol2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="ReviewDetailTitleColumns">
                Journey Date</td>
            <td class="VehSearchSelectCol1">
                
                <asp:TextBox ID="txtStartDate" runat="server" 
                    
                    style="z-index: 1; left: 186px; top: 178px; position: static; right: 880px;" BackColor="#99CCFF"></asp:TextBox>
                    &nbsp;
                <asp:Button ID="btnStartDate" runat="server" 
                    style="z-index: 1; left: 333px; top: 177px; position: static; height: 22px; width: 28px; right: 833px;" 
                    Text=">>" onclick="btnStartDate_Click" CausesValidation="False" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ErrorMessage="Please Specify Journey Date" 
                    ControlToValidate="txtStartDate">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToValidate="txtStartDate" ErrorMessage="Date Should be &gt; Today" 
                    Operator="GreaterThan" Type="Date">*</asp:CompareValidator>
            </td>
            <td class="ReviewDetailTitleColumns">
                Return Date</td>
            <td class="VehSearchSelectCol2">
                <asp:TextBox ID="txtReturnDate" runat="server" 
                    style="z-index: 1; left: 535px; top: 179px; position: static" BackColor="#99CCFF"></asp:TextBox>
                    &nbsp;
                <asp:Button ID="btnReturnDate" runat="server" 
                    style="z-index: 1; left: 693px; top: 178px; position: static; height: 22px; width: 28px; right: 473px;" 
                    Text="&gt;&gt;" onclick="btnReturnDate_Click" CausesValidation="False" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ErrorMessage="Please Specify Return Date" 
                    ControlToValidate="txtReturnDate">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtStartDate" ControlToValidate="txtReturnDate" 
                    ErrorMessage="Return Date Should be &gt; Start Date" 
                    Operator="GreaterThan" Type="Date">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="ReviewDetailTitleColumns">
                Time</td>
            <td class="VehSearchSelectCol1">
                <asp:DropDownList ID="drpStartTime" runat="server" 
                    style="z-index: 1; left: 186px; top: 230px; position: static" 
                    AppendDataBoundItems="True" BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:Calendar ID="calJourney" runat="server" BackColor="#B7DBFF" 
                    
                    
                    style="z-index: 1; left: 391px; top: 570px; position: absolute; height: 188px; width: 211px" 
                    onselectionchanged="calJourney_SelectionChanged" Visible="False">
                </asp:Calendar>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="Please Specify Journey StartTime" 
                    ControlToValidate="drpStartTime">*</asp:RequiredFieldValidator>
            </td>
            <td class="ReviewDetailTitleColumns">
                Return
                Time</td>
            <td class="VehSearchSelectCol2">
                <asp:DropDownList ID="drpReturnTime" runat="server" 
                    style="z-index: 1; left: 535px; top: 230px; position: static" 
                    AppendDataBoundItems="True" BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:Calendar ID="calReturn" runat="server" BackColor="#B7DBFF" 
                    
                    style="z-index: 1; left: 816px; top: 573px; position: absolute; height: 188px; width: 212px; right: 166px;" 
                    onselectionchanged="calReturn_SelectionChanged" Visible="False">
                </asp:Calendar>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="Please Specify Return Time" 
                    ControlToValidate="txtReturnDate">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="ReviewDetailTitleColumns">
                City</td>
            <td class="VehSearchSelectCol1">
                <asp:DropDownList ID="drpCity" runat="server" 
                    style="z-index: 1; left: 186px; top: 275px; position: static" 
                    AppendDataBoundItems="True" DataSourceID="ObjectDataSource2" 
                    DataTextField="CityName" DataValueField="CityCode" BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ErrorMessage="Please Specify City" ControlToValidate="drpCity">*</asp:RequiredFieldValidator>
            </td>
            <td class="ReviewDetailTitleColumns">
                Pick Up Address</td>
            <td class="VehSearchSelectCol2">
                <asp:TextBox ID="txtPickUpAddress" runat="server" 
                    style="z-index: 1; left: 535px; top: 270px; position: static" BackColor="#99CCFF"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Please Specify Pick UP Address" 
                    ControlToValidate="txtPickUpAddress">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td class="VehSearchSelectCol2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="Button3" runat="server" 
                    style="z-index: 1; left: 204px; top: 431px; position: static; width: 184px" 
                    Text="Search For Car" onclick="Button3_Click"  BackColor="#99CCFF"/>
    
        
    
            </td>
        </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ShowMessageBox="True" ShowSummary="False" />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="populatecust" 
        TypeName="PopulateCust"></asp:ObjectDataSource>
        
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="populatecity" 
        TypeName="PopulateCity"></asp:ObjectDataSource>

</asp:Content>

