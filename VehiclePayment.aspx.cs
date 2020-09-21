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

/*---------------------------------------------------------------------*/
/* Project : Make My Trip
 Sub-system name : Vehicle Payment
 Author : <Pukhraj Bal>
 Module name : Vehicle Module
 Description : This Program Specification gives the detailed
                flow for the user to make payment for the package.*/
/*---------------------------------------------------------------------*/
public partial class Vehicle_Module_VehiclePayment : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Fare obj = new Fare();

        // call function to check if discount is available or not
        int discount = obj.CheckDiscountDisountAvailable(Session["CustomerId"].ToString(),                                                                            Session["CarName"].ToString(), Session["City"].ToString());

        // set labels
        lblAmount.Text = Convert.ToString((Convert.ToInt32(Session["ReviewTotal"].ToString()) -                                                                Convert.ToInt32(Session["Tax"].ToString())));
        lblTotalTaxAmount.Text = Session["Tax"].ToString();
        lblTotalAmount.Text = Session["ReviewTotal"].ToString();
        lblDiscount.Text = discount.ToString();
        lblAmountToBePaid.Text = Convert.ToString(Convert.ToInt32(lblTotalAmount.Text) -                                                                              Convert.ToInt32(lblDiscount.Text)/100 * Convert.ToInt32(lblAmount.Text));
       
        Session["GrandTotal"] = lblAmountToBePaid.Text;
    }

    // on click of "Save Payment Details " Button
    protected void SavePaymentDetails_Click(object sender, EventArgs e)
    {
        Fare obj = new Fare();

        // call bookVehicle Function From Fare class in DatabaseLayer
        string bookingid = obj.BookVehicle(Session["CarName"].ToString(), Session["PickUpAddress"].ToString(),                                                    Session["CustomerId"].ToString(), Session["CurrentDate"].ToString(), Session["JourneyStartDate"].ToString(),                                      Session["JourneyReturnDate"].ToString(), Session["JourneyStartTime"].ToString(),                                                                  Session["JourneyEndTime"].ToString(), Session["TravelType"].ToString(), Session["City"].ToString()).ToString();

        int DiscountAvailabelFlag = 0;
        if(lblDiscount.Text != "0")
        {
            DiscountAvailabelFlag = 1;
        }
        
        // check if booking is susccessful or not
        if (bookingid != "0")
        {
            obj.Payment(bookingid, Session["GrandTotal"].ToString(), Session["Tax"].ToString(), DiscountAvailabelFlag.ToString());
            Response.Write("<script>alert('Payment Successful!! Booking ID :" + bookingid + " ')</script>");
            Server.Transfer("Search_Vehicle1.aspx");
        }
        // if customer has already boooked a vehicle in the specified duration
        else
        {
            Response.Write("<script>alert('You cannot Book more than ONE vehicle at a time')</script>");
            Server.Transfer("Search_Vehicle1.aspx");
        }
    }

}
