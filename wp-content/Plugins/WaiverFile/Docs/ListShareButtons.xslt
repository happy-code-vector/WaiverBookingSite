<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="BaseUrlAbsolute"></xsl:param>

  <xsl:template match="/">

    <div class="row">
      <xsl:for-each select="/ArrayOfWaiverSiteLinkCodeTemplate/WaiverSiteLinkCodeTemplate">
        <xsl:sort select="OrderNum"/>
        
        <div class="col-sm-4" >
          <a href="{$BasePathRelative}/admin/Style/GetShareButtonCode.aspx?id={ID}">
            <img src="/sharedmedia/ShareButtonPreviews/{ImagePreviewPath}" class="img-responsive" style="border:2px solid #cecece; "></img>
          </a>
          <h4>
            <xsl:value-of select="Name"/>
          </h4>
          <p>
            <xsl:value-of select="Description"/>
          </p>
          <a href="{$BasePathRelative}/admin/Style/GetShareButtonCode.aspx?id={ID}" class="btn btn-primary btn-sm">Get Code</a>
        </div>

        <xsl:if test="position() mod 3 = 0">
          <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;div class="row"&gt;</xsl:text>
        </xsl:if>
      </xsl:for-each>
    </div>

  </xsl:template>
</xsl:stylesheet>
