<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QuickTutorProject.User.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main>

        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active">
                <div class="single-slider slider-height d-flex align-items-center" data-background="../assets/img/hero/bg1.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-6 col-lg-9 col-md-10">
                                <div class="hero__caption">

                                    <%-- <h1>Knowledge on Your Hand</h1>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->


        <!--/about-section-->
        <section class="w3l-index2" id="about">
            <div class="midd-w3 py-5">
                <div class="container py-md-5 py-3">
                    <!--/row-1-->
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="w3shape position-relative">
                                <img src="../assets/img/blog/4.png" alt="" class="radius-image img-fluid">
                            </div>
                        </div>
                        <div class="col-lg-6 mt-lg-0 mt-md-5 mt-4 align-self ps-lg-5">
                            <div class="title-content text-left">
                                <h6 class="title-subhny mb-2"><span>Our Story</span></h6>
                                <h3 class="title-w3l"><b>Illuminating Minds,Connections in the World of Learning</b>
                                </h3>
                            </div>
                            <p class="mt-md-4">
                                QuickTutor was designed to be a haven for both tutors and learners.
                        	Tutors, the unsung heroes of education, found a platform to showcase their passion.
                        	It is just a source of information but a source of inspiration,
                        	fostering an environment where learning became a joyful adventure.
                            </p>

                            <a href="About.aspx" class="btn btn-style btn-primary mt-lg-5 mt-4">Read More <span class="fas fa-angle-double-right ms-2"></span></a>
                            <a href="Contact.aspx" class="btn btn-outline-primary btn-style mt-lg-5 mt-4 ms-2">Contact Us<span class="fas fa-angle-double-right ms-2"></span></a>

                        </div>
                    </div>
                    <!--//row-1-->

                </div>
            </div>
        </section>
        <!--//about-section-->

        <!-- Our Services Start -->
        <div class="our-services section-pad-t20">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <b><span>FEATURED OUR SERVICES</span></b>
                            <h2>Browse All Services</h2>
                        </div>
                    </div>
                </div>
                <div class="row d-flex justify-contnet-center">

                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="services-cap">
                                <h5><a href="job_listing.html">Documentary</a></h5>
                                <span>(600)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-cms"></span>
                            </div>
                            <div class="services-cap">
                                <h5><a href="job_listing.html">Computer Language</a></h5>
                                <span>(500)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-report"></span>
                            </div>
                            <div class="services-cap">
                                <h5><a href="job_listing.html">Commerce</a></h5>
                                <span>(550)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-app"></span>
                            </div>
                            <div class="services-cap">
                                <h5><a href="job_listing.html">Technical</a></h5>
                                <span>(400)</span>
                            </div>
                        </div>
                    </div>

                </div>


            </div>
        </div>
        <!-- Our Services End -->

        <!-- How  Apply Process Start-->
        <div class="apply-process-area apply-bg pt-150 pb-150" data-background="../assets/img/gallery/how-applybg.png">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle white-text text-center">
                            <b><span>Apply process</span></b>
                            <h2>How it apply</h2>
                        </div>
                    </div>
                </div>
                <!-- Apply Process Caption -->
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-search"></span>
                            </div>
                            <div class="process-cap">
                                <h5>1. Search a tution</h5>
                                <p>Determine the specific subject or topic for which you need tuition.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-curriculum-vitae"></span>
                            </div>
                            <div class="process-cap">
                                <h5>2. Apply for tution</h5>
                                <p>Ask about the availability of the tutor or the schedule of the tutoring service.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="process-cap">
                                <h5>3. Get your tution</h5>
                                <p>Arrange a meeting to discuss details, such as plan, fees.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- How  Apply Process End-->



        <!--/services-->
        <section class="w3l-services2" id="services">
            <div id="cwp23-block" class="py-5">
                <div class="container py-lg-5">
                    <div class="row cwp23-content mt-lg-5 mt-4">
                        <div class="col-lg-6 cwp23-img">
                            <h6 class="title-subhny mb-2"><span>What We Do?</span></h6>
                            <h3 class="title-w3l mb-4"><b>The service we offer is specifically designed to meet your needs!<br>
                            </b>
                            </h3>
                            <p class="mt-4">
                                For learners, QuickTutor opened the doors to a world of possibilities.
                        	The platform wasn't just about academic assistance; it was a gateway to new perspectives,
                        	fresh insights, and a deepening of understanding. It is delving into a new language, or exploring the intricacies of a subject,
                        	QuickTutor became the compass guiding learners towards success.

                            </p>

                            <div class="w3l-button mt-lg-5 mt-4">
                                <a href="About.aspx" class="btn btn-style btn-primary mt-2">Read More <span class="fas fa-angle-double-right ms-2"></span></a>
                            </div>
                        </div>
                        <div class="col-lg-6 cwp23-text mt-lg-0 mt-5 ps-lg-5">
                            <div class="cwp23-text-cols">
                                <div class="column">
                                    <a href="#">
                                        <img src="../assets/img/blog/1.png" alt="" class="radius-image img-fluid"></a>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--//services-->


    </main>

</asp:Content>
