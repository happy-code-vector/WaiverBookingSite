<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="Subject"></xsl:param>
  <xsl:param name="NumIncludedTotal"></xsl:param>
  <xsl:param name="NumUsed"></xsl:param>
  <xsl:param name="AdditionalWaiverPriceEach"></xsl:param>
  <xsl:param name="PeriodEnds"></xsl:param>

  <xsl:template match="/WFSubscription">

    <xsl:variable name="UnsubscribeUrl">
      <xsl:text>{UnsubscribeUrl}</xsl:text>
    </xsl:variable>

    <html>
      <head>
        <meta name="viewport" content="width=device-width"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>
          <xsl:value-of select="$Subject"/>
        </title>

      </head>
      <body class="" style="background-color:#ffffff;color:#575e68;font-family:sans-serif;-webkit-font-smoothing:antialiased;font-size:14px;line-height:1.4;margin:0;padding:0;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;">

        <p style="color:#575e68;font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
          <xsl:text>Hi </xsl:text>
          <xsl:value-of select="Customer/FirstName"/>
          <xsl:text>, </xsl:text>
        </p>
        <p style="color:#575e68;font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">

          Your WaiverFile account has reached 90% of it's quota for the current billing period.

        </p>
        <a href="https://www.waiverfile.com/b/{Sites/WaiverSite/Url}/admin/Settings/Renew.aspx" target="_blank">Manage Your Account Here</a>

        

        <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
          <strong>Usage details:</strong>
        </p>
        <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
          <xsl:text>You have used </xsl:text>
          <xsl:value-of select="$NumUsed"/>
          <xsl:text> of </xsl:text>
          <xsl:value-of select="$NumIncludedTotal"/>
          <xsl:text> waivers for the current billing period which ends </xsl:text>
          <xsl:value-of select="$PeriodEnds"/>
          <xsl:text>. </xsl:text>
        </p>

        <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
          <xsl:text>Waivers beyond your quota will be billed at $</xsl:text>
          <xsl:value-of select="format-number( $AdditionalWaiverPriceEach, '#.00')"/>
          <xsl:text> each. Avoid overages by upgrading your account early.</xsl:text>
        </p>
        <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
          Please feel free to contact us with any questions or concerns you may have. <a href="mailto:info@waiverfile.com">info@waiverfile.com</a>
        </p>

        <xsl:text>{{FOOTER}}</xsl:text>
        <xsl:text>{{SIGNATURE}}</xsl:text>



      </body>
    </html>


  </xsl:template>
</xsl:stylesheet>
