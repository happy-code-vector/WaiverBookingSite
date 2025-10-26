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

    <xsl:if test="count(/WorkflowStep/Children/WorkflowStep)!=0">
      <div style="margin-bottom:10px;">

        <xsl:choose>
          <xsl:when test="count(/WorkflowStep/Children/WorkflowStep)&gt;7">


            <script type="text/javascript">
              $(document).on('change', '#linkselect', function(e){
              e.preventDefault();
              var val = $(this).find('option:selected').val();
              if(val!=''){
              window.location = val;
              }
              });

            </script>

            
            <select class="form-control selectpicker" data-live-search="true" id="linkselect">
              <option>Next Step...</option>
              <xsl:for-each select="/WorkflowStep/Children/WorkflowStep">

                <option  value="Viewer.aspx?id={$WorkflowID}&amp;stepid={ID}">
                  <xsl:if test="DescriptionText!=''">
                    <xsl:attribute name="title">
                      <xsl:value-of select="DescriptionText"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ButtonText"/>

                </option>
              </xsl:for-each>


              
            </select>

            

          </xsl:when>
          <xsl:otherwise>
            <xsl:for-each select="/WorkflowStep/Children/WorkflowStep">
              <a href="Viewer.aspx?id={$WorkflowID}&amp;stepid={ID}" class="btn btn-primary">
                <xsl:if test="DescriptionText!=''">
                  <xsl:attribute name="title">
                    <xsl:value-of select="DescriptionText"/>
                  </xsl:attribute>
                </xsl:if>
                <xsl:value-of select="ButtonText"/>

              </a>
              <xsl:text> </xsl:text>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
   
      </div>
    </xsl:if>
    
    
  </xsl:template>



</xsl:stylesheet>
