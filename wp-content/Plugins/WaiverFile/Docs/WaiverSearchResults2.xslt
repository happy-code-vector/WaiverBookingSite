<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

<xsl:param name="SearchTerms"></xsl:param>
  <xsl:param name="TimeZoneName"></xsl:param>
  <xsl:output method="html" omit-xml-declaration="yes"/>
  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="BaseUrlAbsolute"></xsl:param>

  <xsl:template match="/">

    <script type="text/javascript">

      String.prototype.replaceAll = function(search, replacement) {
      var target = this;
      return target.split(search).join(replacement);
      };

      $(document).ready(function(){
      $('.show_part').click(function(){
      var recordnum = $(this).data('recordnum');

      var thediv = $(this).parent().find("[data-recordnum='" + recordnum + "']");
      $(this).parent().find(".part_num").hide();
      var txt = $(this).data('names');

      var a = txt.split('|'),
      i;

      var txtOut = '';
      var currName = '';
      var currAgedOut = false;
      var currIsSignee = false;
      for (i = 0; i &lt; a.length; i++) {
      if(i % 3 == 0){
      currName = a[i];
      }else if(i % 3 == 1){
      currAgedOut = a[i]=='1';
      }else if(i % 3 == 2){
      currIsSignee = a[i]=='1';


      if(currAgedOut==true){
      txtOut += '&lt;span class="text-danger"&gt;' + currName + ' &lt;br/&gt;&lt;small&gt;(Old enough to sign own waiver)&lt;/small&gt;&lt;/span&gt;';
      }else{
      txtOut += currName;
      }
      txtOut += '<br/>';
      }
      }


      thediv.html(txtOut);
      thediv.fadeIn();
      $(this).hide();
      });

      });
    </script>
    
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
    
    <table class="table">
      <thead>
        <tr>
          <th>Name</th>
          <th>Participants</th>
          <th>
            <!-- expired column -->
            &#160;
          </th>
          <th>Event</th>
          <th>Signed</th>
          <th>Signed By</th>
          <th>Form</th>
          <th>View</th>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="/DataSet/diffgr:diffgram/NewDataSet/Table">

          <tr>
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
            <td>
              <span class="part_num">
                <xsl:value-of select="numParticipants"/>
              </span>
              <xsl:text> </xsl:text>
              <xsl:if test="ParticipantNames!=''">
                <a href="javascript:void(0);" class="show_part text-small" data-recordnum="{position()}" data-names="{ParticipantNames}" data-dobs="{ParticipantDobs}">(Show)</a>
                <div style="display:none;" data-recordnum="{position()}"></div>
              </xsl:if>
            </td>
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
              <xsl:value-of select="EventName"/>
            </td>
        <td>
          <xsl:value-of select="dt:format-date(DateSigned,'MMMM d, yyyy h:mm a')"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="$TimeZoneName"/>
         
        </td>
        
        <td>
          <xsl:value-of select="SignedNameFirst"/>
          <xsl:if test="SignedNameFirst!=''">
            <xsl:text> </xsl:text>
          </xsl:if><xsl:value-of select="SignedName"/></td>
            <td>
              <xsl:value-of select="FormName"/>
            </td>
        <td>
          <a href="{$BasePathRelative}/admin/ViewWaiver.aspx?id={WaiverID}">View</a>
        </td>
      </tr>  
    </xsl:for-each>
      </tbody>
    </table>
    
    
  </xsl:template>
</xsl:stylesheet>