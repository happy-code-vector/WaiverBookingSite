<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:param name="EventID"></xsl:param>

  <xsl:param name="EventName"></xsl:param>
  <xsl:param name="EventTimeLabel"></xsl:param>
  <xsl:param name="RegisteringForLabel"></xsl:param>
  
  <xsl:template match="/">

    <xsl:if test="$EventName!=''">
      <h3>
      <xsl:value-of select="$RegisteringForLabel"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="$EventName"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="$EventTimeLabel"/>
      </h3>
    </xsl:if>

    <div class="row">
    <xsl:for-each select="ArrayOfWaiverForm/WaiverForm">
      <xsl:sort select="Name"/>
      <div class=" col-xs-12 col-sm-6">
        <a href="Waiver.aspx?formid={ID}" class="btn btn-primary btn-lg btn-block waiverselect">
          <xsl:attribute name="href">
            <xsl:text>Waiver.aspx?formid=</xsl:text>
            <xsl:value-of select="ID"/>
            <xsl:if test="$EventID!='00000000-0000-0000-0000-000000000000'">
              <xsl:text>&amp;id=</xsl:text>
              <xsl:value-of select="$EventID"/>
            </xsl:if>
          </xsl:attribute>
          <xsl:value-of select="Name"/>
        </a>
      </div>

      <xsl:if test="position() mod 2 = 0">
        <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;div class="row"&gt;</xsl:text>
      </xsl:if>
    </xsl:for-each>


      <xsl:for-each select="ArrayOfWaiverForm/ArrayOfWorkflow/Workflow">
        <xsl:sort select="Name"/>
        <div class=" col-xs-12 col-sm-6">
          <a href="Workflow.aspx?stepid={RootStep/ID}" class="btn btn-primary btn-lg btn-block waiverselect">
            <xsl:attribute name="href">
              <xsl:text>Workflow.aspx?stepid=</xsl:text>
              <xsl:value-of select="RootStep/ID"/>
              <xsl:if test="$EventID!='00000000-0000-0000-0000-000000000000'">
                <xsl:text>&amp;eventid=</xsl:text>
                <xsl:value-of select="$EventID"/>
              </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="RootStep/ButtonText"/>
          </a>
        </div>

        <xsl:if test="(position() + count(/ArrayOfWaiverForm/WaiverForm)) mod 2 = 0">
          <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;div class="row"&gt;</xsl:text>
        </xsl:if>
      </xsl:for-each>
      
    </div>
    <xsl:if test="count(ArrayOfWaiverForm/WaiverForm)=0 and count(ArrayOfWaiverForm/ArrayOfWorkflow/Workflow)=0">
      
      <div class="row">
        <div class="container">
          <p>
            
              We're sorry, waivers are not being accepted for this event at this time. 
            
          </p>
        </div>
      </div>
      
    </xsl:if>



  </xsl:template>
</xsl:stylesheet>
