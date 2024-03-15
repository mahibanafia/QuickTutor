﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="TutionList.aspx.cs" Inherits="QuickTutorProject.Admin.TutionList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
    <div class="container-fluid pt-4 pb-4">
         <%--  <div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
           </div> --%>

        <div class="btn-toolbar justify-content-between mb-3">
            <div class="btn-group">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>

            <div class="input-group h-25">
            <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/Admin/AddTuition.aspx" CssClass="btn btn-secondary" 
                Visible="false"> < Back </asp:HyperLink>
            </div>

        </div>

        

        <h3 class="text-center">Tuition List/Details</h3>

        <div class="row mb-3 pt-sm-3">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"
                    EmptyDataText="No record to display..!" AutoGenerateColumns="False" AllowPaging="True" PageSize="5"
                    OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="TuitionId" OnRowDeleting="GridView1_RowDeleting"
                    OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>

                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Title" HeaderText="Tuition Title">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Subject" HeaderText="Subject">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Duration" HeaderText="Tutoring Duration">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="PerWeek" HeaderText="Per Week">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Salary" HeaderText="Salary">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="TutoringMethod" HeaderText="Tutoring Method">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Mobile" HeaderText="Phone No">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="CreateDate" HeaderText="Posted Date" DataFormatString="{0:dd MMMM yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEditTuition" runat="server" CommandName="EditTuition" CommandArgument='<%# Eval("TuitionId") %>'>
                                    <asp:Image ID="Img" runat="server" ImageUrl="../assets/img/icon/edit.png" Height="25px" />
                                </asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"  Width="50px"/>
                        </asp:TemplateField>

                        <asp:CommandField CausesValidation="false" HeaderText="Delete" ShowDeleteButton="true" 
                            DeleteImageUrl="../assets/img/icon/del.png" ButtonType="Image">
                            <ControlStyle  Height="25px" Width="25px"/>
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        
                    </Columns>
                    <HeaderStyle BackColor="#0b3669" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>

    </div>
</div>
</asp:Content>
