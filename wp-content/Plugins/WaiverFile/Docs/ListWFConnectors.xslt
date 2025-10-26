<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="BaseUrlAbsolute"></xsl:param>

  <xsl:template mode="DocsLink" match="*">
    <xsl:choose>
      <xsl:when test="System='MailChimp'">
        <a href="https://www.waiverfile.com/Resources/Help/Export-and-Integrations/Integrations/MailChimp.aspx" target="_blank" class="btn btn-sm btn-block btn-default">
          <i class="fa fa-external-link"></i>
          <xsl:text> </xsl:text>
          Documentation
        </a>
      </xsl:when>


      <xsl:when test="System='ConstantContact'">
        <a href="https://www.waiverfile.com/Resources/Help/Export-and-Integrations/Integrations/Constant-Contact.aspx" target="_blank" class="btn btn-sm btn-block btn-default">
          <i class="fa fa-external-link"></i>
          <xsl:text> </xsl:text>
          Documentation
        </a>
      </xsl:when>

      <xsl:when test="System='MailChimp'">
        <a href="https://www.waiverfile.com/Resources/Help/Export-and-Integrations/Integrations/GetResponse.aspx" target="_blank" class="btn btn-sm btn-block btn-default">
          <i class="fa fa-external-link"></i>
          <xsl:text> </xsl:text>
          Documentation
        </a>
      </xsl:when>

      <xsl:when test="System='GetResponse'">
        <a href="https://www.waiverfile.com/Resources/Help/Export-and-Integrations/Integrations/MailChimp.aspx" target="_blank" class="btn btn-sm btn-block btn-default">
          <i class="fa fa-external-link"></i>
          <xsl:text> </xsl:text>
          Documentation
        </a>
      </xsl:when>

      <xsl:when test="System='SignPost'">
        <a href="https://www.waiverfile.com/Resources/Help/Export-and-Integrations/Integrations/Signpost.aspx" target="_blank" class="btn btn-sm btn-block btn-default">
          <i class="fa fa-external-link"></i>
          <xsl:text> </xsl:text>
          Documentation
        </a>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="/">

  
    <h3>Integrations</h3>
    <p>WaiverFile can connect to the following services. If you use any of these services, click the Setup button to configure the integration and share data between WaiverFile and that service! </p>

    <xsl:if test="count(/ArrayOfWFConnector/WFConnector[Status='Active'])!=0">
      <h4>Active Integrations</h4>
      <div class="row">
      <xsl:for-each select="/ArrayOfWFConnector/WFConnector[Status='Active']">
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
                <a href="{$BasePathRelative}/admin/Settings/EditConnector.aspx?id={ID}&amp;mode=conn" class="btn btn-sm btn-block btn-default">Connection Settings</a>
                <a href="{$BasePathRelative}/admin/Settings/EditConnector.aspx?id={ID}" class="btn btn-sm btn-block btn-default">Other Settings</a>
              </xsl:when>
              <xsl:otherwise>
                <a href="{$BasePathRelative}/admin/Settings/EditConnector.aspx?id={ID}&amp;mode=conn" class="btn btn-sm btn-block btn-default">Settings</a>
              </xsl:otherwise>
            </xsl:choose>


            <!-- docs link -->
            <xsl:apply-templates mode="DocsLink" select="."></xsl:apply-templates>
            


          </div>
        </div>


      </xsl:for-each>
      </div>
    </xsl:if>


    <h4>Integration Services</h4>
    <p>The following services can be used to connect WaiverFile to a variety of other services. </p>



    <div class="row">
      <div class="col-lg-3 col-md-4 col-sm-6">
        <div class="well" style="background-color:#ffffff;">
          <img src="/wp-content/images/apilogos/zapier.jpg" class="img-responsive"></img>

          <br/>


          <a href="ZapierSetup.aspx"  class="btn btn-sm btn-block btn-primary">
            Setup
          </a>

          <a href="/Resources/Help/Export-and-Integrations/Integrations/Zapier.aspx"  class="btn btn-sm btn-block btn-default">
            <i class="fa fa-external-link"></i>
            <xsl:text> </xsl:text>
            Documentation
          </a>


        </div>
      </div>

      <div class="col-lg-3 col-md-4 col-sm-6">
        <div class="well" style="background-color:#ffffff;">
          <img src="/wp-content/images/apilogos/make.jpg" class="img-responsive"></img>

          <br/>


          <a href="/Resources/Help/Export-and-Integrations/Integrations/Make.aspx" target="_blank" class="btn btn-sm btn-block btn-default">
            <i class="fa fa-external-link"></i>
            <xsl:text> </xsl:text>
            Documentation
          </a>

        </div>
      </div>


    </div>




    

    <xsl:if test="count(/ArrayOfWFConnector/WFConnector[Status='Active'])!=0">
      <h4>Additional Integrations</h4>
    </xsl:if>
    <div class="row">
    <xsl:for-each select="/ArrayOfWFConnector/WFConnector[Status!='Active']">
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
            


            <xsl:choose>
              <xsl:when test="IWFconnectorHasSeparateSettingsControl='true'">
                <a href="{$BasePathRelative}/admin/Settings/EditConnector.aspx?id={ID}&amp;mode=conn" class="btn btn-sm btn-primary btn-block">Setup</a>
              </xsl:when>
              <xsl:otherwise>
                <asp:Button runat="server" Text="Activate" CssClass="btn btn-sm btn-block btn-primary" CommandName="ACTIVATE" CommandArgument="{ID}"></asp:Button>
              </xsl:otherwise>
            </xsl:choose>
            
          </xsl:when>
          <xsl:when test="Status='Disabled_due_to_error'">
            <p>
              <xsl:text> &#160;</xsl:text>
            </p>
            <span class="text-danger">* An error has occurred with this connector so it has been disabled. Please check your connector's settings or contact support for assistance.</span>
            <a href="{$BasePathRelative}/admin/Settings/EditConnector.aspx?id={ID}" class="btn btn-sm btn-default btn-block">Settings</a>
          </xsl:when>
          
        </xsl:choose>


          <!-- docs link -->
          <xsl:apply-templates mode="DocsLink" select="."></xsl:apply-templates>

        </div>
      </div>
      
      
    </xsl:for-each>

    </div>


  </xsl:template>
</xsl:stylesheet>
