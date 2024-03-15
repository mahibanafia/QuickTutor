using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace QuickTutorProject.User
{
    public partial class TuitionListing : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public int tuitionCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showTuitionList();
                RBSelectedColorChange();
            }
        }

        private void showTuitionList()
        {
            if (dt == null)
            {
                con = new SqlConnection(str);
                string query = @"Select TuitionId,Title,Subject,Salary,TutoringMethod,StuName,Division,CreateDate from Tuition";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
            DataList1.DataSource = dt;
            DataList1.DataBind();
            lblTuitionCount.Text = TuitionCount(dt.Rows.Count);
        }

        string TuitionCount(int count)
        {
            if (count > 1)
            {
                return "Total <b>" + count + "</b> tuitions found";
            }
            else if (count == 1)
            {
                return "Total <b>" + count + "</b> tuition found";
            }
            else
            {
                return "No tuition found";
            }
        }



        protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDivision.SelectedValue != "0")
            {
                con = new SqlConnection(str);
                string query = @"Select TuitionId,Title,Subject,Salary,TutoringMethod,StuName,Division,CreateDate from Tuition
                    where Division ='" + ddlDivision.SelectedValue + "' ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showTuitionList();
                RBSelectedColorChange();
            }
            else
            {
                showTuitionList();
                RBSelectedColorChange();
            }
        }



        // Getting RelativeDate for given date like -- '1 month ago' 
        public static string RelativeDate(DateTime theDate)
        {
            Dictionary<long, string> thresholds = new Dictionary<long, string>();
            int minute = 60;
            int hour = 60 * minute;
            int day = 24 * hour;
            thresholds.Add(60, "{0} seconds ago");
            thresholds.Add(minute * 2, "a minute ago");
            thresholds.Add(45 * minute, "{0} minutes ago");
            thresholds.Add(120 * minute, "an hour ago");
            thresholds.Add(day, "{0} hours ago");
            thresholds.Add(day * 2, "yesterday");
            thresholds.Add(day * 30, "{0} days ago");
            thresholds.Add(day * 365, "{0} months ago");
            thresholds.Add(long.MaxValue, "{0} years ago");
            long since = (DateTime.Now.Ticks - theDate.Ticks) / 10000000;
            foreach (long threshold in thresholds.Keys)
            {
                if (since < threshold)
                {
                    TimeSpan t = new TimeSpan((DateTime.Now.Ticks - theDate.Ticks));
                    return string.Format(thresholds[threshold], (t.Days > 365 ? t.Days / 365 : (t.Days > 0 ? t.Days : (t.Hours > 0 ? t.Hours : (t.Minutes > 0 ? t.Minutes : (t.Seconds > 0 ? t.Seconds : 0))))).ToString());
                }
            }
            return "";
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string tutoringMethod = string.Empty;
            tutoringMethod = selectedCheckBox();
            if (tutoringMethod != "")
            {
                con = new SqlConnection(str);
                string query = @"Select TuitionId,Title,Subject,Salary,TutoringMethod,StuName,Division,CreateDate from Tuition 
                    where TutoringMethod IN (" + tutoringMethod + ")";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showTuitionList();
                RBSelectedColorChange();
            }
            else
            {
                showTuitionList();
            }
        }

        string selectedCheckBox()
        {
            string tutoringMethod = string.Empty;
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    tutoringMethod += "'" + CheckBoxList1.Items[i].Text + "',";
                }
            }
            return tutoringMethod = tutoringMethod.TrimEnd(',');
        }


        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue != "0")
            {
                string postedDate = string.Empty;
                postedDate = selectedRadioButton();
                con = new SqlConnection(str);
                string query = @"Select TuitionId,Title,Subject,Salary,TutoringMethod,StuName,Division,CreateDate from Tuition 
                    where Convert(DATE,CreateDate) " + postedDate + " ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showTuitionList();
                RBSelectedColorChange();
            }
            else
            {
                showTuitionList();
                RBSelectedColorChange();
            }

        }

        string selectedRadioButton()
        {
            string postedDate = string.Empty;
            DateTime date = DateTime.Today;
            if (RadioButtonList1.SelectedValue == "1")
            {
                postedDate = "= Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "') ";
            }
            else if (RadioButtonList1.SelectedValue == "2")
            {
                postedDate = " between Convert(DATE,'" + DateTime.Now.AddDays(-2).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "') ";
            }
            else if (RadioButtonList1.SelectedValue == "3")
            {
                postedDate = " between Convert(DATE,'" + DateTime.Now.AddDays(-3).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "') ";
            }
            else if (RadioButtonList1.SelectedValue == "4")
            {
                postedDate = " between Convert(DATE,'" + DateTime.Now.AddDays(-5).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "') ";
            }
            else
            {
                postedDate = " between Convert(DATE,'" + DateTime.Now.AddDays(-10).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "') ";
            }
            return postedDate;
        }


        protected void lbReset_Click(object sender, EventArgs e)
        {
            ddlDivision.ClearSelection();
            CheckBoxList1.ClearSelection();
            RadioButtonList1.SelectedValue = "0";
            RBSelectedColorChange();
            showTuitionList();
        }

        void RBSelectedColorChange()
        {
            if (RadioButtonList1.SelectedItem.Selected == true)
            {
                RadioButtonList1.SelectedItem.Attributes.Add("class", "selectedradio");
            }
        }
    }
}