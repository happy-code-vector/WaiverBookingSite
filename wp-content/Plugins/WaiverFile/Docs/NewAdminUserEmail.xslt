<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>

  <xsl:param name="BaseUrl"></xsl:param>
  <xsl:param name="Host"></xsl:param>
  <xsl:param name="Email"></xsl:param>
  <xsl:param name="SiteName"></xsl:param>
  <xsl:param name="Password"></xsl:param>
  <xsl:param name="Role"></xsl:param>

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
                </td>

              </tr>
             
            </table>
            <table width="{$TableWidth}" style="background-color:#ffffff; " cellpadding="10">
              <tr>
                <td colspan="2" style="color:#333333; font-size: 15px; text-align:center;" >

                  You have been granted access to the WaiverFile admin area!<br/><br/>

                  <div style="border:1px dotted #cecece;padding:10px; text-align:center;margin:20px 30px 20px 30px;">
                  <div>
                    <xsl:text disable-output-escaping="yes">&lt;!--[if mso]&gt;
  &lt;v:roundrect xmlns:v=&quot;urn:schemas-microsoft-com:vml&quot; xmlns:w=&quot;urn:schemas-microsoft-com:office:word&quot; href=&quot;</xsl:text>

                    <xsl:value-of select="$BaseUrl"/>

                    <xsl:text disable-output-escaping="yes">/admin&quot; style=&quot;height:40px;v-text-anchor:middle;width:200px;&quot; arcsize=&quot;18%&quot; stroke=&quot;f&quot; fillcolor=&quot;#ea7400&quot;&gt;
    &lt;w:anchorlock/&gt;
    &lt;center&gt;
  &lt;![endif]--&gt;</xsl:text>

                    <a href="{$BaseUrl}/admin"
              style="background-color:#ea7400;border-radius:7px;color:#ffffff;display:inline-block;font-family:sans-serif;font-size:13px;font-weight:bold;line-height:40px;text-align:center;text-decoration:none;width:200px;-webkit-text-size-adjust:none;">Log In to View Waivers</a>
                    <xsl:text disable-output-escaping="yes">  &lt;!--[if mso]&gt;
    &lt;/center&gt;
  &lt;/v:roundrect&gt;
&lt;![endif]--&gt;</xsl:text>

                  </div>

                  <br/>
                  <div style="font-size:18px; font-weight:bold;">Your Login Info:</div><br/>
                  <strong>Email Address: </strong><xsl:value-of select="$Email"/><br/>
                    <xsl:if test="$Password!=''">
                    <strong>Password: </strong><xsl:value-of select="$Password"/><br/>
                    </xsl:if>
                  <br/>
                  Once logged in, you can click on the account icon to change your password.

</div>
                  
                </td>
             
              </tr>
              <tr>
                <td colspan="2" style="color:#333333; font-size: 15px; text-align:center;">
                  <strong>WaiverFile Site</strong>
                  <br/>
                  <br/>
                  Name: <xsl:value-of select="/WaiverSite/Name"/><br/>
                  
                  <br/>
                  <br/>
                  <strong>Link to Signature Page:</strong><br/>
                  <a href="{$BaseUrl}">
                    <xsl:value-of select="$BaseUrl"/>
                  </a><br/>
                Send this link to customers to collect signatures.
<br/>
                  <br/>
                  <strong>Link to Admin Area:</strong><br/>
                  <a href="{$BaseUrl}/admin">
                    <xsl:value-of select="$BaseUrl"/>
                    <xsl:text>/admin</xsl:text>
                  </a><br/>
              </td>
              </tr>
             
            </table>
          </td>
        </tr>
        <tr>
          <td style="padding-top: 50px; text-align:center; font-size: 11px; color: #999999;">
            Powered by<br/><a href="https://www.waiverfile.com/?wcs=pbw">
            <img src="https://www.waiverfile.com/sharedmedia/waiverfile-logo-lg.png" alt="WaiverFile" height="26" width="150"/>
          </a>
          </td>
        </tr>
      </table>
    </body>

  </xsl:template>

</xsl:stylesheet>
