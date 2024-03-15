using System;
using System.Configuration;
using System.Data.SqlClient;


namespace QuickTutorProject.Admin
{
    public partial class AddTuition : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
            Session["title"] = "Add Tuition";
            if (!IsPostBack)
            {
                fillData();
            }

        }


        private void fillData()
        {
            if (Request.QueryString["id"] != null)
            {
                con = new SqlConnection(str);
                query = "Select * from Tuition where TuitionId = '" + Request.QueryString["id"] + "' ";
                cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        txtTutionTitle.Text = sdr["Title"].ToString();
                        txtSubject.Text = sdr["Subject"].ToString();
                        txtNoOfStudent.Text = sdr["NoOfStudent"].ToString();
                        txtTutoringDu.Text = sdr["Duration"].ToString();
                        txtPerWeek.Text = sdr["PerWeek"].ToString();
                        txtSalary.Text = sdr["Salary"].ToString();
                        ddlTutionType.SelectedValue = sdr["TutoringMethod"].ToString();
                        txtDescription.Text = sdr["Description"].ToString();
                        txtName.Text = sdr["StuName"].ToString();
                        ddlDivision.SelectedValue = sdr["Division"].ToString();
                        txtPhoneNo.Text = sdr["Mobile"].ToString();
                        txtEmail.Text = sdr["Email"].ToString();
                        txtAddress.Text = sdr["Address"].ToString();
                        btnAdd.Text = "Update";
                        linkBack.Visible = true;
                        Session["title"] = "Edit Tuition";
                    }
                }
                else
                {
                    lblMsg.Text = "Tuition not found..!";
                    lblMsg.CssClass = "alert alert-danger";
                }
                sdr.Close();
                con.Close();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string type = string.Empty;
   
                con = new SqlConnection(str);
                if (Request.QueryString["id"] != null)
                {

                    query = @"Update Tuition set Title=@Title,Subject=@Subject,NoOfStudent=@NoOfStudent,
                        Duration=@Duration,PerWeek=@PerWeek,Salary=@Salary,TutoringMethod=@TutoringMethod,
                        Description=@Description,StuName=@StuName,Division=@Division,Mobile=@Mobile,
                        Email=@Email,Address=@Address where TuitionId=@id";
                    type = "update";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Title", txtTutionTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
                    cmd.Parameters.AddWithValue("@NoOfStudent", txtNoOfStudent.Text.Trim());
                    cmd.Parameters.AddWithValue("@Duration", txtTutoringDu.Text.Trim());
                    cmd.Parameters.AddWithValue("@PerWeek", txtPerWeek.Text.Trim());
                    cmd.Parameters.AddWithValue("@Salary", txtSalary.Text.Trim());
                    cmd.Parameters.AddWithValue("@TutoringMethod", ddlTutionType.SelectedValue);
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@StuName", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Division", ddlDivision.SelectedValue);
                    cmd.Parameters.AddWithValue("@Mobile", txtPhoneNo.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());


                }
                else
                {
                    query = @"Insert into Tuition (UserId, Title, Subject, NoOfStudent, Duration, PerWeek, Salary, TutoringMethod, Description, StuName, Division, Mobile, Email, Address,CreateDate)
                    values(@UserId,@Title,@Subject,@NoOfStudent,@Duration,@PerWeek,@Salary,@TutoringMethod,@Description,@StuName,@Division,@Mobile, @Email,@Address,@CreateDate)";
                    type = "save";
                    DateTime time = DateTime.Now;
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserId", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Title", txtTutionTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
                    cmd.Parameters.AddWithValue("@NoOfStudent", txtNoOfStudent.Text.Trim());
                    cmd.Parameters.AddWithValue("@Duration", txtTutoringDu.Text.Trim());
                    cmd.Parameters.AddWithValue("@PerWeek", txtPerWeek.Text.Trim());
                    cmd.Parameters.AddWithValue("@Salary", txtSalary.Text.Trim());
                    cmd.Parameters.AddWithValue("@TutoringMethod", ddlTutionType.SelectedValue);
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@StuName", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Division", ddlDivision.SelectedValue);
                    cmd.Parameters.AddWithValue("@Mobile", txtPhoneNo.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@CreateDate", time.ToString("yyyy-MM-dd HH:mm:ss"));


                }
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        lblMsg.Text = " Tuition " + type + "d successful..!";
                        lblMsg.CssClass = "alert alert-success";
                        clear();
                    }
                    else
                    {
                        lblMsg.Text = "Cannot " + type + " the records, please try after sometime..!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }
        private void clear()
        {
            txtTutionTitle.Text = string.Empty;
            txtSubject.Text = string.Empty;
            txtNoOfStudent.Text = string.Empty;
            txtTutoringDu.Text = string.Empty;
            txtPerWeek.Text = string.Empty;
            txtSalary.Text = string.Empty;
            txtName.Text = string.Empty;
            txtPhoneNo.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtDescription.Text = string.Empty;
            ddlDivision.ClearSelection();
            ddlTutionType.ClearSelection();
        }

    }
}