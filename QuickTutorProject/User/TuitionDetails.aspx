<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="TuitionDetails.aspx.cs" Inherits="QuickTutorProject.User.TuitionDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<main>

<!-- Hero Area Start-->
<div class="slider-area ">
    <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="../assets/img/blog/c8.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="hero-cap text-center">
                        <h2> <%# tuitionTitle %> </h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Hero Area End -->

<div>

</div>
<div>
    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
</div>

<!-- Tuition post Start -->
<div class="job-post-company pt-120 pb-120">
    <div class="container">
        <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
            <ItemTemplate>
                <div class="row justify-content-center"> <!-- Center the content horizontally -->
                    <div class="col-xl-6 col-lg-8 col-md-6 col-sm-12"> <!-- Adjusted column width -->
                        <!-- Left Content -->
                        <!-- Tuition single -->
                        <div class="single-job-items mb-50">
                            <div class="job-items">
                                <div class="job-tittle">
                                    <a href="#">
                                        <h4><b>Tutor to be required:  <%# Eval("Title") %></b></h4>
                                    </a>
                                    <ul>
                                        <li>Subjects to teach: <%# Eval("Subject") %></li>
                                        <li><i class="fas fa-map-marker-alt"></i>From <%# Eval("Division") %></li>
                                        <li>Salary is <%# Eval("Salary") %></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Job single End -->
                        <div class="job-post-details">
                            <div class="post-details1 mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Tuition Description</h4>
                                </div>
                                <p><%# Eval("Description") %></p>
                            </div>
                            <div class="post-details2 mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Required Time</h4>
                                </div>
                                <ul>
                                    <li><%# Eval("PerWeek") %> days per week</li>
                                    <li>Duration: <%# Eval("Duration") %></li>
                                </ul>
                            </div>
                            <div class="post-details2 mb-50">
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-4 col-md-6 col-sm-12"> <!-- Adjusted column width -->
                        <!-- Right Content -->
                        <!-- Tuition overview -->
                        <div class="post-details3 mb-50">
                            <!-- Small Section Tittle -->
                            <div class="small-section-tittle">
                                <h4>Tuition Overview</h4>
                            </div>
                            <ul>
                                <li>Posted date: <span><%# DataBinder.Eval(Container.DataItem, "CreateDate", "{0:dd MMMM yyyy}") %></span></li>
                                <li>Location: <span><%# Eval("Division") %></span></li>
                                <li>Number of Students: <span><%# Eval("NoOfStudent") %></span></li>
                                <li>Tutoring Method: <span><%# Eval("TutoringMethod") %></span></li>
                                <li>Salary: <span><%# Eval("Salary") %></span></li>
                            </ul>
                            <div class="apply-btn2">
                                <asp:LinkButton ID="lbApplyTuition" runat="server" CssClass="btn" Text="Apply Now" CommandName="ApplyTuition"></asp:LinkButton>
                            </div>
                        </div>
                        <!-- Student information -->
                        <div class="post-details4 mb-50">
                            <!-- Small Section Tittle -->
                            <div class="small-section-tittle">
                                <h4>Student Information</h4>
                            </div>
                            <span><%# Eval("StuName") %></span>
                            <ul>
                                <li>Email: <span><%# Eval("Email") %></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</div>
<!-- Tuition post End -->

</main>
</asp:Content>