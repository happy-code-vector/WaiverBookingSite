<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<script runat="server">
    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);
        
        // Set background image from CmsImage control
        if (!string.IsNullOrEmpty(HeroBackgroundImage.ImageUrl))
        {
            mastheadPanel.Style["background-image"] = "url('" + ResolveUrl(HeroBackgroundImage.ImageUrl) + "')";
        }
    }
</script>

<!-- Background Image (hidden) -->
<cc1:CmsImage 
    ID="HeroBackgroundImage" 
    runat="server" 
    data-editable="true" 
    data-name="Background Image" 
    data-defaultval="/sitebooking/Themes/Agency/images/header-bg.jpg"
    style="display:none;" />

<!-- Agency Hero/Masthead Section -->
<asp:Panel ID="mastheadPanel" runat="server" CssClass="masthead" style="background-size: cover; background-position: center; background-repeat: no-repeat; min-height: 100vh; display: flex; align-items: center; justify-content: center; text-align: center; color: white; position: relative;">
    
    <!-- Hero Content -->
    <div class="container">
        <div class="masthead-subheading">
            <cc1:CmsLiteral 
                ID="HeroSubtitle" 
                runat="server" 
                data-editable="true" 
                data-name="Subtitle" 
                data-defaultval="Welcome To Our Studio!" />
        </div>
        
        <div class="masthead-heading text-uppercase">
            <cc1:CmsLiteral 
                ID="HeroTitle" 
                runat="server" 
                data-editable="true" 
                data-name="Main Title" 
                data-defaultval="It's Nice To Meet You" />
        </div>
        
        <asp:HyperLink 
            ID="HeroCTAButton" 
            runat="server" 
            data-editable="true" 
            data-name="Call to Action Button" 
            data-defaultval="#services" 
            data-defaulttext="Tell Me More" 
            data-defaulttarget="_self"
            CssClass="btn btn-primary btn-xl text-uppercase" />
    </div>
    
</asp:Panel>
