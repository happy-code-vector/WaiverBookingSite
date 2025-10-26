<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  
  <xsl:template match="/">

    
    <div class="row">
    <xsl:for-each select="/ArrayOfWFImage/WFImage">

      
      
      <div class="col-xs-3">

        <a href="javascript:void(0);" class="imgselector" data-id="{ID}" data-sourceuri="{SourceURI}">
        <img src="/Controls/GetImg.ashx?ID={ID}&amp;type=thumb" class="img-responsive"/>
        </a>
        
      </div>
      <xsl:if test="position() mod 4 = 0">
        <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;div class="row"&gt;</xsl:text>
      </xsl:if>
      
     
    </xsl:for-each>
    </div>

  </xsl:template>

  
</xsl:stylesheet>
