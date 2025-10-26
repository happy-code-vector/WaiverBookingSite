<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove">
	<xsl:output method="html" indent="no" encoding="utf-8" omit-xml-declaration="yes" />

	<xsl:param name="BaseUrl"></xsl:param>
	
	<xsl:template match="/">

		<style type="text/css">
			.label {
			font-size: 12px;         
			padding: 4px 8px;        
			border-radius: 10px;     
			display: inline-block;   
			}
			</style>

		<div class="list-group">
			<xsl:for-each select="/ArrayOfWaiverSiteSetupTask/WaiverSiteSetupTask">

				<a class="list-group-item" href="{$BaseUrl}/{Settings/Url}">

					<!-- Row with icon, name and badge -->
					<div style="display: flex; justify-content: space-between; align-items: center;">
						<div>
							<i>
								<xsl:attribute name="class">
									<xsl:text>fa fa-fw status-icon </xsl:text>
									<xsl:choose>
										<xsl:when test="Status = 'Completed'">fa-check-circle text-success</xsl:when>
										<xsl:when test="Status = 'In_progress'">fa-spinner fa-spin text-info</xsl:when>
										<xsl:when test="Status = 'Skipped'">fa-ban text-warning</xsl:when>
										<xsl:when test="Status = 'Not_done'">fa-circle-o text-muted</xsl:when>
										<xsl:otherwise>fa-circle text-muted</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</i>
							<strong style="margin-left: 5px;">
								<xsl:value-of select="Settings/Name"/>
							</strong>
						</div>

						<!-- Badge -->
						<span>
							<xsl:attribute name="class">
								<xsl:text> label </xsl:text>
								<xsl:choose>
									<xsl:when test="Status = 'Completed'">label-success</xsl:when>
									<xsl:when test="Status = 'In_progress'">label-info</xsl:when>
									<xsl:when test="Status = 'Skipped'">label-warning</xsl:when>
									<xsl:when test="Status = 'Not_done'">label-default</xsl:when>
									<xsl:otherwise>label-default</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:choose>
								<xsl:when test="Status = 'Completed'">Completed</xsl:when>
								<xsl:when test="Status = 'In_progress'">In Progress</xsl:when>
								<xsl:when test="Status = 'Skipped'">Skipped</xsl:when>
								<xsl:when test="Status = 'Not_done'">Not Started</xsl:when>
								<xsl:otherwise>Unknown</xsl:otherwise>
							</xsl:choose>
						</span>
					</div>

					<!-- Description below -->
					<xsl:if test="string-length(Settings/Description) &gt; 0">
						<p class="list-group-item-text small" style="margin-top: 5px;">
							<xsl:value-of select="Settings/Description"/>
						</p>
					</xsl:if>
				</a>

		
			</xsl:for-each>
		</div>

	</xsl:template>
</xsl:stylesheet>
