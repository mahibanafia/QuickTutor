using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace QuickTutorProject.User
{
    public partial class TuitionDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt, dt1;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public string tuitionTitle = string.Empty;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                showTuitionDetails();
                DataBind();
            }
            else
            {
                Response.Redirect("TuitionListing.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void showTuitionDetails()
        {
            con = new SqlConnection(str);
            string query = @"Select * from Tuition where TuitionId = @id";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            tuitionTitle = dt.Rows[0]["Title"].ToString();
            
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ApplyTuition")
            {
                if (Session["user"] != null)
                {
                    try
                    {
                        con = new SqlConnection(str);
                        string query = @"Insert into AppliedTuitions values( @TuitionId, @UserId)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@TuitionId", Request.QueryString["id"]);
                        cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                        con.Open();
                        int r = cmd.ExecuteNonQuery();
                        if (r > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Tuition applied successfull!";
                            lblMsg.CssClass = "alert alert-success";
                            showTuitionDetails();
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Cannot apply the tuition, please try after sometime..!";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<scipt>alert('" + ex.Message + "');</scipt>");
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["user"] != null)
            {
                LinkButton btnApplyTuition = e.Item.FindControl("lbApplyTuition") as LinkButton;
                if (isApplied())
                {
                    btnApplyTuition.Enabled = false;
                    btnApplyTuition.Text = "Applied";
                }
                else
                {
                    btnApplyTuition.Enabled = true;
                    btnApplyTuition.Text = "Apply Now";
                }
            }
        }

        bool isApplied()
        {
            con = new SqlConnection(str);
            string query = @"Select * from AppliedTuitions where UserId = @UserId and TuitionId = @TuitionId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            cmd.Parameters.AddWithValue("@TuitionId", Request.QueryString["id"]);
            sda = new SqlDataAdapter(cmd);
            dt1 = new DataTable();
            sda.Fill(dt1);
            if (dt1.Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        
    }
}