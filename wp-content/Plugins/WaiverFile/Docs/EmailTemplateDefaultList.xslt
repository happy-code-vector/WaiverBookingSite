<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" xmlns:str="http://exslt.org/strings" exclude-result-prefixes="dt str"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>


  <xsl:template match="/">
    
    
    <h3>
      Other Messages
    </h3>

    <table class="table">
      <tbody>
      <xsl:for-each select="/Main/Enums/ArrayOfString/string">
        <xsl:variable name="pos">
          <xsl:value-of select="position()"/>
        </xsl:variable>

        <!-- these two are setup manually above - this is just for the other kinds -->
        <xsl:if test=".!='Waiver_Confirmation' and .!='Waiver_Confirmation_Multiple'">
        <tr>
          <td>
            <label>
            <xsl:value-of select="str:replace(., '_',' ')"/>
            </label>
          </td>
          <td>
            <asp:DropDownList runat="server" ID="cboTemplate_{.}" class="form-control">
              <!-- <asp:ListItem value="00000000-0000-0000-0000-000000000000">System Default</asp:ListItem>-->
              <xsl:for-each select="/Main/Templates/ArrayOfEmailTemplate/EmailTemplate">
                
                  <xsl:if test="ActionType=/Main/Enums/ArrayOfString/string[position()=$pos]">
                  
                <asp:ListItem value="{ID}">
                 
                  <xsl:if test="ID=/Main/Vals/ArrayOfString/string[position()=$pos]">
                    <xsl:attribute name="Selected">True</xsl:attribute>
                  </xsl:if>
                 <xsl:value-of select="Name"/>
                </asp:ListItem>
              </xsl:if>
              </xsl:for-each>
            </asp:DropDownList>
          </td>
        </tr>
        </xsl:if>
      </xsl:for-each>
      </tbody>
    </table>
    
  </xsl:template>

</xsl:stylesheet>
