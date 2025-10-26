<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" xmlns:str="http://exslt.org/strings" exclude-result-prefixes="dt str"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>


  <xsl:param name="Subject"></xsl:param>
  <xsl:param name="Url"></xsl:param>
  <xsl:param name="RequestingDocumentName"></xsl:param>
  <xsl:param name="RequestingName"></xsl:param>
  <xsl:param name="RequestingEmail"></xsl:param>
  
  
  <xsl:template match="/">

    <xsl:variable name="UnsubscribeUrl">
      <xsl:text>{UnsubscribeUrl}</xsl:text>
    </xsl:variable>

    <html>
      <head>

        <title>
          <xsl:value-of select="$Subject"/>
        </title>

      </head>
      <body style="color:#333;font-family: Arial, Helvetica, sans-serif;font-size:14px">

        <p>Hello,</p>
        <p>
          <xsl:value-of select="$RequestingName"/>
          <xsl:text> is requesting that you complete the following form: </xsl:text>
        </p>
        <p>
          <strong>
            <a href="{$Url}">
          <xsl:value-of select="$RequestingDocumentName"/>
            </a>
          </strong>
        </p>
        <p>Please complete the requested form by using the link above. For questions, please email <a href="mailto:{$RequestingEmail}">
          <xsl:value-of  select="$RequestingEmail"/>
        </a>
      </p>

        <p>
          <xsl:text> 
</xsl:text>
        </p>




      </body>
    </html>
  </xsl:template>

  </xsl:stylesheet>
