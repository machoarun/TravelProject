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

/*----------------------------------------------------------------*/
/* Project : Make My Trip
 Sub-system name : Flight Travellers
 Author : <Ankush Rikhi >
 Module name : Flight Module
 Description : This Program Specification gives the detailed
              flow for the user to provide travelers details*/
/*------------------------------------------------------------------*/

public partial class Flight_Travellers : System.Web.UI.Page
{
    /*on page load*/
    protected void Page_Load(object sender, EventArgs e)
    {
        /*Taking The CustomerId from seession into a variable*/
        int CustomerId = Convert.ToInt32(Session["CustomerId"].ToString());
        /*Making The Object Of   FlightDataBaseLayer*/
        FlightDataBaseLayer objFlight = new FlightDataBaseLayer();
        /*Creating DataSet*/
        DataSet dsPrimaryPassenger = new DataSet();
        /*Calling Method From The   FlightDataBaseLayer*/
        dsPrimaryPassenger = objFlight.GetPrimaryPassenger(CustomerId);

        /*Entering The Details Of The PrimaryPassenger And Disabling It For Editing*/
        txtAdultFirstName1.Text = dsPrimaryPassenger.Tables[0].Rows[0][0].ToString();
        txtAdultLastName1.Text = dsPrimaryPassenger.Tables[0].Rows[0][1].ToString();

        txtAdultFirstName1.Enabled = false;
        txtAdultLastName1.Enabled = false;
        drpTitle1.Enabled = false;


        int iAdults = Convert.ToInt32(Session["Adults"].ToString());
        int iChildren = Convert.ToInt32(Session["Children"].ToString());
        /*Calling The Method In The FlightDataBaseLayer To Get The Next Booking ID*/
        string BookingId = objFlight.GenerateNextBookingID();
        /*Storing The Booking ID In A Session Variable*/
        Session["BookingId"] = BookingId;
        
        /*If The Number Of Adults Entered By The User Is One*/
        if (iAdults == 1)
        {
            /*Creating The Session Of Adult Name*/
            Session["AdultFName1"] = txtAdultFirstName1.Text;
            Session["AdultLName1"] = txtAdultLastName1.Text;
            /*Disabling Adult2  Controls*/
            drpTitle2.Enabled = false;
            rfvTitle2.Enabled = false;
            txtAdultFname2.Enabled = false;
            txtAdultlName2.Enabled = false;
            rfvAdultFName2.Enabled = false;
            rfvAdultLName2.Enabled = false;
            rgAdult2Fname.Enabled = false;
            rgAdult2LastName.Enabled = false;
            /*Disabling Adult3  Controls*/
            drpTitle3.Enabled = false;
            rfvTitle3.Enabled = false;
            txtAdultfName3.Enabled = false;
            txtAdultlName3.Enabled = false;
            rfvAdultLName3.Enabled = false;
            rfvAdultFName3.Enabled = false;
            rgAdult3fName.Enabled = false;
            rgAdult3LName.Enabled = false;
            /*Disabling Adult4  Controls*/
            drpTitle4.Enabled = false;
            rfvTitle4.Enabled = false;
            txtAdultFName4.Enabled = false;
            txtAdultLName4.Enabled = false;
            rfvAdultFName4.Enabled = false;
            rfvAdultLName4.Enabled = false;
            rgAdult4Fname.Enabled = false;
            rgAdult4LName.Enabled = false;

        }
        /*If The Number Of Adults Entered By The User Is 2*/
        else if (iAdults == 2)
        {
            /*Creating The Sessions Of Adult Names*/
            Session["AdultFName1"] = txtAdultFirstName1.Text;
            Session["AdultLName1"] = txtAdultLastName1.Text;

            Session["AdultFName2"] = txtAdultFname2.Text;
            Session["AdultLName2"] = txtAdultlName2.Text;


            /*Disabling Adult3  Controls*/
            drpTitle3.Enabled = false;
            rfvTitle3.Enabled = false;
            txtAdultfName3.Enabled = false;
            txtAdultlName3.Enabled = false;
            rfvAdultLName3.Enabled = false;
            rfvAdultFName3.Enabled = false;
            rgAdult3fName.Enabled = false;
            rgAdult3LName.Enabled = false;
            /*Disabling Adult4  Controls*/
            drpTitle4.Enabled = false;
            rfvTitle4.Enabled = false;
            txtAdultFName4.Enabled = false;
            txtAdultLName4.Enabled = false;
            rfvAdultFName4.Enabled = false;
            rfvAdultLName4.Enabled = false;
            rgAdult4Fname.Enabled = false;
            rgAdult4LName.Enabled = false;




        }
        /*If The Number Of Adults Entered By The User Is 3*/
    
        else if (iAdults == 3)
        {
            /*Creating The Sessions Of Adult Names*/
            Session["AdultFName1"] = txtAdultFirstName1.Text;
            Session["AdultLName1"] = txtAdultLastName1.Text;

            Session["AdultFName2"] = txtAdultFname2.Text;
            Session["AdultLName2"] = txtAdultlName2.Text;

            Session["AdultFName3"] = txtAdultfName3.Text;
            Session["AdultLName3"] = txtAdultlName3.Text;

            /*Disabling Adult4  Controls*/
            drpTitle4.Enabled = false;
            rfvTitle4.Enabled = false;
            txtAdultFName4.Enabled = false;
            txtAdultLName4.Enabled = false;
            rfvAdultFName4.Enabled = false;
            rfvAdultLName4.Enabled = false;
            rgAdult4Fname.Enabled = false;
            rgAdult4LName.Enabled = false;



        }
        /*If The Number Of Adults Entered By The User Is 2*/

        else if (iAdults == 4)
        {
            /*Creating The Sessions Of All Adult Names*/

            Session["AdultFName1"] = txtAdultFirstName1.Text;
            Session["AdultLName1"] = txtAdultLastName1.Text;

            Session["AdultFName2"] = txtAdultFname2.Text;
            Session["AdultLName2"] = txtAdultlName2.Text;

            Session["AdultFName3"] = txtAdultfName3.Text;
            Session["AdultLName3"] = txtAdultlName3.Text;

            Session["AdultFName4"] = txtAdultFName4.Text;
            Session["AdultLName4"] = txtAdultLName4.Text;

        }
        /*If The Number Of Children Entered By The User Is 0*/

        if (iChildren == 0)
        {
            /*Disabling The Child One COntrols*/
            txtChlidFName1.Enabled = false;
            txtChlidLName1.Enabled = false;
            rfvChildFName1.Enabled = false;
            rfvChildLName1.Enabled = false;
            rgChildFname1.Enabled = false;
            rgChildLname1.Enabled = false;
            /*Disabling The Child 2 COntrols*/
            txtChlidFName2.Enabled = false;
            txtChlidLName2.Enabled = false;
            rfvChildFName2.Enabled = false;
            rfvChildLName2.Enabled = false;
            rgChildFName2.Enabled = false;
            rgChildLName2.Enabled = false;
            /*Disabling The Child 3 COntrols*/
            txtChlidFName3.Enabled = false;
            txtChlidLName3.Enabled = false;
            rfvChildFName3.Enabled = false;
            rfvChildLName3.Enabled = false;
            rgChildFName3.Enabled = false;
            rgChildLname3.Enabled = false;
            /*Disabling The Child 4 COntrols*/
            txtChlidFName4.Enabled = false;
            txtChlidLName4.Enabled = false;
            rfvChildFName4.Enabled = false;
            rfvChildLName4.Enabled = false;
            rgChildFName4.Enabled = false;
            rgChildLName4.Enabled = false;
        }
        /*If The Number Of Children Entered By The User Is 1*/
        if (iChildren == 1)
        {

            /*Creating The Sessions Of Child Name*/
            Session["ChildFName1"] = txtChlidFName1.Text;
            Session["ChiidLName1"] = txtChlidLName1.Text;

            /*Disabling The Child 2 COntrols*/
       
            rfvChildFName2.Enabled = false;
            rfvChildLName2.Enabled = false;
            txtChlidFName2.Enabled = false;
            txtChlidLName2.Enabled = false;
            rgChildFName2.Enabled = false;
            rgChildLName2.Enabled = false;
            /*Disabling The Child 3 COntrols*/
       
            rfvChildFName3.Enabled = false;
            rfvChildLName3.Enabled = false;
            txtChlidFName3.Enabled = false;
            txtChlidLName3.Enabled = false;
            rgChildFName3.Enabled = false;
            rgChildLname3.Enabled = false;
            /*Disabling The Child 4 COntrols*/
       
            rfvChildFName4.Enabled = false;
            rfvChildLName4.Enabled = false;
            txtChlidFName4.Enabled = false;
            txtChlidLName4.Enabled = false;
            rgChildFName4.Enabled = false;
            rgChildLName4.Enabled = false;

        }
        /*If The Number Of Children Entered By The User Is 2*/
        else if (iChildren == 2)
        {
            /*Creating The Sessions Of Child Names*/

            Session["ChildFName1"] = txtChlidFName1.Text;
            Session["ChiidLName1"] = txtChlidLName1.Text;

            Session["ChildFName2"] = txtChlidFName2.Text;
            Session["ChiidLName2"] = txtChlidLName2.Text;


            /*Disabling The Child 3 COntrols*/
            rfvChildFName3.Enabled = false;
            rfvChildLName3.Enabled = false;
            txtChlidFName3.Enabled = false;
            txtChlidLName3.Enabled = false;
            rgChildFName3.Enabled = false;
            rgChildLname3.Enabled = false;
            /*Disabling The Child 4 COntrols*/
            rfvChildFName4.Enabled = false;
            rfvChildLName4.Enabled = false;
            txtChlidFName4.Enabled = false;
            txtChlidLName4.Enabled = false;
            rgChildFName4.Enabled = false;
            rgChildLName4.Enabled = false;


        }
        /*If The Number Of Children Entered By The User Is 2*/
        else if (iChildren == 3)
        {
            /*Creating The Sessions Of Child Names*/

            Session["ChildFName1"] = txtChlidFName1.Text;
            Session["ChiidLName1"] = txtChlidLName1.Text;

            Session["ChildFName2"] = txtChlidFName2.Text;
            Session["ChiidLName2"] = txtChlidLName2.Text;

            Session["ChildFName3"] = txtChlidFName3.Text;
            Session["ChiidLName3"] = txtChlidLName3.Text;



            /*Disabling The Child 4 COntrols*/
            rfvChildFName4.Enabled = false;
            rfvChildLName4.Enabled = false;
            txtChlidFName4.Enabled = false;
            txtChlidLName4.Enabled = false;
            rgChildFName4.Enabled = false;
            rgChildLName4.Enabled = false;
        }
        /*If The Number Of Children Entered By The User Is 2*/
        else if (iChildren == 4)
        {
            /*Creating The Sessions Of Child Names*/
            Session["ChildFName1"] = txtChlidFName1.Text;
            Session["ChiidLName1"] = txtChlidLName1.Text;

            Session["ChildFName2"] = txtChlidFName2.Text;
            Session["ChiidLName2"] = txtChlidLName2.Text;

            Session["ChildFName3"] = txtChlidFName3.Text;
            Session["ChiidLName3"] = txtChlidLName3.Text;

            Session["ChildFName4"] = txtChlidFName4.Text;
            Session["ChiidLName4"] = txtChlidLName4.Text;


        }
    }
    /*On The Click Of button ContinuePayment*/
    protected void btnContinuePayment_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            /*Transfering The Control To The Next Page*/
            Server.Transfer("Flight_Payment.aspx");
        }

    }

}
