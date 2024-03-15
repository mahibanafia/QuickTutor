<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="QuickTutorProject.User.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
                <div class="container pt-50 pb-40">
            <div class="row">
            <div class="col-12 pb-20">
                <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
            </div>
            <div class="col-12">
                <h2 class="contact-title text-center">Sign Up</h2>
            </div>
            <div class="col-lg-6 mx-auto">
                <div class="form-contact contact_form" runat="server">

                    <div class="row">
                         <div class="col-12">
                             <h6> Login Information</h6>
                         </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label>Username</label>                              
                                <asp:TextBox ID="txtUsername" runat="server"  Cssclass="form-control" placeholder="Enter Unique Username" required></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Password</label>
                                <asp:TextBox ID="txtPassword" runat="server"  Cssclass="form-control" placeholder="Enter Password" TextMode="Password" required></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Confirm Password</label>
                                <asp:TextBox ID="txtConfirmPassword" runat="server"  Cssclass="form-control" placeholder="Enter Confirm Password" TextMode="Password" required></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ErrorMessage="Password & Confirm Password should be same."
                                    ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                    Font-Size="Small">
                                </asp:CompareValidator>
                            </div>
                        </div>

                        <div class="col-12">
                            <h6>Personal Information</h6>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                               <label>Full Name</label>
                               <asp:TextBox ID="txtFullName" runat="server"  Cssclass="form-control" placeholder="Enter Full Name" required></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                   runat="server" ErrorMessage="Name must be characters." 
                                   ForeColor="Red" Display="Dynamic" 
                                   SetFocusOnError="true" Font-Size="Small" 
                                   ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtFullName">
                               </asp:RegularExpressionValidator>
                            </div>
                        </div>
                     
                         <div class="col-12">
                            <div class="form-group">
                               <label>Address</label>
                                <asp:TextBox ID="txtAddress" runat="server"  Cssclass="form-control" placeholder="Enter Address" TextMode="MultiLine" required></asp:TextBox>
                            </div>
                        </div>

                         <div class="col-12">
                            <div class="form-group">
                               <label>Mobile Number</label>
                               <asp:TextBox ID="txtMobile" runat="server"  Cssclass="form-control" placeholder="Enter Mobile Number" required></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ErrorMessage="Mobile no. must have 11 digits." ForeColor="Red" Display="Dynamic" 
                                SetFocusOnError="true" Font-Size="Small" 
                                ValidationExpression="^[0-9]{11}$" ControlToValidate="txtMobile">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>

                         <div class="col-12">
                            <div class="form-group">
                               <label>Email</label>
                               <asp:TextBox ID="txtEmail" runat="server"  Cssclass="form-control" placeholder="Enter Email" required
                               TextMode="Email"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-12">
                         
                           <label for="ddlDivision">Division</label>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlDivision" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control w-100"
                                    AppendDataBoundItems="True" DataTextField="DivisionName" DataValueField="DivisionName" OnSelectedIndexChanged="ddlDivision_SelectedIndexChanged" Width="117%">
                                    <asp:ListItem Value="0">Select a Division</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Division is required"
                                    ForeColor="Red" Display="Dynamic"
                                    SetFocusOnError="true" Font-Size="small" InitialValue="0" ControlToValidate="ddlDivision"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:TuitionPortalConnectionString %>"
                                    ProviderName="<%$ ConnectionStrings:TuitionPortalConnectionString.ProviderName %>" 
                                    SelectCommand="SELECT [DivisionName] FROM [Division]"></asp:SqlDataSource>
                            </div>
                        </div>


                    </div>
                    <div class="form-group mt-3">
                       <asp:Button ID="btnRegister" runat="server" Text="Register" Cssclass="button button-contactForm boxed-btn mr-4" OnClick="btnRegister_Click"/>
                      
                 
                        <span class="clickLink"><a href="../User/Login.aspx">Already Register? Click Here</a></span>

                    </div>
                    </div>
     
                    </div>
                 </div>
        </div>
</section>
  
</asp:Content>
