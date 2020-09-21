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

public partial class HotelPayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*Retriving values from session variables*/

        int FareDlx = Convert.ToInt32(Session["FareDlx"].ToString());
        int FareExe = Convert.ToInt32(Session["FareExe"].ToString());
        int DlxRooms = Convert.ToInt32(Session["DlxRooms"].ToString());
        int ExeRooms = Convert.ToInt32(Session["ExeRooms"].ToString());
        int FPD1 = Convert.ToInt32(Session["FPD1"].ToString());
        int FPD2 = Convert.ToInt32(Session["FPD2"].ToString());
        decimal Tax1 = Convert.ToDecimal(Session["TaxDlx"].ToString());
        decimal Tax2 = Convert.ToDecimal(Session["TaxExe"].ToString());
        string HID = Session["HotelId"].ToString();

        
        /*Calculating fare,taxamount,nd total amount*/

        DateTime CID =Convert.ToDateTime(Session["ArrivalDate"].ToString());
        DateTime COD = Convert.ToDateTime(Session["DepartDate"].ToString());
        int NoOfDays = (COD - CID).Days;
        int DlxFare = FPD1 * DlxRooms * NoOfDays;
        int ExeFare = FPD2 * ExeRooms * NoOfDays;
        int Amount = DlxFare + ExeFare;
        decimal TaxAmount = Tax1 + Tax2;
        decimal TotalAmount = Convert.ToDecimal(Amount) + TaxAmount;

        lblAmount.Text = Convert.ToString(Amount);
        lblTaxAmount.Text = Convert.ToString(TaxAmount);
        lblTotalAmount.Text = Convert.ToString(TotalAmount);

        /*creating object of data base layer*/
        HotelDataBaseLayer hobj = new HotelDataBaseLayer();

        /*calling function CheckDiscount to check if discount is available or not*/
        decimal Discount = hobj.CheckDiscount(HID, DlxRooms, ExeRooms);
        double DiscountAmount = Convert.ToDouble(Discount) * 100;

        if (IsPostBack == false)
        {
            if (Discount == 0)
            {
                Response.Write("<script>alert('Sorry!!! No discount available')</script>");
                lblDiscount.Text = Convert.ToString(DiscountAmount);
            }

            else
            {
                lblDiscount.Text = Convert.ToString(DiscountAmount);
            }
        }
        Double AmtPaid = Convert.ToDouble(TotalAmount) - Convert.ToDouble(Discount * TotalAmount);
        lblPaidAmount.Text = Convert.ToString(AmtPaid);


    }

    protected void btnPayment_Click(object sender, EventArgs e)
    {

        Session["Amount"] = lblAmount.Text;
        Session["TaxAmount"] = lblTaxAmount.Text;
        Session["TotalAmount"] = lblTotalAmount.Text;
        Session["DiscountAmount"] = lblDiscount.Text;

        /*Retriving values from session variables*/
        int CustId = Convert.ToInt32(Session["CustId"].ToString());
        DateTime BookingDate = Convert.ToDateTime(DateTime.Now.ToShortDateString());
        int Dlxrooms = Convert.ToInt32(Session["DlxRooms"].ToString());
        int Exerooms = Convert.ToInt32(Session["ExeRooms"].ToString());
        DateTime ArrivalDate = Convert.ToDateTime(Session["ArrivalDate"].ToString());
        DateTime DepartDate = Convert.ToDateTime(Session["DepartDate"].ToString());
        string HID = Session["HotelId"].ToString();

        /*creating object of data base layer*/
        HotelDataBaseLayer hobj1 = new HotelDataBaseLayer();

        /*calling function GetNextBookingCode to genetare booking id*/
        int BookingId = hobj1.GetNextBookingCode();

        /*calling function BookHotel to book hotel*/
        int status = hobj1.BookHotel(CustId, BookingDate, Dlxrooms, Exerooms, ArrivalDate, DepartDate, HID);



        double Amount = Convert.ToDouble(lblAmount.Text);
        double TaxAmount = Convert.ToDouble(lblTaxAmount.Text);
        double TotalAmount = Convert.ToDouble(lblTotalAmount.Text);
        
        int discountFlag =0 ;
        if(lblDiscount.Text != "0")
        {
            discountFlag =1;
        }

        /*calling function InsertPayment to insert values in table tbl_hotel_payment_group12*/
        hobj1.InsertPayment(BookingId, TotalAmount, TaxAmount, discountFlag);

        if (status == 1)
        {
            Response.Write("<script>alert('SuccessFull Booking and Payment!!!Your Booking Id is:" + BookingId + "') </script>");
            Response.Write("<script>alert('Thank You') </script>");
            Server.Transfer("Welcome.aspx");
        }

    }

}
