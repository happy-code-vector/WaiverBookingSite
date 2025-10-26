<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="Subject"></xsl:param>
  <xsl:param name="Comments"></xsl:param>
  <xsl:param name="FormID"></xsl:param>
  <xsl:param name="FormName"></xsl:param>

  <xsl:template match="/Main">

    <xsl:variable name="UnsubscribeUrl">
      <xsl:text>{UnsubscribeUrl}</xsl:text>
    </xsl:variable>

    <html>
      <head>
        <meta name="viewport" content="width=device-width"/>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>
              <xsl:value-of select="$Subject"/>
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
                <span class="preheader" style="color:transparent;display:none;height:0;max-height:0;max-width:0;opacity:0;overflow:hidden;mso-hide:all;visibility:hidden;width:0;"><xsl:value-of select="$Subject"/></span>
                <table class="main" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;background:#fff;border-radius:3px;width:100%;">
                  <!-- START MAIN CONTENT AREA -->
                  <tr>
                    <td class="wrapper" style="font-family:sans-serif;font-size:14px;vertical-align:top;box-sizing:border-box;padding:20px;">
                      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;width:100%;">
                        <tr>
                          <td style="font-family:sans-serif;font-size:14px;vertical-align:top;">
                            <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">A customer has requested assistance setting up their waiver form. Please see the attached file and help with the conversion. </p>

                            <p style="font-family:sans-serif;font-size:14px;font-weight:bold;margin:0;Margin-bottom:15px;">Customer Details:</p>

                            <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">



                              <strong>Name: </strong>
                              <xsl:value-of select="/Main/WPUser/First_Name"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="/Main/WPUser/Last_Name"/>
                              <br/>
                              <strong>Email: </strong>
                              <xsl:value-of select="/Main/WPUser/Email_Address"/>
                              <br/>

                              <strong>Company: </strong>
                              <xsl:value-of select="/Main/WaiverSite/Customer/Company"/>
                              <br/>

                              <strong>Waiver Site URL: </strong>
                              <a href="{/Main/WaiverSite/BaseUrlAbsolute}">
                                <xsl:value-of select="/Main/WaiverSite/BaseUrlAbsolute"/>
                              </a>
                              <br/>
                              <strong>Admin URL: </strong>
                              <a href="{/Main/WaiverSite/BaseUrlAbsolute}/admin">
                                <xsl:value-of select="/Main/WaiverSite/BaseUrlAbsolute"/>/admin
                              </a>
                              <br/>
                              
                            </p>


                            <p style="font-family:sans-serif;font-size:14px;font-weight:bold;margin:0;Margin-bottom:15px;">Customer Comments/Questions:</p>

                            <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
                              <xsl:value-of select="$Comments"/>
                              <xsl:if test="$Comments=''">None entered.</xsl:if>
                            </p>

                            <xsl:if test="$FormID!='00000000-0000-0000-0000-000000000000'">
                              <p style="font-family:sans-serif;font-size:14px;font-weight:bold;margin:0;Margin-bottom:15px;">Specific Form: </p>

                              <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
                                <xsl:value-of select="$FormName"/>
                                <xsl:text> (</xsl:text>
                                <a href="{/Main/WaiverSite/BaseUrlAbsolute}/admin/Setup.aspx?id={$FormID}">Edit this waiver form</a>)
                              </p>
                            </xsl:if>




                            <table border="0" cellpadding="0" cellspacing="0" class="btn btn-primary" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;box-sizing:border-box;width:100%;">
                              <tbody>
                                <tr>
                                  <td align="left" style="font-family:sans-serif;font-size:14px;vertical-align:top;padding-bottom:15px;">
                                    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;width:100%;width:auto;">
                                      <tbody>
                                        <tr>
                                          <td style="font-family:sans-serif;font-size:14px;vertical-align:top;background-color:#ffffff;border-radius:5px;text-align:center;background-color:#005dac;">
                                            <a href="{/Main/WaiverSite/BaseUrlAbsolute}/admin/Settings/Waiver-Forms.aspx" style="border: solid 1px #005dac;border-radius: 5px;box-sizing: border-box;cursor: pointer;display: inline-block;font-size: 14px;font-weight: bold;margin: 0;padding: 12px 25px;text-decoration: none;text-transform: capitalize;background-color: #005dac;color: #ffffff;">
                                              Manage Customer's Waivers
                                            </a>
                                          </td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                           
                            <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">Thank you!</p>

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
