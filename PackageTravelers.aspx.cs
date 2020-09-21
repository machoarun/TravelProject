using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class PackageTravelers : System.Web.UI.Page
{

    // Declaration of Variables
    public string PackId;
    public string CustId;
    public int NoOfSeats;
    public double Taxes;
    public double TotalFare;
    public double TotalAmount;
    public string TravelerType;
    protected void Page_Load(object sender, EventArgs e)
    {

        // Initialising to the variables from Query string
        this.PackId = (Request.QueryString["PackId"]);
        this.CustId = (Request.QueryString["CustId"]);
        this.NoOfSeats = Convert.ToUInt16(Request.QueryString
            ["NoOfSeats"]);
        this.Taxes = Convert.ToDouble(Request.QueryString["Taxes"]);
        this.TotalFare = Convert.ToDouble(Request.QueryString["TotalFare"]);
        this.TotalAmount = Convert.ToDouble(Request.QueryString
            ["TotalAmount"]);
        this.TravelerType = Convert.ToString(Request.QueryString
            ["TravelerType"]);

        //Disabling the labels and dropdownboxes during the pageload
        drpTitle1.Enabled = false;
        txtFirstName1.Enabled = false;
        txtLastName1.Enabled = false;

        drpTitle2.Enabled = false;
        txtFirstName2.Enabled = false;
        txtLastName2.Enabled = false;

        drpTitle3.Enabled = false;
        txtFirstName3.Enabled = false;
        txtLastName3.Enabled = false;

        drpTitle4.Enabled = false;
        txtFirstName4.Enabled = false;
        txtLastName4.Enabled = false;

        //Enabling the labels, dropdownboxes and Required field
        //validator depending on the number of seats given by the user
        if (this.NoOfSeats == 2)
        {
            drpTitle2.Enabled = true;
            txtFirstName2.Enabled = true;
            txtLastName2.Enabled = true;
            rfvTitle2.Enabled = true;
            rfvFirstName2.Enabled = true;
            rfvLastName2.Enabled = true;
        }

        //Enabling the labels, dropdownboxes and Required field
        //validator depending on the number of seats given by the user
        else if (this.NoOfSeats == 3)
        {
            drpTitle2.Enabled = true;
            txtFirstName2.Enabled = true;
            txtLastName2.Enabled = true;
            rfvTitle2.Enabled = true;
            rfvFirstName2.Enabled = true;
            rfvLastName2.Enabled = true;

            drpTitle3.Enabled = true;
            txtFirstName3.Enabled = true;
            txtLastName3.Enabled = true;
            rfvTitle3.Enabled = true;
            rfvFirstName3.Enabled = true;
            rfvLastName3.Enabled = true;
        }


        //Enabling the labels, dropdownboxes and Required field
        //validator depending on the number of seats given by the user
        else if (this.NoOfSeats == 4)
        {
            drpTitle2.Enabled = true;
            txtFirstName2.Enabled = true;
            txtLastName2.Enabled = true;
            rfvTitle2.Enabled = true;
            rfvFirstName2.Enabled = true;
            rfvLastName2.Enabled = true;

            drpTitle3.Enabled = true;
            txtFirstName3.Enabled = true;
            txtLastName3.Enabled = true;
            rfvTitle3.Enabled = true;
            rfvFirstName3.Enabled = true;
            rfvLastName3.Enabled = true;

            drpTitle4.Enabled = true;
            txtFirstName4.Enabled = true;
            txtLastName4.Enabled = true;
            rfvTitle4.Enabled = true;
            rfvFirstName4.Enabled = true;
            rfvLastName4.Enabled = true;
        }

        //Creation of Object and Dataset
        Travel ObjFetch = new Travel();
        DataSet dsCustDetails = new DataSet();

        //Calling method FetchCustDetails to fetch details
        dsCustDetails = ObjFetch.FetchCustDetails(this.CustId);
        txtFirstName1.Text = Convert.ToString(dsCustDetails.Tables[0].Rows[0][0]);
        txtLastName1.Text = Convert.ToString(dsCustDetails.Tables[0].Rows[0][1]);
    }

    protected void btnContinueWithPayment_Click(object sender, EventArgs e)
    {

        //Transfering the Values to the next page Package_Payment.aspx 
        //using querystring  
        Response.Redirect("Package_Payment.aspx?TotalFare="
          + this.TotalFare + "&TotalAmount="
          + this.TotalAmount + "&Taxes=" + this.Taxes + "&CustId="
          + this.CustId + "&PackId=" + this.PackId.ToString() + "&FirstName1="
          + txtFirstName1.Text.ToString() + "&LastName1="
          + txtLastName1.Text.ToString() + "&TravelerType="
          + this.TravelerType.ToString() + "&NoOfSeats="
          + this.NoOfSeats);
    }

}
