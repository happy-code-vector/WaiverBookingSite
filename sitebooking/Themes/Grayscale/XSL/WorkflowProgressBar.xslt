<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>

	<xsl:param name="BasePathRelative"></xsl:param>
	<xsl:param name="ProgressIndex"></xsl:param>

	<xsl:template match="/">
		<div class="container my-5">
			<div class="workflow-progress">
				<!-- Progress Steps -->
				<div class="d-flex justify-content-between align-items-start position-relative">
					<!-- Progress Line -->
					<div class="progress-line position-absolute top-0 start-0 w-100" style="height: 4px; margin-top: 20px; z-index: 0;">
						<div class="progress" style="height: 100%; background-color: #e9ecef;">
							<xsl:variable name="totalSteps" select="count(/Main/Forms/ArrayOfWaiverForm/WaiverForm)"/>
							<xsl:variable name="progressPercent" select="($ProgressIndex div $totalSteps) * 100"/>
							<div class="progress-bar bg-primary" role="progressbar" style="width: {$progressPercent}%; transition: width 0.3s ease;"></div>
						</div>
					</div>

					<!-- Steps -->
					<xsl:for-each select="/Main/Forms/ArrayOfWaiverForm/WaiverForm">
						<xsl:variable name="formid">
							<xsl:value-of select="ID"/>
						</xsl:variable>
						<xsl:variable name="isSkipped" select="/Main/Skips/WorkflowSession/Settings/Items/WorkflowSessionDetailItem[WaiverFormID=$formid]/Status='Skipped'"/>
						<xsl:variable name="isComplete" select="$ProgressIndex &gt; position()-1"/>
						<xsl:variable name="isActive" select="$ProgressIndex = position()-1"/>

						<div class="workflow-step text-center position-relative" style="flex: 1; z-index: 1;">
							<!-- Step Circle -->
							<div class="step-circle mx-auto mb-2 d-flex align-items-center justify-content-center rounded-circle">
								<xsl:attribute name="class">
									<xsl:text>step-circle mx-auto mb-2 d-flex align-items-center justify-content-center rounded-circle </xsl:text>
									<xsl:choose>
										<xsl:when test="$isSkipped">
											<xsl:text>bg-secondary text-white</xsl:text>
										</xsl:when>
										<xsl:when test="$isComplete">
											<xsl:text>bg-success text-white</xsl:text>
										</xsl:when>
										<xsl:when test="$isActive">
											<xsl:text>bg-primary text-white</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>bg-dark text-muted border border-secondary border-2</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<xsl:attribute name="style">
									<xsl:text>width: 40px; height: 40px; font-size: 1.2rem;</xsl:text>
								</xsl:attribute>
								
								<!-- Icon based on status -->
								<xsl:choose>
									<xsl:when test="$isSkipped">
										<i class="ci-close"></i>
									</xsl:when>
									<xsl:when test="$isComplete">
										<i class="ci-check"></i>
									</xsl:when>
									<xsl:otherwise>
										<span class="fw-bold"><xsl:value-of select="position()"/></span>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							
							<!-- Step Label -->
							<div class="step-label small">
								<xsl:attribute name="class">
									<xsl:text>step-label small </xsl:text>
									<xsl:choose>
										<xsl:when test="$isActive">
											<xsl:text>fw-bold text-primary</xsl:text>
										</xsl:when>
										<xsl:when test="$isComplete">
											<xsl:text>text-success</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>text-muted</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<xsl:value-of select="Name"/>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
