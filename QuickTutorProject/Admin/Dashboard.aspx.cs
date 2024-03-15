using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace QuickTutorProject.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter sda;
        DataTable dt;
        readonly string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }

            if (!IsPostBack)
            {
                Users();
                Tuitions();
                AppliedTuitions();
                ContactCount();
            }

        }

        private void ContactCount()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from Contact", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Contact"] = dt.Rows[0][0];
            }
            else
            {
                Session["Contact"] = 0;
            }
        }

        private void AppliedTuitions()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from AppliedTuitions", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["AppliedTuitions"] = dt.Rows[0][0];
            }
            else
            {
                Session["AppliedTuitions"] = 0;
            }
        } 

        private void Tuitions()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from Tuition", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Tuition"] = dt.Rows[0][0];
            }
            else
            {
                Session["Tuition"] = 0;
            }
        }

        private void Users()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from [User]", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Users"] = dt.Rows[0][0];
            }
            else
            {
                Session["Users"] = 0;
            }
        }
    }
}