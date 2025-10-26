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

          It looks like your trial site is setup but you haven’t completed setting up your waiver form yet. Is there anything we can do to help you get it set up? Use the link below to log in and get started.

        </p>
        <a href="https://www.waiverfile.com/b/{Sites/WaiverSite/Url}/admin/Settings/Waiver-Forms.aspx" target="_blank">Manage Your Waiver Forms Here</a>

        <br/>
        <p style="font-family:sans-serif;font-size:16px;font-weight:700;margin:0;Margin-bottom:15px;">
          Getting Started
        </p>

        <p style="font-family:sans-serif;font-size:14px;font-weight:normal;margin:0;Margin-bottom:15px;">
          Watch the video below to learn a bit more about how to get started using WaiverFile.
        </p>

        <p class="text-align:center">
          <a href="https://www.waiverfile.com/Resources/Help/Getting-Started/Quick-Start/Waiver-Form-Setup.aspx">
            <img src="http://www.waiverfile.com/sharedmedia/waiverfile-setup-video-thumb.gif" alt="Getting started video"/>
          </a>
        </p>

        <xsl:text>{{FOOTER}}</xsl:text>
        <xsl:text>{{SIGNATURE}}</xsl:text>
      </body>
    </html>


  </xsl:template>
</xsl:stylesheet>
