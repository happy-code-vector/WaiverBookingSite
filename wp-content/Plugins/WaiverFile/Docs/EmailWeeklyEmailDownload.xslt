<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>


  <xsl:param name="Host"></xsl:param>
  <xsl:param name="SiteName"></xsl:param>
  <xsl:param name="StartDate"></xsl:param>
  <xsl:param name="EndDate"></xsl:param>
  <xsl:param name="NumEmailsCollected"></xsl:param>


  <xsl:template match="/">



    <!--<xsl:copy-of select="/"/>-->

    <style type="text/css">
      body {
      background-color: #dadada;
      font-family: Tahoma, sans-serif;
      font-size: 12px;
      color: #162440;

      }
      a, a:link, a:visited {
      color: #009fe9;
      font-weight: bold;
      font-weight: 700;

      }
    </style>
    <xsl:variable name="TableWidth">
      <xsl:text>90%</xsl:text>
      <!-- previous was 600 -->
    </xsl:variable>

    <body style="background-color: #dadada;">
      <table style="width:100%; background-color:#dadada;" border="0">
        <tr>
          <td align="center">

            <!-- header -->
            <table width="{$TableWidth}" style="background-color:#ffffff; " cellpadding="10">
              <tr>
                <td style="color:#333333; font-size: 28px; text-align:center;" colspan="2">
                  <xsl:value-of select="$SiteName"/>
                  <xsl:text> Waiver Email Address Export</xsl:text>
                </td>

              </tr>
             
            </table>
            <table width="{$TableWidth}" style="background-color:#ffffff; " cellpadding="10">
              <tr>
                <td colspan="2" style="color:#333333; font-size: 15px; text-align:center;" >

                  Your waiver email address export is attached! <br/><br/>
                  <strong>Export Details: </strong><br/><br/>
                  <strong>Date Range: </strong>   <xsl:value-of select="dt:format-date($StartDate,'MMMM d, yyyy')"/><xsl:text> - </xsl:text><xsl:value-of select="dt:format-date($EndDate,'MMMM d, yyyy')"/><br/>
                  <strong>Email Addresses Collected: </strong>  <xsl:value-of select="$NumEmailsCollected"/><br/>
                
                </td>
             
              </tr>
              <tr>
                <td colspan="2" style="color:#333333; font-size: 15px; text-align:center;" >
                  <xsl:text> </xsl:text>
                </td>
              </tr>
              <tr>
                <td colspan="2" style="color:#333333; font-size: 15px; text-align:center;" >
                  <strong>What's in the attachment? </strong>
                  <br/>
                  <br/>
                  The attached file is a csv file containing all the email addresses collected in the timeframe specified. 
                </td>
              </tr>
              
            </table>
          </td>
        </tr>
        <tr>
          <td style="padding-top: 50px; text-align:center; font-size: 11px; color: #999999;">
            Thank you for choosing<br/>
            <img src="https://www.waiverfile.com/sharedmedia/waiverfile-logo-lg.png" alt="WaiverFile" height="26" width="150"/>
          </td>
        </tr>
      </table>
    </body>

  </xsl:template>

</xsl:stylesheet>
