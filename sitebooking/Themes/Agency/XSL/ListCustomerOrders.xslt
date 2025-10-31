<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:asp="remove"
  xmlns:cc1="remove"
  xmlns:dt="http://exslt.org/dates-and-times"
  xmlns:str="http://exslt.org/strings"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  exclude-result-prefixes="dt str msxsl asp cc1 xsi">

	<xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>

	<!-- Params you provide -->
	<xsl:param name="DateFormat"/>
	<xsl:param name="DateFormatWithTime"/>
	<xsl:param name="CurrencySymbol">$</xsl:param>

	<!-- Helpers -->
	<xsl:template name="FormatDateAuto">
		<xsl:param name="value"/>
		<xsl:choose>
			<xsl:when test="contains($value, 'T') and string-length(normalize-space($DateFormatWithTime)) &gt; 0">
				<xsl:value-of select="dt:format-date($value, $DateFormatWithTime)"/>
			</xsl:when>
			<xsl:when test="string-length(normalize-space($DateFormat)) &gt; 0">
				<xsl:value-of select="dt:format-date($value, $DateFormat)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$value"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="OrderTotal">
		<xsl:param name="order" select="."/>
		<xsl:variable name="sum" select="sum($order/Items/OrderItem/LineTotal)"/>
		<xsl:choose>
			<xsl:when test="string-length($CurrencySymbol) &gt; 0">
				<xsl:value-of select="$CurrencySymbol"/>
				<xsl:value-of select="format-number($sum, '0.00')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="format-number($sum, '0.00')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="StatusBadgeClass">
		<xsl:param name="statusText"/>
		<xsl:variable name="s" select="translate(normalize-space($statusText), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
		<xsl:choose>
			<xsl:when test="$s = 'paid' or $s = 'completed'">badge bg-success</xsl:when>
			<xsl:when test="$s = 'pending' or $s = 'processing'">badge bg-warning text-dark</xsl:when>
			<xsl:when test="$s = 'canceled' or $s = 'cancelled'">badge bg-secondary</xsl:when>
			<xsl:when test="$s = 'refunded' or $s = 'failed' or $s = 'declined'">badge bg-danger</xsl:when>
			<xsl:otherwise>badge bg-light text-dark</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Page -->
	<xsl:template match="/">
		<xsl:variable name="hasOrders" select="count(/ArrayOfOrder/Order) &gt; 0"/>

		<div class="container my-4">
			<h1 class="h3 mb-3">Order History</h1>

			<xsl:choose>
				<xsl:when test="$hasOrders">

					<!-- ===== Mobile: cards (no horizontal scroll) ===== -->
					<div class="d-lg-none">
						<xsl:for-each select="/ArrayOfOrder/Order">
							<xsl:sort select="DateCreated" data-type="text" order="descending"/>
							<xsl:variable name="orderId" select="ID"/>
							<xsl:variable name="orderNumber" select="OrderNumber"/>
							<xsl:variable name="created" select="DateCreated"/>
							<xsl:variable name="status" select="Statuses/OrderStatus[IsCurrentStatus='true']/Status"/>
							<xsl:variable name="statusDate" select="Statuses/OrderStatus[IsCurrentStatus='true']/DateSet"/>

							<div class="card shadow-sm mb-3 position-relative">
								<div class="card-body">
									<div class="d-flex justify-content-between align-items-start mb-1">
										<div class="fw-semibold">
											#<xsl:value-of select="$orderNumber"/>
										</div>
										<span>
											<xsl:attribute name="class">
												<xsl:call-template name="StatusBadgeClass">
													<xsl:with-param name="statusText" select="$status"/>
												</xsl:call-template>
											</xsl:attribute>
											<xsl:value-of select="$status"/>
										</span>
									</div>

									<div class="text-muted small">
										<div>
											<span class="me-1">Placed:</span>
											<xsl:call-template name="FormatDateAuto">
												<xsl:with-param name="value" select="$created"/>
											</xsl:call-template>
										</div>
										<xsl:if test="string-length(normalize-space($statusDate)) &gt; 0">
											<div>
												<span class="me-1">Updated:</span>
												<xsl:call-template name="FormatDateAuto">
													<xsl:with-param name="value" select="$statusDate"/>
												</xsl:call-template>
											</div>
										</xsl:if>
									</div>

									<div class="mt-2 fw-semibold">
										<span class="me-1">Total:</span>
										<xsl:call-template name="OrderTotal">
											<xsl:with-param name="order" select="."/>
										</xsl:call-template>
									</div>

									<a class="btn btn-primary w-100 mt-3" aria-label="View order">
										<xsl:attribute name="href">
											<xsl:text>ViewOrder.aspx?id=</xsl:text>
											<xsl:value-of select="$orderId"/>
										</xsl:attribute>
										View Order
									</a>
								</div>
							</div>
						</xsl:for-each>
					</div>

					<!-- ===== Desktop: table ===== -->
					<div class="card shadow-sm d-none d-lg-block">
						<div class="card-body p-0">
							<div class="table-responsive-lg">
								<table class="table table-hover align-middle mb-0">
									<thead class="table-light">
										<tr>
											<th scope="col">Order #</th>
											<th scope="col">Placed</th>
											<th scope="col">Status</th>
											<th scope="col" class="text-end">Total</th>
											<th scope="col" class="text-end">Action</th>
										</tr>
									</thead>
									<tbody>
										<xsl:for-each select="/ArrayOfOrder/Order">
											<xsl:sort select="DateCreated" data-type="text" order="descending"/>
											<xsl:variable name="orderId" select="ID"/>
											<xsl:variable name="orderNumber" select="OrderNumber"/>
											<xsl:variable name="created" select="DateCreated"/>
											<xsl:variable name="status" select="Statuses/OrderStatus[IsCurrentStatus='true']/Status"/>
											<xsl:variable name="statusDate" select="Statuses/OrderStatus[IsCurrentStatus='true']/DateSet"/>

											<tr>
												<td>
													<a>
														<xsl:attribute name="href">
															<xsl:text>ViewOrder.aspx?id=</xsl:text>
															<xsl:value-of select="$orderId"/>
														</xsl:attribute>
														<strong>
															#<xsl:value-of select="$orderNumber"/>
														</strong>
													</a>
												</td>

												<td>
													<div>
														<xsl:call-template name="FormatDateAuto">
															<xsl:with-param name="value" select="$created"/>
														</xsl:call-template>
													</div>
													<xsl:if test="string-length(normalize-space($statusDate)) &gt; 0">
														<div class="text-muted small">
															<xsl:text>Updated: </xsl:text>
															<xsl:call-template name="FormatDateAuto">
																<xsl:with-param name="value" select="$statusDate"/>
															</xsl:call-template>
														</div>
													</xsl:if>
												</td>

												<td>
													<span>
														<xsl:attribute name="class">
															<xsl:call-template name="StatusBadgeClass">
																<xsl:with-param name="statusText" select="$status"/>
															</xsl:call-template>
														</xsl:attribute>
														<xsl:value-of select="$status"/>
													</span>
												</td>

												<td class="text-end">
													<xsl:call-template name="OrderTotal">
														<xsl:with-param name="order" select="."/>
													</xsl:call-template>
												</td>

												<td class="text-end">
													<a class="btn btn-sm btn-outline-primary" aria-label="View order">
														<xsl:attribute name="href">
															<xsl:text>ViewOrder.aspx?id=</xsl:text>
															<xsl:value-of select="$orderId"/>
														</xsl:attribute>
														View
													</a>
												</td>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</xsl:when>
				<xsl:otherwise>
					<div class="alert alert-info" role="alert">No orders found.</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
</xsl:stylesheet>
