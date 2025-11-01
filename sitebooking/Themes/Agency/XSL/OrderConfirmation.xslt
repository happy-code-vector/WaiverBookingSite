<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" xmlns:str="http://exslt.org/strings" exclude-result-prefixes="dt str"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

	<xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
	<xsl:param name="DateFormat"></xsl:param>

	<xsl:template match="/">
		<div class="container py-5">
			<!-- Success Header -->
			<div class="text-center mb-5">
				<div class="mb-4">
					<i class="ci-check-circle text-success" style="font-size: 5rem;"></i>
				</div>
				<h1 class="display-4 fw-bold mb-3">Booking Confirmed!</h1>
				<p class="lead text-muted mb-4">Thank you for your reservation. We've sent a confirmation email with all the details.</p>
			</div>

			<!-- Order Info Card -->
			<div class="card shadow-sm mb-4">
				<div class="card-body">
					<div class="row g-3">
						<div class="col-md-6">
							<div class="d-flex align-items-center">
								<i class="ci-file-text text-primary fs-4 me-3"></i>
								<div>
									<small class="text-muted d-block">Order Number</small>
									<strong class="fs-5"><xsl:value-of select="/Order/OrderNumber"/></strong>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="d-flex align-items-center">
								<i class="ci-calendar text-primary fs-4 me-3"></i>
								<div>
									<small class="text-muted d-block">Booking Date</small>
									<strong class="fs-5"><xsl:value-of select="substring(/Order/DateCreated, 1, 10)"/></strong>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Items Booked -->
			<h4 class="mb-4">
				<i class="ci-package me-2"></i>Your Reservations
			</h4>
			<div class="row g-4 mb-5">
				<xsl:for-each select="/Order/Items/OrderItem">
					<div class="col-md-6">
						<div class="card h-100 shadow-sm hover-lift">
							<div class="row g-0">
								<div class="col-4">
									<xsl:choose>
										<xsl:when test="string-length(ImageUrl) > 0">
											<img class="img-fluid rounded-start h-100 object-fit-cover" alt="{Name}" src="{ImageUrl}"/>
										</xsl:when>
										<xsl:otherwise>
											<div class="bg-light h-100 d-flex align-items-center justify-content-center rounded-start">
												<i class="ci-image text-muted fs-1"></i>
											</div>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title mb-3">
											<xsl:value-of select="Name"/>
										</h5>
										<div class="d-flex align-items-center mb-2">
											<i class="ci-calendar text-muted me-2"></i>
											<span><xsl:value-of select="Date"/></span>
										</div>
										<div class="d-flex align-items-center mb-2">
											<i class="ci-clock text-muted me-2"></i>
											<span><xsl:value-of select="Time"/></span>
										</div>
										<xsl:if test="Adults > 0">
											<div class="d-flex align-items-center mb-2">
												<i class="ci-user text-muted me-2"></i>
												<span><xsl:value-of select="Adults"/> Adults</span>
											</div>
										</xsl:if>
										<xsl:if test="Children > 0">
											<div class="d-flex align-items-center">
												<i class="ci-user text-muted me-2"></i>
												<span><xsl:value-of select="Children"/> Children</span>
											</div>
										</xsl:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</xsl:for-each>
			</div>

			<!-- Action Buttons -->
			<div class="text-center">
				<a href="Receipt.aspx?oid={/Order/ID}" class="btn btn-primary btn-lg px-5 me-3">
					<i class="ci-file-text me-2"></i>View Receipt
				</a>
				<a href="/" class="btn btn-outline-primary btn-lg px-5">
					<i class="ci-home me-2"></i>Back to Home
				</a>
			</div>
		</div>
	</xsl:template>


</xsl:stylesheet>
