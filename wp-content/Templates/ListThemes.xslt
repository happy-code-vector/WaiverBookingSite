<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dt="http://exslt.org/dates-and-times"
    xmlns:asp="remove"
    exclude-result-prefixes="dt asp">

	<xsl:param name="SiteBaseUrl"></xsl:param>
	<xsl:output method="html" omit-xml-declaration="yes" />

	<xsl:template match="/">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header" style="border-bottom: 1px solid #e7e7e7; padding-bottom: 10px; margin-bottom: 20px;">
						<h2>Site Themes</h2>
						<p class="text-muted">Choose and customize the appearance of your site</p>
					</div>
				</div>
			</div>

			<!-- Current Theme Section -->
			<xsl:if test="//Theme[IsCurrentTheme='true']">
				<div class="row">
					<div class="col-lg-12">
						<h3 style="margin-top: 0;">Active Theme</h3>
					</div>
				</div>
				<div class="row" style="margin-bottom: 30px;">
					<xsl:apply-templates select="//Theme[IsCurrentTheme='true']" mode="current"/>
				</div>
			</xsl:if>

			<!-- Available Themes Section -->
			<xsl:if test="//Theme[IsCurrentTheme='false']">
				<div class="row">
					<div class="col-lg-12">
						<h3 style="margin-top: 0;">Available Themes</h3>
					</div>
				</div>
				<div class="row">
					<xsl:apply-templates select="//Theme[IsCurrentTheme='false']" mode="available"/>
				</div>
			</xsl:if>

			<xsl:if test="count(//Theme) = 0">
				<div class="row">
					<div class="col-lg-12">
						<div class="alert alert-info">
							<i class="fa fa-info-circle"></i> No themes available.
						</div>
					</div>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

	<!-- Current Theme Template -->
	<xsl:template match="Theme" mode="current">
		<div class="col-md-6 col-lg-4">
			<div class="panel panel-success">
				<div class="panel-body" style="position: relative;">
					<!-- Active Badge -->
					<div style="position: absolute; top: 10px; right: 10px; z-index: 10;">
						<span class="label label-success" style="font-size: 12px;">
							<i class="fa fa-check-circle"></i> Active
						</span>
					</div>

					<!-- Preview Image -->
					<div style="background-color: #f5f5f5; border: 1px solid #ddd; height: 200px; margin-bottom: 15px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
						<xsl:choose>
							<xsl:when test="string-length(normalize-space(PreviewImageUrl)) &gt; 0">
								<img src="{PreviewImageUrl}" alt="{Name}" style="max-width: 100%; max-height: 100%; object-fit: cover;" />
							</xsl:when>
							<xsl:otherwise>
								<div style="text-align: center; color: #999;">
									<i class="fa fa-picture-o" style="font-size: 48px; margin-bottom: 10px;"></i>
									<div>No Preview Available</div>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>

					<!-- Theme Info -->
					<h4 style="margin-top: 0; margin-bottom: 10px;">
						<xsl:value-of select="Name"/>
					</h4>
					<xsl:if test="string-length(normalize-space(Description)) &gt; 0">
						<div class="theme-description" style="font-size: 13px; margin-bottom: 15px; display: none; padding: 10px; background-color: #f9f9f9; border-left: 3px solid #5cb85c;">
							<xsl:value-of select="Description"/>
						</div>
						<div style="margin-bottom: 10px;">
							<a href="#" class="toggle-description text-muted" style="font-size: 12px;">
								<i class="fa fa-info-circle"></i> Show Details
							</a>
						</div>
					</xsl:if>

					<!-- Action Buttons -->
					<div style="margin-top: 15px;">
						<a href="CustomizeTheme.aspx?themeFolder={FolderName}" class="btn btn-primary btn-block">
							<i class="fa fa-paint-brush"></i> Customize
						</a>

					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<!-- Available Themes Template -->
	<xsl:template match="Theme" mode="available">
		<div class="col-md-6 col-lg-4">
			<div class="panel panel-default">
				<div class="panel-body" style="position: relative;">
					<!-- Preview Image -->
					<div style="background-color: #f5f5f5; border: 1px solid #ddd; height: 200px; margin-bottom: 15px; display: flex; align-items: center; justify-content: center; overflow: hidden; position: relative;">
						<xsl:choose>
							<xsl:when test="string-length(normalize-space(PreviewImageUrl)) &gt; 0">
								<img src="{PreviewImageUrl}" alt="{Name}" style="max-width: 100%; max-height: 100%; object-fit: cover;" />
							</xsl:when>
							<xsl:otherwise>
								<div style="text-align: center; color: #999;">
									<i class="fa fa-picture-o" style="font-size: 48px; margin-bottom: 10px;"></i>
									<div>No Preview Available</div>
								</div>
							</xsl:otherwise>
						</xsl:choose>

						<!-- Hover Overlay (CSS handles visibility) -->
						<div class="theme-overlay" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0,0,0,0.7); display: flex; align-items: center; justify-content: center; opacity: 0; transition: opacity 0.3s;">
							<div>
								<a href="ChangeTheme.aspx?newtheme={FolderName}" class="btn btn-success btn-sm">
									<i class="fa fa-check"></i> Activate
								</a>
								<xsl:if test="PreviewUrl!=''">
									<a href="{PreviewUrl}" target="_blank" class="btn btn-default btn-sm">
										<i class="fa fa-eye"></i> Preview
									</a>
								</xsl:if>
							</div>
						</div>
					</div>

					<!-- Theme Info -->
					<h4 style="margin-top: 0; margin-bottom: 10px;">
						<xsl:value-of select="Name"/>
					</h4>
					<xsl:if test="string-length(normalize-space(Description)) &gt; 0">
						<div class="theme-description" style="font-size: 13px; margin-bottom: 15px; display: none; padding: 10px; background-color: #f9f9f9; border-left: 3px solid #ddd;">
							<xsl:value-of select="Description"/>
						</div>
						<div style="margin-bottom: 10px;">
							<a href="#" class="toggle-description text-muted" style="font-size: 12px;">
								<i class="fa fa-info-circle"></i> Show Details
							</a>
						</div>
					</xsl:if>

					<!-- Action Buttons (mobile fallback) -->
					<div style="margin-top: 15px;" class="visible-xs">
						<a href="ChangeTheme.aspx?newtheme={FolderName}" class="btn btn-success btn-sm">
							<i class="fa fa-check"></i> Activate
						</a>
						<xsl:if test="PreviewUrl!=''">
						<a href="{PreviewUrl}" target="_blank" class="btn btn-default btn-sm">
							<i class="fa fa-eye"></i> Preview
						</a></xsl:if>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>