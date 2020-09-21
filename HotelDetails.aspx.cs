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

public partial class HotelDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*Error Message for no Hotel Available in city*/
        if (dgvDisplayDetails.Rows.Count == 0)
        {
            Response.Write("<script>alert('No Hotel Available')</script>");
            Server.Transfer("SearchHotel.aspx");
        }

        /*Retrieving Session variables in labels*/
        lblCity.Text = Session["City_loc"].ToString();
        lblArrivalDate.Text = Session["ArrivalDate"].ToString();
        lblDeptDate.Text = Session["DepartDate"].ToString();
        lblDelRooms.Text = Session["DlxRooms"].ToString();
        lblExeRooms.Text = Session["ExeRooms"].ToString();


    }


    protected void dgvDisplayDetails_SelectedIndexChanged(object sender, EventArgs e)
    {


        /*creating object of databaselayer*/
        HotelDataBaseLayer hobj = new HotelDataBaseLayer();

        /*declaring variables*/
        
        string HotelName = dgvDisplayDetails.SelectedRow.Cells[0].Text.ToString();
        string Location = dgvDisplayDetails.SelectedRow.Cells[1].Text.ToString();
        string HotelID = hobj.GetHotelID(HotelName, Location);

        int DeluxeRooms = Convert.ToInt32(lblDelRooms.Text);
        int EXERooms = Convert.ToInt32(lblExeRooms.Text);
        DateTime CheckInDate = Convert.ToDateTime(lblArrivalDate.Text);
        DateTime CheckOutDate = Convert.ToDateTime(lblDeptDate.Text);

        /*using DataBaseLayerObject,calling Function ChechRoomStatus*/
        int status = hobj.ChechRoomStatus(HotelID, DeluxeRooms, EXERooms, CheckInDate, CheckOutDate);

        if (status == 0)
        {
            Response.Write("<script>alert('No Rooms available')</script>");
        }
        else
        {
            Response.Write("<script>alert('Rooms Available')</script>");
            
            HotelDataBaseLayer hobj1 = new HotelDataBaseLayer();

            Session["HotelId"] = HotelID;
            Session["HotelName"] = dgvDisplayDetails.SelectedRow.Cells[0].Text.ToString();

            /*Moving to next page ReviewHotelDetails.aspx*/
            Server.Transfer("ReviewHotelDetails.aspx");
         }
    }

}
