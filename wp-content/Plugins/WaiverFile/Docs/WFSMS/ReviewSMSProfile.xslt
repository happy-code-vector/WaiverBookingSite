<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times"
    xmlns:cc1="remove" exclude-result-prefixes="cc1">

  <xsl:param name="CreatedByName"></xsl:param>
  <xsl:param name="CreatedByEmail"></xsl:param>
  
  <xsl:output method="xml"/>

  <xsl:template match="/">

   <script type="text/javascript">
     $(function(){
     $('#btnChangeStatus').click(function(){ $('#divChangeStatus').show(); });
     });
   </script>
    
    <h3>Application Details</h3>

    <xsl:for-each select="/Main/TwilioCustomerProfile">

     

      <table class="table table-condensed">
        <tbody>
          <tr>
            <td>Status</td>
            <td>
              <strong>
                <xsl:value-of select="RequestStatus"/>
              </strong>
              (<a href="javascript:void(0);" id="btnChangeStatus">Change</a>)
              <div style="display:none;" id="divChangeStatus">
                <asp:DropDownList id="cboStatus" runat="server"></asp:DropDownList>
                <asp:Button runat="server" id="btnSaveStatus" CssClass="btn btn-primary" Text="Save"></asp:Button>
              </div>
            </td>
          </tr>

          <tr>
            <td>Customer</td>
            <td>
              <xsl:value-of select="/Main/ArrayOfWFSubscription/WFSubscription/Customer/FirstName"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="/Main/ArrayOfWFSubscription/WFSubscription/Customer/LastName"/>
              <xsl:text> </xsl:text>
              <a href="mailto:{/Main/ArrayOfWFSubscription/WFSubscription/Customer/Email}">
                <xsl:value-of select="/Main/ArrayOfWFSubscription/WFSubscription/Customer/Email"/>
              </a>
            </td>
          </tr>
          <tr>
            <td>Request by User</td>
            <td> <xsl:value-of select="$CreatedByName"/>
      <xsl:text> (</xsl:text>
      <a href="mailto:{$CreatedByEmail}">
        <xsl:value-of select="$CreatedByEmail"/>
      </a>
      <xsl:text>)</xsl:text></td>
          </tr>
          <tr>
            <td>Created / Modified</td>
            <td>
              <xsl:value-of select="dt:format-date(/Main/TwilioCustomerProfile/Created,'MMMM d, yyyy h:mm a')"/>
              <xsl:text> / </xsl:text>
              <xsl:value-of select="dt:format-date(/Main/TwilioCustomerProfile/Modified,'MMMM d, yyyy h:mm a')"/>
            </td>
          </tr>
          <tr>
            <td>Site</td>
            <td>
              
                <xsl:for-each select="/Main/WaiverSite">
                  
                    
                      <a href="https://www.waiverfile.com/b/{Url}" target="_blank">
                        <xsl:text>https://www.waiverfile.com/b/</xsl:text>
                        <xsl:value-of select="Url"/>
                        <xsl:text> </xsl:text>
                        <i class="fa fa-external-link-square">
                          <xsl:text> </xsl:text>
                        </i>
                      </a>
                      <xsl:text> - </xsl:text>
                      <xsl:value-of select="Name"/>
                    <br/>      
                  </xsl:for-each>
              
            </td>
          </tr>
          
          <tr>
            <td>Legal Business Name</td>
            <td>
              <xsl:value-of select="LegalBusinessName"/>
            </td>
          </tr>
          <tr>
            <td>AccountSID</td>
            <td>
              <xsl:value-of select="AccountSID"/>
            </td>
          </tr>

          <!-- iterate all the nodes and just display it all -->
          <xsl:for-each select="Settings/*">
            <xsl:if test="name()!='CreatedBy' and name()!='' and name()!=''  ">
              <tr>
                <td>
                  <xsl:value-of select="name()"/>
                </td>
                <td>
                  <xsl:value-of select="."/>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </tbody>
      </table>
     

    </xsl:for-each>
    
    
  </xsl:template>

</xsl:stylesheet>