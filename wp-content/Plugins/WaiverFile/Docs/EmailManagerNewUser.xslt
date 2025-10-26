<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>


  <xsl:param name="BaseUrl"></xsl:param>
  <xsl:param name="Email"></xsl:param>
  <xsl:param name="SiteName"></xsl:param>
  <xsl:param name="Password"></xsl:param>
  <xsl:param name="Message"></xsl:param>

  <xsl:template match="/">

    <html>
      <head>
        <meta name="viewport" content="width=device-width"/>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Event Invitation</title>
            <style>
              /* -------------------------------------
              INLINED WITH htmlemail.io/inline
              ------------------------------------- */
              /* -------------------------------------
              RESPONSIVE AND MOBILE FRIENDLY STYLES
              ------------------------------------- */
              @media only screen and (max-width: 620px) {
              table[class=body] h1 {
              font-size: 28px !important;
              margin-bottom: 10px !important;
              }

              table[class=body] p,
              table[class=body] ul,
              table[class=body] ol,
              table[class=body] td,
              table[class=body] span,
              table[class=body] a {
              font-size: 16px !important;
              }

              table[class=body] .wrapper,
              table[class=body] .article {
              padding: 10px !important;
              }

              table[class=body] .content {
              padding: 0 !important;
              }

              table[class=body] .container {
              padding: 0 !important;
              width: 100% !important;
              }

              table[class=body] .main {
              border-left-width: 0 !important;
              border-radius: 0 !important;
              border-right-width: 0 !important;
              }

              table[class=body] .btn table {
              width: 100% !important;
              }

              table[class=body] .btn a {
              width: 100% !important;
              }

              table[class=body] .img-responsive {
              height: auto !important;
              max-width: 100% !important;
              width: auto !important;
              }
              }

              /* -------------------------------------
              PRESERVE THESE STYLES IN THE HEAD
              ------------------------------------- */
              @media all {
              .ExternalClass {
              width: 100%;
              }

              .ExternalClass,
              .ExternalClass p,
              .ExternalClass span,
              .ExternalClass font,
              .ExternalClass td,
              .ExternalClass div {
              line-height: 100%;
              }

              .apple-link a {
              color: inherit !important;
              font-family: inherit !important;
              font-size: inherit !important;
              font-weight: inherit !important;
              line-height: inherit !important;
              text-decoration: none !important;
              }

              #MessageViewBody a {
              color: inherit;
              text-decoration: none;
              font-size: inherit;
              font-family: inherit;
              font-weight: inherit;
              line-height: inherit;
              }

              .btn-primary table td:hover {
              background-color: #005dac !important;
              }

              .btn-primary a:hover {
              background-color: #005dac !important;
              border-color: #005dac !important;
              }
              }
            </style>
          </head>
      <body class="" style="background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;">
        <span class="preheader" style="color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;"> You have been granted access to view the waiver entries for this event!</span>
        <table border="0" cellpadding="0" cellspacing="0" class="body" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background-color: #f6f6f6;">
          <tr>
            <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;"><xsl:text> </xsl:text></td>
            <td class="container" style="font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; Margin: 0 auto; max-width: 580px; padding: 10px; width: 580px;">
              <div class="content" style="box-sizing: border-box; display: block; Margin: 0 auto; max-width: 580px; padding: 10px;">

                <!-- START CENTERED WHITE CONTAINER -->
                <table class="main" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;">

                  <!-- START MAIN CONTENT AREA -->
                  <tr>
                    <td class="wrapper" style="font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;">
                      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;">
                        <tr>
                          <td colspan="3" style="font-family: sans-serif; font-size: 14px; vertical-align: top;">

                            <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;">
                              Hi there,
                            </p>
                            <xsl:if test="$Message!=''">
                              <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;">
                                <xsl:value-of select="$Message" disable-output-escaping="yes" />
                              </p>
                            </xsl:if>

                            <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;">
                              You have been granted access to view the waiver entries for this event!
                            </p>



                          </td>

                        </tr>
                        <tr>
                          <td width="280"  style="font-family: sans-serif; font-size: 14px; vertical-align: top; width:280px;">
                            <table border="0" cellpadding="0" cellspacing="0" class="btn btn-primary" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; box-sizing: border-box;">
                              <tbody>
                                <tr>
                                  <td align="left" style="font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;">
                                    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;">
                                      <tbody>
                                        <tr>
                                          <td style="font-family: sans-serif; font-size: 14px; vertical-align: top; background-color: #0083ca; border-radius: 5px; text-align: center;">
                                            <a href="{$BaseUrl}/Manager" target="_blank" style="display: inline-block; color: #ffffff; background-color: #0083ca; border: solid 1px #0083ca; border-radius: 5px; box-sizing: border-box; cursor: pointer; text-decoration: none; font-size: 14px; font-weight: bold; margin: 0; padding: 12px 25px; text-transform: capitalize; border-color: #0083ca;">
                                              View Signed Waivers
                                            </a>
                                          </td>
                                        </tr>
                                      </tbody>
                                    </table>
                                    <br/>
                                    <p style="font-family: sans-serif; font-size: 12px; font-weight: normal; margin: 0; Margin-bottom: 15px;">
                                      <strong>Your Login Info:</strong><br />
                                      <strong>Email Address: </strong><xsl:value-of select="$Email" /><br />
                                      <strong>Password: </strong><xsl:value-of select="$Password" /><br />
                                      <br />
                                      Once logged in, you can click on the account icon to change your password to something easier to remember.
                                    </p>


                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </td>
                          <td width="20" style="width:20px;">
                            <xsl:text> </xsl:text>
                            
                          </td>
                          <td width="280" style="font-family: sans-serif; font-size: 14px; vertical-align: top;width:280px;">
                            <table border="0" cellpadding="0" cellspacing="0" class="btn btn-primary" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; box-sizing: border-box;">
                              <tbody>
                                <tr>
                                  <td align="left" style="font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;">
                                    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;">
                                      <tbody>
                                        <tr>
                                          <td style="font-family: sans-serif; font-size: 14px; vertical-align: top; background-color: #0083ca; border-radius: 5px; text-align: center;">
                                            <a href="{$BaseUrl}/Waiver.aspx?id={/WaiverEvent/WaiverEventID}" target="_blank" style="display: inline-block; color: #ffffff; background-color: #0083ca; border: solid 1px #0083ca; border-radius: 5px; box-sizing: border-box; cursor: pointer; text-decoration: none; font-size: 14px; font-weight: bold; margin: 0; padding: 12px 25px; text-transform: capitalize; border-color: #0083ca;">
                                              Link to Waiver
                                            </a>
                                          </td>
                                        </tr>
                                      </tbody>
                                    </table>
                                    <br/>
                                    <p style="font-family: sans-serif; font-size: 12px; font-weight: normal; margin: 0; Margin-bottom: 15px;">
                                      Share the link to this waiver with attendees:
                                    </p>
                                    <p style="font-family: sans-serif; font-size: 12px; font-weight: normal; margin: 0; Margin-bottom: 15px;">
                                      <a href="{$BaseUrl}/Waiver.aspx?id={/WaiverEvent/WaiverEventID}">
                                        <xsl:value-of select="$BaseUrl" />
                                        <xsl:text>/Waiver.aspx?id=</xsl:text>
                                        <xsl:value-of select="/WaiverEvent/WaiverEventID" />
                                      </a>
                                    </p>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="3" style="font-family: sans-serif; font-size: 14px; vertical-align: top; text-align:center;">
                            <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;text-align:center;">
                              <strong>Event Details</strong>
                              <br />
                              <br />
                              Name: <xsl:value-of select="/WaiverEvent/Name" /><br />
                              <xsl:text>Date: </xsl:text>


                              <xsl:choose>
                                <xsl:when test="/WaiverEvent/IsAllDay='true'">
                                  <xsl:choose>
                                    <xsl:when test="/WaiverEvent/DateStart=/WaiverEvent/DateEnd">
                                      <xsl:value-of select="dt:format-date(/WaiverEvent/DateStart,'MMM d, yyyy')" />
                                      <br />
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:value-of select="dt:format-date(/WaiverEvent/DateStart,'MMM d, yyyy')" />
                                      <xsl:text> to </xsl:text>
                                      <xsl:value-of select="dt:format-date(/WaiverEvent/DateEnd,'MMM d, yyyy')" />

                                    </xsl:otherwise>
                                  </xsl:choose>
                                </xsl:when>
                                <xsl:when test="/WaiverEvent/DateStart=/WaiverEvent/DateEnd">
                                  <xsl:value-of select="dt:format-date(/WaiverEvent/DateStart,'MMMM d, yyyy h:mm a')" />
                                </xsl:when>
                                <xsl:when test="dt:hour-in-day(/WaiverEvent/DateStart)=0 and dt:hour-in-day(/WaiverEvent/DateEnd)=0">
                                  <xsl:value-of select="dt:format-date(/WaiverEvent/DateStart,'MMMM d')" />
                                  <xsl:text> to </xsl:text>
                                  <xsl:value-of select="dt:format-date(/WaiverEvent/DateEnd,'MMMM d, yyyy')" />
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:choose>
                                    <xsl:when test="dt:day-in-month(/WaiverEvent/DateStart) = dt:day-in-month(/WaiverEvent/DateEnd) and dt:month-in-year(/WaiverEvent/DateStart) = dt:month-in-year(/WaiverEvent/DateEnd)">
                                      <xsl:value-of select="dt:format-date(/WaiverEvent/DateStart,'MMMM d, yyyy h:mm a')" />
                                      <xsl:text> - </xsl:text>
                                      <xsl:value-of select="dt:format-date(/WaiverEvent/DateEnd,'h:mm a')" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:value-of select="dt:format-date(/WaiverEvent/DateStart,'MMMM d, yyyy h:mm a')" />
                                      <xsl:text> to </xsl:text>
                                      <xsl:value-of select="dt:format-date(/WaiverEvent/DateEnd,'MMMM d, yyyy h:mm a')" />
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </xsl:otherwise>
                              </xsl:choose>


                            </p>
                            
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <img src="https://www.waiverfile.com/sharedmedia/spacer.gif" alt="" width="270" height="1" style="width:270px; height:1px;" />
                          </td>
                          <td>
                            <img src="https://www.waiverfile.com/sharedmedia/spacer.gif" alt="" width="20" height="1" style="width:20px; height:1px;" />
                          </td>
                          <td>
                            <img src="https://www.waiverfile.com/sharedmedia/spacer.gif" alt="" width="270" height="1" style="width:270px; height:1px;" />
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>

                  <!-- END MAIN CONTENT AREA -->
                </table>

                <!-- START FOOTER -->
                <div class="footer" style="clear: both; Margin-top: 10px; text-align: center; width: 100%;">
                  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;">
                    <tr>
                      <td class="content-block" style="font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; font-size: 12px; color: #999999; text-align: center;">
                        <span class="apple-link" style="color: #999999; font-size: 12px; text-align: center;">
                          <xsl:text>Sent by WaiverFile on behalf of  </xsl:text>
                          <xsl:value-of select="$SiteName" />.


                          <br />
                          WaiverFile. P.O. Box 35, Bayville, NY 11709.
                        </span>
                      </td>
                    </tr>
                    <tr>
                      <td class="content-block powered-by" style="font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; font-size: 12px; color: #999999; text-align: center;">
                        Powered by<br /><a href="https://www.waiverfile.com/?wcs=pbw">
                          <img src="https://www.waiverfile.com/sharedmedia/waiverfile-logo-xsm.gif" alt="WaiverFile" width="120" />
                        </a>
                      </td>
                    </tr>
                  </table>
                </div>
                <!-- END FOOTER -->
                <!-- END CENTERED WHITE CONTAINER -->
              </div>
            </td>
            <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;"><xsl:text> </xsl:text></td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
