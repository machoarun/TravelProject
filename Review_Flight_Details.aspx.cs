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
/*--------------------------------------------------------------------*/
/* Project : Make My Trip
 Sub-system name : Review Flight Details
 Author : <Ankush Rikhi >
 Module name : Flight Module
 Description : This Program Specification gives the detailed
              flow for the user to review Flight details.*/
/*--------------------------------------------------------------------*/
public partial class Review_Flight_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*On Page Load Assigning The values from the sessions to
         * respective labels*/
        lblAirlinesName.Text = Session["FlightName"].ToString();
        lblSource.Text = Session["Source"].ToString();
        lblDestination.Text = Session["Destination"].ToString();
       
        lblFlightNo.Text = Session["FlightNo"].ToString();
        lblDepartureTime.Text = Session["DepartureTime"].ToString();
        lblArrivalTime.Text = Session["ArrivalTime"].ToString();
        lblAdults.Text = "Adult";
        lblChildrens.Text = "Children";
        lblQuantityAdults.Text = Session["Adults"].ToString();
        lblQuantityChildrens.Text = Session["Children"].ToString();
        lblDepartureDate.Text = Session["DepartureDate"].ToString();
        lblArrivalDate.Text = Session["DepartureDate"].ToString();

        /*Converting The Session Into The Variables to calculate the fare*/
        /*Calculating The AdultFare*/
        int AdultFare = Convert.ToInt32(Session["AdultFare"]);
        int AdultQuantity = Convert.ToInt32(lblQuantityAdults.Text);
        int AdultBaseFare = AdultFare * AdultQuantity;
        lblAdultFare.Text = AdultBaseFare.ToString();
        /*Calculating The adult tax*/
        double dAirportTax = Convert.ToDouble(Session["AirportTax"]);
        double dAdultFare = Convert.ToDouble(lblAdultFare.Text);
        double dTaxAdults = dAirportTax * dAdultFare;
        lblTaxesAdults.Text = dTaxAdults.ToString();

        double TotalAdultFare = AdultBaseFare + dTaxAdults;
        /*Assigning The TotalAdultFare To The Label   lblTotalAdultsFare*/
        lblTotalAdultsFare.Text = TotalAdultFare.ToString();


        /*Calculating The ChildFare*/

        int ChildFare = Convert.ToInt32(Session["ChildFare"]);
        int ChildQuantity = Convert.ToInt32(lblQuantityChildrens.Text);
        int ChildBaseFare = ChildFare * ChildQuantity;
        /*Assigning The  To The Label  lblChildFare   lblChildFare*/
        lblChildFare.Text = ChildBaseFare.ToString();



        /*Calculating The Child tax*/

        double dChildFare = Convert.ToDouble(lblChildFare.Text);
        double dTaxChildren = dAirportTax * dChildFare;
        lblTaxesChildrens.Text = dTaxChildren.ToString();

        /*Calculating The Total Child Fare And Assigning To The Label*/
        double TotalChildFare = ChildBaseFare + dTaxChildren;
        lblTotalChildFare.Text = TotalChildFare.ToString();


        /*Calculating The Total tax  */
        double dTotalTax = dTaxAdults + dTaxChildren;

        /*Calculating The Total Fare*/
        double dGrandTotal = TotalChildFare + TotalAdultFare;
        lblGrandTotal.Text = dGrandTotal.ToString();
        /*Making Sessions For The Fares To Pass To The Next Pages*/
        Session["TotAdultFare"] = TotalAdultFare;
        Session["TotChildFare"] = TotalChildFare;
        Session["TotalTax"] = dTotalTax;
        Session["TotalAmount"] = dGrandTotal;




    }
    protected void btnBookFlight_Click(object sender, EventArgs e)
    {
        /*Passing The Control To The Next Page*/
        Server.Transfer("Flight_Travellers.aspx");

    }

}
