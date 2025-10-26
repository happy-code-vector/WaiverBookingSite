<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>
  <xsl:param name="TimeZoneName"></xsl:param>
  <xsl:param name="DateFormat"></xsl:param>
  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="UserRole"></xsl:param>
  <xsl:param name="IncludeButtons">true</xsl:param>
  <xsl:param name="ShowLimitedDataWarning"></xsl:param>
  <xsl:param name="IncludeEditWaiver"></xsl:param>
  <xsl:param name="SiteName"></xsl:param>
  <xsl:param name="QRBarcodeImgSrc"></xsl:param>
  
  


  
  <xsl:template match="/Waiver">




    <div style="width: 350px; font-size:15px; margin:10px auto; font-family:'Courier New',sans-serif;  text-align:center; padding: 15px; -webkit-filter: drop-shadow(0 2px 10px #000); background-color: #ffffff; color:#000000; ">
      <div style="padding: 10px;border:2px dashed #b6b6b6;color:#000000;">
        <p style="font-size:20px;">
          <xsl:value-of select="$SiteName"/>
        </p>
        <p>
          <xsl:text>Date: </xsl:text>
          <xsl:value-of select="dt:format-date(DateSigned,$DateFormat)"/>
          </p>
        <table border="0" cellpadding="7" width="100%">
          <tr>
            <td valign="top" align="left">
              <strong>Signee: </strong><br />
              <xsl:value-of select="SignedNameFirst"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="SignedName"/>
              <br /><br />
              <xsl:if test="count(Particpants/WaiverParticipant[IsSignee!='true'])!=0">
              <strong>Participants: </strong><br />

              <xsl:for-each select="Particpants/WaiverParticipant[IsSignee!='true']">
                <xsl:value-of select="ParticipantNameFirst"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="ParticipantName"/>
                <br />
              </xsl:for-each>
              </xsl:if>
            </td>
            <td valign="top" align="center">
              <span style="font-size:26px">
                <xsl:value-of select="count(Particpants/WaiverParticipant)"/>
              </span>
              <br />
              <strong>Headcount</strong>
            </td>

          </tr>
        </table>



        <div style="margin:20px">
          <img style="max-width:70%;" src="{$QRBarcodeImgSrc}"/>
            </div>
        <p style="text-align:center; font-size:13px;">Please present this ticket for entry</p>

        <p style="color: #808080; font-size:11px;">
          Powered by<br />
          <a href="https://www.waiverfile.com/?wcs=pbw">
            <img src="https://www.waiverfile.com/sharedmedia/waiverfile-logo-lg.png" alt="WaiverFile" height="26" width="150" />
          </a>
        </p>
      </div>
    </div>

    

  </xsl:template>

  
</xsl:stylesheet>
