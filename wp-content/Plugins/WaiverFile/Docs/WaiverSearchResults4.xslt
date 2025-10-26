<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

<xsl:param name="SearchTerms"></xsl:param>
  <xsl:param name="TimeZoneName"></xsl:param>
  <xsl:output method="html" omit-xml-declaration="yes"/>
  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="BaseUrlAbsolute"></xsl:param>
  <xsl:param name="DateFormat"></xsl:param>

  <!-- always true for now -->
  <xsl:param name="SEARCH_RESULT_CHECKIN">TRUE</xsl:param>
  <xsl:param name="SEARCH_RESULT_VIEW">TRUE</xsl:param>

  <xsl:template match="/">

    <h1>Search Results</h1>


      <p>
      <xsl:value-of select="count(/Main/DataSet/diffgr:diffgram/NewDataSet/Table)"/>
      <xsl:text> result</xsl:text>
      <xsl:if test="count(/Main/DataSet/diffgr:diffgram/NewDataSet/Table)!=1">
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
    <table class="table">
      <thead>
        <tr>
          

          <th>
            <xsl:text> </xsl:text>
          </th>
          <th>Signed Name</th>
          <th>Participants</th>
         
          <xsl:if test="$SEARCH_RESULT_CHECKIN='TRUE'">
            <th>Check-In</th>
          </xsl:if>
         
          <xsl:for-each select="/Main/DBFieldList/Items/DBField">
            <th>
              <xsl:value-of select="HeaderText"/>
            </th>
          </xsl:for-each>
          <xsl:if test="$SEARCH_RESULT_VIEW='TRUE'">
            <th>
              View
            </th>
          </xsl:if>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="/Main/DataSet/diffgr:diffgram/NewDataSet/Table">
          <xsl:variable name="pos">
            <xsl:value-of select="position()"/>
          </xsl:variable>
          <tr>
           
            
            <!-- BEGIN CHECKIN NAME AND STUFF -->
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
              <xsl:value-of select="signednamefirst"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="signedname"/>
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
            <!-- END CHECKIN NAME AND STUFF -->

          
            
            <xsl:for-each select="/Main/DBFieldList/Items/DBField">
              <xsl:variable name="fieldname1">
                <xsl:value-of select="FieldName"/>
                <xsl:text>__FROM_ENCRYPTED</xsl:text>
              </xsl:variable>
              <xsl:variable name="fieldname">
                <xsl:choose>
                  <xsl:when test="count(/Main/DataSet/diffgr:diffgram/NewDataSet/Table/*[name()=$fieldname1])!=0">
                    <xsl:value-of select="FieldName"/>
                    <xsl:text>__FROM_ENCRYPTED</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="FieldName"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>

              
              

              <td>
               
                
                <xsl:variable name="theval">
                  <xsl:value-of select="/Main/DataSet/diffgr:diffgram/NewDataSet/Table[position()=$pos]/*[name()=$fieldname]"/>
                
                </xsl:variable>
              
                <xsl:choose>
                  <xsl:when test="/Main/DataSet/xs:schema/xs:element/xs:complexType/xs:choice/xs:element/xs:complexType/xs:sequence/xs:element[@name=$fieldname]/@type='xs:dateTime'">
                    <xsl:value-of select="dt:format-date($theval,$DateFormat)"/>
                  </xsl:when>
                  <xsl:when test="$theval='1/1/1753'">
                  </xsl:when>
                  <xsl:when test="$fieldname='waiverLink'">
                  <a href="ViewWaiver.aspx?id={/Main/DataSet/diffgr:diffgram/NewDataSet/Table[position()=$pos]/WaiverID}">View</a>
                    </xsl:when>
                  <xsl:when test="$fieldname='hasattachments'">
                    <xsl:if test="$theval='true'">
                    
                      <i class="fa fa-paperclip">
                        <xsl:text> </xsl:text>
                      </i>
                    </xsl:if>
                  </xsl:when>
                  <xsl:when test="$fieldname='emailverified'">
                    <xsl:if test="$theval='true'">
                      <i class="fa fa-check">
                        <xsl:text> </xsl:text>
                      </i>
                    </xsl:if>
                  </xsl:when>
                  <xsl:when test="$fieldname='hasphotos'">
                    <xsl:if test="$theval='true'">
                      <i class="fa fa-picture-o">
                        <xsl:text> </xsl:text>
                      </i>
                    </xsl:if>
                  </xsl:when>

                  <xsl:when test="substring($fieldname,1,6)='photo_'">
                    <xsl:if test="$theval='true'">
                      <i class="fa fa-picture-o">
                        <xsl:text> </xsl:text>
                      </i>
                    </xsl:if>
                  </xsl:when> 
                  <xsl:when test="substring($fieldname,1,11)='attachment_'">
                    <xsl:if test="$theval='true'">
                      <i class="fa fa-paperclip">
                        <xsl:text> </xsl:text>
                      </i>
                    </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$theval"/>
                  </xsl:otherwise>
                </xsl:choose>


               
              </td>
            </xsl:for-each>

            <xsl:if test="$SEARCH_RESULT_VIEW='TRUE'">
            <td>
              <a href="ViewWaiver.aspx?id={WaiverID}" class="btn btn-primary btn-sm">View</a>

            </td>
            </xsl:if>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
    
  </xsl:template>
</xsl:stylesheet>