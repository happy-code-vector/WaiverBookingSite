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
      <Name>Grid with Custom Fields</Name>
      <Description>Displays a grid of all standard customer details including custom fields.</Description>
    </Meta>


  </xsl:template>

  
    <xsl:template name="RenderCell">
  </xsl:template>

  <xsl:template mode="RenderView" match="*">

  

 <link href="/site/includes/bootstrap.custom.min.css" rel="stylesheet">
      <xsl:text> </xsl:text>
    </link>
    
    
    <xsl:for-each select="set:distinct(//WaiverEvent/WaiverEventID)">
      <xsl:variable name="evtid">
        <xsl:value-of select="."/>
      </xsl:variable>


      <h3>
        <xsl:value-of select="//WaiverEvent[WaiverEventID=$evtid]/Name"/>
      </h3>


      <table width="{$TableWidth}" style="background-color:#ffffff; " class="table table-condensed">
        <thead>
          <tr>
            <th>Participant</th>
            <th>Signed By</th>
            
            <xsl:if test="/ArrayOfWaiver/Waiver[Address!='']">
            <th>Address</th>
            </xsl:if>
            <xsl:if test="/ArrayOfWaiver/Waiver[City!='']">
            <th>City</th>
            </xsl:if>
        <xsl:if test="/ArrayOfWaiver/Waiver[State!='']">
            <th>State/Province</th>
            </xsl:if>
              <xsl:if test="/ArrayOfWaiver/Waiver[Zip!='']">
            <th>Postal Code</th>
            </xsl:if>
                
            <xsl:for-each select="set:distinct(/ArrayOfWaiver/Waiver/ValuesXml/data/field/label)">
             

              <th>
                 <xsl:value-of select="."/>
              </th>
            
            </xsl:for-each>
          
          </tr>
        </thead>
        <xsl:for-each select="//Participant[../WaiverEventID=$WaiverEventID]">
          <xsl:sort select="ParticipantName"/>
          <xsl:sort select="ParticipantNameFirst"/>
          <xsl:variable name="waiverid">
            <xsl:value-of select="WaiverID"/>
          </xsl:variable>
          
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
          
           <xsl:if test="/ArrayOfWaiver/Waiver[Address!='']">
            <td><xsl:value-of select="../../Address"/></td>
            </xsl:if>
            <xsl:if test="/ArrayOfWaiver/Waiver[City!='']">
            <td><xsl:value-of select="../../City"/></td>
            </xsl:if>
        <xsl:if test="/ArrayOfWaiver/Waiver[State!='']">
            <td><xsl:value-of select="../../State"/></td>
            </xsl:if>
              <xsl:if test="/ArrayOfWaiver/Waiver[Zip!='']">
            <td><xsl:value-of select="../../Zip"/></td>
            </xsl:if>
          
        
          <xsl:for-each select="set:distinct(/ArrayOfWaiver/Waiver/ValuesXml/data/field/label)">
              <xsl:variable name="lbl">
                <xsl:value-of select="."/>
            </xsl:variable>

              <td>
                 <xsl:value-of select="/ArrayOfWaiver/Waiver[WaiverID=$waiverid]/ValuesXml/data/field[label=$lbl]/value"/>
              </td>
            
            </xsl:for-each>
      
          </tr>


        </xsl:for-each>
        <tr>
          <td colspan="2">
            <strong>
              <xsl:text>Count: </xsl:text>
              <xsl:value-of select="count(//Participant[../WaiverEventID=$WaiverEventID])"/>
            </strong>
          </td>
        </tr>
      </table>





    </xsl:for-each>




  </xsl:template>

</xsl:stylesheet>
