<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings"  xmlns:set="http://exslt.org/sets" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="xml" omit-xml-declaration="yes"/>


  <xsl:param name="TimeZoneName"></xsl:param>
  <xsl:param name="SiteName"></xsl:param>
  <xsl:param name="DateFormat"></xsl:param>
  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="WaiverEventID"></xsl:param>
  <xsl:param name="mode"></xsl:param>

  <xsl:variable name="TableWidth">
    <xsl:text>100%</xsl:text>
    <!-- previous was 600 -->
  </xsl:variable>


  <xsl:template match="/">



    <xsl:choose>
      <xsl:when test="$mode='GET_METADATA'">
        <xsl:apply-templates mode="RenderMetaData"></xsl:apply-templates>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates mode="RenderView"></xsl:apply-templates>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>
  <xsl:template mode="RenderMetaData" match="*">

    <Meta>
      <Name>Adults vs Children</Name>
      <Description>A view listing adults and children separately</Description>
    </Meta>


  </xsl:template>


  <xsl:template mode="RenderView" match="*">
    

    <h2>Checked In</h2>

    <h3>
      <xsl:value-of select="//WaiverEvent[WaiverEventID=$WaiverEventID]/Name"/> - Adults
    </h3>


    <table width="{$TableWidth}" style="background-color:#ffffff; " cellpadding="5">
      <thead>
        <tr>
          <th>Participant</th>
          <th>Signed By</th>
          <th></th>
        </tr>
      </thead>
      <xsl:for-each select="//Participant[IsCheckedIn='true' and (IsSignee='true')]">
        <xsl:sort select="ParticipantName"/>
        <xsl:sort select="ParticipantNameFirst"/>

        <tr>
          <td>
            <xsl:value-of select="ParticipantNameFirst"/>
            <xsl:if test="ParticipantNameFirst!=''">
              <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:value-of select="ParticipantName"/>
        
          </td>
          <td>
            <xsl:value-of select="../../SignedNameFirst"/>
            <xsl:if test="../../SignedNameFirst!=''">
              <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:value-of select="../../SignedName"/>
          </td>
        </tr>


      </xsl:for-each>
      <tr>
        <td colspan="2">
          <strong>
            <xsl:text>Count: </xsl:text>
            <xsl:value-of select="count(//Participant[IsCheckedIn='true' and (IsSignee='true')])"/>
          </strong>
        </td>
      </tr>
    </table>




    <h3>
      <xsl:value-of select="//WaiverEvent[WaiverEventID=$WaiverEventID]/Name"/>- Children
    </h3>


    <table width="{$TableWidth}" style="background-color:#ffffff; " cellpadding="5">
      <thead>
        <tr>
          <th>Participant</th>
          <th>Signed By</th>

        </tr>
      </thead>
      <xsl:for-each select="//Participant[IsCheckedIn='true' and IsSignee!='true' ]">
        <xsl:sort select="ParticipantName"/>
        <xsl:sort select="ParticipantNameFirst"/>

        <tr>
          <td>
            <xsl:value-of select="ParticipantNameFirst"/>
            <xsl:if test="ParticipantNameFirst!=''">
              <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:value-of select="ParticipantName"/>
          </td>
          <td>
            <xsl:value-of select="../SignedByNameFirst"/>
            <xsl:if test="../SignedByNameFirst!=''">
              <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:value-of select="../SignedByName"/>
          </td>
        </tr>


      </xsl:for-each>
      <tr>
        <td colspan="2">
          <strong>
            <xsl:text>Count: </xsl:text>
            <xsl:value-of select="count(//Participant[IsCheckedIn='true' and IsSignee!='true'])"/>
          </strong>
        </td>
      </tr>
    </table>


<hr/>
    
    <h2>Not Checked In</h2>

    <h3>
      <xsl:value-of select="//WaiverEvent[WaiverEventID=$WaiverEventID]/Name"/> - Adults
    </h3>


    <table width="{$TableWidth}" style="background-color:#ffffff; " cellpadding="5">
      <thead>
        <tr>
          <th>Participant</th>
          <th>Signed By</th>
          <th></th>
        </tr>
      </thead>
      <xsl:for-each select="//Participant[IsCheckedIn!='true' and (IsSignee='true')]">
        <xsl:sort select="ParticipantName"/>
        <xsl:sort select="ParticipantNameFirst"/>

        <tr>
          <td>
            <xsl:value-of select="ParticipantNameFirst"/>
            <xsl:if test="ParticipantNameFirst!=''">
              <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:value-of select="ParticipantName"/>
        
          </td>
          <td>
            <xsl:value-of select="../../SignedNameFirst"/>
            <xsl:if test="../../SignedNameFirst!=''">
              <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:value-of select="../../SignedName"/>
          </td>
        </tr>


      </xsl:for-each>
      <tr>
        <td colspan="2">
          <strong>
            <xsl:text>Count: </xsl:text>
            <xsl:value-of select="count(//Participant[IsCheckedIn!='true' and (IsSignee='true')])"/>
          </strong>
        </td>
      </tr>
    </table>




    <h3>
      <xsl:value-of select="//WaiverEvent[WaiverEventID=$WaiverEventID]/Name"/>- Children
    </h3>


    <table width="{$TableWidth}" style="background-color:#ffffff; " cellpadding="5">
      <thead>
        <tr>
          <th>Participant</th>
          <th>Signed By</th>

        </tr>
      </thead>
      <xsl:for-each select="//Participant[IsCheckedIn!='true' and IsSignee!='true']">
        <xsl:sort select="ParticipantName"/>
        <xsl:sort select="ParticipantNameFirst"/>

        <tr>
          <td>
            <xsl:value-of select="ParticipantNameFirst"/>
            <xsl:if test="ParticipantNameFirst!=''">
              <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:value-of select="ParticipantName"/>
          </td>
          <td>
            <xsl:value-of select="../SignedByNameFirst"/>
            <xsl:if test="../SignedByNameFirst!=''">
              <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:value-of select="../SignedByName"/>
          </td>
        </tr>


      </xsl:for-each>
      <tr>
        <td colspan="2">
          <strong>
            <xsl:text>Count: </xsl:text>
            <xsl:value-of select="count(//Participant[IsCheckedIn!='true' and IsSignee!='true'])"/>
          </strong>
        </td>
      </tr>
    </table>


    
    
    
    

  </xsl:template>

</xsl:stylesheet>
