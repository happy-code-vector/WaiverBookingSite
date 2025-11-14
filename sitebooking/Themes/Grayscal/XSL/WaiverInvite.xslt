<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:dt="http://exslt.org/dates-and-times"
  xmlns:str="http://exslt.org/strings"
  exclude-result-prefixes="dt str">

	<xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>

	<!-- ===== Params (override in code) ===== -->
	<xsl:param name="SiteName" />
	<xsl:param name="CustomerName" select="''"/>
	<xsl:param name="CustomerEmail" select="''"/>
	<xsl:param name="DateFormat" select="'M/d/yyyy'"/>
	<xsl:param name="DateTimeFormat" select="''"/>
	<!-- optional -->
	<xsl:param name="ActionUrl" select="''"/>
	<!-- full link (preferred) -->
	<xsl:param name="WaiverBaseUrl" select="''"/>
	<!-- e.g., https://example.com/waiver/start -->
	<!-- comma separated; optional -->


	<!-- Helper: choose which format to use for a given item -->
	<xsl:template name="fmt-one">
		<xsl:param name="iso"/>
		<xsl:param name="useDateTime" select="false()"/>
		<xsl:choose>
			<xsl:when test="$useDateTime and string-length(normalize-space($DateTimeFormat)) &gt; 0">
				<xsl:value-of select="dt:format-date($iso, $DateTimeFormat)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="dt:format-date($iso, $DateFormat)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Item date range (single day when equal) -->
	<xsl:template name="render-item-dates">
		<xsl:param name="start"/>
		<xsl:param name="end"/>
		<xsl:param name="isAllDay" select="false()"/>

		<xsl:variable name="sameInstant" select="normalize-space($start)=normalize-space($end)"/>
		<xsl:variable name="sameDay" select="substring($start,1,10)=substring($end,1,10)"/>

		<xsl:choose>
			<!-- All-day same calendar day => one date -->
			<xsl:when test="$isAllDay and $sameDay">
				<xsl:call-template name="fmt-one">
					<xsl:with-param name="iso" select="$start"/>
					<xsl:with-param name="useDateTime" select="false()"/>
				</xsl:call-template>
			</xsl:when>

			<!-- same instant => one stamp (use datetime if asked) -->
			<xsl:when test="$sameInstant">
				<xsl:call-template name="fmt-one">
					<xsl:with-param name="iso" select="$start"/>
					<xsl:with-param name="useDateTime" select="not($isAllDay)"/>
				</xsl:call-template>
			</xsl:when>

			<!-- otherwise a range -->
			<xsl:otherwise>
				<xsl:call-template name="fmt-one">
					<xsl:with-param name="iso" select="$start"/>
					<xsl:with-param name="useDateTime" select="not($isAllDay)"/>
				</xsl:call-template>
				<xsl:text> – </xsl:text>
				<xsl:call-template name="fmt-one">
					<xsl:with-param name="iso" select="$end"/>
					<xsl:with-param name="useDateTime" select="not($isAllDay)"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	

	<!-- ===== Root ===== -->
	<xsl:template match="/">

		<!-- Preheader (hidden in most clients) -->
		<div style="display:none!important;visibility:hidden;opacity:0;color:transparent;height:0;width:0;overflow:hidden;">
			<xsl:text>Sign your waiver(s) for Booking </xsl:text>
			<xsl:value-of select="/Booking/BookingNumber"/>
			<xsl:text> at </xsl:text>
			<xsl:value-of select="$SiteName"/>
			<xsl:text>.</xsl:text>
		</div>

		<!-- 600px centered table (email-safe) -->
		<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="background:#ffffff;">
			<tr>
				<td align="center" style="padding:24px;">
					<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="600" style="max-width:600px;border:1px solid #e6e6e6;border-radius:8px;">
						<tr>
							<td style="padding:24px 24px 8px 24px; font-family:Segoe UI,Arial,sans-serif;">
								<div style="font-size:18px; font-weight:600; color:#111;">
									<xsl:value-of select="$SiteName"/>
								</div>
								<div style="font-size:14px; color:#666; margin-top:4px;">
									Booking <xsl:value-of select="/Booking/BookingNumber"/>
								</div>
							</td>
						</tr>

						<tr>
							<td style="padding:8px 24px 0 24px; font-family:Segoe UI,Arial,sans-serif;">
								<h1 style="margin:0 0 8px 0;font-size:20px;line-height:1.3;color:#111;">Please sign your waiver(s)</h1>
								<p style="margin:0 0 12px 0;font-size:14px;line-height:1.6;color:#333;">
									<xsl:choose>
										<xsl:when test="string-length(normalize-space($CustomerName)) &gt; 0">
											<xsl:value-of select="$CustomerName"/> (<xsl:value-of select="$CustomerEmail"/>)
										</xsl:when>
										<xsl:otherwise>The booking holder</xsl:otherwise>
									</xsl:choose>
									<xsl:text> invited you to complete the required waiver(s) for this booking.</xsl:text>
								</p>
							</td>
						</tr>

						<!-- Activities list (filtered if IDs CSV provided) -->
						<tr>
							<td style="padding:0 24px 8px 24px; font-family:Segoe UI,Arial,sans-serif;">
								<xsl:variable name="itemsFiltered"
								  select="/Booking/AdmissionItems"/>
								<xsl:if test="count($itemsFiltered) &gt; 0">
									<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
										<xsl:for-each select="$itemsFiltered">
											<tr>
												<td style="padding:8px 0;border-top:1px solid #eee;vertical-align:top;">
													<div style="font-size:14px;color:#111;font-weight:600;">
														<xsl:value-of select="Item/Name"/>
													</div>
													<div style="font-size:13px;color:#555;">
														<xsl:call-template name="render-item-dates">
															<xsl:with-param name="start" select="DateStart"/>
															<xsl:with-param name="end"   select="DateEnd"/>
															<xsl:with-param name="isAllDay" select="IsAllDay='true'"/>
														</xsl:call-template>
														<xsl:if test="IsAllDay='true'">
															<xsl:text> (all day)</xsl:text>
														</xsl:if>
													</div>
												</td>
											</tr>
										</xsl:for-each>
									</table>
								</xsl:if>
							</td>
						</tr>

						<!-- Button -->
						<tr>
							<td align="center" style="padding:8px 24px 24px 24px;">
								

								<!-- Bulletproof-ish button table -->
								<table role="presentation" cellpadding="0" cellspacing="0" border="0" style="border-collapse:separate;">
									<tr>
										<td align="center" bgcolor="#0d6efd" style="border-radius:999px;">
											<a href="{$ActionUrl}"
											   style="display:inline-block;padding:12px 18px;font-family:Segoe UI,Arial,sans-serif;font-size:14px;color:#ffffff;text-decoration:none;">
												Sign waiver(s)
											</a>
										</td>
									</tr>
								</table>

								<!-- Fallback link -->
								<div style="font-family:Segoe UI,Arial,sans-serif;font-size:12px;color:#666;margin-top:12px;">
									If the button doesn’t work, copy and paste this link into your browser:<br/>
									<a href="{$ActionUrl}" style="color:#0d6efd;text-decoration:underline;word-break:break-all;">
										<xsl:value-of select="$ActionUrl"/>
									</a>
								</div>
							</td>
						</tr>

						<!-- Footer note -->
						<tr>
							<td style="padding:0 24px 24px 24px; font-family:Segoe UI,Arial,sans-serif;">
								<div style="font-size:12px;color:#999;line-height:1.4;">
									You received this email because you’re listed on a booking at
									<xsl:value-of select="$SiteName"/>.
								</div>
							</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
