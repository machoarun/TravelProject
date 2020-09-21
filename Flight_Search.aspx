<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Flight_Search.aspx.cs" Inherits="Flight_Search" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <table align = "center" class="Datatable">
        <caption class="ReviewDetailCaption">
            Flight Search</caption>
        <tr>
            <td class="ReviewDetailTitleColumns">
                Customer Id</td>
            <td style =" height: 45px;width: 198px;" align="left" >
                <asp:DropDownList ID="drpCustomerId" runat="server" 
                    style="z-index: 1; left: 186px; top: 82px; position: static" 
                    AppendDataBoundItems="True" BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvCustomerID" runat="server" 
                    ControlToValidate="drpCustomerId" 
                    ErrorMessage="CustomerID Should Not Be Empty" style="position:static">*</asp:RequiredFieldValidator>
                </td>
            <td class="ReviewDetailTitleColumns">
                &nbsp;</td>
            <td style ="height: 45px;width:200px;margin-left: 80px;">
                </td>
        </tr>
        <tr>
            <td class="ReviewDetailTitleColumns">
                Source</td>
            <td style =" height: 45px;width: 198px;" >
                <asp:DropDownList ID="drpSource" runat="server" 
                    
                    
                    
                    
                    style="z-index: 1; left: 186px; top: 133px; position: static; bottom: 223px;" 
                    AppendDataBoundItems="True" BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvSource" runat="server" ErrorMessage="Source Cannot Be Empty" 
                    ControlToValidate="drpSource">*</asp:RequiredFieldValidator>
            </td>
            <td class="ReviewDetailTitleColumns">
                destination</td>
            <td  style ="height: 45px;width:200px;margin-left: 80px;">
                <asp:DropDownList ID="drpDestination" runat="server" 
                    AppendDataBoundItems="True" BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                
                <asp:RequiredFieldValidator ID="rfvDestination" runat="server" 
                    ControlToValidate="drpDestination" 
                    ErrorMessage="Destination Cannot Be Empty">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvDestination" runat="server" 
                    ControlToCompare="drpSource" ControlToValidate="drpDestination" 
                    ErrorMessage="**" Operator="NotEqual"></asp:CompareValidator>
                
                <br />
            </td>
        </tr>
        <tr>
            <td class="ReviewDetailTitleColumns">
                Time</td>
            <td style =" height: 45px;width: 198px;" >
                
                <asp:DropDownList ID="drpTime1" runat="server" 
                    BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>6.00</asp:ListItem>
                    <asp:ListItem>7.00</asp:ListItem>
                    <asp:ListItem>8.00</asp:ListItem>
                    <asp:ListItem>9.00</asp:ListItem>
                    <asp:ListItem>10.00</asp:ListItem>
                    <asp:ListItem>11.00</asp:ListItem>
                    <asp:ListItem>12.00</asp:ListItem>
                    <asp:ListItem>13.00</asp:ListItem>
                    <asp:ListItem>14.00</asp:ListItem>
                    <asp:ListItem>15.00</asp:ListItem>
                    <asp:ListItem>16.00</asp:ListItem>
                    <asp:ListItem>17.00</asp:ListItem>
                    <asp:ListItem>18.00</asp:ListItem>
                    <asp:ListItem>19.00</asp:ListItem>
                    <asp:ListItem>20.00</asp:ListItem>
                    <asp:ListItem>21.00</asp:ListItem>
                    <asp:ListItem>22.00</asp:ListItem>
                    <asp:ListItem>23.00</asp:ListItem>
                </asp:DropDownList>
                    &nbsp;
                </td>
            <td class="ReviewDetailTitleColumns">
                To</td>
            <td  style ="height: 45px;width:200px;margin-left: 80px;">
                    &nbsp;
                <asp:DropDownList ID="drpTime2" runat="server" AppendDataBoundItems="True" 
                        BackColor="#99CCFF">
                        <asp:ListItem></asp:ListItem>
                    <asp:ListItem>6.00</asp:ListItem>
                    <asp:ListItem>7.00</asp:ListItem>
                    <asp:ListItem>8.00</asp:ListItem>
                    <asp:ListItem>9.00</asp:ListItem>
                    <asp:ListItem>10.00</asp:ListItem>
                    <asp:ListItem>11.00</asp:ListItem>
                    <asp:ListItem>12.00</asp:ListItem>
                    <asp:ListItem>13.00</asp:ListItem>
                    <asp:ListItem>14.00</asp:ListItem>
                    <asp:ListItem>15.00</asp:ListItem>
                    <asp:ListItem>16.00</asp:ListItem>
                    <asp:ListItem>17.00</asp:ListItem>
                    <asp:ListItem>18.00</asp:ListItem>
                    <asp:ListItem>19.00</asp:ListItem>
                    <asp:ListItem>20.00</asp:ListItem>
                    <asp:ListItem>21.00</asp:ListItem>
                    <asp:ListItem>22.00</asp:ListItem>
                    <asp:ListItem>23.00</asp:ListItem>
                   
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="ReviewDetailTitleColumns">
                Departure Date</td>
            <td style =" height: 45px;width: 198px;" >
                <asp:Calendar ID="calDepatureDate" runat="server" BackColor="#B7DBFF" 
                    
                    
                    style="z-index: 1; left: 666px; top: 549px; position: absolute; height: 188px; width: 217px" 
                   Visible="False" onselectionchanged="calDepatureDate_SelectionChanged" 
                    Font-Bold="True" >
                    <DayStyle Font-Bold="True" Font-Overline="False" />
                </asp:Calendar>
                <asp:TextBox ID="txtDepartureDate" runat="server" BackColor="#99CCFF"></asp:TextBox>
            </td>
            <td class="ReviewDetailTitleColumns">
                <asp:Button ID="btnDepartureDate" runat="server" Font-Bold="True" 
                    Text="&gt;&gt;" onclick="btnDepartureDate_Click" 
                    CausesValidation="False" BackColor="#99CCFF" />
            </td>
            <td style =" height: 45px;width: 198px;" >
                <asp:CompareValidator ID="cvDate" runat="server" 
                    ControlToValidate="txtDepartureDate" 
                    ErrorMessage="Departure Date Should Be Greater Than Current Date" Operator="GreaterThanEqual" 
                    Type="Date">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="ReviewDetailTitleColumns">
                Adults </td>
            <td style =" height: 45px;width: 198px;" >
                <asp:DropDownList ID="drpAdults" runat="server" 
                    style="z-index: 1; left: 186px; top: 275px; position: static" 
                    AppendDataBoundItems="True" BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvAdults" runat="server" 
                    ControlToValidate="drpAdults" 
                    ErrorMessage="Number Of Adults Cannot Be Zero">*</asp:RequiredFieldValidator>
            </td>
            <td class="ReviewDetailTitleColumns">
                Children</td>
            <td  style ="height: 45px;width:200px;margin-left: 80px;">
                <asp:DropDownList ID="drpChildren" runat="server" AppendDataBoundItems="True" 
                    BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style =" height: 37px;" colspan="4">
                <asp:Button ID="btnSearchFlights" runat="server" 
                    style="z-index: 1; left: 26px; top: 515px; position: static; width: 346px" 
                    Text="Search For Flights" onclick="btnSearchFlights_Click" 
                    BackColor="#99CCFF" Font-Bold="True"  />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    BackColor="#99CCFF" ForeColor="#FF3300" />
            </td>
        </tr>
        </table>
</asp:Content>

