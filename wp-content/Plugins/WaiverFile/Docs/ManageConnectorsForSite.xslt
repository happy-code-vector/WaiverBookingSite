<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">


  <xsl:param name="SiteUrl"></xsl:param>
  <xsl:output method="html" omit-xml-declaration="yes"/>



  <xsl:template match="/">

   
    <xsl:if test="count(/Main/active/ArrayOfWFConnector/WFConnector[Status='Active'])!=0">
      <h4>Active Integrations</h4>
      <div class="row">
      <xsl:for-each select="/Main/active/ArrayOfWFConnector/WFConnector[Status='Active']">
        <xsl:sort select="System"/>
        <div class="col-lg-3 col-md-4 col-sm-6">
          <div class="well" style="background-color:#ffffff;">
            <img src="/wp-content/images/apilogos/{System}.jpg" class="img-responsive"></img>

            <!--<br/>
        <h4>
          <xsl:value-of select="translate(System,'_',' ')"/>
        </h4>-->
            <br/>


                <p class="text-success text-center">
                  <i class="fa fa-check-circle text-success">
                    <xsl:text> </xsl:text>
                  </i>
                  <xsl:text> Integration active</xsl:text>

                </p>
            
            

                    <asp:Button runat="server" Text="Deactivate" CssClass="btn btn-sm btn-block btn-primary" CommandName="DEACTIVATE" CommandArgument="{ID}"></asp:Button>
            <xsl:choose>
              <xsl:when test="IWFconnectorHasSeparateSettingsControl='true'">
                <a target="_blank" href="https://{$SiteUrl}/admin/Settings/EditConnector.aspx?id={ID}&amp;mode=conn" class="btn btn-sm btn-block btn-default">Connection Settings</a>
                <a target="_blank" href="https://{$SiteUrl}/admin/Settings/EditConnector.aspx?id={ID}" class="btn btn-sm btn-block btn-default">Other Settings</a>
              </xsl:when>
              <xsl:otherwise>
                <a target="_blank" href="https://{$SiteUrl}/admin/Settings/EditConnector.aspx?id={ID}&amp;mode=conn" class="btn btn-sm btn-block btn-default">Settings</a>
              </xsl:otherwise>
            </xsl:choose>

            <xsl:variable name="CurrSystem">
              <xsl:value-of select="System"/>
            </xsl:variable>
            
            <xsl:if test="count(/Main/manual_all/ArrayOfWFConnectorSystemEnum/WFConnectorSystemEnum[.=$CurrSystem])!=0">

              <asp:LinkButton runat="server" ID="btnRemoveConnector{position()}" Text="Remove" CssClass="btn btn-sm btn-danger btn-block" CommandName="REMOVE" CommandArgument="{ID}"></asp:LinkButton>

            </xsl:if>


          </div>
        </div>


      </xsl:for-each>
      </div>
    </xsl:if>

    <xsl:if test="count(/Main/available/ArrayOfWFConnector/WFConnector[Status!='Active'])!=0">
      <h4>Available Integrations</h4>
    </xsl:if>
    <div class="row">
    <xsl:for-each select="/Main/available/ArrayOfWFConnector/WFConnector[Status!='Active']">
      <xsl:sort select="System"/>
      <div class="col-lg-3 col-md-4 col-sm-6">
        <div class="well" style="background-color:#ffffff;">
        <img src="/wp-content/images/apilogos/{System}.jpg" class="img-responsive"></img>
        
        <!--<br/>
        <h4>
          <xsl:value-of select="translate(System,'_',' ')"/>
        </h4>-->
        <br/>
         
        <xsl:choose>
          <xsl:when test="Status='Disabled'">
            <p>
              <xsl:text> &#160;</xsl:text>
            </p>

            
            <a target="_blank" href="https://{$SiteUrl}/admin/Settings/EditConnector.aspx?id={ID}&amp;mode=conn" class="btn btn-sm btn-primary btn-block">Setup</a>
            
          </xsl:when>
          <xsl:when test="Status='Disabled_due_to_error'">
            <p>
              <xsl:text> &#160;</xsl:text>
            </p>
            <span class="text-danger">* An error has occurred with this connector so it has been disabled. Please check your connector's settings or contact support for assistance.</span>
            <a target="_blank" href="https://{$SiteUrl}/admin/Settings/EditConnector.aspx?id={ID}" class="btn btn-sm btn-default btn-block">Settings</a>
          </xsl:when>
          
        </xsl:choose>
          <xsl:variable name="CurrSystem">
            <xsl:value-of select="System"/>
          </xsl:variable>

          <xsl:if test="count(/Main/manual_all/ArrayOfWFConnectorSystemEnum/WFConnectorSystemEnum[.=$CurrSystem])!=0">

            <asp:LinkButton runat="server" ID="btnRemoveConnector_alt_{position()}" Text="Remove" CssClass="btn btn-sm btn-danger btn-block" CommandName="REMOVE" CommandArgument="{ID}"></asp:LinkButton>
            
          </xsl:if>
            
        </div>
      </div>
      
      
    </xsl:for-each>

    </div>



    <xsl:if test="count(/Main/manual/ArrayOfWFConnectorSystemEnum/WFConnectorSystemEnum)!=0">
      <h4>Manual Integrations</h4>
      <p>Customers don't see these connectors unless activated manually here.</p>
    </xsl:if>
    <div class="row">
      <xsl:for-each select="/Main/manual/ArrayOfWFConnectorSystemEnum/WFConnectorSystemEnum">
        <xsl:sort select="."/>
        <div class="col-lg-3 col-md-4 col-sm-6">
          <div class="well" style="background-color:#ffffff;">
            <img src="/wp-content/images/apilogos/{.}.jpg" class="img-responsive"></img>

            <!--<br/>
        <h4>
          <xsl:value-of select="translate(System,'_',' ')"/>
        </h4>-->
            <br/>

            <p>
              <xsl:text> &#160;</xsl:text>
            </p>
            <asp:LinkButton runat="server" ID="btnEnableConnector{position()}" Text="Enable" CssClass="btn btn-sm btn-primary btn-block" CommandName="ENABLE" CommandArgument="{.}"></asp:LinkButton>

          </div>
        </div>


      </xsl:for-each>

    </div>
    
    
  </xsl:template>
</xsl:stylesheet>
