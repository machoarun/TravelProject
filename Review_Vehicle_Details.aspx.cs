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
 Sub-system name : Review Vehicle Details
 Author : <Pukhraj Bal>
 Module name : Vehicle Module
 Description : This Program Specification gives the detailed
               flow for the user to review vehicle details.*/
/*--------------------------------------------------------------------*/
public partial class Vehicle_Module_Review_Vehicle_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // set labels
        lblArrivalTime.Text = Session["JourneyEndTime"].ToString();
        lblCarName.Text = Session["CarName"].ToString();
        lblDepaertureTime.Text = Session["JourneyStartTime"].ToString();
        lblDepartureDate.Text = Session["JourneyStartDate"].ToString();
        lblReturnDate.Text = Session["JourneyReturnDate"].ToString();
        lblTravelType.Text = Session["TravelType"].ToString();

        Fare obj = new Fare();

        // if travel type Drop then DIscount is halved
        if (Session["TravelType"].ToString() == "Drop")
        {
            lblFare.Text = Convert.ToString(0.5 * Convert.ToInt32(Session["Duration"]) *                                                                       obj.retfare(Session["CarName"].ToString(), Session["City"].ToString()));
        }

        else
        {
            lblFare.Text = Convert.ToString(Convert.ToInt32(Session["Duration"]) *                                                                            obj.retfare(Session["CarName"].ToString(), Session["City"].ToString()));
        }

        string tax = Convert.ToString(obj.taxes(Session["CarName"].ToString(), Session["City"].ToString()));
        int taxAmount = Convert.ToInt32(tax) * Convert.ToInt32(lblFare.Text) / 100;

        lblTaxes.Text = taxAmount.ToString();
        lblTotal.Text = Convert.ToString(Convert.ToInt32(lblFare.Text) + Convert.ToInt32(lblTaxes.Text));
        lblGrandTotal.Text = lblTotal.Text;

        //insert value into labels
        Session["ReviewTotal"] = lblTotal.Text;
        Session["Tax"] = lblTaxes.Text;
    }

    // on click of button continue booking
    protected void btnContinueBooking_Click(object sender, EventArgs e)
    {
        // move to next page
        Server.Transfer("VehiclePayment.aspx");
    }

}
