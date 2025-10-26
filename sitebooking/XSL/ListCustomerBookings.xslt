<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- Params -->
	<xsl:param name="bookingId" select="''"/>
	<xsl:param name="baseHref" select="''"/>

	<xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>

	<!-- ========== Helpers ========== -->
	<!-- Safe text: outputs empty string if node missing -->
	<xsl:template name="text-or-empty">
		<xsl:param name="sel"/>
		<xsl:choose>
			<xsl:when test="$sel != ''">
				<xsl:value-of select="$sel"/>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- YYYY-MM-DD from 2025-09-06T00:00:00 -->
	<xsl:template name="date-ymd">
		<xsl:param name="dt"/>
		<xsl:value-of select="substring($dt,1,10)"/>
	</xsl:template>

	<!-- First admission item name on a booking -->
	<xsl:template name="first-item-name">
		<xsl:param name="ctx"/>
		<xsl:choose>
			<xsl:when test="$ctx/AdmissionItems/BookingAdmissionItem[1]/Item/Name">
				<xsl:value-of select="$ctx/AdmissionItems/BookingAdmissionItem[1]/Item/Name"/>
			</xsl:when>
			<xsl:otherwise>Activity</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Date range label from first admission item -->
	<xsl:template name="first-item-daterange">
		<xsl:param name="ctx"/>
		<xsl:variable name="start" select="$ctx/AdmissionItems/BookingAdmissionItem[1]/DateStart"/>
		<xsl:variable name="end"   select="$ctx/AdmissionItems/BookingAdmissionItem[1]/DateEnd"/>
		<xsl:choose>
			<xsl:when test="string($start)!='' and string($end)!=''">
				<xsl:call-template name="date-ymd">
					<xsl:with-param name="dt" select="$start"/>
				</xsl:call-template>
				<xsl:text> – </xsl:text>
				<xsl:call-template name="date-ymd">
					<xsl:with-param name="dt" select="$end"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="string($start)!=''">
				<xsl:call-template name="date-ymd">
					<xsl:with-param name="dt" select="$start"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>Dates TBA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Count people on a booking -->
	<xsl:template name="person-count">
		<xsl:param name="ctx"/>
		<xsl:value-of select="count($ctx/Persons/BookingPerson)"/>
	</xsl:template>

	<!-- ========== Root ========== -->
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="string($bookingId)!=''">
				<xsl:apply-templates select="/ArrayOfBooking/Booking[ID=$bookingId]" mode="detail"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="/ArrayOfBooking" mode="list"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ========== LIST VIEW ========== -->
	<xsl:template match="ArrayOfBooking" mode="list">
		<section class="container pb-5">
			<h1 class="h3 mb-4">My Bookings</h1>

			<xsl:choose>
				<xsl:when test="count(Booking)=0">
					<div class="alert alert-info rounded-4" role="alert">
						No bookings yet. When you schedule an activity, you’ll see it here.
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="d-flex flex-column gap-3">
						<xsl:for-each select="Booking">
							<xsl:sort select="AdmissionItems/BookingAdmissionItem[1]/DateStart" data-type="text" order="ascending"/>

							<div class="bg-body-tertiary rounded-5 p-4">
								<div class="d-flex flex-column flex-md-row align-items-md-center">
									<div class="flex-grow-1">
										<div class="d-flex align-items-center gap-2 mb-1">
											<span class="badge text-bg-success" style="min-width:5.5rem">
												<xsl:if test="Status='Cancelled'">
													<xsl:attribute name="class">badge text-bg-danger</xsl:attribute>
												</xsl:if>
												<xsl:value-of select="Status"/>
												
											</span>
											<span class="fs-sm text-body-secondary">
												Booked:
												<xsl:call-template name="date-ymd">
													<xsl:with-param name="dt" select="DateCreated"/>
												</xsl:call-template>
											</span>
										</div>

										<h3 class="h5 mb-1">
											<xsl:call-template name="first-item-name">
												<xsl:with-param name="ctx" select="."/>
											</xsl:call-template>
										</h3>

										<div class="text-body-emphasis">
											<i class="ci-calendar me-1"></i>
											<xsl:call-template name="first-item-daterange">
												<xsl:with-param name="ctx" select="."/>
											</xsl:call-template>
										</div>

										<div class="fs-sm text-body mt-1">
											<i class="ci-users me-1"></i>
											<xsl:call-template name="person-count">
												<xsl:with-param name="ctx" select="."/>
											</xsl:call-template>
											<xsl:text> participant(s)</xsl:text>
											<xsl:text> • </xsl:text>
											<span class="text-body-secondary">ID:</span>
											<code class="text-muted">
												<xsl:value-of select="BookingNumber"/>
											</code>
										</div>
									</div>

									<div class="d-flex gap-2 mt-3 mt-md-0 ms-md-3">
										<a class="btn btn-outline-primary rounded-pill"
										   href="{$baseHref}ViewBooking.aspx?id={ID}">
											View / Manage
										</a>
										<!--<a class="btn btn-primary rounded-pill"
										   href="{$baseHref}booking-manage.aspx?id={ID}">
											Manage
										</a>-->
									</div>
								</div>
							</div>
						</xsl:for-each>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</section>
	</xsl:template>

	<!-- ========== DETAIL / MANAGE VIEW ========== -->
	<xsl:template match="Booking" mode="detail">
		<section class="container pb-5">
			<div class="d-flex align-items-center justify-content-between mb-3">
				<h1 class="h4 mb-0">
					<xsl:call-template name="first-item-name">
						<xsl:with-param name="ctx" select="."/>
					</xsl:call-template>
				</h1>
				<div class="nav">
					<a class="nav-link p-0 text-decoration-underline" href="{$baseHref}bookings.aspx">
						<i class="ci-chevron-left me-1"></i>Back to bookings
					</a>
				</div>
			</div>

			<div class="row g-4">
				<!-- Left: booking summary -->
				<div class="col-lg-8">
					<div class="bg-body-tertiary rounded-5 p-4 mb-3">
						<div class="d-flex align-items-center gap-2 mb-1">
							<span class="badge text-bg-success" style="min-width:5.5rem">
								<xsl:value-of select="Status"/>
							</span>
							<span class="fs-sm text-body-secondary">
								Verified: <xsl:value-of select="Verified"/>
							</span>
						</div>

						<div class="text-body-emphasis mb-2">
							<i class="ci-calendar me-1"></i>
							<xsl:call-template name="first-item-daterange">
								<xsl:with-param name="ctx" select="."/>
							</xsl:call-template>
						</div>

						<div class="fs-sm">
							<div>
								<span class="text-body-secondary">Booking ID:</span>
								<code>
									<xsl:value-of select="ID"/>
								</code>
							</div>
							<div>
								<span class="text-body-secondary">Created:</span>
								<xsl:text> </xsl:text>
								<xsl:call-template name="date-ymd">
									<xsl:with-param name="dt" select="DateCreated"/>
								</xsl:call-template>
							</div>
							<div>
								<span class="text-body-secondary">People:</span>
								<xsl:text> </xsl:text>
								<xsl:call-template name="person-count">
									<xsl:with-param name="ctx" select="."/>
								</xsl:call-template>
							</div>
						</div>
					</div>

					<!-- Admission items -->
					<div class="bg-body-tertiary rounded-5 p-4 mb-3">
						<h5 class="mb-3">Activities</h5>
						<div class="d-flex flex-column gap-3">
							<xsl:for-each select="AdmissionItems/BookingAdmissionItem">
								<div class="border rounded-4 p-3">
									<div class="d-flex align-items-center justify-content-between">
										<div>
											<div class="fw-medium">
												<xsl:value-of select="Item/Name"/>
											</div>
											<div class="fs-sm text-body">
												<i class="ci-calendar me-1"></i>
												<xsl:call-template name="date-ymd">
													<xsl:with-param name="dt" select="DateStart"/>
												</xsl:call-template>
												<xsl:text> – </xsl:text>
												<xsl:call-template name="date-ymd">
													<xsl:with-param name="dt" select="DateEnd"/>
												</xsl:call-template>
												<xsl:if test="IsAllDay='true'">
													<span class="badge text-bg-secondary ms-2">All day</span>
												</xsl:if>
											</div>
										</div>
										<div class="fs-sm text-body-secondary">
											<span class="me-2">
												Status: <span class="text-body">
													<xsl:value-of select="Status"/>
												</span>
											</span>
											<span class="d-none d-md-inline">
												ID: <code>
													<xsl:value-of select="ID"/>
												</code>
											</span>
										</div>
									</div>
									<xsl:if test="string(Item/Description)!=''">
										<div class="fs-sm mt-2 text-body-secondary">
											<xsl:value-of select="Item/Description"/>
										</div>
									</xsl:if>
								</div>
							</xsl:for-each>
						</div>
					</div>

					<!-- People -->
					<div class="bg-body-tertiary rounded-5 p-4">
						<h5 class="mb-3">Participants</h5>
						<xsl:choose>
							<xsl:when test="count(Persons/BookingPerson)=0">
								<div class="text-body-secondary fs-sm">No participants.</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="table-responsive">
									<table class="table align-middle">
										<thead>
											<tr>
												<th class="text-body fw-normal">Name</th>
												<th class="text-body fw-normal">Email</th>
												<th class="text-body fw-normal">Type</th>
												<th class="text-body fw-normal text-end">Status</th>
											</tr>
										</thead>
										<tbody>
											<xsl:for-each select="Persons/BookingPerson">
												<tr>
													<td>
														<xsl:variable name="fullName">
															<xsl:choose>
																<xsl:when test="string(normalize-space(concat(FirstName,' ',LastName)))!=''">
																	<xsl:value-of select="concat(FirstName,' ',LastName)"/>
																</xsl:when>
																<xsl:otherwise>Unnamed</xsl:otherwise>
															</xsl:choose>
														</xsl:variable>
														<xsl:value-of select="$fullName"/>
													</td>
													<td>
														<xsl:value-of select="EmailAddress"/>
													</td>
													<td>
														<code class="text-muted">
															<xsl:value-of select="PersonTypeID"/>
														</code>
													</td>
													<td class="text-end">
														<span class="badge text-bg-success">
															<xsl:value-of select="Status"/>
														</span>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>

				<!-- Right: actions -->
				<aside class="col-lg-4">
					<div class="position-sticky top-0" style="padding-top: 1rem">
						<div class="bg-body-tertiary rounded-5 p-4">
							<h5 class="mb-3">Actions</h5>
							<div class="d-grid gap-2">
								<a class="btn btn-primary rounded-pill" href="{$baseHref}booking-manage.aspx?id={ID}">
									Manage booking
								</a>
								<a class="btn btn-outline-secondary rounded-pill" href="{$baseHref}booking-view.aspx?id={ID}">
									View booking
								</a>
							</div>
						</div>
					</div>
				</aside>
			</div>
		</section>
	</xsl:template>

</xsl:stylesheet>
