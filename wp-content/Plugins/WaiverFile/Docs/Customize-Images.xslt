<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  
  <xsl:template match="/">

   
           
    
    <xsl:for-each select="/Main/ArrayOfWFImageLocation/WFImageLocation">
      <xsl:variable name="locid">
        <xsl:value-of select="ID"/>
      </xsl:variable>
      <div class="well">
        <h4>
          <xsl:value-of select="Name"/>
        </h4>
        <p class="help-block">
          <xsl:value-of select="Description"/>
        </p>
        <div class="wfimgbox" style="width: ">
          <xsl:attribute name="style">
            <xsl:choose>
              <xsl:when test="RecommendedWidth&gt;0">

                <xsl:variable name="displayW">
                  <xsl:choose>
                    <xsl:when test="RecommendedWidth&gt;500">500</xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="RecommendedWidth"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>
                <xsl:variable name="displayH">
                  <xsl:choose>
                    <xsl:when test="RecommendedHeight&gt;400">400</xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="RecommendedHeight"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>
                
                <xsl:text>width:</xsl:text>
                <xsl:value-of select="$displayW"/>
                <xsl:text>px;</xsl:text>
                <xsl:text>height:</xsl:text>
                <xsl:value-of select="$displayH"/>
                <xsl:text>px;</xsl:text>
                <xsl:text>line-height:</xsl:text>
                <xsl:value-of select="$displayH"/>
                <xsl:text>px;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                width: 200px; height: 100px;line-height: 100px;
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:choose>
            <xsl:when test="/Main/ArrayOfWFImage/WFImage[ImageLocationID=$locid]">
                <img src="/Controls/GetImg.ashx?ID={/Main/ArrayOfWFImage/WFImage[ImageLocationID=$locid]/ID}"></img>
            
            </xsl:when>
            <xsl:otherwise>
              <xsl:choose>
                <xsl:when test="RecommendedWidth&gt;0 and RecommendedWidth&lt;100">
                  <!-- too small for the little image background -->
                  <xsl:attribute name="class">wfimgbox noimg nobg</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="class">wfimgbox noimg</xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
              
             
            </xsl:otherwise>
          </xsl:choose>
        
        </div>
        <p class="help-block small">
          <xsl:if test="RecommendedWidth!=-1">
            <xsl:text>Recommended size: </xsl:text>
            <xsl:value-of select="RecommendedWidth"/>
            <xsl:text> x </xsl:text>
            <xsl:value-of select="RecommendedHeight"/>
            <xsl:text> pixels </xsl:text>
          </xsl:if>
        </p>

        
        
        <div class="row">
          <div class="col-sm-6">  <div class="input-group">
          <label class="input-group-btn">
            <span class="btn btn-default">
              Browse
              <asp:FileUpload data-id="{ID}" runat="server" CssClass="fileupload" data-labelid="" style="display:none;"></asp:FileUpload>
            </span>
          </label>
          <input type="text" class="form-control" readonly="readonly" id="lbl_{translate(ID,'-','_')}"/>
        </div></div>
          <div class="col-sm-4">
            <asp:Button data-id="{ID}" runat="server" CommandName="UPLOAD" Text="Upload" CssClass="btn btn-primary btn-block"></asp:Button>
          </div>
          <div class="col-sm-2">
            <xsl:if test="/Main/ArrayOfWFImage/WFImage[ImageLocationID=$locid]">
            <asp:Button data-id="{/Main/ArrayOfWFImage/WFImage[ImageLocationID=$locid]/ID}" runat="server" CommandName="REMOVE" Text="Remove" CssClass="btn btn-danger btn-block"></asp:Button>
            </xsl:if>
          </div>
        </div>
      
     
      
      </div>
      
    </xsl:for-each>
    
  </xsl:template>

  
</xsl:stylesheet>
