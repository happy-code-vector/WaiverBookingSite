<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:asp="remove" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  
  <xsl:output method="html" indent="yes"/>
  
  <!-- Group items by Category -->
  <xsl:key name="categories" match="Control" use="Category"/>
  
  <xsl:template match="/">
   
      
      <!-- Iterate over unique categories -->
      <xsl:for-each select="WPData/Controls/Control[generate-id() = generate-id(key('categories', Category)[1])]">
        <h5 class="text-primary">
          <xsl:value-of select="Category"/>
        </h5>

        <div class="list-group mb-3">
          <!-- Get all controls within this category -->
          <xsl:for-each select="key('categories', Category)">
            <div class="list-group-item d-flex justify-content-between align-items-center">
              <div>
                <strong>
                  <xsl:value-of select="Name"/>
                </strong>
                <p class="small text-muted mb-0">
                  <xsl:value-of select="Description"/>
                </p>
              </div>
              <asp:Button runat="server" CssClass="btn btn-sm btn-success" Text="Add" CommandArgument="{ID}" > </asp:Button>
              
            </div>
          </xsl:for-each>
        </div>
      </xsl:for-each>
      
   
  </xsl:template>
  
</xsl:stylesheet>
