using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace FoodSavor
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

			////create application state variables
			//Application["TotalApplications"] = 0;
			//Application["TotalUserSessions"] = 0;

			////increment totalapplications by 1
			//Application["TotalApplications"] = (int)Application["TotalApplications"] + 1;
        }

		void Session_Start(object sender, EventArgs e)
		{
			////increment totalapplications by 1
			//Application["TotalUserSessions"] = (int)Application["TotalUserSessions"] + 1;
		}

		void Session_End(object sender, EventArgs e)
		{
			////decrement totalapplications by 1
			//Application["TotalUserSessions"] = (int)Application["TotalUserSessions"] - 1;
		}
	}
}