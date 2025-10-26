<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" xmlns:str="http://exslt.org/strings" exclude-result-prefixes="dt str"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>


  <xsl:param name="TimeZoneName"></xsl:param>
  <xsl:output method="xml" omit-xml-declaration="yes"/>

  
  
  
  <xsl:param name="Subject"></xsl:param>
  <xsl:param name="SiteName"></xsl:param>
  <xsl:param name="SignatureCID"></xsl:param>
  <xsl:param name="QRCodeCID"></xsl:param>
  <xsl:param name="DateFormat"></xsl:param>
  <xsl:param name="BaseUrl"></xsl:param>

  <xsl:param name="LoadOriginalVersion"></xsl:param>
  <xsl:param name="OmitCustomFields"></xsl:param>
  <xsl:param name="LogoPath"></xsl:param>
  

  <xsl:template match="/ArrayOfWaiver">

    <xsl:for-each select="Waiver[position()=1]">

    <xsl:variable name="UnsubscribeUrl">
      <xsl:text>{UnsubscribeUrl}</xsl:text>
    </xsl:variable>

    <xsl:variable name="EmailConfirmed">
      <xsl:if test="Email=ValuesXml/data/field[@label='Confirm Email Address']/value">true</xsl:if>
    </xsl:variable>
    <xsl:variable name="EmailVerified">
      <xsl:if test="EmailVerification/VerifyStatus='Verified'">true</xsl:if>
    </xsl:variable>

    <html>
      <head>
        <meta name="viewport" content="width=device-width"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>
          <xsl:value-of select="$Subject"/>
        </title>
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
        <span class="preheader" style="color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;">Your WaiverFile Waiver</span>
        <table border="0" cellpadding="0" cellspacing="0" class="body" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background-color: #f6f6f6;">
          <tr>
            <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;">
              <xsl:text> </xsl:text>
            </td>
            <td class="container" style="font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; Margin: 0 auto; max-width: 580px; padding: 10px; width: 580px;">
              <div class="content" style="box-sizing: border-box; display: block; Margin: 0 auto; max-width: 580px; padding: 10px;">

                <!-- START CENTERED WHITE CONTAINER -->
                <table class="main" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;">

                  <!-- START MAIN CONTENT AREA -->
                  <tr>
                    <td class="wrapper" style="font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;">
                      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;">
                        <tr>
                          <xsl:choose>
                            <xsl:when test="$LogoPath!=''">
                              <td style="height:54px; width:298px;" width="298">




                                <img src="{$LogoPath}" alt="Logo" width="200" style="width:200px; max-width:200px; max-height:100px;"/>

                              </td>
                              <td style="color:#333333; font-size: 22px; text-align:right;">

                                <xsl:value-of select="$SiteName"/>
                              </td>
                            </xsl:when>
                            <xsl:otherwise>
                              <td style="color:#333333; font-size: 22px; text-align:center;padding-bottom:10px;" colspan="2">
                                <xsl:value-of select="$SiteName"/>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                        </tr>
                        <tr>
                          <td colspan="2" style="font-family: sans-serif; font-size: 14px; vertical-align: top;">

                            <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;">
                              Thank you for completing the waivers. A zipped copy of your documents are attached.
                            </p>


                           
                            <xsl:choose>
                              <xsl:when test="OriginalDataVerified='true' and $LoadOriginalVersion!='true'">
                                <tr>
                                  <td style="color:#333333; font-size: 15px; text-align:center; padding:10px; " colspan="2" align="center">

                                    <p style="text-align:center; font-weight:bold;color: red;">
                                      This waiver has been edited.
                                    </p>
                                  </td>
                                </tr>
                              </xsl:when>
                            </xsl:choose>

                            <xsl:if test="$QRCodeCID!=''">
                              <table style="width:100%;">
                                <tr>
                                  <td style="color:#333333; font-size: 15px; text-align:center; padding:10px; " colspan="2" align="center">



                                    <table style="width: 550px; max-width:100%; font-size:15px; margin:10px auto; font-family:'Courier New',sans-serif;  text-align:center; padding: 15px; -webkit-filter: drop-shadow(0 2px 10px #000); background-color: #ffffff; color:#000000; ">
                                      <tr>
                                        <td>
                                          <table style="padding: 10px;border:2px dashed #b6b6b6;color:#000000; width:550px;max-width:100%; ">
                                            <tr>
                                              <td>
                                                <p style="font-size:20px;">
                                                  <xsl:value-of select="$SiteName"/>
                                                </p>
                                                <p>
                                                  <xsl:text>Date: </xsl:text>
                                                  <xsl:value-of select="dt:format-date(DateSigned,$DateFormat)"/>
                                                </p>
                                                <table border="0" cellpadding="7" width="450" style=" width:450px;max-width:90%; ">
                                                  <tr>
                                                    <td valign="top" align="left">
                                                      <strong>Signee: </strong>
                                                      <br />
                                                      <xsl:value-of select="SignedNameFirst"/>
                                                      <xsl:text> </xsl:text>
                                                      <xsl:value-of select="SignedName"/>
                                                      <br />
                                                      <br />
                                                      <xsl:if test="count(Particpants/WaiverParticipant[IsSignee!='true'])!=0">
                                                        <strong>Participants: </strong>
                                                        <br />

                                                        <xsl:for-each select="Particpants/WaiverParticipant[IsSignee!='true']">
                                                          <xsl:value-of select="ParticipantNameFirst"/>
                                                          <xsl:text> </xsl:text>
                                                          <xsl:value-of select="ParticipantName"/>
                                                          <br />
                                                        </xsl:for-each>
                                                      </xsl:if>
                                                    </td>
                                                    <td valign="top" align="right">

                                                      <span style="font-size:26px">
                                                        <xsl:value-of select="count(Particpants/WaiverParticipant)"/>
                                                      </span>
                                                      <br />
                                                      <strong>Headcount</strong>
                                                    </td>

                                                  </tr>
                                                </table>



                                                <div style="margin:20px; text-align:center;">
                                                  <img style="max-width:95%;width:95%;" width="95%" src="cid:{$QRCodeCID}"/>
                                                </div>
                                                <p style="text-align:center; font-size:13px;">Please present this ticket for entry</p>

                                                <p style="color: #808080; font-size:11px; text-align:center;">
                                                  Powered by<br />
                                                  <a href="https://www.waiverfile.com/?wcs=pbw">
                                                    <img src="https://www.waiverfile.com/sharedmedia/waiverfile-logo-lg.png" alt="WaiverFile" height="26" width="150" />
                                                  </a>
                                                </p>
                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                    </table>




                                  </td>
                                </tr>
                              </table>
                            </xsl:if>

                          
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
                    <!-- ticket shows powered by. don't show it twice.  -->
                    <xsl:if test="$QRCodeCID=''">
                      <tr>
                        <td class="content-block powered-by" style="font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; font-size: 12px; color: #999999; text-align: center;">
                          Powered by<br /><a href="https://www.waiverfile.com/?wcs=pbw">
                            <img src="https://www.waiverfile.com/sharedmedia/waiverfile-logo-xsm.gif" alt="WaiverFile" width="120" />
                          </a>
                        </td>
                      </tr>
                    </xsl:if>
                  </table>
                </div>
                <!-- END FOOTER -->
                <!-- END CENTERED WHITE CONTAINER -->
              </div>
            </td>
            <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;">
              <xsl:text> </xsl:text>
            </td>
          </tr>
        </table>
      </body>
    </html>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
