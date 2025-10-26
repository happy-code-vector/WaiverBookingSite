<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="BaseUrlAbsolute"></xsl:param>
  <xsl:param name="EventID"></xsl:param>



  <xsl:template match="/">

    <xsl:variable name="evtidadd">
      <xsl:if test="$EventID!='' and $EventID!='00000000-0000-0000-0000-000000000000'">
        <xsl:text disable-output-escaping="yes">&amp;evtid=</xsl:text>
        <xsl:value-of select="$EventID"/>
      </xsl:if>
    </xsl:variable>

    <h3>
      Select a Report
    </h3>

    <div class="row">
      <xsl:for-each select="/ArrayOfWFReport/WFReport">
        <div class="col-sm-4">
          <div class="well">
            <h3>
              <xsl:value-of select="Name"/>
              
            </h3>
            <xsl:if test="Description!=''">
              <p>
                <xsl:value-of select="Description"/>
              </p>
            </xsl:if>
            <a href="{$BasePathRelative}/admin/RunReport.aspx?id={ID}{$evtidadd}" class="btn btn-primary">
              <i class="fa fa-play">
                <xsl:text> </xsl:text>
              </i> Run</a>
           
          </div>
        </div>
        <xsl:if test="position() mod 3 = 0">
          <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;div class="row"&gt;</xsl:text>
        </xsl:if>
      </xsl:for-each>
    </div>
    
    

  </xsl:template>
</xsl:stylesheet>
