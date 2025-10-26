<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:asp="remove"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl xsi"
>

  <xsl:param name="WAIVERFILE_ADMIN_AUTO_LOGIN_KEY"></xsl:param>
  <xsl:param name="USE_HTTPS">true</xsl:param>
  <xsl:param name="SchemeAndDomain"></xsl:param>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="*">

      <xsl:variable name="scheme">
        <xsl:choose>
          <xsl:when test="$USE_HTTPS='true'">https</xsl:when>
          <xsl:otherwise>http</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
        <!--
        logo larger:        http://www.waiverfile.com/wp-content/images/waiverfile-logo-lg2.png
        logo small: http://www.waiverfile.com/wp-content/images/waiverfile-logo-header.gif
        font-family: "Lato","Helvetica Neue",Helvetica,Arial,sans-serif; 
        color: #333;
        
        new password? <xsl:value-of select="$NewPassword"/>
        -->



      <h3>Welcome to WaiverFile, <xsl:value-of select="/ArrayOfAnyType/anyType[@xsi:type='Customer']/FirstName"/>!
    </h3>
      <asp:PlaceHolder runat="server" ID="phHearAboutThanks"></asp:PlaceHolder>
      <!--      <asp:Panel runat="server" ID="pnlHearAboutUs">
      <p>
        Thanks for signing up! If we can just ask you quickly, how did you hear about us?
      </p>
      <asp:RadioButtonList ID="rbHearAboutUs" runat="server">
        <asp:ListItem>Google Search</asp:ListItem>
        <asp:ListItem>Review Site</asp:ListItem>
        <asp:ListItem>Bing Search</asp:ListItem>
        <asp:ListItem>Brochure</asp:ListItem>
        <asp:ListItem>Magazine Ad</asp:ListItem>
        <asp:ListItem>Word of Mouth</asp:ListItem>
      </asp:RadioButtonList>
      <br/>
      <asp:Button runat="server" ID="btnSubmitHearAboutUs" CssClass="btn btn-primary btn-sm" Text="Submit"></asp:Button>

      </asp:Panel>
      
      <hr/>
      <h2>Start Using WaiverFile:</h2>-->
      <p>Let's get started setting up your form:</p>
     
      <p><a href="{$SchemeAndDomain}/wp-content/Plugins/WaiverFile/Controls/AutoLogin.ashx?siteid={/ArrayOfAnyType/anyType[@xsi:type='WaiverSite']/ID}&amp;key={$WAIVERFILE_ADMIN_AUTO_LOGIN_KEY}" class="btn btn-primary" target="_blank">Set Up Your Waiver Form</a>
      </p>
      <hr/>
      <h4>Your WaiverFile addresses:</h4>
      <h5>Admin Area:</h5>
      <p>
        <a href="{$SchemeAndDomain}/wp-content/Plugins/WaiverFile/Controls/AutoLogin.ashx?siteid={/ArrayOfAnyType/anyType[@xsi:type='WaiverSite']/ID}&amp;key={$WAIVERFILE_ADMIN_AUTO_LOGIN_KEY}">
          <xsl:value-of select="$SchemeAndDomain"/>
          <xsl:text>/b/</xsl:text>
          <xsl:value-of select="/ArrayOfAnyType/anyType[@xsi:type='WaiverSite']/Url"/>/admin
        </a>
        <xsl:text> - </xsl:text>
        <em>Go here to manage your site and view waivers</em>
      </p>

      <h5>Signature Area:</h5>
      <p>
        <a href="{$SchemeAndDomain}/b/{/ArrayOfAnyType/anyType[@xsi:type='WaiverSite']/Url}">
          <xsl:value-of select="$SchemeAndDomain"/>
          <xsl:text>/b/</xsl:text>
          <xsl:value-of select="/ArrayOfAnyType/anyType[@xsi:type='WaiverSite']/Url"/>
        </a>
        <xsl:text> - </xsl:text>
        <em>Your customers go here to sign waivers. Send this link via email or <a href="{$SchemeAndDomain}/b/{/ArrayOfAnyType/anyType[@xsi:type='WaiverSite']/Url}/admin/Style/ShareButtons.aspx">link it on your website!</a>
        </em>
      </p>

     
      <h4>For Devices / Kiosks</h4>
      <p>If collecting waivers on an iPad or other device, check out the free WaiverFile App: <br/>

       

          <a href="https://itunes.apple.com/us/app/waiverfile/id1460722145?ls=1&amp;mt=8" target="_blank">
            <img src="/wp-content/images/apple-app-store-vert.gif" alt="WaiverFile on the Apple App Store for iPad and iPhone" class="img-responsive"/>
          </a>
          <br/>
            <a href="https://play.google.com/store/apps/details?id=com.waiverfile.mobile" target="_blank">
              <img src="/wp-content/images/google-play-vert.gif" alt="WaiverFile on Google Play for Android devices" class="img-responsive"/>
            </a>
        
        

        <a href="{$SchemeAndDomain}/b/{/ArrayOfAnyType/anyType[@xsi:type='WaiverSite']/Url}/admin/Style/ShareButtons.aspx" target="_blank">Click here</a> to learn how you can add a link to your website to accept waivers there as well.
    </p>

      
      <h4>Thank you for choosing WaiverFile!</h4>
      <p>
        Please feel free to <a href="/Contact.aspx">contact us</a> if you have any questions, comments, or product feedback! 
      </p>


     



    </xsl:template>
</xsl:stylesheet>
