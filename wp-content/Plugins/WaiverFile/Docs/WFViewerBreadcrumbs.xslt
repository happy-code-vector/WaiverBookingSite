<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>

  <xsl:param name="BasePathRelative"></xsl:param>

  <xsl:param name="WorkflowID"></xsl:param>
  <xsl:param name="WorkflowName"></xsl:param>

  <!-- <xsl:param name="Host"></xsl:param>
  <xsl:param name="SiteName"></xsl:param>-->


  <xsl:template match="/">


    <nav aria-label="breadcrumb">
      <ol class="breadcrumb" style="margin-bottom:10px;">
        <li>
          <a href="Workflows.aspx">Workflows</a>
        </li>
        <!--<li>
          <a href="Viewer.aspx?id={$WorkflowID}">
            <xsl:value-of select="$WorkflowName"/>
          </a>
        </li>-->
        <xsl:for-each select="/Main/ArrayOfWorkflowStep/WorkflowStep">
          <li>
            <xsl:choose>
              <xsl:when test="position()=count(/Main/ArrayOfWorkflowStep/WorkflowStep)">
                <xsl:attribute name="aria-current">page</xsl:attribute>
                <xsl:attribute name="class">breadcrumb-item active</xsl:attribute>
                <xsl:value-of select="ButtonText"/>
              </xsl:when>
              <xsl:otherwise>
                <a href="Viewer.aspx?id={$WorkflowID}&amp;stepid={ID}">
                  <xsl:if test="DescriptionText!=''">
                    <xsl:attribute name="title">
                      <xsl:value-of select="DescriptionText"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ButtonText"/>
                </a>
              </xsl:otherwise>
            </xsl:choose>

          </li>
        </xsl:for-each>

      </ol>
    </nav>

  </xsl:template>



</xsl:stylesheet>
