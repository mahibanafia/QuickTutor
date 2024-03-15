<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddTuition.aspx.cs" Inherits="QuickTutorProject.Admin.AddTuition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container pt-4 pb-4">

        <div class="btn-toolbar justify-content-between mb-3">
            <div class="btn-group">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <div class="input-group h-25">
                <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/Admin/TutionList.aspx" CssClass="btn btn-secondary"
                    Visible="false">< Back </asp:HyperLink>
            </div>
        </div>

        <h3 class="text-center"><% Response.Write(Session["title"]); %></h3>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-12 pt-3">
                <label for="txtTutionTitle" style="font-weight: 600">Tuition Title</label>
                <asp:TextBox ID="txtTutionTitle" runat="server" CssClass="form-control" placeholder="Ex. Science Tutor, English Tutor etc." required>
                </asp:TextBox>
            </div>

        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-12 pt-3">
                <label for="txtSubject" style="font-weight: 600">Subjects</label>
               <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter Required Subjects" TextMode="MultiLine" required>
                </asp:TextBox>
            </div>
        </div>


        <div class="row mr-lg-5 ml-lg-5 mb-3">

            <div class="col-md-6 pt-3">
                <label for="txtNoOfStudent" style="font-weight: 600">Number Of Students</label>
                <asp:TextBox ID="txtNoOfStudent" runat="server" CssClass="form-control" placeholder="Enter Number Of Students"
                    TextMode="Number" required>
                </asp:TextBox>
            </div>
            <div class="col-md-6 pt-3">
                <label for="txtTutoringDu" style="font-weight: 600">Tutoring Duration</label>
                <asp:TextBox ID="txtTutoringDu" runat="server" CssClass="form-control" placeholder="Ex. 1 hour, 2 hours etc." required>
                </asp:TextBox>
            </div>
        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-12">
                <label for="txtPerWeek" style="font-weight: 600">Per Week</label>
                <asp:TextBox ID="txtPerWeek" runat="server" CssClass="form-control" placeholder="Required Days Per Week..."
                    TextMode="MultiLine" required>
                </asp:TextBox>
            </div>
        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <label for="txtSalary" style="font-weight: 600">Salary</label>
                <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" placeholder="per month" required>
                </asp:TextBox>
            </div>
            <div class="col-md-6 pt-3">
                <label for="ddlTutionType" style="font-weight: 600">Tutoring Method</label>
                <asp:DropDownList ID="ddlTutionType" runat="server" CssClass="form-control">
                    <asp:ListItem Value="0">Select Method Type</asp:ListItem>
                    <asp:ListItem>Online Class</asp:ListItem>
                    <asp:ListItem>Tutor House</asp:ListItem>
                    <asp:ListItem>Student House</asp:ListItem>
                </asp:DropDownList>


                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tuition Type is required" ForeColor="Red"
                    ControlToValidate="ddlTutionType" InitialValue="0" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-12 pt-3">
                <label for="txtDescription" style="font-weight: 600">Tutor Description</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Additional Description for Tutor"
                    TextMode="MultiLine" required>
                </asp:TextBox>
            </div>
        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <label for="txtName" style="font-weight: 600">Student/Guardian Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name" required></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                    runat="server" ErrorMessage="Name must be characters."
                    ForeColor="Red" Display="Dynamic"
                    SetFocusOnError="true" Font-Size="Small"
                    ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtName">
                </asp:RegularExpressionValidator>
            </div>

            <div class="col-md-6 pt-3">
                <label for="txtDivision" style="font-weight: 600">Division</label>
                <asp:DropDownList ID="ddlDivision" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control w-100"
                    AppendDataBoundItems="true" DataTextField="DivisionName" DataValueField="DivisionName">
                    <asp:ListItem Value="0">Select a Division</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Division is required"
                    ForeColor="Red" Display="Dynamic"
                    SetFocusOnError="true" Font-Size="small" InitialValue="0" ControlToValidate="ddlDivision"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:TuitionPortalConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:TuitionPortalConnectionString.ProviderName %>"
                    SelectCommand="SELECT [DivisionName] FROM [Division]"></asp:SqlDataSource>
            </div>

        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <label for="txtPhoneNo" style="font-weight: 600">Phone Number</label>
                <asp:TextBox ID="txtPhoneNo" runat="server" CssClass="form-control" placeholder="Enter Phone Number" required></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                    ErrorMessage="Mobile no. must have 11 digits." ForeColor="Red" Display="Dynamic"
                    SetFocusOnError="true" Font-Size="Small"
                    ValidationExpression="^[0-9]{11}$" ControlToValidate="txtPhoneNo">
                </asp:RegularExpressionValidator>
            </div>
            <div class="col-md-6 pt-3">
                <label for="txtEmail" style="font-weight: 600">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"
                    TextMode="Email" required>
                </asp:TextBox>
            </div>
        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-12 pt-3">
                <label for="txtAddress" style="font-weight: 600">Address</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address"
                    TextMode="MultiLine" required>
                </asp:TextBox>
            </div>
        </div>


        <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#0b3669" Text="Add Tuition"
                    OnClick="btnAdd_Click" />
            </div>
        </div>

    </div>
</asp:Content>

