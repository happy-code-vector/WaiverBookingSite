<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>

  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="ProgressIndex"></xsl:param>
  
  <!-- <xsl:param name="Host"></xsl:param>
  <xsl:param name="SiteName"></xsl:param>-->


  <xsl:template match="/">



    <div class="container">
      <div class="wfprogress">
        <div class="progress-track">
          <xsl:text> </xsl:text>
        </div>
        
     


     
      <xsl:for-each select="/Main/Forms/ArrayOfWaiverForm/WaiverForm">


        <xsl:variable name="formid">
          <xsl:value-of select="ID"/>
        </xsl:variable>
       
        
        <div class="progress-step">
          <xsl:attribute name="class">
          
            <xsl:choose>
              <!-- todo - check this xpath. -->
              <xsl:when test="/Main/Skips/WorkflowSession/Settings/Items/WorkflowSessionDetailItem[WaiverFormID=$formid]/Status='Skipped'">
                progress-step is-skip
              </xsl:when>
              <xsl:when test="$ProgressIndex&gt;position()-1">
                progress-step is-complete
              </xsl:when>
              <xsl:when test="$ProgressIndex=position()-1">
                progress-step is-active
              </xsl:when>
              <xsl:otherwise>
                progress-step
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>

         
          <xsl:value-of select="Name"/>

        </div>
    
      </xsl:for-each>
      </div>


    </div>
    


  </xsl:template>



</xsl:stylesheet>
