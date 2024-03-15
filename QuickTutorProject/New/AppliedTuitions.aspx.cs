using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.WebControls;

namespace QuickTutorProject.New
{
    public partial class AppliedTuitions : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }

            if (!IsPostBack)
            {
                ShowAppliedTuition();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowAppliedTuition();
        }

        private void ShowAppliedTuition()
        {

                string query = string.Empty;
                con = new SqlConnection(str);
                int userId = Convert.ToInt32(Session["userId"]);
                query = @"SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [Sr.No], T.TuitionId,
                                         T.Title, T.Subject, T.Duration, T.PerWeek,
                                        T.Salary, T.TutoringMethod, T.Email 
                                FROM Tuition T 
                                INNER JOIN AppliedTuitions AT ON T.TuitionId = AT.TuitionId 
                                WHERE AT.UserId = @UserId";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
    

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowAppliedTuition();
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.ID = e.Row.RowIndex.ToString();
                if (Request.QueryString["id"] != null)
                {
                    int TuitionId = Convert.ToInt32(GridView1.DataKeys[e.Row.RowIndex].Values[0]);
                    if (TuitionId == Convert.ToInt32(Request.QueryString["id"]))
                    {
                        e.Row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    }
                }
            }
        }
    }
}
