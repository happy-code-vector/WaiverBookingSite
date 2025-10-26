<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="HasFullViewAccess"></xsl:param>
  
  <xsl:template match="/">

    <div class="row">
    <xsl:for-each select="/WaiverSiteSettingPack/AdvancedSearchFields/Items/DBField">

      <xsl:if test="$HasFullViewAccess='true' or IsCustomColumn!='true'">

        <div class="col-sm-6">
          <p class="form-block">
            <label>
              <xsl:value-of select="HeaderText"/>
            </label>
            <asp:TextBox runat="server" ID="txt{position()}" CssClass="form-control" data-field="{FieldName}"></asp:TextBox>
          </p>
        </div>
      </xsl:if>
  </xsl:for-each>
</div>
  </xsl:template>
</xsl:stylesheet>
