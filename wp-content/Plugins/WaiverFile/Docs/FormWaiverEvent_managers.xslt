<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>


  <xsl:template match="/">

   
    <table class="table table-condensed">
      <thead>
        <tr>
          <th>Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Resend Email</th>
          <th>Resend Text</th>
          <th>Remove</th>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="/ArrayOfWPUserWithMobileNum/WPUserWithMobileNum">
          <tr>
            <td>
              <xsl:value-of select="First_Name"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="Last_Name"/>
            </td>
            
            <td>
              <a href="mailto:{Email_Address}">
                <xsl:value-of select="Email_Address"/>
              </a>
            </td>
            <td>
              <xsl:if test="MobileNumber/WPObjectStatus='Current'">
                <xsl:value-of select="MobileNumber/MobileNumber"/>
              </xsl:if>
            </td>
            <td>
              <asp:LinkButton runat="server" CommandArgument="{ID}" CommandName="RESEND">Resend Email</asp:LinkButton>
            </td>
            <td>
              <xsl:if test="MobileNumber/MobileNumber!=''">
              <asp:LinkButton runat="server" CommandArgument="{ID}" CommandName="RESEND_SMS">Resend Text</asp:LinkButton>
              </xsl:if>
            </td>
            <td>
              <asp:LinkButton runat="server" CommandArgument="{ID}" CommandName="DELETE">Remove</asp:LinkButton>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
      <tbody id="tbodyNewUsers">
        
      </tbody>
    </table>


  </xsl:template>

</xsl:stylesheet>
