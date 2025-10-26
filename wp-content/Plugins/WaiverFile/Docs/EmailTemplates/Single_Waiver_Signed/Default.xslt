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

  <xsl:param name="Body"></xsl:param>

  <xsl:template match="/Waiver">


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


                            <xsl:value-of select="Body" disable-output-escaping="yes"/>

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



                            <table width="100%" cellpadding="5" cellspacing="5" border="0">
                              <tr>
                                <td colspan="4">
                                  <h3>
                                    <xsl:value-of select="WaiverForm/Name"/>
                                  </h3>
                                  <xsl:if test="WaiverEvent/Name!=''">
                                    <h4>
                                      <xsl:value-of select="WaiverEvent/Name"/>
                                      <xsl:text> | </xsl:text>
                                      <xsl:value-of select="WaiverEvent/TimeLabel"/>
                                    </h4>
                                  </xsl:if>
                                </td>
                              </tr>

                              <tr>
                                <td colspan="4">
                                  <xsl:value-of select="WaiverText/AgreementText" disable-output-escaping="yes"/>
                                </td>
                              </tr>




                              <xsl:if test="Address!=''">

                                <tr>
                                  <td colspan="3">
                                    <span style="color:#373f4f">Address</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td colspan="4" style="font-weight:bold; color:#162440; ">
                                    <xsl:value-of select="Address"/>
                                  </td>
                                </tr>

                                <xsl:if test="Address2!=''">
                                  <tr>
                                    <td colspan="3">
                                      <span style="color:#373f4f">Address Line 2</span>
                                    </td>
                                    <td colspan="4" style="font-weight:bold; color:#162440; ">
                                      <xsl:value-of select="Address2"/>
                                    </td>
                                  </tr>
                                </xsl:if>


                                <tr>
                                  <td colspan="2">
                                    <span style="color:#373f4f">City</span>
                                  </td>
                                  <td>
                                    <span style="color:#373f4f">State</span>
                                  </td>
                                  <td>
                                    <span style="color:#373f4f">Zip</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td colspan="2" style="font-weight:bold; color:#162440; ">
                                    <xsl:value-of select="City"/>
                                  </td>
                                  <td style="font-weight:bold; color:#162440; ">
                                    <xsl:value-of select="State"/>
                                  </td>
                                  <td style="font-weight:bold; color:#162440; ">
                                    <xsl:value-of select="Zip"/>
                                  </td>
                                </tr>

                              </xsl:if>

                              <tr>
                                <xsl:if test="Phone!=''">
                                  <td colspan="2">
                                    <span style="color:#373f4f">Phone</span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="Email!=''">
                                  <td colspan="2">
                                    <span style="color:#373f4f">Email</span>
                                  </td>
                                </xsl:if>
                              </tr>

                              <tr>
                                <xsl:if test="Phone!=''">
                                  <td colspan="2" style="font-weight:bold; color:#162440; ">
                                    <xsl:value-of select="Phone"/>
                                  </td>
                                </xsl:if>
                                <xsl:if test="Email!=''">
                                  <td colspan="2" style="font-weight:bold; color:#162440; ">
                                    <xsl:value-of select="Email"/>
                                    <xsl:if  test="$EmailVerified='true' or $EmailConfirmed='true'">
                                      <xsl:text> (</xsl:text>
                                      <xsl:if test="$EmailConfirmed='true'">
                                        <xsl:text>confirmed</xsl:text>
                                        <xsl:if test="$EmailVerified='true'">
                                          <xsl:text>, </xsl:text>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="$EmailVerified='true'">
                                        <xsl:text>verified</xsl:text>
                                      </xsl:if>
                                      <xsl:text>)</xsl:text>
                                    </xsl:if>
                                  </td>
                                </xsl:if>
                              </tr>


                              <!-- 2 column trickery -->

                              <xsl:if test="$OmitCustomFields!='true'">
                                <xsl:for-each select="FieldsXml/data/fields">
                                  <xsl:variable name="pos">
                                    <xsl:value-of select="position()"/>
                                  </xsl:variable>
                                  <xsl:variable name="currlbl">
                                    <xsl:value-of select="label"/>
                                  </xsl:variable>
                                  <xsl:variable name="fieldCidParam">
                                    <xsl:value-of select="cid"></xsl:value-of>
                                  </xsl:variable>

                                  <xsl:if test="position() mod 2=1">


                                    <tr>
                                      <td colspan="2" valign="top">
                                        <span style="color:#373f4f">
                                          <xsl:value-of select="label"/>
                                        </span>

                                        <xsl:if test="../../../FieldsXml/data/fields[label=$currlbl]/field_options/description!=''">
                                          <br/>
                                          <span style="color:#838383;">
                                            <xsl:value-of select="../../../FieldsXml/data/fields[label=$currlbl]/field_options/description"/>
                                          </span>
                                        </xsl:if>

                                      </td>
                                      <!-- and the next row -->
                                      <xsl:for-each select="../../../FieldsXml/data/fields[position()=$pos+1]">
                                        <td colspan="2" valign="top">
                                          <span style="color:#373f4f">
                                            <xsl:value-of select="label"/>
                                          </span>
                                          <xsl:variable name="currlbl2">
                                            <xsl:value-of select="label"/>
                                          </xsl:variable>
                                          <xsl:if test="../../../FieldsXml/data/fields[label=$currlbl2]/field_options/description!=''">
                                            <br/>
                                            <span style="color:#838383;">
                                              <xsl:value-of select="../../../FieldsXml/data/fields[label=$currlbl2]/field_options/description"/>
                                            </span>
                                          </xsl:if>
                                        </td>
                                      </xsl:for-each>
                                    </tr>



                                    <tr>
                                      <td colspan="2" valign="top" style="font-weight:bold; color:#162440; ">
                                        <span style="color:#373f4f">
                                          <!-- get value by cid if possible, otherwise by label -->
                                          <xsl:choose>
                                            <xsl:when test="$fieldCidParam!='' and ../../../ValuesXml/data/field[@cid=$fieldCidParam]">
                                              <xsl:value-of select="../../../ValuesXml/data/field[@cid=$fieldCidParam]/value"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <xsl:value-of select="../../../ValuesXml/data/field[label=$currlbl]/value"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </span>
                                      </td>
                                      <!-- and the next row -->
                                      <xsl:for-each select="../../../ValuesXml/data/field[position()=$pos+1]">
                                        <td colspan="2" valign="top" style="font-weight:bold; color:#162440; ">
                                          <span style="color:#373f4f">
                                            <xsl:value-of select="value"/>
                                          </span>
                                        </td>
                                      </xsl:for-each>
                                    </tr>



                                  </xsl:if>


                                </xsl:for-each>
                              </xsl:if>
                              <tr>
                                <td colspan="4">
                                  <h4>Participants:</h4>
                                </td>
                              </tr>
                              <tr>
                                <xsl:choose>
                                  <xsl:when test="count(Particpants/WaiverParticipant[ParticipantNameFirst!=''])!=0">
                                    <td>
                                      <span style="color:#373f4f">First Name</span>
                                    </td>
                                    <td>
                                      <span style="color:#373f4f">Last Name</span>
                                    </td>
                                    <xsl:if test="$OmitCustomFields!='true' and  count(Particpants/WaiverParticipant[DOB!='' and DOB!='1/1/1753'])!=0">
                                      <td colspan="2">
                                        <span style="color:#373f4f">Date of Birth</span>
                                      </td>
                                    </xsl:if>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <td colspan="2">
                                      <span style="color:#373f4f">Name</span>
                                    </td>
                                    <xsl:if test="$OmitCustomFields!='true' and count(Particpants/WaiverParticipant[DOB!='' and DOB!='1/1/1753'])!=0">
                                      <td colspan="2">
                                        <span style="color:#373f4f">Date of Birth</span>
                                      </td>
                                    </xsl:if>
                                  </xsl:otherwise>
                                </xsl:choose>

                              </tr>
                              <xsl:for-each select="Particpants/WaiverParticipant">
                                <tr>
                                  <xsl:choose>
                                    <xsl:when test="count(../../Particpants/WaiverParticipant[ParticipantNameFirst!=''])!=0">
                                      <td valign="top" style="font-weight:bold; color:#162440; ">
                                        <xsl:value-of select="ParticipantNameFirst"/>
                                      </td>
                                      <td valign="top" style="font-weight:bold; color:#162440; ">
                                        <xsl:value-of select="ParticipantName"/>
                                      </td>
                                      <xsl:if test="count(../../Particpants/WaiverParticipant[DOB!='' and DOB!='1/1/1753'])!=0">
                                        <xsl:if test="$OmitCustomFields!='true' and DOB!='' and DOB!='1/1/1753'">
                                          <td colspan="2" valign="top" style="font-weight:bold; color:#162440; ">

                                            <xsl:choose>
                                              <xsl:when test="$DateFormat=''">
                                                <xsl:value-of select="DOB"/>
                                              </xsl:when>
                                              <xsl:otherwise>
                                                <xsl:choose>
                                                  <xsl:when test="dt:format-date(dt:parse-date(DOB,'M/d/yyyy'),$DateFormat)=''">
                                                    <!-- the app puts it in a format with - instead of / -->
                                                    <xsl:value-of select="dt:format-date(dt:parse-date(DOB,'M-d-yyyy'),$DateFormat)"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                    <xsl:value-of select="dt:format-date(dt:parse-date(DOB,'M/d/yyyy'),$DateFormat)"/>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                              </xsl:otherwise>
                                            </xsl:choose>
                                          </td>
                                        </xsl:if>
                                      </xsl:if>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <td colspan="2" valign="top" style="font-weight:bold; color:#162440; ">
                                        <xsl:value-of select="ParticipantName"/>
                                      </td>
                                      <xsl:if test="$OmitCustomFields!='true' and DOB!='' and DOB!='1/1/1753'">
                                        <td>
                                          <xsl:choose>
                                            <xsl:when test="$DateFormat=''">
                                              <xsl:value-of select="DOB"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <xsl:choose>
                                                <xsl:when test="dt:format-date(dt:parse-date(DOB,'M/d/yyyy'),$DateFormat)=''">
                                                  <!-- the app puts it in a format with - instead of / -->
                                                  <xsl:value-of select="dt:format-date(dt:parse-date(DOB,'M-d-yyyy'),$DateFormat)"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="dt:format-date(dt:parse-date(DOB,'M/d/yyyy'),$DateFormat)"/>
                                                </xsl:otherwise>
                                              </xsl:choose>
                                            </xsl:otherwise>
                                          </xsl:choose>

                                        </td>
                                      </xsl:if>
                                    </xsl:otherwise>
                                  </xsl:choose>

                                </tr>

                              </xsl:for-each>


                              <tr>
                                <td colspan="4">
                                  <hr></hr>
                                </td>
                              </tr>

                              <tr>
                                <td colspan="2">
                                  <h4>
                                    <span style="color:#373f4f">Signed By</span>
                                  </h4>
                                </td>
                                <td colspan="2">
                                  <span style="color:#373f4f">Signed On</span>
                                </td>
                              </tr>
                              <tr>
                                <td colspan="2" valign="top" style="font-weight:bold; color:#162440; ">


                                  <xsl:value-of select="SignedNameFirst"/>
                                  <xsl:if test="SignedNameFirst!=''">
                                    <xsl:text> </xsl:text>
                                  </xsl:if>
                                  <xsl:value-of select="SignedName"/>

                                </td>

                                <td colspan="2" valign="top" style="font-weight:bold; color:#162440; ">


                                  <xsl:choose>
                                    <xsl:when test="$DateFormat=''">
                                      <xsl:value-of select="dt:format-date(DateSigned,'MMMM d, yyyy h:mm a')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:variable name="combined_format_str">
                                        <xsl:value-of select="$DateFormat"></xsl:value-of>
                                        <xsl:text> h:mm a</xsl:text>
                                      </xsl:variable>
                                      <xsl:value-of select="dt:format-date(DateSigned,$combined_format_str)"/>

                                    </xsl:otherwise>
                                  </xsl:choose>

                                  <xsl:text> </xsl:text>
                                  <xsl:value-of select="$TimeZoneName"/>


                                </td>
                              </tr>



                              <xsl:if test="$OmitCustomFields!='true' and DOB!='' and DOB!='1/1/1753'">

                                <tr>
                                  <td colspan="2">
                                    <span style="color:#373f4f">Date of Birth</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td colspan="2" valign="top" style="font-weight:bold; color:#162440; ">
                                    <xsl:choose>
                                      <xsl:when test="$DateFormat=''">
                                        <xsl:value-of select="DOB"/>
                                      </xsl:when>
                                      <xsl:otherwise>
                                        <xsl:choose>
                                          <xsl:when test="dt:format-date(dt:parse-date(DOB,'M/d/yyyy'),$DateFormat)=''">
                                            <!-- the app puts it in a format with - instead of / -->
                                            <xsl:value-of select="dt:format-date(dt:parse-date(DOB,'M-d-yyyy'),$DateFormat)"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                            <xsl:value-of select="dt:format-date(dt:parse-date(DOB,'M/d/yyyy'),$DateFormat)"/>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                      </xsl:otherwise>
                                    </xsl:choose>
                                  </td>
                                </tr>


                              </xsl:if>




                              <tr>
                                <td colspan="4">

                                  <xsl:choose>
                                    <xsl:when test="count(/Waiver/Signatures/WFSignature2[EntryType='Typed' and LocationIndexes/int[.=-1]])!=0">
                                      <span class="sigtyped" style="font-family: 'Marck Script', cursive;font-size: 27px;padding: 10px;">
                                        <xsl:value-of select="str:replace(/Waiver/Signatures/WFSignature2[EntryType='Typed' and LocationIndexes/int[.=-1]]/SigData,'__TYPED__','')"></xsl:value-of>
                                      </span>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:if test="HasSignature='true' and $SignatureCID!=''">
                                        <img src="cid:{$SignatureCID}" alt="Signature" style="max-width:100%"></img>
                                      </xsl:if>
                                    </xsl:otherwise>
                                  </xsl:choose>


                                </td>
                              </tr>



                              <tr>
                                <td width="25%"></td>
                                <td width="25%"></td>
                                <td width="25%"></td>
                                <td width="25%"></td>
                              </tr>

                            </table>


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
  </xsl:template>

</xsl:stylesheet>
