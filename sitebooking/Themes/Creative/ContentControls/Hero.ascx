<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Hero/Masthead - Creative Style -->
<header class="masthead">
    <div class="container px-4 px-lg-5 h-100">
        <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
            <div class="col-lg-8 align-self-end">
                <h1 class="text-white font-weight-bold">
                    <cc1:CmsLiteral 
                        ID="HeroTitle" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Hero Title" 
                        data-defaultval="Your Favorite Place for Free Bootstrap Themes" />
                </h1>
                <hr class="divider divider-light" />
            </div>
            <div class="col-lg-8 align-self-baseline">
                <p class="text-white-75 mb-5">
                    <cc1:CmsLiteral 
                        ID="HeroSubtitle" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Hero Subtitle" 
                        data-defaultval="Start Bootstrap can help you build better websites using the Bootstrap framework! Just download a theme and start customizing, no strings attached!" />
                </p>
                <asp:HyperLink 
                    ID="HeroButton" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Hero Button" 
                    data-defaultval="#about" 
                    data-defaulttext="Find Out More"
                    CssClass="btn btn-primary btn-xl">
                </asp:HyperLink>
            </div>
        </div>
    </div>
</header>
