<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>

	<xsl:param name="BasePathRelative"></xsl:param>
	<xsl:param name="ProgressIndex"></xsl:param>

	<xsl:template match="/">
		<div class="container">
			<div class="wfprogress">
				<!-- Track line (can be styled with BS5 utilities or custom CSS) -->
				<div class="progress-track mb-4"></div>

				<!-- Steps as a horizontal flex row -->
				<div class="d-flex justify-content-between">
					<xsl:for-each select="/Main/Forms/ArrayOfWaiverForm/WaiverForm">
						<xsl:variable name="formid">
							<xsl:value-of select="ID"/>
						</xsl:variable>

						<div>
							<xsl:attribute name="class">
								<xsl:text>progress-step</xsl:text>
								<xsl:choose>
									<xsl:when test="/Main/Skips/WorkflowSession/Settings/Items/WorkflowSessionDetailItem[WaiverFormID=$formid]/Status='Skipped'">
										<xsl:text> is-skip</xsl:text>
									</xsl:when>
									<xsl:when test="$ProgressIndex&gt;position()-1">
										<xsl:text> is-complete</xsl:text>
									</xsl:when>
									<xsl:when test="$ProgressIndex=position()-1">
										<xsl:text> is-active</xsl:text>
									</xsl:when>
								</xsl:choose>
							</xsl:attribute>

							<span class="d-block text-center fw-bold">
								<xsl:value-of select="Name"/>
							</span>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
