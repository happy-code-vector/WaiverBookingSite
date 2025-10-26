<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:param name="TimeZoneName"></xsl:param>
  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="SiteName"></xsl:param>
  <xsl:param name="BaseUrl"></xsl:param>

  <xsl:template match="/Waiver">

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
                <td style="height:54px; width:298px;" width="298">
                  <a href="http://www.waiverfile.com">
                    <img src="https://www.waiverfile.com/sharedmedia/waiverfile-logo-sm.gif" alt="WaiverFile" height="54" width="298"/>
                  </a>
                </td>
                <td style="color:#333333; font-size: 28px; text-align:right;">

                  <xsl:value-of select="$SiteName"/>
                </td>
              </tr>
              
              <tr>
                <td colspan="2">
                  <xsl:text> </xsl:text>
                </td>
              </tr>
            </table>
            
            
            <table width="{$TableWidth}" style="background-color:#ffffff; " cellpadding="10">
              <tr>
                <td style="color:#333333; font-size: 15px; text-align:center; " colspan="2" align="center">

                    A new Waiver has been received! The following is an overview of the information collected. <br/>

                </td>
              </tr>

              <tr>
                <td style="color:#333333; font-size: 15px; text-align:center; " colspan="2" align="center">
                  <div>


                    <div>


                      <div>
                        <xsl:text disable-output-escaping="yes">&lt;!--[if mso]&gt;
  &lt;v:roundrect xmlns:v=&quot;urn:schemas-microsoft-com:vml&quot; xmlns:w=&quot;urn:schemas-microsoft-com:office:word&quot; href=&quot;</xsl:text>

                        <xsl:value-of select="$BaseUrl"/>
                        <xsl:text>/admin/ViewWaiver.aspx?id=</xsl:text>
                        <xsl:value-of select="WaiverID"/>
                        <xsl:text disable-output-escaping="yes">&quot; style=&quot;height:40px;v-text-anchor:middle;width:200px;&quot; arcsize=&quot;18%&quot; stroke=&quot;f&quot; fillcolor=&quot;#ea7400&quot;&gt;
    &lt;w:anchorlock/&gt;
    &lt;center&gt;
  &lt;![endif]--&gt;</xsl:text>

                        <a href="{$BaseUrl}/admin/ViewWaiver.aspx?id={WaiverID}"
                  style="background-color:#ea7400;border-radius:7px;color:#ffffff;display:inline-block;font-family:sans-serif;font-size:13px;font-weight:bold;line-height:40px;text-align:center;text-decoration:none;width:200px;-webkit-text-size-adjust:none;">View The Waiver</a>
                        <xsl:text disable-output-escaping="yes">  &lt;!--[if mso]&gt;
    &lt;/center&gt;
  &lt;/v:roundrect&gt;
&lt;![endif]--&gt;</xsl:text>

                      </div>

                    </div>
                  </div>
                </td>
              </tr>
              
              <tr>
                <td style="color:#333333; font-size: 15px; text-align:left;">
                  <strong>Signed By</strong>
                  <h2>
                    <xsl:value-of select="SignedNameFirst"/>
                    <xsl:if test="SignedNameFirst!=''">
                      <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:value-of select="SignedName"/>
                  </h2>

                  <h3>
                    <xsl:value-of select="WaiverForm/Name"/>
                  </h3>

                  <xsl:if test="WaiverEvent/Name!=''">
                    <h4>
                      <xsl:value-of select="WaiverEvent/Name"/>
                      <xsl:text> | </xsl:text>
                      <xsl:value-of select="WaiverEvent/TimeLabel"/>
                    </h4>
                  </xsl:if>




                  <h4>Participants:</h4>
                  <ul>
                    <xsl:for-each select="Particpants/WaiverParticipant">
                      <li>
                        <xsl:value-of select="ParticipantNameFirst"/>
                        <xsl:if test="ParticipantNameFirst!=''">
                          <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="ParticipantName"/>
                        <xsl:if test="DOB!='' and DOB!='1/1/1753'">
                          <xsl:text> - </xsl:text>
                          <xsl:value-of select="DOB"/>
                        </xsl:if>
                      </li>
                    </xsl:for-each>
                  </ul>
                </td>
                <td style="color:#333333; font-size: 15px; text-align:left;">

                 



                  <strong>Address:</strong>
                  <br/>
                  <xsl:value-of select="Address"/>
                  <br/>
                  <xsl:if test="Address2!=''">
                        <xsl:value-of select="Address2"/>
                    <br/>
                  </xsl:if>
                  <xsl:value-of select="City"/>
                  <xsl:text>, </xsl:text>
                  <xsl:value-of select="State"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="Zip"/>
                  <br/>
                  <br/>


                  <strong>Phone: </strong>
                  
                  <a href="tel:{Phone}">
                    <xsl:value-of select="Phone"/>
                  </a>
                  <br/>

                  <strong>Email: </strong>
                  
                  <a href="mailto:{Email}">
                    <xsl:value-of select="Email"/>
                  </a>
                  <br/>




                 

                </td>
              </tr>
             
            </table>
          </td>
        </tr>
      </table>
    </body>

  </xsl:template>
</xsl:stylesheet>
