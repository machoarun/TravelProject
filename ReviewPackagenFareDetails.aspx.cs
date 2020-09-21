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

public partial class ReviewPackagenFareDetails : System.Web.UI.Page
{

    // Declaration of Variables
    public string PackId;
    public string CustId;
    protected void Page_Load(object sender, EventArgs e)
    {

        Response.Write("<script>alert('Seats available !!!!!!')</script>");
        // Initialising to the variables, labels and textboxes from Query string
        lblPackageName.Text = (Request.QueryString["PackageName"]);
        lblTravelers.Text = (Request.QueryString["Travelers"]);
        lblSeats.Text = (Request.QueryString["Travelers"]);
        this.PackId = (Request.QueryString["PackId"]);
        this.CustId = (Request.QueryString["CustId"]);


        int NoofSeats = Convert.ToInt32(lblSeats.Text);

        //Creation of Object and Dataset
        Travel ObjReview = new Travel();
        DataSet dsReview = new DataSet();

        //Calling method to fetch review details
        dsReview = ObjReview.FetchReview(PackId);

        // Assigning to the variables from the Dataset
        DateTime StartDate = Convert.ToDateTime
            (dsReview.Tables[0].Rows[0][0].ToString());
        DateTime EndDate = Convert.ToDateTime
            (dsReview.Tables[0].Rows[0][1].ToString());
        Double Fare = Convert.ToDouble(dsReview.Tables[0].Rows[0][2].ToString());
        Double Tax = Convert.ToDouble(dsReview.Tables[0].Rows[0][3].ToString());

        //Assigning the labels
        lblStartDate.Text = StartDate.ToLongDateString();
        lblEndDate.Text = EndDate.ToLongDateString();
        lblFare.Text = Fare.ToString();

        // Declaration of Variables for calculating the amount
        Double TotalFare;
        Double GrandTotFare;
        Double Taxable;

        //Calculation of Total amount and taxable amount
        TotalFare = (Fare * NoofSeats);
        Taxable = (TotalFare * (Tax / 100));
        GrandTotFare = (Taxable + TotalFare);

        //Assigning Calculated values to labels 
        lblTotalFare.Text = Convert.ToString(TotalFare);
        lblTotalAmount.Text = Convert.ToString(GrandTotFare);
        lblTaxes.Text = Convert.ToString(Taxable);
    }
    protected void btnContinueBooking_Click(object sender, EventArgs e)
    {
        //Transfering the Values to the next page PackageTravelers.aspx
        //using querystring  
        Response.Redirect("PackageTravelers.aspx?CustId="
          + this.CustId.ToString() + "&PackId="
          + this.PackId.ToString() + "&NoOfSeats="
          + lblTravelers.Text + "&TotalFare="
          + lblTotalFare.Text + "&TotalAmount="
          + lblTotalAmount.Text + "&Taxes="
          + lblTaxes.Text + "&TravelerType="
          + lblTravellerType.Text.ToString());

    }

}
