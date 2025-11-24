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

	<!-- Params (pass one or both) -->
	<!-- DateFormat example:        %m/%d/%Y -->
	<!-- DateFormatWithTime example:%m/%d/%Y %I:%M %p -->
	<xsl:param name="DateFormat"/>
	<xsl:param name="DateFormatWithTime"/>
	<xsl:param name="CurrencySymbol">$</xsl:param>

	<!-- ================= Helpers ================= -->
	<xsl:template name="FormatDateAuto">
		<xsl:param name="value"/>
		<xsl:choose>
			<xsl:when test="string-length(normalize-space($value)) = 0">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="contains($value,'T') and string-length(normalize-space($DateFormatWithTime)) &gt; 0">
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

	<xsl:template name="Money">
		<xsl:param name="n" select="0"/>
		<xsl:choose>
			<xsl:when test="string-length($CurrencySymbol) &gt; 0">
				<xsl:value-of select="$CurrencySymbol"/>
				<xsl:value-of select="format-number($n, '0.00')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="format-number($n, '0.00')"/>
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

	<!-- ================= Page ================= -->
	<xsl:template match="/">
		<xsl:variable name="order" select="/Order"/>
		<xsl:variable name="grandTotal" select="sum($order/Items/OrderItem/LineTotal)"/>
		<xsl:variable name="currentStatus" select="$order/CurrentStatus/Status"/>

		<div class="container my-4">
			<!-- Header -->
			<div class="mb-3 border-bottom pb-2">
				<div class="d-flex flex-wrap align-items-center gap-2">
					<h2 class="mb-0">
						Order #<xsl:value-of select="$order/OrderNumber"/>
					</h2>
					<span>
						<xsl:attribute name="class">
							<xsl:call-template name="StatusBadgeClass">
								<xsl:with-param name="statusText" select="$currentStatus"/>
							</xsl:call-template>
						</xsl:attribute>
						<xsl:value-of select="$currentStatus"/>
					</span>
				</div>
				<div class="text-muted small mt-1">
					<span class="me-2">
						Placed:
						<xsl:text> </xsl:text>
						<xsl:call-template name="FormatDateAuto">
							<xsl:with-param name="value" select="$order/DateCreated"/>
						</xsl:call-template>
					</span>
					<xsl:if test="string-length(normalize-space($order/CurrentStatus/DateSet)) &gt; 0">
						<span>
							Updated:
							<xsl:text> </xsl:text>
							<xsl:call-template name="FormatDateAuto">
								<xsl:with-param name="value" select="$order/CurrentStatus/DateSet"/>
							</xsl:call-template>
						</span>
					</xsl:if>
				</div>
			</div>

			<!-- Layout: main + sidebar -->
			<div class="row g-4">
				<!-- MAIN (Items, Totals, Status history, Customer) -->
				<div class="col-lg-8">
					<!-- Items -->
					<div class="card shadow-sm mb-3">
						<div class="card-header bg-light">
							<strong>Items</strong>
						</div>
						<div class="card-body p-0">
							<xsl:choose>
								<xsl:when test="count($order/Items/OrderItem) &gt; 0">
									<div class="table-responsive">
										<table class="table align-middle mb-0">
											<thead class="table-light">
												<tr>
													<th>Item</th>
													<th class="text-center">Qty</th>
													<th class="text-end">Price</th>
													<th class="text-end">Line Total</th>
												</tr>
											</thead>
											<tbody>
												<!-- Main product items first (GenericItem, Admission_Item, Product) -->
												<xsl:for-each select="$order/Items/OrderItem[ItemType='GenericItem' or ItemType='Admission_Item' or ItemType='Product']">
													<tr>
														<td>
															<div class="fw-semibold">
																<xsl:value-of select="Name"/>
															</div>
															<xsl:if test="string-length(normalize-space(Details)) &gt; 0">
																<div class="text-muted small">
																	<xsl:value-of select="Details"/>
																</div>
															</xsl:if>
														</td>
														<td class="text-center">
															<xsl:value-of select="Quantity"/>
														</td>
														<td class="text-end">
															<xsl:call-template name="Money">
																<xsl:with-param name="n" select="Price"/>
															</xsl:call-template>
														</td>
														<td class="text-end">
															<xsl:call-template name="Money">
																<xsl:with-param name="n" select="LineTotal"/>
															</xsl:call-template>
														</td>
													</tr>
												</xsl:for-each>

												<!-- Then fees, shipping, tax, discounts, etc. -->
												<xsl:if test="count($order/Items/OrderItem[ItemType='Tax' or ItemType='Shipping' or ItemType='Handling' or ItemType='Shipping_and_Handling' or ItemType='Fee' or ItemType='Discount']) &gt; 0">
													
													<xsl:for-each select="$order/Items/OrderItem[ItemType='Tax' or ItemType='Shipping' or ItemType='Handling' or ItemType='Shipping_and_Handling' or ItemType='Fee' or ItemType='Discount']">
														<tr class="text-muted">
															<td colspan="3" class="text-end">
																<xsl:value-of select="Name"/>
																<xsl:if test="string-length(normalize-space(Details)) &gt; 0">
																	<span class="small">
																		(<xsl:value-of select="Details"/>)
																	</span>
																</xsl:if>
															</td>
															<td class="text-end">
																<xsl:call-template name="Money">
																	<xsl:with-param name="n" select="LineTotal"/>
																</xsl:call-template>
															</td>
														</tr>
													</xsl:for-each>
												</xsl:if>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="3" class="text-end fw-bold">Grand Total</td>
													<td class="text-end fw-bold">
														<xsl:call-template name="Money">
															<xsl:with-param name="n" select="$grandTotal"/>
														</xsl:call-template>
													</td>
												</tr>
											</tfoot>
										</table>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div class="p-3 text-muted">No items on this order.</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>

					<!-- Status History -->
					<div class="card shadow-sm mb-3">
						<div class="card-header bg-light">
							<strong>Status History</strong>
						</div>
						<div class="card-body p-0">
							<xsl:choose>
								<xsl:when test="count($order/Statuses/OrderStatus) &gt; 0">
									<div class="table-responsive">
										<table class="table table-sm table-striped mb-0">
											<thead class="table-light">
												<tr>
													<th>Date</th>
													<th>Status</th>
													<th>Comments</th>
												</tr>
											</thead>
											<tbody>
												<!-- show newest first -->
												<xsl:for-each select="$order/Statuses/OrderStatus">
													<xsl:sort select="DateSet" order="descending"/>
													<tr>
														<td>
															<xsl:call-template name="FormatDateAuto">
																<xsl:with-param name="value" select="DateSet"/>
															</xsl:call-template>
														</td>
														<td>
															<span>
																<xsl:attribute name="class">
																	<xsl:call-template name="StatusBadgeClass">
																		<xsl:with-param name="statusText" select="Status"/>
																	</xsl:call-template>
																</xsl:attribute>
																<xsl:value-of select="Status"/>
															</span>
														</td>
														<td>
															<xsl:choose>
																<xsl:when test="string-length(normalize-space(Comments)) &gt; 0">
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
								</xsl:when>
								<xsl:otherwise>
									<div class="p-3 text-muted">No status updates recorded.</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>

					<!-- Customer (keep visible; hide on xs if you’d like) -->
					<div class="card shadow-sm">
						<div class="card-header bg-light">
							<strong>Customer</strong>
						</div>
						<div class="card-body">
							<div class="row g-2">
								<div class="col-sm-6">
									<div class="text-muted small">Name</div>
									<div class="fw-semibold">
										<xsl:value-of select="$order/FullName"/>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="text-muted small">Email</div>
									<div class="fw-semibold">
										<xsl:value-of select="$order/Email"/>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="text-muted small">Phone</div>
									<div class="fw-semibold">
										<xsl:value-of select="$order/Phone"/>
									</div>
								</div>
							</div>
							<xsl:if test="string-length(normalize-space($order/CurrentStatus/Comments)) &gt; 0">
								<div class="mt-3 text-muted small">
									Payment info: <xsl:value-of select="$order/CurrentStatus/Comments"/>
								</div>
							</xsl:if>
						</div>
					</div>
				</div>

				<!-- SIDEBAR (Related Bookings) -->
				<div class="col-lg-4">
					<div class="card shadow-sm">
						<div class="card-header bg-light d-flex justify-content-between align-items-center">
							<strong>Related Bookings</strong>
							<span class="badge bg-secondary">
								<xsl:value-of select="count($order/Bookings/Booking)"/>
							</span>
						</div>

						<div class="card-body p-0">
							<xsl:choose>
								<xsl:when test="count($order/Bookings/Booking) &gt; 0">
									<div class="list-group list-group-flush">
										<xsl:for-each select="$order/Bookings/Booking">
											<xsl:sort select="DateCreated" order="descending"/>
											<xsl:variable name="bid" select="ID"/>
											<xsl:variable name="bnum" select="BookingNumber"/>
											<xsl:variable name="bstatus" select="Status"/>
											<xsl:variable name="party" select="count(Persons/BookingPerson)"/>
											<xsl:variable name="children" select="count(Persons/BookingPerson[translate(normalize-space(IsChild), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='true'])"/>
											<xsl:variable name="firstItemName" select="AdmissionItems/BookingAdmissionItem[1]/Item/Name"/>
											<xsl:variable name="aiCount" select="count(AdmissionItems/BookingAdmissionItem)"/>
											<xsl:variable name="startDate" select="AdmissionItems/BookingAdmissionItem[1]/DateStart"/>
											<xsl:variable name="endDate" select="AdmissionItems/BookingAdmissionItem[1]/DateEnd"/>

											<a class="list-group-item list-group-item-action py-3">
												<xsl:attribute name="href">
													<xsl:text>ViewBooking.aspx?id=</xsl:text>
													<xsl:value-of select="$bid"/>
												</xsl:attribute>

												<div class="d-flex justify-content-between align-items-start">
													<div class="fw-semibold">
														Booking #<xsl:value-of select="$bnum"/>
													</div>
													<span>
														<xsl:attribute name="class">
															<xsl:call-template name="StatusBadgeClass">
																<xsl:with-param name="statusText" select="$bstatus"/>
															</xsl:call-template>
														</xsl:attribute>
														<xsl:value-of select="$bstatus"/>
													</span>
												</div>

												<div class="text-muted small mt-1">
													<xsl:if test="string-length(normalize-space($startDate)) &gt; 0">
														<span class="me-2">
															Start:
															<xsl:text> </xsl:text>
															<xsl:call-template name="FormatDateAuto">
																<xsl:with-param name="value" select="$startDate"/>
															</xsl:call-template>
														</span>
													</xsl:if>
													<xsl:if test="string-length(normalize-space($endDate)) &gt; 0">
														<span>
															End:
															<xsl:text> </xsl:text>
															<xsl:call-template name="FormatDateAuto">
																<xsl:with-param name="value" select="$endDate"/>
															</xsl:call-template>
														</span>
													</xsl:if>
												</div>

												<div class="small mt-1">
													<xsl:if test="string-length(normalize-space($firstItemName)) &gt; 0">
														<span class="me-2">
															Item: <xsl:value-of select="$firstItemName"/>
															<xsl:if test="$aiCount &gt; 1">
																<xsl:text> (+</xsl:text>
																<xsl:value-of select="$aiCount - 1"/>
																<xsl:text> more)</xsl:text>
															</xsl:if>
														</span>
													</xsl:if>
													<span>
														Guests: <xsl:value-of select="$party"/>
														<xsl:if test="$children &gt; 0">
															<xsl:text> (children: </xsl:text>
															<xsl:value-of select="$children"/>
															<xsl:text>)</xsl:text>
														</xsl:if>
													</span>
												</div>

											</a>
										</xsl:for-each>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div class="p-3 text-muted">No related bookings.</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
				</div>
			</div>

			<!-- Footer note -->
			<div class="text-muted small mt-3">
				This receipt was generated on
				<xsl:text> </xsl:text>
				<xsl:call-template name="FormatDateAuto">
					<xsl:with-param name="value" select="$order/DateCreated"/>
				</xsl:call-template>.
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
