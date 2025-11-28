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
	<xsl:param name="Body"></xsl:param>
	<xsl:param name="BaseUrl"></xsl:param>
	<xsl:param name="LoadOriginalVersion"></xsl:param>
	<xsl:param name="OmitCustomFields"></xsl:param>
	<xsl:param name="LogoPath"></xsl:param>
	<xsl:param name="ActionUrl"></xsl:param>
	<xsl:param name="ActionType"></xsl:param>

	<xsl:template match="/">
		<!-- Check if waivers are required -->
		<xsl:variable name="waiversRequired" select="count(/Main/ArrayOfBooking/Booking/Persons/BookingPerson[WaiverStatus='Required_Not_Started']) > 0 or count(/Main/ArrayOfOrder/Order/Items/OrderItem[contains(Details, 'Waiver') or contains(Name, 'Waiver')]) > 0" />

		<table width="100%" cellpadding="0" cellspacing="0" style="font-family:Arial, sans-serif; background-color:#f5f5f5; padding:20px;">
			<tr>
				<td align="center">
					<table width="600" cellpadding="0" cellspacing="0" style="background:#ffffff; border-radius:8px; overflow:hidden; box-shadow:0 2px 4px rgba(0,0,0,0.06); border:1px solid #e6e6e6;">

						<!-- Header -->
						<tr>
							<td style="background:#2b2b2b; color:#ffffff; padding:30px 20px; text-align:center;">
								<h1 style="margin:0; font-size:28px; font-weight:normal;">Order Confirmation</h1>
								<p style="margin:10px 0 0 0; font-size:16px; opacity:0.9;">
									Thank you for your booking!
								</p>
							</td>
						</tr>

						<!-- Custom Body Content from Admin -->
						<xsl:if test="string-length($Body) > 0">
							<tr>
								<td style="padding:20px 30px; font-size:15px; line-height:1.6; color:#333333; border-bottom:1px solid #eeeeee;">
									<xsl:value-of select="$Body" disable-output-escaping="yes"/>
								</td>
							</tr>
						</xsl:if>

						<!-- Waiver Alert (if required) -->
						<xsl:if test="$waiversRequired">
							<tr>
								<td style="padding:20px 30px; background:#f6f6f6; border-left:4px solid #cfcfcf;">
									<p style="margin:0 0 10px 0; font-weight:bold; color:#444444; font-size:16px;">
										Action Required: Complete Waivers
									</p>
									<p style="margin:0; color:#555555; font-size:14px; line-height:1.5;">
										Your booking includes activities that require signed waivers. Please complete the required waivers before your visit. You can also invite additional participants if needed.
									</p>
								</td>
							</tr>
						</xsl:if>

						<!-- Manage Booking Button (Always Show) -->
						<tr>
							<td align="center" style="padding:25px 30px 20px 30px;">
								<xsl:if test="count(/Main/ArrayOfBooking/Booking)=1">
									<a href="{$BaseUrl}/ViewBooking.aspx?id={/Main/ArrayOfBooking/Booking/ID}" style="display:inline-block; background:#333333; color:#ffffff; padding:14px 32px; border-radius:4px; text-decoration:none; font-weight:bold; font-size:16px; border:1px solid #2a2a2a;">
										View &amp; Manage Your Booking
									</a>
								</xsl:if>
							</td>
						</tr>

						<!-- Order Details -->
						<xsl:for-each select="/Main/ArrayOfOrder/Order">
							<tr>
								<td style="padding:20px 30px;">
									<table width="100%" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<h2 style="margin:0 0 15px 0; font-size:20px; color:#222222; border-bottom:2px solid #d1d5db; padding-bottom:10px;">
													Order #<xsl:value-of select="OrderNumber"/>
												</h2>
											</td>
										</tr>
										<tr>
											<td style="padding:10px 0; color:#555555; font-size:14px;">
												<strong>Customer:</strong> <xsl:value-of select="FullName"/>
												<br/>
												<strong>Email:</strong> <xsl:value-of select="Email"/>
												<br/>
												<strong>Order Date:</strong>
												<xsl:value-of select="substring(DateCreated, 6, 2)"/>/<xsl:value-of select="substring(DateCreated, 9, 2)"/>/<xsl:value-of select="substring(DateCreated, 1, 4)"/>
												<br/>
												<strong>Status:</strong>
												<span style="color:#222222; font-weight:bold;">
													<xsl:value-of select="Statuses/OrderStatus[IsCurrentStatus='true']/Status"/>
												</span>
											</td>
										</tr>
									</table>
								</td>
							</tr>

							<!-- Booking Details -->
							<xsl:for-each select="/Main/ArrayOfBooking/Booking">
								<tr>
									<td style="padding:0 30px 20px 30px;">
										<table width="100%" cellpadding="0" cellspacing="0" style="border:1px solid #e6e6e6; border-radius:4px; overflow:hidden;">
											<tr>
												<td style="background:#f7f7f7; padding:12px 15px; font-weight:bold; color:#222222; border-bottom:1px solid #e6e6e6;">
													Booking #<xsl:value-of select="BookingNumber"/>
												</td>
											</tr>

											<!-- Booking Items with Dates -->
											<xsl:for-each select="/Main/ArrayOfOrder/Order/Items/OrderItem[BookingID=current()/ID]">
												<tr>
													<td style="padding:12px 15px; border-bottom:1px solid #eeeeee;">
														<div style="display:table; width:100%;">
															<div style="display:table-row;">
																<div style="display:table-cell; padding-right:10px;">
																	<strong style="color:#222222; font-size:15px;">
																		<xsl:value-of select="Name"/>
																	</strong>
																	<br/>
																	<span style="color:#666666; font-size:13px;">
																		<xsl:value-of select="Details"/>
																	</span>
																</div>
																<div style="display:table-cell; text-align:right; vertical-align:top; white-space:nowrap;">
																	<div style="color:#666666; font-size:13px;">
																		Qty: <xsl:value-of select="Quantity"/>
																	</div>
																	<div style="color:#222222; font-weight:bold; font-size:15px;">
																		$<xsl:value-of select="format-number(LineTotal, '0.00')"/>
																	</div>
																</div>
															</div>
														</div>
													</td>
												</tr>
											</xsl:for-each>
										</table>
									</td>
								</tr>
							</xsl:for-each>

							<!-- Order Summary (Receipt Style) -->
							<tr>
								<td style="padding:20px 30px 30px 30px;">
									<table width="100%" cellpadding="0" cellspacing="0" style="border-top:2px solid #e6e6e6; padding-top:15px;">

										<!-- Subtotal -->
										<tr>
											<td style="padding:8px 0; color:#555555; font-size:14px;">
												Subtotal:
											</td>
											<td style="padding:8px 0; text-align:right; color:#555555; font-size:14px;">
												$<xsl:value-of select="format-number(sum(Items/OrderItem[ItemType!='Tax' and ItemType!='Fee' and ItemType!='Shipping' and ItemType!='Handling' and ItemType!='Shipping_and_Handling']/LineTotal), '0.00')"/>
											</td>
										</tr>

										<!-- Booking Fee -->
										<xsl:if test="Items/OrderItem[ItemType='Fee']">
											<tr>
												<td style="padding:8px 0; color:#555555; font-size:14px;">
													Booking Fee:
												</td>
												<td style="padding:8px 0; text-align:right; color:#555555; font-size:14px;">
													$<xsl:value-of select="format-number(sum(Items/OrderItem[ItemType='Fee']/LineTotal), '0.00')"/>
												</td>
											</tr>
										</xsl:if>

										<!-- Shipping -->
										<xsl:if test="Items/OrderItem[ItemType='Shipping' or ItemType='Handling' or ItemType='Shipping_and_Handling']">
											<tr>
												<td style="padding:8px 0; color:#555555; font-size:14px;">
													Shipping:
												</td>
												<td style="padding:8px 0; text-align:right; color:#555555; font-size:14px;">
													$<xsl:value-of select="format-number(sum(Items/OrderItem[ItemType='Shipping' or ItemType='Handling' or ItemType='Shipping_and_Handling']/LineTotal), '0.00')"/>
												</td>
											</tr>
										</xsl:if>

										<!-- Tax -->
										<xsl:if test="Items/OrderItem[ItemType='Tax']">
											<xsl:for-each select="Items/OrderItem[ItemType='Tax']">
												<tr>
													<td style="padding:8px 0; color:#555555; font-size:14px;">
														<xsl:value-of select="Name"/>:
													</td>
													<td style="padding:8px 0; text-align:right; color:#555555; font-size:14px;">
														$<xsl:value-of select="format-number(LineTotal, '0.00')"/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>

										<!-- Grand Total -->
										<tr>
											<td style="padding:15px 0 0 0; border-top:2px solid #2b2b2b; font-size:18px; font-weight:bold; color:#222222;">
												Total Paid:
											</td>
											<td style="padding:15px 0 0 0; border-top:2px solid #2b2b2b; text-align:right; font-size:20px; font-weight:bold; color:#222222;">
												$<xsl:value-of select="format-number(sum(Items/OrderItem/LineTotal), '0.00')"/>
											</td>
										</tr>
									</table>
								</td>
							</tr>

							<!-- Payment Details -->
							<xsl:if test="Statuses/OrderStatus[IsCurrentStatus='true']/Comments != ''">
								<tr>
									<td style="padding:0 30px 20px 30px; color:#555555; font-size:13px; font-style:italic;">
										<xsl:value-of select="Statuses/OrderStatus[IsCurrentStatus='true']/Comments"/>
									</td>
								</tr>
							</xsl:if>

						</xsl:for-each>

						<!-- Footer -->
						<tr>
							<td style="background:#f7f7f7; padding:20px 30px; text-align:center; border-top:1px solid #e6e6e6;">
								<p style="margin:0; color:#666666; font-size:13px; line-height:1.6;">
									Questions? Contact us at <xsl:value-of select="$SiteName"/>
									<br/>
									This is an automated confirmation email. Please do not reply directly to this message.
								</p>
							</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

</xsl:stylesheet>
