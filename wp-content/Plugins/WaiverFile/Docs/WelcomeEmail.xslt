<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="NewPassword"></xsl:param>
  <xsl:param name="SchemeAndDomain"></xsl:param>
  <xsl:param name="CustomMessage"></xsl:param>

  <xsl:template match="*">

    <xsl:variable name="UnsubscribeUrl">
      <xsl:text>{UnsubscribeUrl}</xsl:text>
    </xsl:variable>

    <html>
      <head>
        <meta name="viewport" content="width=device-width"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>
          WaiverFile Account Details
        </title>
        <style type="text/css">
          /* -------------------------------------
          INLINED WITH https://putsmail.com/inliner
          ------------------------------------- */
          /* -------------------------------------
          RESPONSIVE AND MOBILE FRIENDLY STYLES
          ------------------------------------- */
          @media only screen and (max-width: 620px) {
          table[class=body] h1 {
          font-size: 28px !important;
          margin-bottom: 10px !important; }
          table[class=body] p,
          table[class=body] ul,
          table[class=body] ol,
          table[class=body] td,
          table[class=body] span,
          table[class=body] a {
          font-size: 16px !important; }
          table[class=body] .wrapper,
          table[class=body] .article {
          padding: 10px !important; }
          table[class=body] .content {
          padding: 0 !important; }
          table[class=body] .container {
          padding: 0 !important;
          width: 100% !important; }
          table[class=body] .main {
          border-left-width: 0 !important;
          border-radius: 0 !important;
          border-right-width: 0 !important; }
          table[class=body] .btn table {
          width: 100% !important; }
          table[class=body] .btn a {
          width: 100% !important; }
          table[class=body] .img-responsive {
          height: auto !important;
          max-width: 100% !important;
          width: auto !important; }}
          /* -------------------------------------
          PRESERVE THESE STYLES IN THE HEAD
          ------------------------------------- */
          @media all {
          .ExternalClass {
          width: 100%; }
          .ExternalClass,
          .ExternalClass p,
          .ExternalClass span,
          .ExternalClass font,
          .ExternalClass td,
          .ExternalClass div {
          line-height: 100%; }
          .apple-link a {
          color: inherit !important;
          font-family: inherit !important;
          font-size: inherit !important;
          font-weight: inherit !important;
          line-height: inherit !important;
          text-decoration: none !important; }
          .btn-primary table td:hover {
          background-color: #34495e !important; }
          .btn-primary a:hover {
          background-color: #34495e !important;
          border-color: #34495e !important; } }
        </style>
      </head>
      <body class="" style="background-color:#f6f6f6;font-family:sans-serif;-webkit-font-smoothing:antialiased;font-size:14px;line-height:1.4;margin:0;padding:0;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">
        <table border="0" cellpadding="0" cellspacing="0" class="body" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;background-color:#f6f6f6;width:100%;">
          <tr>
            <td style="font-family:sans-serif;font-size:14px;vertical-align:top;">
              <xsl:text> </xsl:text>
            </td>
            <td class="container" style="font-family:sans-serif;font-size:14px;vertical-align:top;display:block;max-width:580px;padding:10px;width:580px;Margin:0 auto !important;">
              <div class="content" style="box-sizing:border-box;display:block;Margin:0 auto;max-width:580px;padding:10px;">
                <!-- START CENTERED WHITE CONTAINER -->
                <span class="preheader" style="color:transparent;display:none;height:0;max-height:0;max-width:0;opacity:0;overflow:hidden;mso-hide:all;visibility:hidden;width:0;">
                  WaiverFile Account Details
                </span>
                <table class="main" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;background:#fff;border-radius:3px;width:100%;">
                  <!-- START MAIN CONTENT AREA -->
                  <tr>
                    <td class="wrapper" style="font-family:sans-serif;font-size:14px;vertical-align:top;box-sizing:border-box;padding:20px;">
                      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;width:100%;">
                        <tr>
                          <td style="font-family:sans-serif;font-size:14px;vertical-align:top;">
                            <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
                              <xsl:text>Hi </xsl:text>
                              <xsl:value-of select="/ArrayOfAnyType/anyType[@xsi:type='Customer']/FirstName"/>
                              <xsl:text>, </xsl:text>
                            </p>
                            <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">Thank you for trying WaiverFile! Your new trial account is set up and ready to use! </p>

                            <xsl:if test="$CustomMessage!=''">
                              <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
                                <xsl:value-of select="$CustomMessage"/> </p>  
                            </xsl:if>



                            <p style="font-family:sans-serif;font-size:16px;font-weight:700;margin:0;Margin-bottom:15px;">
                              Getting Started
                            </p>

                            <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
                              Watch the video below to learn a bit more about how to get started using WaiverFile.
                            </p>

                            <p class="text-align:center">
                              <a href="https://www.waiverfile.com/Resources/Help/Getting-Started/Quick-Start/Waiver-Form-Setup.aspx">
                                <img src="http://www.waiverfile.com/sharedmedia/waiverfile-setup-video-thumb.gif" alt="Getting started video"/>
                              </a>
                            </p>


                            <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
                              Please feel free to contact us with any questions you may have or if you need help getting your account configured. <a href="mailto:info@waiverfile.com">info@waiverfile.com</a>
                            </p>
                            
                            
                            <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">Here are your account details: </p>


                            <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
                              <strong>Setup / Admin Dashboard:</strong>
                              <a href="{$SchemeAndDomain}/b/{/ArrayOfAnyType/anyType[@xsi:type='WaiverSite']/Url}/admin">
                                <xsl:value-of select="$SchemeAndDomain"/>
                                <xsl:text>/b/</xsl:text>
                                <xsl:value-of select="/ArrayOfAnyType/anyType[@xsi:type='WaiverSite']/Url"/>
                                <xsl:text>/admin</xsl:text>
                              </a>
                            </p>

                            
                            <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
                              <strong>Signature Area:</strong>
                              <a href="{$SchemeAndDomain}/b/{/ArrayOfAnyType/anyType[@xsi:type='WaiverSite']/Url}">
                                <xsl:value-of select="$SchemeAndDomain"/>
                                <xsl:text>/b/</xsl:text>
                                <xsl:value-of select="/ArrayOfAnyType/anyType[@xsi:type='WaiverSite']/Url"/>
                              </a>
                              <br/>
                              <em>(Share this or link to it from your website!)</em>
                            </p>


                            <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
                              <strong>Your Login Info:</strong>
                              <br/>
                              <strong>Email: </strong>
                              <xsl:value-of select="/ArrayOfAnyType/anyType[@xsi:type='Customer']/Email"/>
                              <br/>
                              <xsl:if test="$NewPassword!=''">
                                <strong>Password: </strong>
                                <xsl:value-of select="$NewPassword"/>
                              </xsl:if>
                              <xsl:if test="$NewPassword=''">
                                <strong>Password: </strong>
                                <xsl:text> *******</xsl:text>
                                <br/>
                                If you forgot your password, <a href="https://www.waiverfile.com/Forgot-Password.aspx">click here</a> to reset it.
                              </xsl:if>

                            </p>
                            
                          
                            <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">Thank you for trying WaiverFile!</p>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <!-- END MAIN CONTENT AREA -->
                </table>
                <!-- START FOOTER -->
                <div class="footer" style="clear:both;padding-top:10px;text-align:center;width:100%;">
                  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;width:100%;">
                    <tr>
                      <td class="content-block" style="font-family:sans-serif;font-size:14px;vertical-align:top;color:#999999;font-size:12px;text-align:center;">
                        <span class="apple-link" style="color:#999999;font-size:12px;text-align:center;">WaiverFile, PO Box 35, Bayville, NY 11709</span>
                        <br/>
                        Want to stop receiving these emails? <a href="{$UnsubscribeUrl}" style="color:#005dac;text-decoration:underline;color:#999999;font-size:12px;text-align:center;">Unsubscribe</a>.
                      </td>
                    </tr>
                    <tr>
                      <td class="content-block powered-by" style="font-family:sans-serif;font-size:14px;vertical-align:top;color:#999999;font-size:12px;text-align:center;">
                        <br/>
                        <a href="https://www.waiverfile.com">
                          <img src="http://www.waiverfile.com/sharedmedia/waiverfile-logo-xsm.gif"/>
                        </a>
                      </td>
                    </tr>
                  </table>
                </div>
                <!-- END FOOTER -->
                <!-- END CENTERED WHITE CONTAINER -->
              </div>
            </td>
            <td style="font-family:sans-serif;font-size:14px;vertical-align:top;">
              <xsl:text> </xsl:text>
            </td>
          </tr>
        </table>
      </body>
    </html>


  </xsl:template>
</xsl:stylesheet>
