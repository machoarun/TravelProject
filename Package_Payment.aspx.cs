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

public partial class Package_Payment : System.Web.UI.Page
{
    // Declaration of Variables
    public double Taxes;
    public double TotalFare;
    public double TotalAmount;
    public int CustId;
    public string PackId;
    public int NoOfSeats;
    public string FirstName1;
    public string LastName1;
    public string TravelerType;


    protected void Page_Load(object sender, EventArgs e)
    {
        // Initialising to the variables from Query string
        this.Taxes = Convert.ToDouble(Request.QueryString["Taxes"]);
        this.TotalFare = Convert.ToDouble(Request.QueryString["TotalFare"]);
        this.TotalAmount = Convert.ToDouble(Request.QueryString
            ["TotalAmount"]);
        this.CustId = Convert.ToUInt16(Request.QueryString["CustId"]);
        this.PackId = Convert.ToString(Request.QueryString["PackId"]);
        this.NoOfSeats = Convert.ToUInt16(Request.QueryString["NoOfSeats"]);
        this.FirstName1 = Convert.ToString(Request.QueryString
            ["FirstName1"]);
        this.LastName1 = Convert.ToString(Request.QueryString["LastName1"]);
        this.TravelerType = Convert.ToString(Request.QueryString
            ["TravelerType"]);

        //Assigning values to the labels in the Webform
        lblTotalFare.Text = this.TotalFare.ToString();
        lblTotalTaxAmount.Text = this.Taxes.ToString();
        lblAmountToBePaid.Text = this.TotalAmount.ToString();
    }

    protected void btnMakePayment_Click(object sender, EventArgs e)
    {

        Travel objFetchCustID = new Travel();
        //To display the next Booking ID when the Travel Booking
        //form is loaded
        int i_BookingId = objFetchCustID.GetNextBookingID();
        Response.Write
            ("<script>alert('Payment Successful!!!! Booking ID: "
            + i_BookingId + "')</script>");

        Travel ObjInsert = new Travel();
        //Method Call to Insert the values into the table Package Booking table
        int Ret1 = ObjInsert.InsertValues1
            (this.PackId, this.CustId, DateTime.Now, this.NoOfSeats);

        if (Ret1 == 1)
        {
            Response.Write
                ("<script>alert('Booking Successful." +
                    "Thanks a lot for Booking..!!!!!!!')</script>");
        }

        else
        {
            Response.Write("<script>alert('Booking Failed')</script>");
        }

        // Method Call to Insert the values into the 
        //table Package Travelers Details table
        int Ret2 = ObjInsert.InsertValues2
            (i_BookingId, this.CustId, this.FirstName1, this.LastName1);

        // Method Call to Insert the values into the table 
        //Package Payment Details table.
        int Ret3 = ObjInsert.InsertValues3
            (i_BookingId, this.TotalFare, this.Taxes);

        //Method Call to Update values into table
        //Tbl_Package_Status_Group12
        ObjInsert.UpdateStatus(this.PackId, this.NoOfSeats);

        //Control transfered to the Home Page
        Server.Transfer("Welcome.aspx");

    }

}
