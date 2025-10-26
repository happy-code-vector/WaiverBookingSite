<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:template match="/">

    
    
    
    <table class="table forminstancelabels">
      <thead>
        <tr>
          <th>Customize</th>
          <th>Name</th>
          <th>Current Value</th>
          <th>Default Value</th>
          <th>Reset</th>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="/Main/SiteLabels/ArrayOfWaiverSiteLabel/WaiverSiteLabel[IncludeInFormInstanceLabels='true']">
          <xsl:sort select="Name"/>
          <xsl:variable name="currCode">
            <xsl:value-of select="Code"/>
          </xsl:variable>

          <tr>
            <td>
              
              <input type="checkbox" id="chk_{Code}" name="chk_{Code}" data-default="{DefaultValue}" value="checked">
                <xsl:if test="/Main/FormLabels/ArrayOfWaiverSiteLabel/WaiverSiteLabel[Code=$currCode]">
                  <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
              </input>
              
            </td>
            <td>
              <xsl:value-of select="Name"/>
            </td>
            <td>
              <input type="text" id="txt_{Code}" name="txt_{Code}" value="" class="form-control" data-default="{/Main/SiteLabels/ArrayOfWaiverSiteLabel/WaiverSiteLabel[Code=$currCode]/DefaultValue}">
                <xsl:attribute name="value">
                  <xsl:choose>
              <xsl:when test="count(/Main/FormLabels/ArrayOfWaiverSiteLabel/WaiverSiteLabel[Code=$currCode])!=0">
               
                <xsl:value-of select="/Main/FormLabels/ArrayOfWaiverSiteLabel/WaiverSiteLabel[Code=$currCode]/Value"/>
              </xsl:when>
              <xsl:otherwise>

                <xsl:choose>
                  <xsl:when test="/Main/SiteLabels/ArrayOfWaiverSiteLabel/WaiverSiteLabel[Code=$currCode]/Value!=''">
                     <xsl:value-of select="/Main/SiteLabels/ArrayOfWaiverSiteLabel/WaiverSiteLabel[Code=$currCode]/Value"/>
                  </xsl:when>
                  <xsl:otherwise>
                   <xsl:value-of select="/Main/SiteLabels/ArrayOfWaiverSiteLabel/WaiverSiteLabel[Code=$currCode]/DefaultValue"/>
                  </xsl:otherwise>
                </xsl:choose>
                
               
                </xsl:otherwise>
              </xsl:choose>
                  </xsl:attribute>
            </input>
            </td>
            <td>
              <input type="text" readonly="readonly" value="" class="form-control">
               <xsl:attribute name="value">
                 <xsl:value-of select="/Main/SiteLabels/ArrayOfWaiverSiteLabel/WaiverSiteLabel[Code=$currCode]/DefaultValue"/>
                  </xsl:attribute></input>

            </td>
            <td>
              <a href="javascript:void(0);" class="btn btn-default btn-sm btnReset" data-btnid="txt_{Code}">Reset</a>
            </td>
          </tr>

        </xsl:for-each>

      </tbody>
    </table>


  </xsl:template>
</xsl:stylesheet>
