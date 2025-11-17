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

		<table width="100%" cellpadding="0" cellspacing="0" style="font-family:Arial, sans-serif; background-color:#000000; padding:20px;">
			<tr>
				<td align="center">
					<table width="600" cellpadding="0" cellspacing="0" style="background:#161616; border-radius:8px; overflow:hidden; box-shadow:0 2px 4px rgba(0,0,0,0.5); border:1px solid #333333;">

						<!-- Header -->
						<tr>
							<td style="background:#64a19d; color:#ffffff; padding:30px 20px; text-align:center;">
								<h1 style="margin:0; font-size:28px; font-weight:normal;">Order Confirmation</h1>
								<p style="margin:10px 0 0 0; font-size:16px; opacity:0.9;">
									Thank you for your booking!
								</p>
							</td>
						</tr>

						<!-- Custom Body Content from Admin -->
						<xsl:if test="string-length($Body) > 0">
							<tr>
								<td style="padding:20px 30px; font-size:15px; line-height:1.6; color:#adb5bd; border-bottom:1px solid #333333;">
									<xsl:value-of select="$Body" disable-output-escaping="yes"/>
								</td>
							</tr>
						</xsl:if>

						<!-- Waiver Alert (if required) -->
						<xsl:if test="$waiversRequired">
							<tr>
								<td style="padding:20px 30px; background:#1a1a1a; border-left:4px solid #64a19d;">
									<p style="margin:0 0 10px 0; font-weight:bold; color:#ffffff; font-size:16px;">
										Action Required: Complete Waivers
									</p>
									<p style="margin:0; color:#adb5bd; font-size:14px; line-height:1.5;">
										Your booking includes activities that require signed waivers. Please complete the required waivers before your visit. You can also invite additional participants if needed.
									</p>
								</td>
							</tr>
						</xsl:if>

						<!-- Manage Booking Button (Always Show) -->
						<tr>
							<td align="center" style="padding:25px 30px 20px 30px;">
								<xsl:if test="count(/Main/ArrayOfBooking/Booking)=1">
									<a href="{$BaseUrl}/ViewBooking.aspx?id={/Main/ArrayOfBooking/Booking/ID}" style="display:inline-block; background:#64a19d; color:#ffffff; padding:14px 32px; border-radius:4px; text-decoration:none; font-weight:bold; font-size:16px; border:1px solid #64a19d;">
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
												<h2 style="margin:0 0 15px 0; font-size:20px; color:#ffffff; border-bottom:2px solid #333333; padding-bottom:10px;">
													Order #<xsl:value-of select="OrderNumber"/>
												</h2>
											</td>
										</tr>
										<tr>
											<td style="padding:10px 0; color:#adb5bd; font-size:14px;">
												<strong style="color:#ffffff;">Customer:</strong> <xsl:value-of select="FullName"/>
												<br/>
												<strong style="color:#ffffff;">Email:</strong> <xsl:value-of select="Email"/>
												<br/>
												<strong style="color:#ffffff;">Order Date:</strong>
												<xsl:value-of select="substring(DateCreated, 6, 2)"/>/<xsl:value-of select="substring(DateCreated, 9, 2)"/>/<xsl:value-of select="substring(DateCreated, 1, 4)"/>
												<br/>
												<strong style="color:#ffffff;">Status:</strong>
												<span style="color:#64a19d; font-weight:bold;">
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
										<table width="100%" cellpadding="0" cellspacing="0" style="border:1px solid #333333; border-radius:4px; overflow:hidden;">
											<tr>
												<td style="background:#1a1a1a; padding:12px 15px; font-weight:bold; color:#ffffff; border-bottom:1px solid #333333;">
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
																	<strong style="color:#ffffff; font-size:15px;">
																		<xsl:value-of select="Name"/>
																	</strong>
																	<br/>
																	<span style="color:#adb5bd; font-size:13px;">
																		<xsl:value-of select="Details"/>
																	</span>
																</div>
																<div style="display:table-cell; text-align:right; vertical-align:top; white-space:nowrap;">
																	<div style="color:#adb5bd; font-size:13px;">
																		Qty: <xsl:value-of select="Quantity"/>
																	</div>
																	<div style="color:#64a19d; font-weight:bold; font-size:15px;">
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
											<td style="padding:8px 0; color:#adb5bd; font-size:14px;">
												Subtotal:
											</td>
											<td style="padding:8px 0; text-align:right; color:#adb5bd; font-size:14px;">
												$<xsl:value-of select="format-number(sum(Items/OrderItem[ItemType!='Tax' and ItemType!='Fee' and ItemType!='Shipping' and ItemType!='Handling' and ItemType!='Shipping_and_Handling']/LineTotal), '0.00')"/>
											</td>
										</tr>

										<!-- Booking Fee -->
										<xsl:if test="Items/OrderItem[ItemType='Fee']">
											<tr>
												<td style="padding:8px 0; color:#adb5bd; font-size:14px;">
													Booking Fee:
												</td>
												<td style="padding:8px 0; text-align:right; color:#adb5bd; font-size:14px;">
													$<xsl:value-of select="format-number(sum(Items/OrderItem[ItemType='Fee']/LineTotal), '0.00')"/>
												</td>
											</tr>
										</xsl:if>

										<!-- Shipping -->
										<xsl:if test="Items/OrderItem[ItemType='Shipping' or ItemType='Handling' or ItemType='Shipping_and_Handling']">
											<tr>
												<td style="padding:8px 0; color:#adb5bd; font-size:14px;">
													Shipping:
												</td>
												<td style="padding:8px 0; text-align:right; color:#adb5bd; font-size:14px;">
													$<xsl:value-of select="format-number(sum(Items/OrderItem[ItemType='Shipping' or ItemType='Handling' or ItemType='Shipping_and_Handling']/LineTotal), '0.00')"/>
												</td>
											</tr>
										</xsl:if>

										<!-- Tax -->
										<xsl:if test="Items/OrderItem[ItemType='Tax']">
											<xsl:for-each select="Items/OrderItem[ItemType='Tax']">
												<tr>
													<td style="padding:8px 0; color:#adb5bd; font-size:14px;">
														<xsl:value-of select="Name"/>:
													</td>
													<td style="padding:8px 0; text-align:right; color:#adb5bd; font-size:14px;">
														$<xsl:value-of select="format-number(LineTotal, '0.00')"/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>

										<!-- Grand Total -->
										<tr>
											<td style="padding:15px 0 0 0; border-top:2px solid #64a19d; font-size:18px; font-weight:bold; color:#ffffff;">
												Total Paid:
											</td>
											<td style="padding:15px 0 0 0; border-top:2px solid #64a19d; text-align:right; font-size:20px; font-weight:bold; color:#64a19d;">
												$<xsl:value-of select="format-number(sum(Items/OrderItem/LineTotal), '0.00')"/>
											</td>
										</tr>
									</table>
								</td>
							</tr>

							<!-- Payment Details -->
							<xsl:if test="Statuses/OrderStatus[IsCurrentStatus='true']/Comments != ''">
								<tr>
									<td style="padding:0 30px 20px 30px; color:#adb5bd; font-size:13px; font-style:italic;">
										<xsl:value-of select="Statuses/OrderStatus[IsCurrentStatus='true']/Comments"/>
									</td>
								</tr>
							</xsl:if>

						</xsl:for-each>

						<!-- Footer -->
						<tr>
							<td style="background:#1a1a1a; padding:20px 30px; text-align:center; border-top:1px solid #333333;">
								<p style="margin:0; color:#adb5bd; font-size:13px; line-height:1.6;">
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
