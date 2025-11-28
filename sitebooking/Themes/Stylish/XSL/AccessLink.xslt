<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:asp="remove" xmlns:cc1="remove"
  xmlns:dt="http://exslt.org/dates-and-times"
  xmlns:str="http://exslt.org/strings"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  exclude-result-prefixes="dt str msxsl xsi">

	<!-- Params you pass from code -->
	<xsl:param name="SiteName"/>
	<xsl:param name="DateFormat"/>
	<xsl:param name="Subject"/>
	<xsl:param name="BaseUrl"/>
	<xsl:param name="SchemeAndDomain"/>
	<xsl:param name="Body"/>
	<xsl:param name="ActionUrl"/>
	<xsl:param name="ActionType"/>

	<xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>

	<!-- Helpers -->
	<xsl:variable name="CustomerFirst" select="/Main/*[local-name()='Customer']/*[local-name()='FirstName']"/>
	<xsl:variable name="CustomerLast"  select="/Main/*[local-name()='Customer']/*[local-name()='LastName']"/>
	<xsl:variable name="CustomerName">
		<xsl:choose>
			<xsl:when test="string($CustomerFirst) and string($CustomerLast)">
				<xsl:value-of select="concat($CustomerFirst,' ',$CustomerLast)"/>
			</xsl:when>
			<xsl:when test="string($CustomerFirst)">
				<xsl:value-of select="$CustomerFirst"/>
			</xsl:when>
			<xsl:otherwise>there</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="BookingNumber"
	  select="/Main/*[local-name()='Booking']/*[local-name()='BookingNumber']"/>

	<xsl:variable name="ctaHref">
		<xsl:choose>
			<xsl:when test="string($ActionUrl) and normalize-space($ActionUrl) != ''">
				<xsl:value-of select="$ActionUrl"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$BaseUrl"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="ctaLabel">
		<xsl:choose>
			<xsl:when test="$ActionType='VIEW_BOOKING'">View your booking</xsl:when>
			<xsl:when test="$ActionType='VIEW_ORDER'">View your order</xsl:when>
			<xsl:otherwise>Access your account</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:template match="/">
		<!-- Preheader (hidden) -->
		<div style="display:none;visibility:hidden;opacity:0;color:transparent;height:0;width:0;overflow:hidden;">
			<xsl:choose>
				<xsl:when test="string($Subject) and normalize-space($Subject)!=''">
					<xsl:value-of select="$Subject"/>
				</xsl:when>
				<xsl:otherwise>
					Your secure link for ">
					<xsl:value-of select="$SiteName"/>
					<xsl:text>"</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</div>

		<!-- Outer wrapper -->
		<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="background:#f6f8fb;margin:0;padding:24px;">
			<tr>
				<td align="center">
					<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="max-width:600px;background:#ffffff;border:1px solid #e9eef5;border-radius:8px;overflow:hidden;">
						<!-- Header -->
						<tr>
							<td style="padding:20px 24px;background:#ffffff;border-bottom:1px solid #e9eef5;">
								<h1 style="margin:0;font-family:Arial,Helvetica,sans-serif;font-size:20px;line-height:1.3;color:#111111;">
									<xsl:choose>
										<xsl:when test="string($Subject) and normalize-space($Subject)!=''">
											<xsl:value-of select="$Subject"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>Your secure link for </xsl:text>
											<xsl:value-of select="$SiteName"/>
										</xsl:otherwise>
									</xsl:choose>
								</h1>
							</td>
						</tr>

						<!-- Body -->
						<tr>
							<td style="padding:24px 24px 8px 24px;background:#ffffff;">
								<p style="margin:0 0 12px 0;font-family:Arial,Helvetica,sans-serif;font-size:16px;line-height:1.5;color:#111111;">
									<xsl:text>Hi </xsl:text>
									<xsl:value-of select="$CustomerName"/>
									<xsl:text>,</xsl:text>
								</p>

								<!-- Optional intro/body text -->
								<xsl:if test="string($Body) and normalize-space($Body)!=''">
									<p style="margin:0 0 16px 0;font-family:Arial,Helvetica,sans-serif;font-size:15px;line-height:1.6;color:#333333;">
										<xsl:value-of select="$Body"/>
									</p>
								</xsl:if>

								<!-- Context line for booking/order -->
								<xsl:choose>
									<xsl:when test="$ActionType='VIEW_BOOKING'">
										<p style="margin:0 0 16px 0;font-family:Arial,Helvetica,sans-serif;font-size:15px;line-height:1.6;color:#333333;">
											<xsl:text>Use the button below to securely view your booking</xsl:text>
											<xsl:if test="string($BookingNumber) and normalize-space($BookingNumber)!=''">
												<xsl:text> (#</xsl:text>
												<xsl:value-of select="$BookingNumber"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
											<xsl:text>.</xsl:text>
										</p>
									</xsl:when>
									<xsl:when test="$ActionType='VIEW_ORDER'">
										<p style="margin:0 0 16px 0;font-family:Arial,Helvetica,sans-serif;font-size:15px;line-height:1.6;color:#333333;">
											<xsl:text>Use the button below to securely view your order.</xsl:text>
										</p>
									</xsl:when>
									<xsl:otherwise>
										<p style="margin:0 0 16px 0;font-family:Arial,Helvetica,sans-serif;font-size:15px;line-height:1.6;color:#333333;">
											<xsl:text>Tap the button below to access your </xsl:text>
											<xsl:value-of select="$SiteName"/>
											<xsl:text> account.</xsl:text>
										</p>
									</xsl:otherwise>
								</xsl:choose>

								<!-- CTA (bulletproof-ish) -->
								<table role="presentation" cellpadding="0" cellspacing="0" border="0" style="margin:0 0 20px 0;">
									<tr>
										<td align="center" bgcolor="#0d6efd" style="border-radius:6px;">
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="$ctaHref"/>
												</xsl:attribute>
												<xsl:attribute name="style">
													font-family:Arial,Helvetica,sans-serif;
													font-size:16px;
													line-height:1.2;
													color:#ffffff;
													text-decoration:none;
													display:inline-block;
													padding:12px 18px;
													border-radius:6px;
												</xsl:attribute>
												<xsl:value-of select="$ctaLabel"/>
											</a>
										</td>
									</tr>
								</table>

								<!-- Plain-link fallback -->
								<p style="margin:0 0 4px 0;font-family:Arial,Helvetica,sans-serif;font-size:13px;line-height:1.6;color:#666666;">
									If the button doesn’t work, copy and paste this link into your browser:
								</p>
								<p style="margin:0 0 16px 0;font-family:Courier,monospace;font-size:12px;line-height:1.6;color:#444444;word-break:break-all;">
									<xsl:value-of select="$ctaHref"/>
								</p>

								<!-- Security note -->
								<p style="margin:0 0 0 0;font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:1.6;color:#8a8f98;">
									For your security, this link may expire after a short time. If you didn’t request it, you can safely ignore this email.
								</p>
							</td>
						</tr>

						<!-- Footer -->
						<tr>
							<td style="padding:16px 24px;background:#f9fbfd;border-top:1px solid #e9eef5;">
								<p style="margin:0;font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:1.6;color:#8a8f98;">
									<xsl:value-of select="$SiteName"/> •
									<xsl:value-of select="$SchemeAndDomain"/>
								</p>
							</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
