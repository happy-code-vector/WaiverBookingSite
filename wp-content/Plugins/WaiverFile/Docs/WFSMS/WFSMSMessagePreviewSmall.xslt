<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times"
    xmlns:cc1="remove" exclude-result-prefixes="cc1">

  <xsl:output method="xml"/>

  <xsl:param name="SendDateFormatted"></xsl:param>

  <xsl:template match="/Message">


    <h3>Message Preview</h3>
    <div class="well">
      <p class="text-muted">
        <em>
          <xsl:value-of select="$SendDateFormatted"/>
        </em>
      </p>
      <p>
        <xsl:value-of select="MessageText"/>
      </p>
    </div>
    



  </xsl:template>

</xsl:stylesheet>