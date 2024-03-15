using System;
using System.Configuration;
using System.Data.SqlClient;

namespace QuickTutorProject.User
{
    public partial class ResumeBuild : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader sdr;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string query;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    showUserInfo();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void showUserInfo()
        {
            try
            {
                con = new SqlConnection(str);

                if (int.TryParse(Request.QueryString["id"], out int userId))
                {
                    string query = "SELECT * FROM [User] WHERE UserId = @userId";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@userId", userId);
                    con.Open();
                    sdr = cmd.ExecuteReader();

                    if (sdr.HasRows)
                    {
                        if (sdr.Read())
                        {
                            txtUserName.Text = sdr["Username"].ToString();
                            txtFullName.Text = sdr["Name"].ToString();
                            txtEmail.Text = sdr["Email"].ToString();
                            txtMobile.Text = sdr["Mobile"].ToString();
                            txtTenth.Text = sdr["TenthGrade"].ToString();
                            txtTwelfth.Text = sdr["TwelfthGrade"].ToString();
                            txtGraduation.Text = sdr["GraduationGrade"].ToString();
                            txtPostGraduation.Text = sdr["PostGraduationGrade"].ToString();
                            txtExperience.Text = sdr["Experience"].ToString();
                            txtAddress.Text = sdr["Address"].ToString();
                            ddlDivision.SelectedValue = sdr["Division"].ToString();
                        }
                    }
                    else
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "User not found!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Invalid user ID in the query string!";
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int userId) && userId > 0)
                {
                    con = new SqlConnection(str);
                    string concatQuery = string.Empty;
                    string filePath = string.Empty;
                    bool isValid = false;

                    if (fuResume.HasFile)
                    {
                        if (Utils.IsValidExtension4Resume(fuResume.FileName))
                        {
                            concatQuery = ", Resume=@resume";
                            isValid = true;
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Please select .doc, .docx, .pdf file for the resume!";
                            lblMsg.CssClass = "alert alert-danger";
                            return;
                        }
                    }

                    query = $@"UPDATE [User] SET Username=@Username, Name=@Name, Email=@Email, Mobile=@Mobile, TenthGrade=@TenthGrade,
                            TwelfthGrade=@TwelfthGrade, GraduationGrade=@GraduationGrade, PostGraduationGrade=@PostGraduationGrade,
                            Experience=@Experience, Address=@Address, Division=@Division{concatQuery}
                            WHERE UserId=@UserId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Name", txtFullName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                        cmd.Parameters.AddWithValue("@TenthGrade", txtTenth.Text.Trim());
                        cmd.Parameters.AddWithValue("@TwelfthGrade", txtTwelfth.Text.Trim());
                        cmd.Parameters.AddWithValue("@GraduationGrade", txtGraduation.Text.Trim());
                        cmd.Parameters.AddWithValue("@PostGraduationGrade", txtPostGraduation.Text.Trim());
                        cmd.Parameters.AddWithValue("@Experience", txtExperience.Text.Trim());
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@Division", ddlDivision.SelectedValue);
                        cmd.Parameters.AddWithValue("@UserId", userId);

                        if (fuResume.HasFile && isValid)
                        {
                            Guid obj = Guid.NewGuid();
                            filePath = "Resumes/" + obj.ToString() + fuResume.FileName;
                            fuResume.PostedFile.SaveAs(Server.MapPath("~/Resumes/") + obj.ToString() + fuResume.FileName);
                            cmd.Parameters.AddWithValue("@Resume", filePath);
                        }

                        con.Open();
                        int r = cmd.ExecuteNonQuery();

                        if (r > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Resume details updated successfully!";
                            lblMsg.CssClass = "alert alert-success";
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Cannot update the records, please try after some time!";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Cannot update the records, please try Relogin!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + txtUserName.Text.Trim() + "</b> username already exists, try a new one!";
                    lblMsg.CssClass = "alert alert-danger";
                }
                else
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
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
    }
}
