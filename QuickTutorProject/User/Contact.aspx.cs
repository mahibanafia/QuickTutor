using System;
using System.Configuration;
using System.Data.SqlClient;

namespace QuickTutorProject.User
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnSend_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(str);
                string query = @"Insert into Contact values (@Name, @Email, @Subject, @Message)";
                cmd = new SqlCommand(query, con);

                // Use Parameters.AddWithValue for each parameter
                cmd.Parameters.AddWithValue("@Name", name.Value.Trim());
                cmd.Parameters.AddWithValue("@Email", email.Value.Trim());
                cmd.Parameters.AddWithValue("@Subject", subject.Value.Trim());
                cmd.Parameters.AddWithValue("@Message", message.Value.Trim());

                con.Open();
                int r = cmd.ExecuteNonQuery();

                if (r > 0)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Thanks for reaching out. We will look into your query!";
                    lblMsg.CssClass = "alert alert-success";
                    Clear();
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Message could not be saved. Please try again!";
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


        private void Clear()
        {
            // Clear the input fields
            name.Value = String.Empty;
            email.Value = String.Empty;
            subject.Value = String.Empty;
            message.Value = String.Empty;
        }
    }
}