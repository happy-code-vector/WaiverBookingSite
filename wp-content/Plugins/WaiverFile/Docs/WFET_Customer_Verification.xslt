<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" xmlns:str="http://exslt.org/strings" exclude-result-prefixes="dt str"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>


  <xsl:param name="TimeZoneName"></xsl:param>

  <xsl:param name="Subject"></xsl:param>
  <xsl:param name="SiteName"></xsl:param>
  <xsl:param name="SignatureCID"></xsl:param>
  <xsl:param name="QRCodeCID"></xsl:param>
  <xsl:param name="DateFormat"></xsl:param>
  <xsl:param name="BaseUrl"></xsl:param>
	<xsl:param name="Body"></xsl:param>
	<xsl:param name="Link"></xsl:param>
  <xsl:param name="LoadOriginalVersion"></xsl:param>
  <xsl:param name="OmitCustomFields"></xsl:param>
  <xsl:param name="LogoPath"></xsl:param>

	<xsl:template match="/">
		<table width="100%" cellpadding="0" cellspacing="0" style="font-family:Arial, sans-serif; background-color:#f9f9f9; padding:20px;">
			<tr>
				<td align="center">
					<table width="600" cellpadding="0" cellspacing="0" style="background:#ffffff; border:1px solid #ddd; padding:30px;">

						<!-- Standard message -->
						<tr>
							<td style="padding-bottom:20px; font-size:16px;">
								We received a request to verify your account or reset your password for 
								<xsl:value-of select="$SiteName" />. 
								If you made this request, click the button below to continue.
								If not, you can safely ignore this email.
							</td>
						</tr>
						<!-- customizable message -->
						<xsl:if test="$Body!=''">
						<tr>
							<td style="padding-bottom:20px; font-size:16px;">
								<xsl:value-of select="$Body" disable-output-escaping="yes"/>
							</td>
						</tr>
						</xsl:if>
						
						<!-- View / Manage Booking button -->
						<tr>
							<td align="center" style="padding-bottom:20px;">
								<a href="{$Link}" style="background:#007bff; color:#ffffff; padding:12px 24px; border-radius:4px; text-decoration:none; display:inline-block; font-weight:bold;">
									Verify Your Account
								</a>
							</td>
						</tr>


						


					</table>
				</td>
			</tr>
		</table>
	</xsl:template>


</xsl:stylesheet>
