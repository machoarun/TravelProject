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

public partial class ReviewHotelDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*Retrieving Session variables in labels*/
        lblHotelName.Text = Session["HotelName"].ToString();
        lblCID.Text = Session["ArrivalDate"].ToString();
        lblCOD.Text = Session["DepartDate"].ToString();
        lblDLX.Text = Session["DlxRooms"].ToString();
        lblEXE.Text = Session["ExeRooms"].ToString();
        lblNOR1.Text = Session["DlxRooms"].ToString();
        lblNOR2.Text = Session["ExeRooms"].ToString();

        string HotelName = Session["HotelName"].ToString();
        string HotelId = Session["HotelId"].ToString();

        /*creating object of databaselayer*/
        HotelDataBaseLayer Hobj = new HotelDataBaseLayer();
        DataSet ds = Hobj.HotelDetails(HotelId);

        /*Retriving values from dataset into labels*/
        lblFPD1.Text = ds.Tables[0].Rows[0][0].ToString();
        lblFPD2.Text = ds.Tables[0].Rows[0][1].ToString();

        /*Calculating check in date nd check out date difference*/
        int NoOfDays = (Convert.ToDateTime(lblCOD.Text) - Convert.ToDateTime(lblCID.Text)).Days;



        int DlxFare = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString()) * Convert.ToInt32(Session["DlxRooms"].ToString()) * NoOfDays;
        int ExeFare = Convert.ToInt32(ds.Tables[0].Rows[0][1].ToString()) * Convert.ToInt32(Session["ExeRooms"].ToString()) * NoOfDays;

        lblFare1.Text = Convert.ToString(DlxFare);
        lblFare2.Text = Convert.ToString(ExeFare);

        /*calculating tax*/
        double TaxDlx = Convert.ToDouble(DlxFare) * Convert.ToDouble(ds.Tables[0].Rows[0][2].ToString());
        lblTax1.Text = Convert.ToString(TaxDlx);
        double TaxExe = Convert.ToDouble(ExeFare) * Convert.ToDouble(ds.Tables[0].Rows[0][2].ToString());
        lblTax2.Text = Convert.ToString(TaxExe);



        /*calculating total amount*/
        double TotalAmtDlx = TaxDlx + DlxFare;
        double TotalAmtExe = TaxExe + ExeFare;

        /*Retriving values from variables into labels*/
        lblAmount1.Text = Convert.ToString(TotalAmtDlx);
        lblAmount2.Text = Convert.ToString(TotalAmtExe);
        lblGTotal.Text = Convert.ToString(TotalAmtDlx + TotalAmtExe);



    }
    protected void btnContiBooking_Click(object sender, EventArgs e)
    {
        /*creating session variables*/
        Session["FareDlx"] = lblFare1.Text;
        Session["FareExe"] = lblFare2.Text;
        Session["TaxDlx"] = lblTax1.Text;
        Session["TaxExe"] = lblTax2.Text;
        Session["AmountDlx"] = lblAmount1.Text;
        Session["AmountExe"] = lblAmount2.Text;
        Session["FPD1"] = lblFPD1.Text;
        Session["FPD2"] = lblFPD2.Text;

        /*Moving to next page HotelPayment.aspx*/
        Response.Redirect("HotelPayment.aspx");

    }

 
}
