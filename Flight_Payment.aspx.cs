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

/*-----------------------------------------------------------*/
/*Project : Make My Trip
 Sub-system name : Flight Payment
 Author : <Ankush Rikhi>
 Module name : Flight Module
 Description : This Program Specification gives the detailed
flow for the user to make payment for the Flight. 
 */
/*-----------------------------------------------------------*/
public partial class Flight_Payment : System.Web.UI.Page
{
    /*On Page load assigning the values to the respective labels*/
    protected void Page_Load(object sender, EventArgs e)
    {
        lblSource.Text = Session["Source"].ToString();
        lblDestination.Text = Session["Destination"].ToString();
        lblAdults.Text = Session["Adults"].ToString();
        lblChildrens.Text = Session["Children"].ToString();
        lblTotalAdultFare.Text = Session["TotAdultFare"].ToString();
        lblTotalChildFare.Text = Session["TotChildFare"].ToString();
        lblTaxAmount.Text = Session["TotalTax"].ToString();
        lblTotalAmount.Text = Session["TotalAmount"].ToString();

    }
    /*on click of make payment entering the details of payment to flightpayment table 
     * in database*/
    protected void btnMakePayment_Click(object sender, EventArgs e)
    {
        int iRet = 0;
        /*Converting the required parameters for method call*/
        int iAdults = Convert.ToInt32(Session["Adults"].ToString());
        int iChildren = Convert.ToInt32(Session["Children"].ToString());
        string BookingId = Session["BookingId"].ToString();
        int FlightNo = Convert.ToInt32(Session["FlightNo"].ToString());
        int CustId = Convert.ToInt32(Session["CustomerId"].ToString());
        DateTime DateOfBooking = Convert.ToDateTime(DateTime.Now.ToShortDateString());
        DateTime DateOfJourney = Convert.ToDateTime(Session["DepartureDate"].ToString());
       /*Making The Object Of    FlightDataBaseLayer */
        FlightDataBaseLayer objFlight = new FlightDataBaseLayer();
        /*Calling The Method*/
         objFlight.BookingFlight(BookingId, FlightNo, CustId, DateOfBooking, DateOfJourney, iAdults, iChildren);



         /*Converting the required parameters for method call PaymentInsert*/
        double iACharge = Convert.ToDouble(Session["TotAdultFare"].ToString());
        double iCCharges = Convert.ToDouble(Session["TotChildFare"].ToString());
        double dTax = Convert.ToDouble(Session["TotalTax"].ToString());

        objFlight.PaymentInsert(BookingId, iACharge, iCCharges, dTax);

        /*if no of adults is 1*/
        if (iAdults == 1)
        {
            /*Converting names to variablesd from sessions*/
            string AdultFName1 = Session["AdultFName1"].ToString();
            string AdultLName1 = Session["AdultLName1"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, AdultFName1, AdultLName1, "A");
        }
        /*if no of adults is 2*/
        else if (iAdults == 2)
        {
            string AdultFName1 = Session["AdultFName1"].ToString();
            string AdultLName1 = Session["AdultLName1"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, AdultFName1, AdultLName1, "A");

            string AdultFName2 = Session["AdultFName2"].ToString();
            string AdultLName2 = Session["AdultLName2"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, AdultFName2, AdultLName2, "A");
        }
        /*if no of adults is 3*/
        else if (iAdults == 3)
        {
            /*Converting names to variablesd from sessions*/
            string AdultFName1 = Session["AdultFName1"].ToString();
            string AdultLName1 = Session["AdultLName1"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, AdultFName1, AdultLName1, "A");


            string AdultFName2 = Session["AdultFName2"].ToString();
            string AdultLName2 = Session["AdultLName2"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, AdultFName2, AdultLName2, "A");


            string AdultFName3 = Session["AdultFName3"].ToString();
            string AdultLName3 = Session["AdultLName3"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, AdultFName3, AdultLName3, "A");
        }
        /*if no of adults is 4*/
        else if (iAdults == 4)
        {
            /*Converting names to variablesd from sessions*/
            string AdultFName1 = Session["AdultFName1"].ToString();
            string AdultLName1 = Session["AdultLName1"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, AdultFName1, AdultLName1, "A");

            string AdultFName2 = Session["AdultFName2"].ToString();
            string AdultLName2 = Session["AdultLName2"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, AdultFName2, AdultLName2, "A");



            string AdultFName3 = Session["AdultFName3"].ToString();
            string AdultLName3 = Session["AdultLName3"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, AdultFName3, AdultLName3, "A");


            string AdultFName4 = Session["AdultFName4"].ToString();
            string AdultLName4 = Session["AdultLName4"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, AdultFName4, AdultLName4, "A");

        }
        /*if no of children is 1*/
        if (iChildren == 1)
        {
            /*Converting names to variablesd from sessions*/

            string ChildFName1 = Session["ChildFName1"].ToString();
            string ChildLName1 = Session["ChiidLName1"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, ChildFName1, ChildLName1, "C");

        }
        else if (iChildren == 2)
        {
            /*Converting names to variablesd from sessions*/
            string ChildFName1 = Session["ChildFName1"].ToString();
            string ChildLName1 = Session["ChiidLName1"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, ChildFName1, ChildLName1, "C");

            string ChildFName2 = Session["ChildFName2"].ToString();
            string ChildLName2 = Session["ChiidLName2"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, ChildFName2, ChildLName2, "C");

        }
        else if (iChildren == 3)
        {
            /*Converting names to variablesd from sessions*/
            string ChildFName1 = Session["ChildFName1"].ToString();
            string ChildLName1 = Session["ChiidLName1"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, ChildFName1, ChildLName1, "C");

            string ChildFName2 = Session["ChildFName2"].ToString();
            string ChildLName2 = Session["ChiidLName2"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, ChildFName2, ChildLName2, "C");

            string ChildFName3 = Session["ChildFName3"].ToString();
            string ChildLName3 = Session["ChiidLName3"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, ChildFName3, ChildLName3, "C");

        }
        else if (iChildren == 4)
        {
            /*Converting names to variablesd from sessions*/
            string ChildFName1 = Session["ChildFName1"].ToString();
            string ChildLName1 = Session["ChiidLName1"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, ChildFName1, ChildLName1, "C");


            string ChildFName2 = Session["ChildFName2"].ToString();
            string ChildLName2 = Session["ChiidLName2"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, ChildFName2, ChildLName2, "C");

            string ChildFName3 = Session["ChildFName3"].ToString();
            string ChildLName3 = Session["ChiidLName3"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, ChildFName3, ChildLName3, "C");


            string ChildFName4 = Session["ChildFName4"].ToString();
            string ChildLName4 = Session["ChiidLName4"].ToString();
            /*Calling The Method TravellerInsert */
            objFlight.TravellerInsert(BookingId, ChildFName4, ChildLName4, "C");
        }


        /*Writing the successful payment messaage*/
        Response.Write("<script>alert('Payment SuccessFul  BookingId : " + BookingId + "')</script>");
        Server.Transfer("Welcome.aspx");

    }

}
