<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="BaseUrlAbsolute"></xsl:param>
  <xsl:param name="EventID"></xsl:param>



  <xsl:template match="/">

    
    
    <xsl:variable name="evtidadd">
      <xsl:if test="$EventID!='' and EventID!='00000000-0000-0000-0000-000000000000'">
        <xsl:text disable-output-escaping="yes">&amp;evtid=</xsl:text>
        <xsl:value-of select="$EventID"/>
      </xsl:if>
    </xsl:variable>

    <h3>
      Reports
      <a href="{$BasePathRelative}/admin/EditReport.aspx" class="btn btn-primary pull-right" style="margin-bottom:10px;">
        <i class="fa fa-plus-circle"></i> New Report
      </a>
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
            <xsl:text> </xsl:text>
            <a href="{$BasePathRelative}/admin/EditReport.aspx?id={ID}{$evtidadd}" class="btn btn-default">
              <i class="fa fa-cog">
                <xsl:text> </xsl:text>
              </i> Edit</a>
            <xsl:text> </xsl:text>
            <asp:LinkButton runat="server" CommandName="DELETE" CommandArgument="{ID}" Text="Delete" CssClass="btn btn-danger"></asp:LinkButton>
          </div>
        </div>
        <xsl:if test="position() mod 3 = 0">
          <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;div class="row"&gt;</xsl:text>
        </xsl:if>
      </xsl:for-each>
    </div>

   

  </xsl:template>
</xsl:stylesheet>
