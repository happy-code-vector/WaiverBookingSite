<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" xmlns:str="http://exslt.org/strings" exclude-result-prefixes="dt str"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

	<xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
	<xsl:param name="DateFormat"></xsl:param>
	

	<xsl:template match="/">
		
					<div class="mb-4 border-bottom pb-3">
						<h2 class="mb-0">Order Receipt</h2>
						<small class="text-muted">
							Order #: <xsl:value-of select="/Order/OrderNumber"/> |
							Status: <xsl:value-of select="/Order/CurrentStatus/Status"/> |
							Date: 

							<xsl:choose>
								<xsl:when test="$DateFormat=''">
									<xsl:value-of select="/Order/DateCreated"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="dt:format-date(/Order/DateCreated,$DateFormat)"/>
								</xsl:otherwise>
							</xsl:choose>
							
						
						</small>
					</div>

					<div class="mb-4">
						<h5>Customer Details</h5>
						<p class="mb-1">
							<strong>Name:</strong>
							<xsl:value-of select="/Order/FullName"/>
						</p>
						<p class="mb-1">
							<strong>Email:</strong>
							<xsl:value-of select="/Order/Email"/>
						</p>
						<p class="mb-1">
							<strong>Phone:</strong>
							<xsl:value-of select="/Order/Phone"/>
						</p>
					</div>

					<div class="table-responsive mb-4">
						<table class="table table-bordered align-middle">
							<thead class="table-light">
								<tr>
									<th>Item</th>
									<th class="">Details</th>
									<th class="text-center">Qty</th>
									<th class="text-end">Price</th>
									<th class="text-end">Total</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="/Order/Items/OrderItem[ItemType!='Tax' and ItemType!='Fee']">
									<tr>
										<td>
											<xsl:value-of select="Name"/>
										</td>
										<td>
											<xsl:value-of select="Details"/>
										</td>
										<td class="text-center">
											<xsl:value-of select="Quantity"/>
										</td>
										<td class="text-end">
											$<xsl:value-of select="format-number(Price, '0.00')"/>
										</td>
										<td class="text-end">
											$<xsl:value-of select="format-number(LineTotal, '0.00')"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
							<tfoot>
								<xsl:for-each select="/Order/Items/OrderItem[ItemType='Fee']">
									<tr>
										<td colspan="4" class="text-end">
											<xsl:value-of select="Name"/>
										</td>
										<td class="text-end">
											$<xsl:value-of select="format-number(LineTotal, '0.00')"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="/Order/Items/OrderItem[ItemType='Tax']">
									<tr>
										<td colspan="4" class="text-end">
											<xsl:value-of select="Name"/>
										</td>
										<td class="text-end">
											$<xsl:value-of select="format-number(LineTotal, '0.00')"/>
										</td>
									</tr>
								</xsl:for-each>
								
								<tr>
									<td colspan="4" class="text-end fw-bold">Grand Total</td>
									<td class="text-end fw-bold">
										$<xsl:value-of select="format-number(sum(/Order/Items/OrderItem/LineTotal), '0.00')"/>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>

					<!-- 🕓 Status History Section -->
					<div class="mb-4">
						<h5>Status History</h5>
						<div class="table-responsive">
							<table class="table table-sm table-striped">
								<thead class="table-light">
									<tr>
										<th>Date</th>
										<th>Status</th>
										<th>Comments</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="/Order/Statuses/OrderStatus">
										<tr>
											<td>
												<xsl:choose>
													<xsl:when test="$DateFormat=''">
														<xsl:value-of select="DateSet"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="dt:format-date(DateSet,$DateFormat)"/>
													</xsl:otherwise>
												</xsl:choose>
												
											</td>
											<td>
												<xsl:value-of select="Status"/>
											</td>
											<td>
												<xsl:choose>
													<xsl:when test="string-length(Comments) > 0">
														<xsl:value-of select="Comments"/>
													</xsl:when>
													<xsl:otherwise>
														<span class="text-muted">—</span>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
					</div>

					<div class="text-muted small">
						<p class="mb-0">
							Payment Info: <xsl:value-of select="/Order/CurrentStatus/Comments"/>
						</p>
						<p class="mb-0">
							This receipt was generated on 
							<xsl:choose>
							<xsl:when test="$DateFormat=''">
								<xsl:value-of select="DateCreated"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="dt:format-date(DateCreated,$DateFormat)"/>
							</xsl:otherwise>
						</xsl:choose>.
							
						</p>
					</div>
				
	</xsl:template>

</xsl:stylesheet>
