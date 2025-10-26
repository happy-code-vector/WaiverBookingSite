<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">
    
    <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="last">false</xsl:param>
  <xsl:param name="TimeZoneName"></xsl:param>
  <xsl:param name="SiteName"></xsl:param>
  <xsl:param name="DateFormat"></xsl:param>
  <xsl:param name="BaseUrl"></xsl:param>
  <xsl:param name="SchemeAndDomain"></xsl:param>
  <xsl:param name="ConvertSVG"></xsl:param>
  

  <xsl:variable name="TableWidth">
    <xsl:text>100%</xsl:text>
    <!-- previous was 600 -->
  </xsl:variable>


  <xsl:template match="/Waiver">

    <script type="text/javascript">
      window.onload = function() { window.print(); }
    </script>

    <!-- header -->
    <table width="{$TableWidth}" style="background-color:#ffffff; " cellpadding="10">
      <tr>
        <td width="50%">
          <a href="http://www.waiverfile.com">
            <img src="https://www.waiverfile.com/sharedmedia/waiverfile-logo-sm.gif" alt="WaiverFile" height="54" width="298"/>
          </a>
        </td>
        <td style="color:#333333; font-size: 28px; text-align:right;">

          <xsl:value-of select="$SiteName"/>
        </td>
      </tr>

      <tr>
        <td colspan="2"> 
          <xsl:text> </xsl:text>
        </td>
      </tr>

    </table>


    <table width="{$TableWidth}" border="0" class="structuretable" cellspacing="0" cellpadding="0">

      <tr>
        <td>
          <h3>
            <xsl:value-of select="WaiverForm/Name"/>
            <xsl:if test="WaiverEvent/Name!=''">
              <xsl:text> | </xsl:text>
              <xsl:value-of select="WaiverEvent/Name"/>
              <xsl:text> | </xsl:text>
              <xsl:value-of select="WaiverEvent/TimeLabel"/>

            </xsl:if>
          </h3>

        </td>
        <td>
          <h3>Participants</h3>
        </td>
      </tr>

      <xsl:for-each select="/Waiver">


        <xsl:variable name="EmailConfirmed">
          <xsl:if test="Email=ValuesXml/data/field[@label='Confirm Email Address']/value">true</xsl:if>
        </xsl:variable>
        <xsl:variable name="EmailVerified">
          <xsl:if test="EmailVerification/VerifyStatus='Verified'">true</xsl:if>
        </xsl:variable>

        
        
        <tr>
          <td valign="top">
            <!-- main info here -->

            <table width="100%" border="0" cellspacing="0" cellpadding="5" class="datatable">
              <tbody>
              <tr>
                <td>
                  <strong>Signee Name</strong>
                </td>
                <td>
                  <xsl:value-of select="SignedNameFirst"/>
                  <xsl:if test="SignedNameFirst!=''">
                    <xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:value-of select="SignedName"/>
                </td>
              </tr>
              <xsl:if test="DOB!='' and DOB!='1/1/1753'">
                <tr>
                  <td>
                    <strong>Date of Birth</strong>
                  </td>
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
                </tr>
              </xsl:if>
              <xsl:if test="Address!=''">

                <tr>
                  <td>
                    <strong>Address</strong>
                  </td>
                  <td>
                    <xsl:value-of select="Address"/>
                  </td>
                </tr>
                <xsl:if test="Address2!=''">
                  <tr>
                    <td>
                      <strong>Address Line 2</strong>
                    </td>
                    <td>
                      <xsl:value-of select="Address2"/>
                    </td>
                  </tr>
                </xsl:if>
                <tr>
                  <td>
                    <strong>City, State, Zip</strong>
                  </td>
                  <td>
                    <xsl:value-of select="City"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="State"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="Zip"/>
                  </td>
                </tr>
              </xsl:if>
              
              <xsl:if test="Phone!=''">
                <tr>
                <td>
                  <strong>Phone</strong>
                </td>
                <td>
                  <xsl:value-of select="Phone"/>
                </td>
                </tr>
              </xsl:if>
              
              <xsl:if test="Email!=''">
                <tr>
                <td>
                  <strong>Email</strong>
                </td>
                <td>
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
                </tr>
              </xsl:if>
              <tr>
                <td>
                  <strong>Client IP Address</strong>
                </td>
                <td>
                  <xsl:value-of select="ClientIP"/>
                </td>
              </tr>
                <tr>
                  <td>
                    <strong>Mailing List Opt-In</strong>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="OptIn='true'">Yes</xsl:when>
                      <xsl:otherwise>No</xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
              </tbody>
            </table>
            
          </td>
          <td valign="top">
            <!-- participants here -->
            <xsl:if test="count(Particpants/WaiverParticipant)!=0">

              <xsl:choose>
                <xsl:when test="Particpants/WaiverParticipant/ValuesXml/Values/Value">
                  <!-- custom values have been specified. render them in chunks -->


                  <xsl:for-each select="Particpants/WaiverParticipant">
                    <h4>
                      <xsl:value-of select="ParticipantNameFirst"/>
                      <xsl:if test="ParticipantNameFirst!=''">
                        <xsl:text> </xsl:text>
                      </xsl:if>
                      <xsl:value-of select="ParticipantName"/>
                    </h4>
                    <table width="100%" cellspacing="0" cellpadding="4" class="table table-condensed datatable">

                      <tbody>



                        <xsl:if test="DOB!='' and DOB!='1/1/1753'">
                          <tr>
                            <td>
                              <strong>Date of Birth</strong>
                            </td>
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
                          </tr>
                        </xsl:if>

                        <xsl:for-each select="ValuesXml/Values/Value">
                          <tr>
                            <td>
                              <strong>
                                <xsl:value-of select="@label"/>
                              </strong>
                            </td>
                            <td>
                              <xsl:value-of select="."/>
                            </td>
                          </tr>

                        </xsl:for-each>
                      </tbody>
                    </table>
                  </xsl:for-each>

                </xsl:when>
                <xsl:otherwise>

                  <table width="100%" cellspacing="0" cellpadding="4" class="participantstable">
                    <thead>
                      <tr>
                        <th>Name</th>
                        <xsl:if test="count(Particpants/WaiverParticipant[DOB!='' and DOB!='1/1/1753'])!=0">
                          <th>
                            <strong>Date of Birth</strong>
                          </th>
                        </xsl:if>
                      </tr>
                    </thead>
                    <tbody>
                      <xsl:for-each select="Particpants/WaiverParticipant">

                        <tr>
                          <td width="50%">
                            <xsl:value-of select="ParticipantNameFirst"/>
                            <xsl:if test="ParticipantNameFirst!=''">
                              <xsl:text> </xsl:text>
                            </xsl:if>
                            <xsl:value-of select="ParticipantName"/>
                          </td>
                          <xsl:if test="count(../../Particpants/WaiverParticipant[DOB!='' and DOB!='1/1/1753'])!=0">
                            <xsl:if test="DOB!='' and DOB!='1/1/1753'">
                              <td width="50%">
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
                        </tr>
                      </xsl:for-each>
                    </tbody>
                  </table>
                </xsl:otherwise>
              </xsl:choose>




            </xsl:if>

          </td>
        </tr>

        <!-- custom questions -->

        <tr>



          <xsl:for-each select="FieldsXml/data/fields">
            <xsl:variable name="pos">
              <xsl:value-of select="position()"/>
            </xsl:variable>
            <xsl:variable name="currlbl">
              <xsl:value-of select="label"/>
            </xsl:variable>
            
            <td width="50%" valign="top">
              <table width="100%" cellspacing="0" cellpadding="4" class="datatable">
                <tr>
                  <td width="50%">
                    <strong>
                      <xsl:value-of select="label"/>
                    </strong>
                  </td>
                  <td width="50%">
                    <xsl:value-of select="../../../ValuesXml/data/field[label=$currlbl]/value"/>
                  </td>
                </tr>


                <xsl:if test="field_options/description!=''">
                  <tr>
                    <td colspan="2" class="no-top-border">
                      <small>
                        <xsl:value-of select="field_options/description"/>
                      </small>
                    </td>
                  </tr>
                </xsl:if>
              </table>
            </td>

            <xsl:if test="position() mod 2 = 0">
              <xsl:text disable-output-escaping="yes">&lt;/tr&gt;&lt;tr&gt;</xsl:text>
            </xsl:if>

          </xsl:for-each>

          <!-- if odd number, add a blank td to fill in-->
          <xsl:if test="count(ValuesXml/data/field) mod 2 = 1">
            <td>
              <xsl:text> </xsl:text>
            </td>
          </xsl:if>
        </tr>

        <tr>
          <td colspan="2" class="agreementcell">
            <xsl:value-of select="WaiverText/AgreementText" disable-output-escaping="yes"/>
          </td>
        </tr>

        <tr>
          <td>
            <strong>Signed By</strong>
          </td>
          <td>
            <strong>Signed On</strong>
          </td>
          
        </tr>
        <tr>
          <td>
            <xsl:value-of select="SignedNameFirst"/>
            <xsl:if test="SignedNameFirst!=''">
              <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:value-of select="SignedName"/>
          </td>
          <td>
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

        <xsl:if test="HasSignature='true'">
          <tr>
            <td colspan="2"  class="signaturecell">


                <xsl:choose>
                  <xsl:when test="count(/Waiver/Signatures/WFSignature2[EntryType='Typed' and LocationIndexes/int[.=-1]])!=0">
                    <span class="sigtyped">
                      <xsl:value-of select="str:replace(/Waiver/Signatures/WFSignature2[EntryType='Typed' and LocationIndexes/int[.=-1]]/SigData,'__TYPED__','')"></xsl:value-of>
                    </span>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="$ConvertSVG='true'">
                        <img src="{$SchemeAndDomain}/Controls/GetSignature.ashx?id={WaiverID}&amp;convert=true&amp;INTERNAL_REQUEST_KEY=jgGBxJWGuAgRgKvkhrGb" class="img-responsive" alt="Signature"></img>
                      </xsl:when>
                      <xsl:otherwise>
                        <img src="{$SchemeAndDomain}/Controls/GetSignature.ashx?id={WaiverID}" class="wfsignature"  alt="Signature"></img>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                
                
               

            </td>
          </tr>
        </xsl:if>
        

        
      </xsl:for-each>




    </table>



    </xsl:template>


</xsl:stylesheet>
