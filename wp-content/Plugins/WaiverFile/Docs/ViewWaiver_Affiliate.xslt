<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:param name="TimeZoneName"></xsl:param>
    <xsl:output method="html" omit-xml-declaration="yes"/>
  <xsl:param name="DateFormat"></xsl:param>
  <xsl:param name="BasePathRelative"></xsl:param>

  <xsl:param name="IncludeButtons">true</xsl:param>
  
  <xsl:variable name="DateFormatWithTime">
    <xsl:value-of select="$DateFormat"/>
    <xsl:text> h:mm a</xsl:text>
  </xsl:variable>

  
  <xsl:template match="/">

   
    
    <style type="text/css">
    <xsl:for-each select="/Main/Flags/ArrayOfWaiverFlag/WaiverFlag">
      <xsl:variable name="currFlagID">
        <xsl:value-of select="ID"/>
      </xsl:variable>

      <xsl:text>input.wfflag.wfflag</xsl:text>
      <xsl:value-of select="position()"/>
      <xsl:text>[type=checkbox]:checked + label:before{ color: </xsl:text>
      <xsl:value-of select="Color"/>
      <xsl:text>; }</xsl:text>
      
      </xsl:for-each>
    </style>

    <xsl:for-each select="/Main/Waiver">
    

      <xsl:if test="$IncludeButtons='true'">
    <div class="text-right">


     
    
      <asp:LinkButton ID="btnEmailMe" runat="server" CssClass="btn btn-default" >
        <i class="fa fa-envelope"></i>
        <xsl:text> Email Copy to Me</xsl:text>
        </asp:LinkButton>
      <xsl:text> </xsl:text>
      <asp:LinkButton ID="btnDownloadPDF" runat="server" CssClass="btn btn-default" >
        <i class="fa fa-file-pdf-o"></i>
        <xsl:text> Download PDF</xsl:text>
        </asp:LinkButton>
      <xsl:text> </xsl:text>
      <a href="/Controls/PrintWaivers_Affiliate.aspx?siteid={SiteID}&amp;id={WaiverID}" class="btn btn-default" target="_blank">
        <i class="fa fa-print"></i>
        <xsl:text> Print</xsl:text>
      </a>

      <xsl:text> </xsl:text>
      
   
    
    
  </div>
      </xsl:if>
      
    
    <table width="100%" border="0" class="structuretable">

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

      <xsl:if test="Expired='true'">
        <tr>
          <td colspan="2">
            <h4>
              <span class="text-danger">
                <i class="fa fa-exclamation-triangle">
                  <xsl:text> </xsl:text>
                </i>
                <xsl:text> This Waiver is Expired</xsl:text>
              </span>
            </h4>
          </td>
        </tr>
        
      </xsl:if>



      <xsl:variable name="EmailConfirmed">
        <xsl:if test="Email=ValuesXml/data/field[@label='Confirm Email Address']/value">true</xsl:if>
      </xsl:variable>
      <xsl:variable name="EmailVerified">
        <xsl:if test="EmailVerification/VerifyStatus='Verified'">true</xsl:if>
      </xsl:variable>

      

      <tr>
          <td valign="top">
            <!-- main info here -->

            <table width="100%" border="0" cellspacing="0" cellpadding="4" class="table table-condensed datatable">
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

                <xsl:if test="DateAttending!='' and dt:year(DateAttending) &gt; 1753">
                  <tr>
                    <td>
                      <strong>Date Attending</strong>
                    </td>
                    <td>
                      <xsl:choose>
                        <xsl:when test="$DateFormat=''">
                          <xsl:value-of select="dt:format-date(DateAttending,'MMMM d, yyyy')"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:variable name="combined_format_str">
                            <xsl:value-of select="$DateFormat"></xsl:value-of>
                          </xsl:variable>
                          <xsl:value-of select="dt:format-date(DateAttending,$combined_format_str)"/>

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
              <table width="100%" cellspacing="0" cellpadding="4" class="table table-condensed datatable">
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
              <div class="signaturewrap">
              <img src="/Controls/GetSignature.ashx?id={WaiverID}" class="" alt="Signature"></img>
              </div>
            </td>
          </tr>
        </xsl:if>







    </table>


    </xsl:for-each>



  </xsl:template>
</xsl:stylesheet>
