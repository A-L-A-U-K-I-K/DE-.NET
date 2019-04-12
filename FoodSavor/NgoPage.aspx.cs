using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodSavor
{
	public partial class NgoPage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.Cookies["user"] != null)
			{
				if (Request.Cookies["user"]["usertype"].Equals("customer"))
				{
					Response.Redirect("Default.aspx");
				}
			}
			else
			{
				Response.Redirect("Default.aspx");
			}
		}

		protected void request_Click(object sender, EventArgs e)
		{
			Response.Redirect("request.aspx");
		}
	}
}