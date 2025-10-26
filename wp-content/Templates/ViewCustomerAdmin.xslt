<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:asp="remove"
  xmlns:cc1="remove"
  xmlns:dt="http://exslt.org/dates-and-times"
  xmlns:str="http://exslt.org/strings"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1"
  xmlns:msdata="urn:schemas-microsoft-com:xml-msdata"
  exclude-result-prefixes="dt str msxsl asp cc1 xsi diffgr msdata">

	<xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>

	<!-- Params -->
	<xsl:param name="fmtDate"/>
	<xsl:param name="fmtDateTime"/>
	<xsl:param name="CurrencySymbol">$</xsl:param>

	<!-- ================= Helpers ================= -->
	<xsl:template name="FormatDateAuto">
		<xsl:param name="value"/>

		<xsl:choose>
			<xsl:when test="string-length(normalize-space($value)) = 0">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="contains($value,'T') and string-length(normalize-space($fmtDateTime)) &gt; 0">
				<xsl:value-of select="dt:format-date($value, $fmtDateTime)"/>
			</xsl:when>
			<xsl:when test="string-length(normalize-space($fmtDate)) &gt; 0">
				<xsl:value-of select="dt:format-date($value, $fmtDate)"/>
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
			<xsl:when test="$s = 'active' or $s = 'paid' or $s = 'completed' or $s = 'confirmed'">label label-success</xsl:when>
			<xsl:when test="$s = 'pending' or $s = 'hold' or $s = 'unpaid'">label label-warning</xsl:when>
			<xsl:when test="$s = 'cancelled' or $s = 'canceled' or $s = 'void' or $s = 'inactive'">label label-danger</xsl:when>
			<xsl:otherwise>label label-default</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ================= Page ================= -->
	<xsl:template match="/">
		<xsl:variable name="customer" select="/Main/Customer"/>
		<xsl:variable name="customerID" select="$customer/ID"/>
		<xsl:variable name="totalSpent" select="sum(/Main/ArrayOfOrder/Order/Items/OrderItem/LineTotal)"/>

		<!-- Pagination CSS -->
		<style>
			.pagination-container {
			text-align: center;
			margin-top: 15px;
			padding: 10px;
			}
			.pagination-container .pagination {
			margin: 0;
			display: inline-block;
			}
		</style>

		<!-- Header -->
		<div class="row">
			<div class="col-lg-12">
				<div class="page-header" style="border-bottom: 1px solid #e7e7e7; padding-bottom: 10px; margin-bottom: 20px;">
					<h2>
						<xsl:value-of select="normalize-space(concat($customer/First_Name,' ',$customer/Middle_Name,' ',$customer/Last_Name))"/>
						<small style="margin-left: 10px;">
							<span>
								<xsl:attribute name="class">
									<xsl:call-template name="StatusBadgeClass">
										<xsl:with-param name="statusText" select="$customer/Status"/>
									</xsl:call-template>
								</xsl:attribute>
								<xsl:value-of select="$customer/Status"/>
							</span>
						</small>
					</h2>
					<div class="text-muted" style="font-size: 12px; margin-top: 5px;">
						<span style="margin-right: 15px;">
							<a href="mailto:{$customer/Email}">
								<xsl:value-of select="$customer/Email"/>
							</a>
							<xsl:if test="$customer/Verified_Email='true'">
								<i class="fa fa-check-circle text-success" style="margin-left: 5px;" title="Verified"></i>
							</xsl:if>
						</span>
						<xsl:if test="normalize-space($customer/Phone)">
							<span style="margin-right: 15px;">
								<i class="fa fa-phone"></i>
								<xsl:text> </xsl:text>
								<xsl:value-of select="$customer/Phone"/>
							</span>
						</xsl:if>
						<span>
							Customer since:
							<xsl:text> </xsl:text>
							<xsl:call-template name="FormatDateAuto">
								<xsl:with-param name="value" select="$customer/Created"/>
							</xsl:call-template>
						</span>
					</div>
					<div style="margin-top: 10px;">
						<!--<a class="btn btn-primary btn-sm" href="EditCustomer.aspx?id={$customerID}">
							<i class="fa fa-edit"></i> Edit Customer
						</a>-->
					</div>
				</div>
			</div>
		</div>

		<!-- Layout: main + sidebar -->
		<div class="row">
			<!-- MAIN -->
			<div class="col-lg-8">

				<!-- Orders -->
				<div class="panel panel-primary" style="margin-bottom: 20px;">
					<div class="panel-heading" style="display: flex; justify-content: space-between; align-items: center;">
						<strong>Orders</strong>
						<span class="label label-default">
							<xsl:value-of select="count(/Main/ArrayOfOrder/Order)"/>
						</span>
					</div>
					<div class="panel-body" style="padding: 0;">
						<xsl:choose>
							<xsl:when test="count(/Main/ArrayOfOrder/Order) &gt; 0">
								<div class="table-responsive">
									<table class="table table-striped paginated-table" id="ordersTable" style="margin-bottom: 0;" data-items-per-page="10">
										<thead>
											<tr>
												<th>Order #</th>
												<th>Date</th>
												<th>Status</th>
												<th style="text-align: right;">Total</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<xsl:for-each select="/Main/ArrayOfOrder/Order">
												<xsl:sort select="DateCreated" order="descending"/>
												<xsl:variable name="total" select="sum(Items/OrderItem/LineTotal)"/>
												<xsl:variable name="currentStatus" select="Statuses/OrderStatus[IsCurrentStatus='true']/Status"/>
												<tr>
													<td>
														<strong>
															#<xsl:value-of select="OrderNumber"/>
														</strong>
													</td>
													<td>
														<xsl:call-template name="FormatDateAuto">
															<xsl:with-param name="value" select="DateCreated"/>
														</xsl:call-template>
													</td>
													<td>
														<span>
															<xsl:attribute name="class">
																<xsl:call-template name="StatusBadgeClass">
																	<xsl:with-param name="statusText" select="$currentStatus"/>
																</xsl:call-template>
															</xsl:attribute>
															<xsl:value-of select="$currentStatus"/>
														</span>
													</td>
													<td style="text-align: right;">
														<xsl:call-template name="Money">
															<xsl:with-param name="n" select="$total"/>
														</xsl:call-template>
													</td>
													<td style="text-align: right;">
														<a href="ViewOrder.aspx?id={ID}" class="btn btn-default btn-xs">View</a>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</div>
								<div id="ordersPagination" class="pagination-container"></div>
							</xsl:when>
							<xsl:otherwise>
								<div style="padding: 15px;" class="text-muted">No orders yet.</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>

				<!-- Bookings -->
				<div class="panel panel-primary" style="margin-bottom: 20px;">
					<div class="panel-heading" style="display: flex; justify-content: space-between; align-items: center;">
						<strong>Bookings</strong>
						<span class="label label-default">
							<xsl:value-of select="count(/Main/ArrayOfBooking/Booking)"/>
						</span>
					</div>
					<div class="panel-body" style="padding: 0;">
						<xsl:choose>
							<xsl:when test="count(/Main/ArrayOfBooking/Booking) &gt; 0">
								<div class="table-responsive">
									<table class="table table-striped paginated-table" id="bookingsTable" style="margin-bottom: 0;" data-items-per-page="10">
										<thead>
											<tr>
												<th>Booking #</th>
												<th>Date</th>
												<th>Activity</th>
												<th>Guests</th>
												<th>Status</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<xsl:for-each select="/Main/ArrayOfBooking/Booking">
												<xsl:sort select="DateCreated" order="descending"/>
												<xsl:variable name="bookingStatus" select="StatusHistory/BookingStatus[IsCurrent='true']/Status"/>
												<xsl:variable name="guestCount" select="count(Persons/BookingPerson)"/>
												<tr>
													<td>
														<strong>
															#<xsl:value-of select="BookingNumber"/>
														</strong>
													</td>
													<td>
														<xsl:call-template name="FormatDateAuto">
															<xsl:with-param name="value" select="DateCreated"/>
														</xsl:call-template>
													</td>
													<td>
														<xsl:value-of select="AdmissionItems/BookingAdmissionItem[1]/Item/Name"/>
														<xsl:if test="count(AdmissionItems/BookingAdmissionItem) &gt; 1">
															<span class="text-muted">
																+<xsl:value-of select="count(AdmissionItems/BookingAdmissionItem) - 1"/>
															</span>
														</xsl:if>
													</td>
													<td>
														<xsl:value-of select="$guestCount"/>
													</td>
													<td>
														<span>
															<xsl:attribute name="class">
																<xsl:call-template name="StatusBadgeClass">
																	<xsl:with-param name="statusText" select="$bookingStatus"/>
																</xsl:call-template>
															</xsl:attribute>
															<xsl:value-of select="$bookingStatus"/>
														</span>
													</td>
													<td style="text-align: right;">
														<a href="ViewBooking.aspx?id={ID}" class="btn btn-default btn-xs">View</a>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</div>
								<div id="bookingsPagination" class="pagination-container"></div>
							</xsl:when>
							<xsl:otherwise>
								<div style="padding: 15px;" class="text-muted">No bookings yet.</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>

				<!-- Waivers -->
				<div class="panel panel-primary" style="margin-bottom: 20px;">
					<div class="panel-heading" style="display: flex; justify-content: space-between; align-items: center;">
						<strong>Waivers</strong>
						<span class="label label-default">
							<xsl:value-of select="count(/Main/DataSet/diffgr:diffgram/NewDataSet/Table)"/>
						</span>
					</div>
					<div class="panel-body" style="padding: 0;">
						<xsl:choose>
							<xsl:when test="count(/Main/DataSet/diffgr:diffgram/NewDataSet/Table) &gt; 0">
								<div class="table-responsive">
									<table class="table table-striped paginated-table" id="waiversTable" style="margin-bottom: 0;" data-items-per-page="10">
										<thead>
											<tr>
												<th>Signed By</th>
												<th>Waiver Form</th>
												<th>Date Signed</th>
												<th style="text-align: center;">Participants</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<xsl:for-each select="/Main/DataSet/diffgr:diffgram/NewDataSet/Table">
												<xsl:sort select="DateSigned" order="descending"/>
												<tr>
													<td>
														<strong>
															<xsl:value-of select="SignedNameFirst"/>
															<xsl:text> </xsl:text>
															<xsl:value-of select="SignedName"/>
														</strong>
													</td>
													<td>
														<xsl:choose>
															<xsl:when test="WaiverCount=1">
																<xsl:value-of select="waiverFormName"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="WaiverCount"/>
																<xsl:text> waiver forms</xsl:text>
															</xsl:otherwise>
														</xsl:choose>

													</td>
													<td>
														<xsl:call-template name="FormatDateAuto">
															<xsl:with-param name="value" select="DateSigned"/>
														</xsl:call-template>
													</td>
													<td style="text-align: center;">
														<xsl:value-of select="ParticipantCount"/>
													</td>
													<td style="text-align: right;">
														<a href="ViewWaiver.aspx?id={WaiverID}" class="btn btn-default btn-xs">View</a>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</div>
								<div id="waiversPagination" class="pagination-container"></div>
							</xsl:when>
							<xsl:otherwise>
								<div style="padding: 15px;" class="text-muted">No waivers signed yet.</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>

				<!-- Addresses -->
				<div class="panel panel-default" style="margin-bottom: 20px;">
					<div class="panel-heading">
						<strong>Addresses</strong>
					</div>
					<div class="panel-body" style="padding: 0;">
						<xsl:choose>
							<xsl:when test="count($customer/Addresses/Address) &gt; 0">
								<div class="table-responsive">
									<table class="table table-striped paginated-table" id="addressesTable" style="margin-bottom: 0;" data-items-per-page="10">
										<thead>
											<tr>
												<th>Name</th>
												<th>Address</th>
												<th>Status</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<xsl:for-each select="$customer/Addresses/Address">
												<tr>
													<td>
														<xsl:value-of select="normalize-space(concat(FirstName,' ',LastName))"/>
													</td>
													<td>
														<div>
															<xsl:value-of select="Address1"/>
															<xsl:if test="normalize-space(Address2)">
																<xsl:text>, </xsl:text>
																<xsl:value-of select="Address2"/>
															</xsl:if>
														</div>
														
														<div class="text-muted" style="font-size: 12px;">
															<xsl:value-of select="City"/>, <xsl:value-of select="StateCode"/>
															<xsl:text> </xsl:text>
															<xsl:value-of select="PostalZipCode"/>
														</div>
													</td>
													<td>
														<xsl:if test="IsDefaultShippingAddress='true'">
															<span class="label label-success">Default Shipping</span>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="IsDefaultBillingAddress='true'">
															<span class="label label-success">Default Billing</span>
														</xsl:if>
														
													</td>
													<td style="text-align: right;">
														<a href="EditAddress.aspx?id={ID}" class="btn btn-default btn-xs">Edit</a>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</div>
								<div id="addressesPagination" class="pagination-container"></div>
							</xsl:when>
							<xsl:otherwise>
								<div style="padding: 15px;" class="text-muted">No addresses on file.</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<div class="panel-footer">
						<a href="EditAddress.aspx?customerid={$customerID}" class="btn btn-default btn-sm">
							<i class="fa fa-plus"></i> Add Address
						</a>
					</div>
				</div>

			</div>

			<!-- SIDEBAR -->
			<div class="col-lg-4">

				<!-- Summary Stats -->
				<div class="panel panel-default" style="margin-bottom: 20px;">
					<div class="panel-heading">
						<strong>Summary</strong>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-6">
								<div style="text-align: center;">
									<div class="h2" style="margin: 0;">
										<xsl:value-of select="count(/Main/ArrayOfOrder/Order)"/>
									</div>
									<div class="text-muted" style="font-size: 12px;">Orders</div>
								</div>
							</div>
							<div class="col-xs-6">
								<div style="text-align: center;">
									<div class="h2" style="margin: 0;">
										<xsl:value-of select="count(/Main/ArrayOfBooking/Booking)"/>
									</div>
									<div class="text-muted" style="font-size: 12px;">Bookings</div>
								</div>
							</div>
						</div>
						<hr style="margin: 15px 0;"/>
						<div style="text-align: center;">
							<div class="h3" style="margin: 0;">
								<xsl:call-template name="Money">
									<xsl:with-param name="n" select="$totalSpent"/>
								</xsl:call-template>
							</div>
							<div class="text-muted" style="font-size: 12px;">Total Spent</div>
						</div>
					</div>
				</div>

				<!-- Customer Details -->
				<div class="panel panel-default" style="margin-bottom: 20px;">
					<div class="panel-heading">
						<strong>Customer Details</strong>
					</div>
					<div class="panel-body" style="padding: 0;">
						<table class="table" style="margin-bottom: 0;">
							<xsl:if test="normalize-space($customer/Company_name)">
								<tr>
									<td style="border-top: 0;">
										<strong>Company</strong>
									</td>
									<td style="border-top: 0;">
										<xsl:value-of select="$customer/Company_name"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<xsl:if test="not(normalize-space($customer/Company_name))">
									<xsl:attribute name="style">border-top: 0;</xsl:attribute>
								</xsl:if>
								<td>
									<strong>Has Password</strong>
								</td>
								<td>
									<xsl:choose>
										<xsl:when test="$customer/HasPassword='true'">
											<i class="fa fa-check text-success"></i> Yes
										</xsl:when>
										<xsl:otherwise>
											<i class="fa fa-times text-muted"></i> No
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<xsl:if test="$customer/Last_Login != '1753-01-01T00:00:00'">
								<tr>
									<td>
										<strong>Last Login</strong>
									</td>
									<td>
										<xsl:call-template name="FormatDateAuto">
											<xsl:with-param name="value" select="$customer/Last_Login"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="normalize-space($customer/StripeCustomerID)">
								<tr>
									<td>
										<strong>Stripe ID</strong>
									</td>
									<td>
										<code style="font-size: 11px;">
											<xsl:value-of select="$customer/StripeCustomerID"/>
										</code>
									</td>
								</tr>
							</xsl:if>
						</table>
					</div>
				</div>

				<!-- Actions -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>Actions</strong>
					</div>
					<div class="panel-body">
						<asp:LinkButton runat="server" CommandName="SEND_PASSWORD_RESET" CssClass="btn btn-default btn-block">
							<i class="fa fa-key"></i> Send Password Reset
						</asp:LinkButton>
						<!--<asp:LinkButton runat="server" CommandName="DEACTIVATE_CUSTOMER" CssClass="btn btn-warning btn-block" OnClientClick="return confirm('Deactivate this customer?');">
							<i class="fa fa-ban"></i> Deactivate Customer
						</asp:LinkButton>-->
					</div>
				</div>

			</div>
		</div>

		<!-- Pagination Script -->
		<script>
			<![CDATA[
		$(document).ready(function() {
			function initPagination(tableId, paginationId) {
				var $table = $('#' + tableId);
				var $tbody = $table.find('tbody');
				var $rows = $tbody.find('tr');
				var rowCount = $rows.length;
				var itemsPerPage = parseInt($table.data('items-per-page')) || 10;
				
				// Hide pagination if 10 or fewer items
				if (rowCount <= itemsPerPage) {
					return;
				}
				
				var pageCount = Math.ceil(rowCount / itemsPerPage);
				var currentPage = 1;
				
				function showPage(page) {
					currentPage = page;
					$rows.hide();
					var start = (page - 1) * itemsPerPage;
					var end = start + itemsPerPage;
					$rows.slice(start, end).show();
					updatePagination();
				}
				
				function updatePagination() {
					var $pagination = $('#' + paginationId);
					$pagination.empty();
					
					var $ul = $('<ul class="pagination pagination-sm"></ul>');
					
					// Previous button
					var $prev = $('<li></li>');
					if (currentPage === 1) {
						$prev.addClass('disabled');
					}
					$prev.append($('<a href="#"></a>').html('&laquo;').click(function(e) {
						e.preventDefault();
						if (currentPage > 1) {
							showPage(currentPage - 1);
						}
					}));
					$ul.append($prev);
					
					// Page numbers
					var maxVisible = 5;
					var startPage = Math.max(1, currentPage - Math.floor(maxVisible / 2));
					var endPage = Math.min(pageCount, startPage + maxVisible - 1);
					
					if (endPage - startPage < maxVisible - 1) {
						startPage = Math.max(1, endPage - maxVisible + 1);
					}
					
					if (startPage > 1) {
						$ul.append($('<li></li>').append($('<a href="#"></a>').text('1').click(function(e) {
							e.preventDefault();
							showPage(1);
						})));
						if (startPage > 2) {
							$ul.append($('<li class="disabled"></li>').append($('<a href="#"></a>').text('...')));
						}
					}
					
					for (var i = startPage; i <= endPage; i++) {
						var $li = $('<li></li>');
						if (i === currentPage) {
							$li.addClass('active');
						}
						(function(pageNum) {
							$li.append($('<a href="#"></a>').text(pageNum).click(function(e) {
								e.preventDefault();
								showPage(pageNum);
							}));
						})(i);
						$ul.append($li);
					}
					
					if (endPage < pageCount) {
						if (endPage < pageCount - 1) {
							$ul.append($('<li class="disabled"></li>').append($('<a href="#"></a>').text('...')));
						}
						$ul.append($('<li></li>').append($('<a href="#"></a>').text(pageCount).click(function(e) {
							e.preventDefault();
							showPage(pageCount);
						})));
					}
					
					// Next button
					var $next = $('<li></li>');
					if (currentPage === pageCount) {
						$next.addClass('disabled');
					}
					$next.append($('<a href="#"></a>').html('&raquo;').click(function(e) {
						e.preventDefault();
						if (currentPage < pageCount) {
							showPage(currentPage + 1);
						}
					}));
					$ul.append($next);
					
					$pagination.append($ul);
				}
				
				// Initialize
				showPage(1);
			}
			
			// Initialize pagination for each table
			initPagination('ordersTable', 'ordersPagination');
			initPagination('bookingsTable', 'bookingsPagination');
			initPagination('waiversTable', 'waiversPagination');
			initPagination('addressesTable', 'addressesPagination');
		});
		]]>
		</script>
	</xsl:template>
</xsl:stylesheet>