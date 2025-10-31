<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" xmlns:str="http://exslt.org/strings" exclude-result-prefixes="dt str"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

	<xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
	<xsl:param name="DateFormat"></xsl:param>

	<xsl:template match="/">
		<div class="container py-5">
			<div class="text-center mb-5">
				<h1 class="display-5 fw-bold">Thanks for your booking!</h1>
				<p class="lead mb-4">Here is a summary of your reservation.</p>
			</div>

			<!-- Booking Details -->
			<div class="mb-4">
				<p class="mb-1">
					<strong>Order #:</strong>
					<xsl:value-of select="/Order/OrderNumber"/>
				</p>
				<p class="mb-1">
					<strong>Booking Date:</strong>
					<xsl:value-of select="substring(/Order/DateCreated, 1, 10)"/>
				</p>
			</div>

			<!-- Items Booked -->
			<div class="row g-4">
				<xsl:for-each select="/Order/Items/OrderItem">
					<div class="col-md-6">
						<div class="card h-100 border rounded shadow-sm">
							<div class="row g-0">
								<div class="col-4">
									<xsl:if test="string-length(ImageUrl) > 0">
										<img class="img-fluid rounded-start" alt="{Name}" src="{ImageUrl}"/>
									</xsl:if>
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">
											<xsl:value-of select="Name"/>
										</h5>
										<p class="card-text mb-1">
											<strong>Date:</strong>
											<xsl:value-of select="Date"/>
										</p>
										<p class="card-text mb-1">
											<strong>Time:</strong>
											<xsl:value-of select="Time"/>
										</p>
										<p class="card-text mb-1">
											<strong>Adults:</strong>
											<xsl:value-of select="Adults"/>
										</p>
										<p class="card-text mb-1">
											<strong>Children:</strong>
											<xsl:value-of select="Children"/>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</xsl:for-each>
			</div>

			<!-- View Receipt Button -->
			<div class="text-center mt-5">
				<a href="Receipt.aspx?oid={/Order/ID}" class="btn btn-primary btn-lg">
					View Receipt
				</a>
			</div>
		</div>
	</xsl:template>


</xsl:stylesheet>
