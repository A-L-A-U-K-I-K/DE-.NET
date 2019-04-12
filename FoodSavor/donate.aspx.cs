using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodSavor
{
	public partial class donate : System.Web.UI.Page
	{
		SqlConnection con;
		SqlDataAdapter sda;
		SqlCommand cmd;
		DataSet ds;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.Cookies["user"] != null)
			{
				if (Request.Cookies["user"]["usertype"].Equals("ngo"))
				{
					Response.Redirect("Default.aspx");
				}
			}
			else
			{
				Response.Redirect("Default.aspx");
			}
			con = new SqlConnection();
			con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\Gdrive\use4\Food\oep_food\FoodSavor\FoodSavor\App_Data\FoodSavor.mdf;Integrated Security=True";
			if (con.State != ConnectionState.Open)
			{
				con.Open();
			}
			if (!IsPostBack)
			{
				donate_address_text.Focus();
				BindCity();
				BindState();
			}
		}

		private void BindState()
		{
			sda = new SqlDataAdapter("select * from statedata", con);
			ds = new DataSet();
			sda.Fill(ds);
			donate_state_list.DataSource = ds.Tables[0];
			donate_state_list.DataTextField = ds.Tables[0].Columns[1].ToString();
			donate_state_list.DataValueField = ds.Tables[0].Columns[1].ToString();
			donate_state_list.DataBind();
			ds.Clear();
		}

		private void BindCity()
		{
			sda = new SqlDataAdapter("select * from citydata", con);
			ds = new DataSet();
			sda.Fill(ds);
			donate_city_list.DataSource = ds.Tables[0];
			donate_city_list.DataTextField = ds.Tables[0].Columns[1].ToString();
			donate_city_list.DataValueField = ds.Tables[0].Columns[1].ToString();
			donate_city_list.DataBind();
			ds.Clear();
		}

		protected void donateBtn_Click(object sender, EventArgs e)
		{
			string address, city, state, desc, dt,email;
            int pn, weight;
			address = donate_address_text.Text;
			city = donate_city_list.Text;
			state = donate_state_list.Text;
			weight = Convert.ToInt32(donate_weight_text.Text);
			desc = donate_desc_text.Text;
			dt = DateTime.Now.ToString();
            pn = Convert.ToInt32(donate_persons_text.Text);
			//Response.Write("<script>alert('" + dt + "')</script>");
			email = Request.Cookies["user"]["email"];
			cmd = new SqlCommand();
			cmd.Connection = con;
			cmd.CommandType = CommandType.Text;
			cmd.CommandText = "insert into donation(fweight,fdesc,persons_number,address,city,state,datetime,email) "+
				"values('" + weight + "','" + desc + "','" + pn + "','" + address + "','" + city + "','" + state + 
				"','" + dt + "','" + email + "')";
			if(cmd.ExecuteNonQuery() > 0)
			{
				Response.Write("<script>alert('Donated Successfully')</script>");
			}
			else
			{
				Response.Write("<script>alert('Donation Failed')</script>");
			}
		}
	}
}
 
 