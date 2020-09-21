<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
        Session["CustomerId"] = "";
        Session["City"] = "";
        Session["TravelType"] = "";
        Session["JourneyStartDate"] = "";
        Session["JourneyReturnDate"] = "";
        Session["NoTravellers"] = "";
        Session["JourneyStartTime"] = "";
        Session["JourneyEndTime"] = "";
        Session["CityName"] = "";
        Session["CarName"] = "";
        Session["PickUpAddress"] = "";
        Session["CurrentDate"] = "";
        Session["BookingId"] = "";
        Session["Duration"] = "";
        Session["ReviewTotal"] = "";
        Session["GrandTotal"] = "";
        Session["Tax"] = "";
        
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        Session.Remove("CustomerId");
        Session.Remove("City");
        Session.Remove("TravelType");
        Session.Remove("JourneyStartDate");
        Session.Remove("JourneyReturnDate");
        Session.Remove("NoTravellers");
        Session.Remove("JourneyStartTime");
        Session.Remove("JourneyEndTime");
        Session.Remove("CityName");
        Session.Remove("CarName");
        Session.Remove("PickUpAddress");
        Session.Remove("BookingId");
        Session.Remove("CurrentDate");
        Session.Remove("Duration");
        Session.Remove("Tax");
        Session.Remove("GrandTotal");
        Session.Remove("ReviewTotal");
        Session.Remove("VehicleType");
    }
       
</script>
