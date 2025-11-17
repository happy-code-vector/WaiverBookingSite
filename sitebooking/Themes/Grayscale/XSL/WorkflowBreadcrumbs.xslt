<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>

	<xsl:param name="BasePathRelative"></xsl:param>

	<xsl:template match="/">
		<nav aria-label="breadcrumb" class="my-3">
			<ol class="breadcrumb bg-dark border border-secondary p-3 rounded shadow-sm">
				<li class="breadcrumb-item">
					<a href="{$BasePathRelative}" title="Home" class="text-decoration-none">
						<i class="ci-home me-1"></i>
						<span>Home</span>
					</a>
				</li>

				<xsl:for-each select="/Main/ArrayOfWorkflowStep/WorkflowStep">
					<li>
						<xsl:attribute name="class">
							<xsl:text>breadcrumb-item</xsl:text>
							<xsl:if test="position()=count(/Main/ArrayOfWorkflowStep/WorkflowStep)">
								<xsl:text> active</xsl:text>
							</xsl:if>
						</xsl:attribute>

						<xsl:choose>
							<!-- Active breadcrumb shouldn't be a link -->
							<xsl:when test="position()=count(/Main/ArrayOfWorkflowStep/WorkflowStep)">
								<span class="fw-bold text-primary">
									<xsl:value-of select="ButtonText"/>
								</span>
							</xsl:when>
							<xsl:otherwise>
								<a href="{$BasePathRelative}/Workflow.aspx?stepid={ID}" class="text-decoration-none">
									<xsl:if test="DescriptionText!=''">
										<xsl:attribute name="title">
											<xsl:value-of select="DescriptionText"/>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="ButtonText"/>
								</a>
							</xsl:otherwise>
						</xsl:choose>
					</li>
				</xsl:for-each>
			</ol>
		</nav>
	</xsl:template>
</xsl:stylesheet>
