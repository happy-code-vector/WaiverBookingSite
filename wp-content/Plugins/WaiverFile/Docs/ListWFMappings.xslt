<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="xml" omit-xml-declaration="yes"/>
  

  <xsl:template match="/">

    <xsl:for-each select="//FieldMappings/WFFieldMapping">
      <tr>
        <td>
          <xsl:value-of select="LocalField/HeaderText"/>
        </td>
        <td>
          <xsl:value-of select="ServiceFieldDisplayName"/>
        </td>
        <td class="text-center">
          <asp:LinkButton runat="server" ID="btnRemoveMap{position()}" CommandName="REMOVE" CommandArgument="{ServiceFieldName}">
            <i class="fa fa-times">
              <xsl:text> </xsl:text>
            </i>
          </asp:LinkButton>
        </td>
      </tr>
    </xsl:for-each>
    
  </xsl:template>
</xsl:stylesheet>
