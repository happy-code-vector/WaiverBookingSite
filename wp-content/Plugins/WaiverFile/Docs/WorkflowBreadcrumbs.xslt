<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>

  <xsl:param name="BasePathRelative"></xsl:param>

  <!-- <xsl:param name="Host"></xsl:param>
  <xsl:param name="SiteName"></xsl:param>-->


  <xsl:template match="/">


    <ol class="breadcrumb">
      <li>
        <a href="{$BasePathRelative}" title="Home">
          <i class="fa fa-home">
            <xsl:text> </xsl:text>
          </i>
        </a>
      </li>
      <xsl:for-each select="/Main/ArrayOfWorkflowStep/WorkflowStep">
        <li>
          <xsl:if test="position()=count(/Main/ArrayOfWorkflowStep/WorkflowStep)">
            <xsl:attribute name="class">breadcrumb-item active</xsl:attribute>
          </xsl:if>
          <a href="{$BasePathRelative}/Workflow.aspx?stepid={ID}">
            <xsl:if test="DescriptionText!=''">
              <xsl:attribute name="title">
                <xsl:value-of select="DescriptionText"/>    
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="ButtonText"/>
          </a>
        </li>
      </xsl:for-each>
     
    </ol>
    

  </xsl:template>



</xsl:stylesheet>
