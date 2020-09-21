<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PackageTravelers.aspx.cs" Inherits="PackageTravelers" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style9
        {
            width: 80%;
        }
        .style10
        {
            width: 109px;
        }
        .style11
        {
            width: 111px;
        }
        .style12
        {
            width: 114px;
        }
        .style13
        {
            width: 120px;
        }
    .style14
    {
    }
        .style8449
        {
            width: 114px;
            height: 30px;
        }
        .style8450
        {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;
    <br />
    <table class="style9">
        <tr>
            <td bgcolor="#66CCFF" class="style14">
    <asp:Label ID="Label4" runat="server" BackColor="#66CCFF" 
        Text="1: Primary Passenger" CssClass="ReviewDetailCaption"></asp:Label>
            </td>
        </tr>
</table>
    <table class="style9">
        <tr>
            <td class="style11">
                <asp:Label ID="Label11" runat="server" Text="Title:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpTitle1" runat="server" BackColor="#99CCFF">
                    <asp:ListItem>Mr</asp:ListItem>
                    <asp:ListItem>Mrs</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style11">
                <asp:Label ID="Label12" runat="server" Text="First Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFirstName1" runat="server" BackColor="#99CCFF"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style11">
                <asp:Label ID="Label13" runat="server" Text="Last Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLastName1" runat="server" BackColor="#99CCFF"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table class="style9">
        <tr>
            <td bgcolor="#66CCFF" class="ReviewDetailCaption">
    <asp:Label ID="Label5" runat="server" BackColor="#66CCFF" Text="2: "></asp:Label>
            </td>
        </tr>
</table>
    <br />
    <table class="style9">
        <tr>
            <td class="style10">
                <asp:Label ID="Label7" runat="server" Text="Title:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpTitle2" runat="server" BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Mr</asp:ListItem>
                    <asp:ListItem>Mrs</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvTitle2" runat="server" 
                    ControlToValidate="drpTitle2" Enabled="False" 
                    ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style10">
                <asp:Label ID="Label14" runat="server" Text="First Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFirstName2" runat="server" BackColor="#99CCFF"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirstName2" runat="server" 
                    ControlToValidate="txtFirstName2" Enabled="False" 
                    ErrorMessage="Enter the details of Adults">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtFirstName2" ErrorMessage="Name Cannot be a Number" 
                    ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style10">
                <asp:Label ID="Label15" runat="server" Text="Last Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLastName2" runat="server" BackColor="#99CCFF"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLastName2" runat="server" 
                    ControlToValidate="txtLastName2" Enabled="False" 
                    ErrorMessage="Enter the details of Adults">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtLastName2" ErrorMessage="Name Cannot be a Number" 
                    ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table class="style9">
        <tr>
            <td bgcolor="#66CCFF" class="ReviewDetailCaption">
    <asp:Label ID="Label20" runat="server" BackColor="#66CCFF" Text="3:"></asp:Label>
            </td>
        </tr>
</table>
    <br />
    <table class="style9">
        <tr>
            <td class="style8449">
                <asp:Label ID="Label8" runat="server" Text="Title:"></asp:Label>
            </td>
            <td class="style8450">
                <asp:DropDownList ID="drpTitle3" runat="server" BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Mr</asp:ListItem>
                    <asp:ListItem>Mrs</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvTitle3" runat="server" 
                    ControlToValidate="drpTitle3" Enabled="False" 
                    ErrorMessage="Enter the details of Adults">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style12">
                <asp:Label ID="Label9" runat="server" Text="First Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFirstName3" runat="server" BackColor="#99CCFF"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirstName3" runat="server" 
                    ControlToValidate="txtFirstName3" Enabled="False" 
                    ErrorMessage="Enter the details of Adults">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtFirstName3" ErrorMessage="Name Cannot be a Number" 
                    ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style12">
                <asp:Label ID="Label10" runat="server" Text="Last Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLastName3" runat="server" BackColor="#99CCFF"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLastName3" runat="server" 
                    ControlToValidate="txtLastName3" Enabled="False" 
                    ErrorMessage="Enter the details of Adults">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="txtLastName3" ErrorMessage="Name Cannot be a Number" 
                    ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table class="style9">
        <tr>
            <td bgcolor="#66CCFF" class="ReviewDetailCaption">
    <asp:Label ID="Label21" runat="server" BackColor="#66CCFF" Text="4:"></asp:Label>
            </td>
        </tr>
</table>
    <br />
    <table class="style9">
        <tr>
            <td class="style13">
                <asp:Label ID="Label16" runat="server" Text="Title:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpTitle4" runat="server" Width="52px" 
                    BackColor="#99CCFF">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Mr</asp:ListItem>
                    <asp:ListItem>Mrs</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvTitle4" runat="server" 
                    ControlToValidate="drpTitle4" Enabled="False" 
                    ErrorMessage="Enter the details of Adults">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style13">
                <asp:Label ID="Label17" runat="server" Text="First Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFirstName4" runat="server" BackColor="#99CCFF"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirstName4" runat="server" 
                    ControlToValidate="txtFirstName4" Enabled="False" 
                    ErrorMessage="Enter the details of Adults">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                    ControlToValidate="txtFirstName4" ErrorMessage="Name Cannot be a Number" 
                    ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style13">
                <asp:Label ID="Label18" runat="server" Text="Last Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLastName4" runat="server" BackColor="#99CCFF"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLastName4" runat="server" 
                    ControlToValidate="txtLastName4" Enabled="False" 
                    ErrorMessage="Enter the details of Adults">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                    ControlToValidate="txtLastName4" ErrorMessage="Name Cannot be a Number" 
                    ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:Button ID="btnContinueWithPayment" runat="server" Font-Bold="True" 
        onclick="btnContinueWithPayment_Click" Text="Continue WITH PAYMENT" 
        Width="360px" />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

