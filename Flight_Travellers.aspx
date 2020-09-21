<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Flight_Travellers.aspx.cs" Inherits="Flight_Travellers" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
        {
            width: 150px;
        }
        .style6
        {
            width: 202px;
            height: 26px;
        }
        .style9
        {
            border-style: solid;
            border-width: thin;
            font-weight: 100;
            font-size: x-large;
            text-align: left;
            width: 286px;
        }
        .style12
        {
        width: 169px;
    }
        .COlFlight1
        {
            width: 150px;
        }
    .style8449
    {
        width: 169px;
        height: 26px;
    }
    .style8452
    {
        width: 286px;
    }
    .style8453
    {
        width: 286px;
        height: 26px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


        <table align ="center" class="Datatable">
            <tr>
                <td colspan="2">
                    <span class="ReviewDetailCaption">Adult1:Primary Passenger</span></td>
                <td class="partition">
                    &nbsp;</td>
                <td class="ReviewDetailCaption">
                    Child1</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="COlFlight1">
                   <b> Title</b></td>
                <td class="style4">
                    <asp:DropDownList ID="drpTitle1" runat="server" BackColor="#99CCFF">
                        <asp:ListItem>Mr</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvTitle1" runat="server" 
                        ControlToValidate="drpTitle1" 
                        ErrorMessage="Title For Adult 1 Cannot Be Empty">*</asp:RequiredFieldValidator>
                </td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <b>FirstName</b></td>
                <td class="style4">
                    <asp:TextBox ID="txtAdultFirstName1" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFName1" runat="server" 
                        ControlToValidate="txtAdultFirstName1" 
                        ErrorMessage="First Name For Adult 1 Cannot Be Empty">*</asp:RequiredFieldValidator>
                </td>
                <td class="partition">
                    </td>
                <td class="style8452">
                    <b>First Name</b></td>
                <td class="style12">
                    <asp:TextBox ID="txtChlidFName1" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvChildFName1" runat="server" 
                        ControlToValidate="txtChlidFName1" 
                        ErrorMessage="First Name For Child 1 Cannot Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgChildFname1" runat="server" 
                        ControlToValidate="txtChlidFName1" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <b>Last Name</b></td>
                <td class="style4">
                    <asp:TextBox ID="txtAdultLastName1" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAdultLName1" runat="server" 
                        ControlToValidate="txtAdultLastName1" 
                        ErrorMessage="Last Name For Adult 1 Cannot Be Empty">*</asp:RequiredFieldValidator>
                </td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    <b>Last Name</b></td>
                <td class="style12">
                    <asp:TextBox ID="txtChlidLName1" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvChildLName1" runat="server" 
                        ControlToValidate="txtChlidLName1" 
                        ErrorMessage="Last Name For Child 1 Cannot Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgChildLname1" runat="server" 
                        ControlToValidate="txtChlidLName1" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    &nbsp;</td>
                <td class="style4">
                    </td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <span class="ReviewDetailCaption"><b>Adult 2</b></span></td>
                <td class="style4">
                    &nbsp;</td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style9">
                    <b class="ReviewDetailCaption">Child 2</b></td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <b>Title</b></td>
                <td class="style4">
                    <asp:DropDownList ID="drpTitle2" runat="server" BackColor="#99CCFF">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Mr</asp:ListItem>
                        <asp:ListItem>Ms</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvTitle2" runat="server" 
                        ControlToValidate="drpTitle2" 
                        ErrorMessage="Title For Adult2 Should Not Be Empty">*</asp:RequiredFieldValidator>
                </td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <b>First Name</b></td>
                <td class="style6">
                    <asp:TextBox ID="txtAdultFname2" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAdultFName2" runat="server" 
                        ControlToValidate="txtAdultFname2" 
                        ErrorMessage="Adult First Name Should Not Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgAdult2Fname" runat="server" 
                        ControlToValidate="txtAdultFname2" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
                <td class="partition">
                    </td>
                <td class="style8453">
                    <b>First Name</b></td>
                <td class="style8449">
                    <asp:TextBox ID="txtChlidFName2" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvChildFName2" runat="server" 
                        ControlToValidate="txtChlidFName2" 
                        ErrorMessage="First Name For Child 2 Cannot Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgChildFName2" runat="server" 
                        ControlToValidate="txtChlidFName2" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <b>Last Name</b></td>
                <td class="style4">
                    <asp:TextBox ID="txtAdultlName2" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAdultLName2" runat="server" 
                        ControlToValidate="txtAdultlName2" 
                        ErrorMessage="Adult Last Name Cannot Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgAdult2LastName" runat="server" 
                        ControlToValidate="txtAdultlName2" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    <b>Last Name</b></td>
                <td class="style12">
                    <asp:TextBox ID="txtChlidLName2" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvChildLName2" runat="server" 
                        ControlToValidate="txtChlidLName2" 
                        ErrorMessage="First Name For Child 2 Cannot Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgChildLName2" runat="server" 
                        ControlToValidate="txtChlidLName2" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <span class="ReviewDetailCaption"><b>Adult 3</b></span></td>
                <td class="style4">
                    &nbsp;</td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style9">
                    <b class="ReviewDetailCaption">Child 3</b></td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <b>Title</b></td>
                <td class="style4">
                    <asp:DropDownList ID="drpTitle3" runat="server" BackColor="#99CCFF">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Mr</asp:ListItem>
                        <asp:ListItem>Ms</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvTitle3" runat="server" 
                        ControlToValidate="drpTitle3" 
                        ErrorMessage="Title For Adult 3 Cannot Be Empty">*</asp:RequiredFieldValidator>
                </td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <b>First Name</b></td>
                <td class="style4">
                    <asp:TextBox ID="txtAdultfName3" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAdultFName3" runat="server" 
                        ControlToValidate="txtAdultfName3" 
                        ErrorMessage="First Name Of Adult 3 Cannot Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgAdult3fName" runat="server" 
                        ControlToValidate="txtAdultfName3" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    <b>First Name</b></td>
                <td class="style12">
                    <asp:TextBox ID="txtChlidFName3" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvChildFName3" runat="server" 
                        ControlToValidate="txtChlidFName3" 
                        ErrorMessage="First Name For Child 3 Cannot Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgChildFName3" runat="server" 
                        ControlToValidate="txtChlidFName3" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <b>Last Name</b></td>
                <td class="style4">
                    <asp:TextBox ID="txtAdultlName3" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAdultLName3" runat="server" 
                        ControlToValidate="txtAdultlName3" 
                        ErrorMessage="Last Name For Adult 3 Cannot Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgAdult3LName" runat="server" 
                        ControlToValidate="txtAdultlName3" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    <b>Last Name</b></td>
                <td class="style12">
                    <asp:TextBox ID="txtChlidLName3" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvChildLName3" runat="server" 
                        ControlToValidate="txtChlidLName3" 
                        ErrorMessage="First Name For Child 3 Cannot Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgChildLname3" runat="server" 
                        ControlToValidate="txtChlidLName3" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <span class="ReviewDetailCaption"><b>Adult 4</b></span></td>
                <td class="style4">
                    &nbsp;</td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style9">
                    <b class="ReviewDetailCaption">Child 4</b></td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8447">
                    <b>Title</b></td>
                <td class="style4">
                    <asp:DropDownList ID="drpTitle4" runat="server" BackColor="#99CCFF">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Mr</asp:ListItem>
                        <asp:ListItem>Ms</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvTitle4" runat="server" 
                        ControlToValidate="drpTitle4" 
                        ErrorMessage="Title For Adult 4 Cannot Be Empty">*</asp:RequiredFieldValidator>
                </td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <b>First Name</b></td>
                <td class="style4">
                    <asp:TextBox ID="txtAdultFName4" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAdultFName4" runat="server" 
                        ControlToValidate="txtAdultFName4" 
                        ErrorMessage="First Name For Adult 4 Cannot Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgAdult4Fname" runat="server" 
                        ControlToValidate="txtAdultFName4" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    <b>First Name</b></td>
                <td class="style12">
                    <asp:TextBox ID="txtChlidFName4" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvChildFName4" runat="server" 
                        ControlToValidate="txtChlidFName4" 
                        ErrorMessage="First Name For Child 4 Cannot Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgChildFName4" runat="server" 
                        ControlToValidate="txtChlidFName4" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <b>Last Name</b></td>
                <td class="style4">
                    <asp:TextBox ID="txtAdultLName4" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAdultLName4" runat="server" 
                        ControlToValidate="txtAdultLName4" 
                        ErrorMessage="Last Name For Adult 4 Cannot Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgAdult4LName" runat="server" 
                        ControlToValidate="txtAdultLName4" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    <b>Last Name</b></td>
                <td class="style12">
                    <asp:TextBox ID="txtChlidLName4" runat="server" BackColor="#99CCFF"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvChildLName4" runat="server" 
                        ControlToValidate="txtChlidLName4" 
                        ErrorMessage="Last Name For Child 4 Cannot Be Empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgChildLName4" runat="server" 
                        ControlToValidate="txtChlidLName4" ErrorMessage="Only Alphabets Allowed" 
                        ValidationExpression="[a-z A-Z]*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    <asp:Button ID="btnContinuePayment" runat="server" Text="Continue With Payment" 
                        Width="234px" onclick="btnContinuePayment_Click" Font-Bold="True" 
                        BackColor="#99CCFF" />
                </td>
                <td class="style4">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                </td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="COlFlight1">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="partition">
                    &nbsp;</td>
                <td class="style8452">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
        </table>
</asp:Content>

