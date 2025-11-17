<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" xmlns:str="http://exslt.org/strings" exclude-result-prefixes="dt str"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

	<xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
	<xsl:param name="DateFormat"></xsl:param>
	

	<xsl:template match="/">
		<div class="container my-5">
			<div class="card shadow-sm">
				<div class="card-header bg-primary text-white">
					<div class="d-flex justify-content-between align-items-center">
						<div>
							<h2 class="mb-1">
								<i class="ci-file-text me-2"></i>Order Receipt
							</h2>
							<small class="opacity-75">
								Order #: <xsl:value-of select="/Order/OrderNumber"/>
							</small>
						</div>
						<div class="text-end">
							<xsl:variable name="statusClass">
								<xsl:choose>
									<xsl:when test="/Order/CurrentStatus/Status='Completed'">success</xsl:when>
									<xsl:when test="/Order/CurrentStatus/Status='Pending'">warning</xsl:when>
									<xsl:when test="/Order/CurrentStatus/Status='Cancelled'">danger</xsl:when>
									<xsl:otherwise>info</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<span class="badge bg-{$statusClass} fs-6">
								<xsl:value-of select="/Order/CurrentStatus/Status"/>
							</span>
							<div class="small opacity-75 mt-1">
								Date: 

							<xsl:choose>
								<xsl:when test="$DateFormat=''">
									<xsl:value-of select="/Order/DateCreated"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="dt:format-date(/Order/DateCreated,$DateFormat)"/>
								</xsl:otherwise>
							</xsl:choose>
							</div>
						</div>
					</div>
				</div>

				<div class="card-body p-4">
					<!-- Customer Details -->
					<div class="mb-4">
						<h5 class="mb-3">
							<i class="ci-user me-2"></i>Customer Details
						</h5>
						<div class="row g-3">
							<div class="col-md-4">
								<div class="d-flex align-items-center">
									<i class="ci-user-check text-muted me-2"></i>
									<div>
										<small class="text-muted d-block">Name</small>
										<strong><xsl:value-of select="/Order/FullName"/></strong>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="d-flex align-items-center">
									<i class="ci-mail text-muted me-2"></i>
									<div>
										<small class="text-muted d-block">Email</small>
										<strong><xsl:value-of select="/Order/Email"/></strong>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="d-flex align-items-center">
									<i class="ci-phone text-muted me-2"></i>
									<div>
										<small class="text-muted d-block">Phone</small>
										<strong><xsl:value-of select="/Order/Phone"/></strong>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Order Items -->
					<div class="mb-4">
						<h5 class="mb-3">
							<i class="ci-shopping-bag me-2"></i>Order Items
						</h5>
						<div class="table-responsive">
							<table class="table table-hover align-middle">
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

					<!-- Status History -->
					<div class="mb-4">
						<h5 class="mb-3">
							<i class="ci-clock me-2"></i>Status History
						</h5>
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

					<!-- Footer Info -->
					<div class="border-top pt-3 mt-4">
						<div class="row g-3 text-muted small">
							<div class="col-md-6">
								<i class="ci-credit-card me-1"></i>
								<strong>Payment Info:</strong> <xsl:value-of select="/Order/CurrentStatus/Comments"/>
							</div>
							<div class="col-md-6 text-md-end">
								<i class="ci-calendar me-1"></i>
								<strong>Generated:</strong> 
							<xsl:choose>
							<xsl:when test="$DateFormat=''">
								<xsl:value-of select="DateCreated"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="dt:format-date(DateCreated,$DateFormat)"/>
							</xsl:otherwise>
						</xsl:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
