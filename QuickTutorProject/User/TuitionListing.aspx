<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="TuitionListing.aspx.cs" Inherits="QuickTutorProject.User.TuitionListing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"
        rel="stylesheet" type="text/css" />
   <style type="text/css">
     .checkbox {
         padding-left: 20px;
     }

         .checkbox label {
             display: inline-block;
             vertical-align: middle;
             position: relative;
             padding-left: 5px;
         }

             .checkbox label::before {
                 content: "";
                 display: inline-block;
                 position: absolute;
                 width: 17px;
                 height: 17px;
                 left: 0;
                 margin-left: -20px;
                 border: 1px solid #cccccc;
                 border-radius: 3px;
                 background-color: #fff;
                 -webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
                 -o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
                 transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
             }

             .checkbox label::after {
                 display: inline-block;
                 position: absolute;
                 width: 16px;
                 height: 16px;
                 left: 0;
                 top: 0;
                 margin-left: -20px;
                 padding-left: 3px;
                 padding-top: 1px;
                 font-size: 11px;
                 color: #0b3669;
             }

         .checkbox input[type="checkbox"] {
             opacity: 0;
             z-index: 1;
         }

             .checkbox input[type="checkbox"]:checked + label::after {
                 font-family: "FontAwesome";
                 content: "\f00c";
             }

     .checkbox-primary input[type="checkbox"]:checked + label::before {
         background-color: #0b3669;
         border-color: #0b3669;
     }

     .checkbox-primary input[type="checkbox"]:checked + label::after {
         color: #fff;
     }
 </style>
 <style>
     .radiobuttonlist {
         font: 12px Verdana, sans-serif;
         color: #000; /* non selected color */
     }

         .radiobuttonlist input {
             width: 0px;
             height: 20px;
         }

         .radiobuttonlist label {
             color: #0b3669;
             background-color: #FFF;
             padding-left: 6px;
             padding-right: 6px;
             padding-top: 2px;
             padding-bottom: 2px;
             border: 1px solid #0b3669;
             border-radius: 10%;
             margin: 0px 0px 0px 0px;
             white-space: nowrap;
             clear: left;
             margin-right: 5px;
         }

         .radiobuttonlist span.selectedradio label {
             background-color: #0b3669;
             color: #FFF;
             font-weight: bold;
             border-bottom-color: #0b3669;
             padding-top: 4px;
         }

         .radiobuttonlist label:hover {
             color: #0b3669;
             background: #D1CFC2;
         }

     .radiobuttoncontainer {
         position: relative;
         z-index: 1;
     }

     .radiobuttonbackground {
         position: relative;
         z-index: 0;
         border: solid 1px #AcA899;
         padding: 10px;
         background-color: #5bd6f8;
     }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <main>

        <!-- Tuition List Area Start -->
        <div class="job-listing-area pt-50 pb-120">
            <div class="container">
                <div class="row">
                    <!-- Left content -->
                    <div class="col-xl-2 col-lg-3 col-md-4">
                        <div class="row">
                            <div class="col-12">
                                <div class="small-section-tittle2 mb-45">
                                    <div class="ion">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            xmlns:xlink="http://www.w3.org/1999/xlink"
                                            width="20px" height="12px">
                                            <path fill-rule="evenodd" fill="rgb(27, 207, 107)"
                                                d="M7.778,12.000 L12.222,12.000 L12.222,10.000 L7.778,10.000 L7.778,12.000 ZM-0.000,-0.000 L-0.000,2.000 L20.000,2.000 L20.000,-0.000 L-0.000,-0.000 ZM3.333,7.000 L16.667,7.000 L16.667,5.000 L3.333,5.000 L3.333,7.000 Z" />
                                        </svg>
                                    </div>
                                    <h4>Filter Tuitions</h4>
                                </div>
                            </div>
                        </div>
                        <!-- Tuition Category Listing start -->
                        <div class="job-category-listing mb-50 pb-0">
                            <!-- single one -->
                            <div class="single-listing">
                                <div class="small-section-tittle2">
                                    <h4>Tuition Location</h4>
                                </div>
                                <!-- Select tuition items start -->
                                <div class="select-job-items2">
                                    <asp:DropDownList ID="ddlDivision" runat="server" name="select" CssClass="form-control w-100"
                                        DataSourceID="SqlDataSource1" AppendDataBoundItems="True" DataTextField="DivisionName"
                                        DataValueField="DivisionName" OnSelectedIndexChanged="ddlDivision_SelectedIndexChanged"
                                        AutoPostBack="true">
                                        <asp:ListItem Value="0">Division</asp:ListItem>
                                    </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:TuitionPortalConnectionString %>"
                                    ProviderName="<%$ ConnectionStrings:TuitionPortalConnectionString.ProviderName %>" 
                                    SelectCommand="SELECT [DivisionName] FROM [Division]"></asp:SqlDataSource>
                                </div>
                                <!--  Select tuition items End-->
                                <!-- select-Categories start -->
                                <div class="select-Categories pt-80 pb-50">
                                    <div class="small-section-tittle2">
                                        <h4>Tutoring Method</h4>
                                    </div>
                                    <div class="checkbox checkbox-primary">
                                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True"
                                            RepeatDirection="Vertical" RepeatLayout="Flow" CssClass="styled"
                                            TextAlign="Right" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                                            <asp:ListItem>Online Class</asp:ListItem>
                                            <asp:ListItem>Tutor House</asp:ListItem>
                                            <asp:ListItem>Student House</asp:ListItem>
                                        
                                        </asp:CheckBoxList>
                                    </div>
                                </div>
                                <!-- select-Categories End -->
                            </div>
                            <!-- single two -->

                            <!-- single three -->
                            <div class="single-listing">
                                <!-- select-Categories start -->
                                <div class="select-Categories pb-50">
                                    <div class="small-section-tittle2">
                                        <h4>Posted Within</h4>
                                    </div>
                                    <div class="radiobuttoncontainer">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="radiobuttonlist" AutoPostBack="true"
                                            OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatLayout="Flow">
                                            <asp:ListItem Value="0" Selected="True">Any</asp:ListItem>
                                            <asp:ListItem Value="1">Today</asp:ListItem>
                                            <asp:ListItem Value="2">Last 2 days</asp:ListItem>
                                            <asp:ListItem Value="3">Last 3 days</asp:ListItem>
                                            <asp:ListItem Value="4">Last 5 days</asp:ListItem>
                                            <asp:ListItem Value="5">Last 10 days</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <!-- select-Categories End -->
 
                                <div class="mb-4">
                                    <asp:LinkButton ID="lbReset" runat="server" CssClass="btn btn-sm" Width="100%"
                                        OnClick="lbReset_Click">Reset</asp:LinkButton>
                                </div>

                            </div>

                        </div>
                        <!-- Tutor Category Listing End -->
                    </div>
                    <!-- Right content -->
                    <div class="col-xl-10 col-lg-9 col-md-8">
                        <!-- Featured_tuition_start -->
                        <section class="featured-job-area">
                            <div class="container">
                                <!-- Count of Tuition list Start -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="count-job mb-35">
                                            <asp:Label ID="lblTuitionCount" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <!-- Count of tuition list End -->
                                <!-- single-job-content -->
                                <asp:DataList ID="DataList1" runat="server">
                                    <ItemTemplate>
                                        <div class="single-job-items mb-30">
                                            <div class="job-items">
                     
                                                <div class="job-tittle job-tittle2">
                                                    <a href="TuitionDetails.aspx?id=<%# Eval("TuitionId") %>">
                                                        <h5><%# Eval("Title") %></h5>
                                                    </a>
                                                    <ul>
                                                        <li><%# Eval("Subject") %></li>
                                                        <li><i class="fas fa-map-marker-alt"></i><%# Eval("Division") %></li>
                                                        <li><%# Eval("Salary") %></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="items-link items-link2 f-right ml-5">
                                                <a href="TuitionDetails.aspx?id=<%# Eval("TuitionId") %>"></a>
                                                <span class="text-secondary">
                                                    <i class="fas fa-clock pr-1"></i>
                                                    <%# RelativeDate(Convert.ToDateTime(Eval("CreateDate"))) %>
                                                </span>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </section>
                        <!-- Featured_tuition_end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Job List Area End -->

    </main>

</asp:Content>

