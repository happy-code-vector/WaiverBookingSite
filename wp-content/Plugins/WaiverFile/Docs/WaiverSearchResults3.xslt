<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

<xsl:param name="SearchTerms"></xsl:param>
  <xsl:param name="TimeZoneName"></xsl:param>
  <xsl:output method="html" omit-xml-declaration="yes"/>
  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="BaseUrlAbsolute"></xsl:param>
  
  <!-- fields to include - they will be TRUE when enabled -->
  <xsl:param name="SEARCH_RESULT_ADDR"></xsl:param>
  <xsl:param name="SEARCH_RESULT_CITY"></xsl:param>
  <xsl:param name="SEARCH_RESULT_DATESIGNED"></xsl:param>
  <xsl:param name="SEARCH_RESULT_EMAIL"></xsl:param>
  <xsl:param name="SEARCH_RESULT_CHECKIN"></xsl:param>
  <xsl:param name="SEARCH_RESULT_PHONE"></xsl:param>
  <xsl:param name="SEARCH_RESULT_STATE"></xsl:param>
  <xsl:param name="SEARCH_RESULT_VIEWLINK"></xsl:param>
  <xsl:param name="SEARCH_RESULT_FORMNAME"></xsl:param>
  <xsl:param name="SEARCH_RESULT_ZIP"></xsl:param>

  <xsl:param name="SEARCH_RESULT_SIGNEE_DOB"></xsl:param>
  <xsl:param name="SEARCH_RESULT_SIGNEE_AGE"></xsl:param>
  <xsl:param name="SEARCH_RESULT_PART_DOB"></xsl:param>
  <xsl:param name="SEARCH_RESULT_PART_AGE"></xsl:param>



  <xsl:template match="/">

   

    <a href="settings/SearchResultSettings.aspx" class="btn btn-default btn-sm pull-right">
      <i class="fa fa-gear">
        <xsl:text> </xsl:text>
      </i>
      <xsl:text> Result Settings</xsl:text>
      
    </a>
    <h1>Search Results</h1>


      <p>
      <xsl:value-of select="count(/DataSet/diffgr:diffgram/NewDataSet/Table)"/>
      <xsl:text> result</xsl:text>
      <xsl:if test="count(/DataSet/diffgr:diffgram/NewDataSet/Table)!=1">
        <xsl:text>s</xsl:text>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="$SearchTerms!=''">
          <xsl:text> found for search term: </xsl:text>
          <xsl:value-of select="$SearchTerms"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text> found.</xsl:text>
        </xsl:otherwise>
      </xsl:choose>

    </p>

    <!--
   $SEARCH_RESULT_ADDR
   $SEARCH_RESULT_CITY
   $SEARCH_RESULT_DATESIGNED
   $SEARCH_RESULT_EMAIL
   $SEARCH_RESULT_CHECKIN
   $SEARCH_RESULT_PHONE
   $SEARCH_RESULT_STATE
   $SEARCH_RESULT_VIEWLINK
   $SEARCH_RESULT_FORMNAME
   $SEARCH_RESULT_ZIP
    -->
    
    <table class="table">
      <thead>
        <tr>
          <th>
            <!-- expired column -->
            &#160;
          </th>
          <th>Name</th>
          <th>Participants</th>
          <xsl:if test="$SEARCH_RESULT_CHECKIN='TRUE'">
            <th>Check-In</th>
          </xsl:if>
          <th>Event</th>
          <th>Signed By</th>

        


          <xsl:if test="$SEARCH_RESULT_SIGNEE_DOB='TRUE'">
            <th>Date of Birth</th>
          </xsl:if>

          <xsl:if test="$SEARCH_RESULT_SIGNEE_AGE='TRUE'">
            <th>Age</th>
          </xsl:if>
          

          <xsl:if test="$SEARCH_RESULT_EMAIL='TRUE'">
            <th>Email</th>
          </xsl:if>
          <xsl:if test="$SEARCH_RESULT_ADDR='TRUE'">
            <th>Address</th>
          </xsl:if>
          <xsl:if test="$SEARCH_RESULT_CITY='TRUE'">
            <th>City</th>
          </xsl:if>
          <xsl:if test="$SEARCH_RESULT_STATE='TRUE'">
            <th>State</th>
          </xsl:if>
          <xsl:if test="$SEARCH_RESULT_ZIP='TRUE'">
            <th>Zip</th>
          </xsl:if>
          <xsl:if test="$SEARCH_RESULT_PHONE='TRUE'">
            <th>Phone</th>
          </xsl:if>
          <xsl:if test="$SEARCH_RESULT_FORMNAME='TRUE'">
            <th>Form</th>
          </xsl:if>
          <xsl:if test="$SEARCH_RESULT_DATESIGNED='TRUE'">
            <th>Signed</th>
          </xsl:if>

          

          <xsl:if test="$SEARCH_RESULT_VIEWLINK='TRUE'">
            <th>View</th>
          </xsl:if>
          
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="/DataSet/diffgr:diffgram/NewDataSet/Table">

          <tr>
            <td>
              <xsl:if test="IsExpired='true'">
                <span class="text-danger">
                  <i class="fa fa-exclamation-triangle">
                    <xsl:text> </xsl:text>
                  </i>
                  <xsl:text> Expired</xsl:text>
                </span>
              </xsl:if>
              <xsl:text> </xsl:text>

              <xsl:if test="agedOut='1'">
                <span class="text-danger">
                  <i class="fa fa-exclamation-triangle">
                    <xsl:text> </xsl:text>
                  </i>
                  <xsl:text> Participant old enough to sign their own waiver</xsl:text>
                </span>
              </xsl:if>
              <xsl:text> </xsl:text>

            </td>
            
        <td>
          <xsl:choose>
            <xsl:when test="ParticipantName!='' or ParticipantNameFirst!=''">
              <xsl:value-of select="ParticipantNameFirst"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="ParticipantName"/>
              
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="SignedNameFirst"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="SignedName"/>
            </xsl:otherwise>
          </xsl:choose>
          
        </td>
            <td class="partcell" data-waiverid="{WaiverID}">

              <xsl:choose>
                <xsl:when test="$SEARCH_RESULT_CHECKIN='TRUE'">
                  <!-- when checkin buttons are enabled, don't collapse the participants. -->
                
                  <div class="text-small partlist_withcheckin" data-recordnum="{position()}" data-names="{ParticipantNames}" data-dobs="{ParticipantDobs}"></div>
                  

              </xsl:when>
                <xsl:otherwise>
                  <span class="part_num">
                    <xsl:value-of select="numParticipants"/>
                  </span>
                  <xsl:text> </xsl:text>
                  <xsl:if test="ParticipantNames!=''">
                    <a href="javascript:void(0);" class="show_part text-small" data-recordnum="{position()}" data-names="{ParticipantNames}" data-dobs="{ParticipantDobs}">(Show)</a>
                    <div style="display:none;" data-recordnum="{position()}"></div>
                  </xsl:if>
                </xsl:otherwise>
              </xsl:choose>
              
             
            </td>
            <xsl:if test="$SEARCH_RESULT_CHECKIN='TRUE'">
              <td>
                <a href="javascript:void(0);" class="btn btn-primary btn-sm btncheckin" data-waiverid="{WaiverID}">Check-In</a>
              </td>
            </xsl:if>
            <td>
              <xsl:value-of select="EventName"/>
            </td>
        
        
        <td>
          <xsl:value-of select="SignedNameFirst"/>
          <xsl:if test="SignedNameFirst!=''">
            <xsl:text> </xsl:text>
          </xsl:if><xsl:value-of select="SignedName"/></td>


            <xsl:if test="$SEARCH_RESULT_SIGNEE_DOB='TRUE'">
              <td>
                <xsl:value-of select="signeeDOB"/>
              </td>
            </xsl:if>

            <xsl:if test="$SEARCH_RESULT_SIGNEE_AGE='TRUE'">
              <td>
                <xsl:value-of select="signeeAge"/>
              </td>
            </xsl:if>


            <xsl:if test="$SEARCH_RESULT_EMAIL='TRUE'">
              <td>
                <a href="mailto:{Email}">
                  <xsl:value-of select="Email"/>
                </a>
              </td>
            </xsl:if>
            <xsl:if test="$SEARCH_RESULT_ADDR='TRUE'">
              <td>
                <xsl:value-of select="Address"/>
                <xsl:if test="Address2!=''">


                  <xsl:text>, </xsl:text>
                  <xsl:value-of select="Address2"/>
                </xsl:if>
              </td>
            </xsl:if>
            <xsl:if test="$SEARCH_RESULT_CITY='TRUE'">
              <td>
                <xsl:value-of select="City"/>
              </td>
            </xsl:if>
            <xsl:if test="$SEARCH_RESULT_STATE='TRUE'">
              <td>
                <xsl:value-of select="State"/>
              </td>
            </xsl:if>
            <xsl:if test="$SEARCH_RESULT_ZIP='TRUE'">
              <td>
                <xsl:value-of select="Zip"/>
              </td>
            </xsl:if>
            <xsl:if test="$SEARCH_RESULT_PHONE='TRUE'">
              <td>
                <xsl:value-of select="Phone"/>
              </td>
            </xsl:if>
            
            <xsl:if test="$SEARCH_RESULT_FORMNAME='TRUE'">
            <td>
              <xsl:value-of select="FormName"/>
            </td>
            </xsl:if>
            <xsl:if test="$SEARCH_RESULT_DATESIGNED='TRUE'">
              <td>
                <xsl:value-of select="dt:format-date(DateSigned,'MMMM d, yyyy h:mm a')"/>
                <!--  <xsl:text> </xsl:text>
                <xsl:value-of select="$TimeZoneName"/>-->

              </td>
            </xsl:if>
           
            
            

            <xsl:if test="$SEARCH_RESULT_VIEWLINK='TRUE'">
              <td>
                <a href="{$BasePathRelative}/admin/ViewWaiver.aspx?id={WaiverID}">View</a>
              </td>
            </xsl:if>
      </tr>  
    </xsl:for-each>
      </tbody>
    </table>
    
    
  </xsl:template>
</xsl:stylesheet>