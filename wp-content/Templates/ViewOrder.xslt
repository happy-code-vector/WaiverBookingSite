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

	<xsl:template name="MoneyFromCents">
		<xsl:param name="cents" select="0"/>
		<xsl:call-template name="Money">
			<xsl:with-param name="n" select="$cents div 100"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="StatusBadgeClass">
		<xsl:param name="statusText"/>
		<xsl:variable name="s" select="translate(normalize-space($statusText), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
		<xsl:choose>
			<!-- OrderTransactionStatusEnum values -->
			<xsl:when test="$s = 'succeeded' or $s = '1'">label label-success</xsl:when>
			<xsl:when test="$s = 'pending' or $s = '0'">label label-warning</xsl:when>
			<xsl:when test="$s = 'processing' or $s = '3'">label label-info</xsl:when>
			<xsl:when test="$s = 'requiresaction' or $s = '2'">label label-warning</xsl:when>
			<xsl:when test="$s = 'canceled' or $s = 'cancelled' or $s = '4'">label label-default</xsl:when>
			<xsl:when test="$s = 'failed' or $s = '5'">label label-danger</xsl:when>
			<!-- Legacy order status values -->
			<xsl:when test="$s = 'paid' or $s = 'completed' or $s = 'complete'">label label-success</xsl:when>
			<xsl:when test="$s = 'refunded' or $s = 'declined'">label label-danger</xsl:when>
			<xsl:when test="$s = 'authorized'">label label-primary</xsl:when>
			<xsl:when test="$s = 'in progress' or $s = 'shipped' or $s = 'out for delivery'">label label-info</xsl:when>
			<xsl:otherwise>label label-default</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="TransactionTypeText">
		<xsl:param name="type"/>
		<xsl:variable name="t" select="translate(normalize-space($type), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
		<xsl:choose>
			<xsl:when test="$t = 'payment' or $t = '0'">Payment</xsl:when>
			<xsl:when test="$t = 'refund' or $t = '1'">Refund</xsl:when>
			<xsl:when test="$t = 'adjustment' or $t = '2'">Adjustment</xsl:when>
			<xsl:otherwise>Unknown</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="TransactionStatusText">
		<xsl:param name="status"/>
		<xsl:value-of select="translate($status,'_',' ')"/>
		
	</xsl:template>

	<xsl:template name="IsRefundable">
		<xsl:param name="transactionType"/>
		<xsl:param name="status"/>
		<xsl:choose>
			<xsl:when test="$transactionType = 'Payment' and $status = 'Succeeded'">true</xsl:when>
			<xsl:otherwise>false</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ================= Page ================= -->
	<xsl:template match="/">
		<xsl:variable name="order" select="/Order"/>
		<xsl:variable name="grandTotal" select="sum($order/Items/OrderItem/LineTotal)"/>
		<xsl:variable name="currentStatus" select="$order/CurrentStatus/Status"/>


		<!-- Header -->
		<div class="row">
			<div class="col-lg-12">
				<div class="page-header" style="border-bottom: 1px solid #e7e7e7; padding-bottom: 10px; margin-bottom: 20px;">
					<h2>
						Order #<xsl:value-of select="$order/OrderNumber"/>
						<small style="margin-left: 10px;">
							<span>
								<xsl:attribute name="class">
									<xsl:call-template name="StatusBadgeClass">
										<xsl:with-param name="statusText" select="$currentStatus"/>
									</xsl:call-template>
								</xsl:attribute>
								<xsl:value-of select="$currentStatus"/>
							</span>
						</small>
					</h2>
					<div class="text-muted" style="font-size: 12px; margin-top: 5px;">
						<span style="margin-right: 15px;">
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
			</div>
		</div>

		<!-- Layout: main + sidebar -->
		<div class="row">
			<!-- MAIN (Items, Totals, Status history, Customer) -->
			<div class="col-lg-8">
				<!-- Customer -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>Customer</strong>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-6">
								<div class="text-muted" style="font-size: 12px;">Name</div>
								<div style="font-weight: 600;">
									<a href="ViewCustomer.aspx?id={$order/WFCustomerID}">
										<xsl:value-of select="$order/FullName"/>
									</a>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="text-muted" style="font-size: 12px;">Email</div>
								<div style="font-weight: 600;">
									<xsl:value-of select="$order/Email"/>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 10px;">
							<div class="col-sm-6">
								<div class="text-muted" style="font-size: 12px;">Phone</div>
								<div style="font-weight: 600;">
									<xsl:value-of select="$order/Phone"/>
								</div>
							</div>
						</div>
						<xsl:if test="string-length(normalize-space($order/CurrentStatus/Comments)) &gt; 0">
							<div style="margin-top: 15px;" class="text-muted">
								<strong>Payment info:</strong>
								<xsl:value-of select="$order/CurrentStatus/Comments"/>
							</div>
						</xsl:if>
					</div>
				</div>
				
				<!-- Items -->
				<div class="panel panel-primary" style="margin-bottom: 20px;">
					<div class="panel-heading">
						<strong>Items</strong>
					</div>
					<div class="panel-body" style="padding: 0;">
						<xsl:choose>
							<xsl:when test="count($order/Items/OrderItem) &gt; 0">
								<div class="table-responsive">
									<table class="table table-striped" style="margin-bottom: 0;">
										<thead>
											<tr>
												<th>Item</th>
												<th style="text-align: center;">Qty</th>
												<th style="text-align: right;">Price</th>
												<th style="text-align: right;">Line Total</th>
											</tr>
										</thead>
										<tbody>
											<xsl:for-each select="$order/Items/OrderItem">
												<tr>
													<td>
														<div style="font-weight: 600;">
															<xsl:value-of select="Name"/>
														</div>
														<xsl:if test="string-length(normalize-space(Details)) &gt; 0">
															<div class="text-muted" style="font-size: 12px;">
																<xsl:value-of select="Details"/>
															</div>
														</xsl:if>
													</td>
													<td style="text-align: center;">
														<xsl:value-of select="Quantity"/>
													</td>
													<td style="text-align: right;">
														<xsl:call-template name="Money">
															<xsl:with-param name="n" select="Price"/>
														</xsl:call-template>
													</td>
													<td style="text-align: right;">
														<xsl:call-template name="Money">
															<xsl:with-param name="n" select="LineTotal"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
										<tfoot>
											<tr style="background-color: #f5f5f5;">
												<td colspan="3" style="text-align: right; font-weight: bold; border-top: 2px solid #ddd;">Grand Total</td>
												<td style="text-align: right; font-weight: bold; border-top: 2px solid #ddd;">
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
								<div style="padding: 15px;" class="text-muted">No items on this order.</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>

				<!-- Status History -->
				<div class="panel panel-primary" style="margin-bottom: 20px;">
					<div class="panel-heading">
						<strong>Status History</strong>
					</div>
					<div class="panel-body" style="padding: 0;">
						<xsl:choose>
							<xsl:when test="count($order/Statuses/OrderStatus) &gt; 0">
								<div class="table-responsive">
									<table class="table table-striped table-condensed" style="margin-bottom: 0;">
										<thead>
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
								<div style="padding: 15px;" class="text-muted">No status updates recorded.</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>

			
			</div>

			<!-- SIDEBAR (Related Bookings + Transactions) -->
			<div class="col-lg-4">
				<!-- Related Bookings -->
				<div class="panel panel-default" style="margin-bottom: 20px;">
					<div class="panel-heading" style="display: flex; justify-content: space-between; align-items: center;">
						<strong>Related Bookings</strong>
						<span class="label label-default">
							<xsl:value-of select="count($order/Bookings/Booking)"/>
						</span>
					</div>

					<div class="panel-body" style="padding: 0;">
						<xsl:choose>
							<xsl:when test="count($order/Bookings/Booking) &gt; 0">
								<div class="list-group" style="margin-bottom: 0;">
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

										<a class="list-group-item" style="padding: 15px;">
											<xsl:attribute name="href">
												<xsl:text>ViewBooking.aspx?id=</xsl:text>
												<xsl:value-of select="$bid"/>
											</xsl:attribute>

											<div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 5px;">
												<div style="font-weight: 600;">
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

											<div class="text-muted" style="font-size: 12px; margin-bottom: 5px;">
												<xsl:if test="string-length(normalize-space($startDate)) &gt; 0">
													<span style="margin-right: 10px;">
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

											<div style="font-size: 12px;">
												<xsl:if test="string-length(normalize-space($firstItemName)) &gt; 0">
													<div style="margin-bottom: 3px;">
														<strong>Item:</strong>
														<xsl:value-of select="$firstItemName"/>
														<xsl:if test="$aiCount &gt; 1">
															<xsl:text> (+</xsl:text>
															<xsl:value-of select="$aiCount - 1"/>
															<xsl:text> more)</xsl:text>
														</xsl:if>
													</div>
												</xsl:if>
												<div>
													<strong>Guests:</strong>
													<xsl:value-of select="$party"/>
													<xsl:if test="$children &gt; 0">
														<xsl:text> (children: </xsl:text>
														<xsl:value-of select="$children"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
												</div>
											</div>

										</a>
									</xsl:for-each>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div style="padding: 15px;" class="text-muted">No related bookings.</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>

				<!-- Transactions -->
				<div class="panel panel-default">
					<div class="panel-heading" style="display: flex; justify-content: space-between; align-items: center;">
						<strong>Transactions</strong>
						<span class="label label-default">
							<xsl:value-of select="count($order/Transactions/OrderTransaction)"/>
						</span>
					</div>

					<div class="panel-body" style="padding: 0;">
						<xsl:choose>
							<xsl:when test="count($order/Transactions/OrderTransaction) &gt; 0">
								<div class="list-group" style="margin-bottom: 0;">
									<xsl:for-each select="$order/Transactions/OrderTransaction">
										<xsl:sort select="CreatedUtc" order="descending"/>
										<xsl:variable name="transId" select="ID"/>
										<xsl:variable name="transType" select="TransactionType"/>
										<xsl:variable name="transStatus" select="Status"/>
										<xsl:variable name="amount" select="AmountInCents"/>
										<xsl:variable name="cardBrand" select="CardBrand"/>
										<xsl:variable name="cardLast4" select="CardLast4"/>
										<xsl:variable name="createdDate" select="CreatedUtc"/>
										<xsl:variable name="description" select="Description"/>
										<xsl:variable name="isRefundable">
											<xsl:call-template name="IsRefundable">
												<xsl:with-param name="transactionType" select="$transType"/>
												<xsl:with-param name="status" select="$transStatus"/>
											</xsl:call-template>
										</xsl:variable>

										<div class="list-group-item" style="padding: 15px;">
											<div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 8px;">
												<div style="font-weight: 600;">
													<xsl:call-template name="TransactionTypeText">
														<xsl:with-param name="type" select="$transType"/>
													</xsl:call-template>
												</div>
												<span>
													<xsl:attribute name="class">
														<xsl:call-template name="StatusBadgeClass">
															<xsl:with-param name="statusText" select="$transStatus"/>
														</xsl:call-template>
													</xsl:attribute>
													<xsl:call-template name="TransactionStatusText">
														<xsl:with-param name="status" select="$transStatus"/>
													</xsl:call-template>
												</span>
											</div>

											<div style="font-size: 14px; font-weight: 600; margin-bottom: 5px;">
												<xsl:call-template name="MoneyFromCents">
													<xsl:with-param name="cents" select="$amount"/>
												</xsl:call-template>
											</div>

											<div class="text-muted" style="font-size: 12px; margin-bottom: 8px;">
												<div style="margin-bottom: 2px;">
													<strong>Date:</strong>
													<xsl:text> </xsl:text>
													<xsl:call-template name="FormatDateAuto">
														<xsl:with-param name="value" select="$createdDate"/>
													</xsl:call-template>
												</div>
												<xsl:if test="string-length(normalize-space($cardBrand)) &gt; 0 and string-length(normalize-space($cardLast4)) &gt; 0">
													<div style="margin-bottom: 2px;">
														<strong>Card:</strong>
														<xsl:text> </xsl:text>
														<xsl:value-of select="translate($cardBrand, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
														<xsl:text> ****</xsl:text>
														<xsl:value-of select="$cardLast4"/>
													</div>
												</xsl:if>
												<xsl:if test="string-length(normalize-space($description)) &gt; 0">
													<div>
														<strong>Description:</strong>
														<xsl:text> </xsl:text>
														<xsl:value-of select="$description"/>
													</div>
												</xsl:if>
											</div>

											<xsl:if test="$isRefundable = 'true'">
												<div style="margin-top: 10px;">
													<a class="btn btn-danger btn-xs">
														<xsl:attribute name="href">
															<xsl:text>Refund.aspx?id=</xsl:text>
															<xsl:value-of select="$transId"/>
														</xsl:attribute>
														<i class="fa fa-undo" style="margin-right: 5px;"></i>
														Process Refund
													</a>
												</div>
											</xsl:if>
										</div>
									</xsl:for-each>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div style="padding: 15px;" class="text-muted">No transactions found.</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer note -->
		<div class="row" style="margin-top: 20px;">
			<div class="col-lg-12">
				<div class="text-muted" style="font-size: 12px;">
					This receipt was generated on
					<xsl:text> </xsl:text>
					<xsl:call-template name="FormatDateAuto">
						<xsl:with-param name="value" select="$order/DateCreated"/>
					</xsl:call-template>.
				</div>
			</div>

		</div>
	</xsl:template>
</xsl:stylesheet>