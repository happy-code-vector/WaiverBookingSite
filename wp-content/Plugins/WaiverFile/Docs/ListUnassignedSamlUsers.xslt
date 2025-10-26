<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="xml" omit-xml-declaration="yes"/>
  

  <xsl:template match="/">

    <xsl:copy-of select="/"/>

    <xsl:choose>
      <xsl:when test="count(//WPUser)=0">No unassigned users found</xsl:when>
      <xsl:otherwise>

        <table class="table">
          <thead>
            <tr>
              <th>Login</th>
              <th>Role</th>
              <th>Add</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="//WPUser">
              <tr>
                <td>
                  <xsl:value-of select="Login_Name"/>
                </td>
                <td>
                  <asp:DropDownList runat="server" id="cboUnassigned_{position()}" CssClass="form-control">
                    
                  </asp:DropDownList>
                </td>
                <td class="text-center">
                  <asp:LinkButton runat="server" ID="btnUnassigned_{position()}" CommandName="ADDUSER" CommandArgument="{ID}" CssClass="btn btn-primary">
                    Add
                  </asp:LinkButton>
                </td>
              </tr>
            </xsl:for-each>
            
          </tbody>
        </table>
        
        
      </xsl:otherwise>
    </xsl:choose>
    
    
    
  </xsl:template>
</xsl:stylesheet>
