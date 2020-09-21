<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search_Table.aspx.cs" Inherits="Search_Table" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style17
    {
        width: 90%;
    }
    .style18
    {
        width: 206px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
<table align ="center" class="style17">
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Customer ID"></asp:Label>
            </td>
        <td class="style18">
            <asp:DropDownList ID="drpCustID" runat="server" Height="68px" Width="145px" 
                AppendDataBoundItems="True" BackColor="#99CCFF">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="drpCustID" ErrorMessage="Please Select a CustomerID">*</asp:RequiredFieldValidator>
            </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label4" runat="server" Text="City"></asp:Label>
            </td>
        <td class="style18">
            <asp:DropDownList ID="drpCity" runat="server" Height="68px" Width="145px" 
                AppendDataBoundItems="True" BackColor="#99CCFF">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="drpCity" ErrorMessage="Please Select a City name">*</asp:RequiredFieldValidator>
            </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label5" runat="server" Text="From Date"></asp:Label>
            </td>
        <td class="style18">
            <asp:TextBox ID="txtFromDate" runat="server" Width="144px" Height="24px" 
                ontextchanged="txtFromDate_TextChanged" ReadOnly="True" 
                BackColor="#99CCFF"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToValidate="txtFromDate" 
                ErrorMessage="From Date should be Greater than or Equal to the Current Date" 
                Operator="GreaterThanEqual" Type="Date">*</asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtFromDate" ErrorMessage="Enter a From Date">*</asp:RequiredFieldValidator>
            </td>
        <td>
            <asp:Button ID="BtnFromDate" runat="server" Text="&gt;&gt;" Width="42px" 
                onclick="BtnFromDate_Click" style="height: 26px" 
                CausesValidation="False" />
            </td>
        <td>
            <asp:Label ID="Label7" runat="server" Text="To Date"></asp:Label>
            </td>
        <td>
            <asp:TextBox ID="txtToDate" runat="server" Height="22px" Width="138px" 
                BackColor="#99CCFF"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                ControlToCompare="txtFromDate" ControlToValidate="txtToDate" 
                ErrorMessage="From Date should be Greater than or Equal to the Current Date" 
                Operator="GreaterThanEqual" Type="Date">*</asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtToDate" ErrorMessage="Enter a To Date">*</asp:RequiredFieldValidator>
            </td>
        <td>
            <asp:Button ID="BtnToDate" runat="server" Text="&gt;&gt;" Width="37px" 
                onclick="BtnToDate_Click" CausesValidation="False" BackColor="#99CCFF" />
            </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style18">
            <asp:Calendar ID="CalFromDate" runat="server" BackColor="White" 
                BorderColor="#3366CC" DayNameFormat="Shortest" Font-Names="Verdana" 
                Font-Size="8pt" ForeColor="#003399" Height="200px" 
                onselectionchanged="CalFromDate_SelectionChanged" 
                Width="220px" BorderWidth="1px" CellPadding="1">
                <SelectedDayStyle BackColor="#009999" ForeColor="#CCFF99" Font-Bold="True" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <WeekendDayStyle BackColor="#CCCCFF" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <DayHeaderStyle BackColor="#99CCCC" 
                    ForeColor="#336666" Height="1px" />
                <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="10pt" 
                    ForeColor="#CCCCFF" Height="25px" BorderColor="#3366CC" 
                    BorderWidth="1px" />
            </asp:Calendar>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            <asp:Calendar ID="CalToDate" runat="server" BackColor="White" 
                BorderColor="#3366CC" DayNameFormat="Shortest" Font-Names="Verdana" 
                Font-Size="8pt" ForeColor="#003399" Height="200px" 
                onselectionchanged="CalToDate_SelectionChanged" 
                Width="220px" BorderWidth="1px" CellPadding="1">
                <SelectedDayStyle BackColor="#009999" ForeColor="#CCFF99" Font-Bold="True" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <WeekendDayStyle BackColor="#CCCCFF" />
                <TodayDayStyle BackColor="#CCCC99" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <DayHeaderStyle BackColor="#99CCCC" 
                    ForeColor="#336666" Height="1px" />
                <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="10pt" 
                    ForeColor="#CCCCFF" Height="25px" BorderColor="#3366CC" 
                    BorderWidth="1px" />
            </asp:Calendar>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label6" runat="server" Text="Travelers"></asp:Label>
            </td>
        <td class="style18">
            <asp:DropDownList ID="drpTravelers" runat="server" Height="16px" Width="145px" 
                AppendDataBoundItems="True" BackColor="#99CCFF">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="drpTravelers" 
                ErrorMessage="Please select a value for Travelers">*</asp:RequiredFieldValidator>
            </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Height="45px" 
        Width="349px" />
    <br />
    <br />
<asp:Button ID="btnSearch" runat="server" Font-Bold="True" Height="34px" 
    Text="Search for Travel Packages" Width="319px" onclick="btnSearch_Click" />
</asp:Content>

