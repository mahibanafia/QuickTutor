using System;
using System.Configuration;
using System.Data.SqlClient;

namespace QuickTutorProject.User
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(str);
                string query = @"Insert into [User] (Username,Password,Name,Address,Mobile,Email,Division) 
                values (@Username,@Password,@Name,@Address,@Mobile,@Email,@Division)";
                cmd = new SqlCommand(query, con);

                // Use Parameters.AddWithValue for each parameter
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtConfirmPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Name", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Division", ddlDivision.SelectedValue);

                con.Open();
                int r = cmd.ExecuteNonQuery();

                if (r > 0)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Registered Succesful!";
                    lblMsg.CssClass = "alert alert-success";
                    Clear();
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Registration Failed.";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch(SqlException ex)
            {
                if(ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" +txtUsername.Text.Trim() + "</b> username already exists, try a new one...";
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
        private void Clear()
        {
            // Clear the input fields
            txtUsername.Text = String.Empty;
            txtPassword.Text = String.Empty;
            txtConfirmPassword.Text = String.Empty;
            txtAddress.Text = String.Empty;
            txtMobile.Text = String.Empty;
            txtEmail.Text = String.Empty;
            ddlDivision.ClearSelection();

        }
        protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Your ddlDivision_SelectedIndexChanged event handling code here
        }

    }
}