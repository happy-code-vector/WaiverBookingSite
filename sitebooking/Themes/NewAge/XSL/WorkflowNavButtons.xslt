<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>

	<xsl:template match="/">

		<script type="text/javascript">
			document.addEventListener('change', function(e){
			if(e.target && e.target.id === 'linkselect'){
			e.preventDefault();
			var val = e.target.value;
			if(val !== ''){
			window.location = val;
			}
			}
			});
		</script>

		<xsl:choose>
			<xsl:when test="count(/Main/Steps/ArrayOfWFButton/WFButton) + count(/Main/Forms/ArrayOfWFButton/WFButton) &gt; 10">

				<!-- Dropdown for many options -->
				<div class="my-4">
					<label class="form-label fw-bold">
						<i class="ci-menu me-2"></i>Select an option:
					</label>
					<select class="form-select form-select-lg" id="linkselect">
						<option value="">Choose...</option>

					<xsl:for-each select="/Main/Steps/ArrayOfWFButton/WFButton">
						<option value="{Url}">
							<xsl:if test="Title!=''">
								<xsl:attribute name="title">
									<xsl:value-of select="Title"/>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="Text"/>
						</option>
					</xsl:for-each>

					<xsl:for-each select="/Main/Forms/ArrayOfWFButton/WFButton">
						<option value="{Url}">
							<xsl:if test="Title!=''">
								<xsl:attribute name="title">
									<xsl:value-of select="Title"/>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="Text"/>
						</option>
					</xsl:for-each>
					</select>
				</div>

			</xsl:when>
			<xsl:otherwise>

				<div class="d-flex flex-wrap gap-2 justify-content-center my-4">
					<xsl:for-each select="/Main/Steps/ArrayOfWFButton/WFButton">
						<a href="{Url}" class="btn btn-lg btn-primary px-4 py-3 shadow-sm hover-lift">
							<xsl:if test="Title!=''">
								<xsl:attribute name="title">
									<xsl:value-of select="Title"/>
								</xsl:attribute>
							</xsl:if>
							<i class="ci-arrow-right me-2"></i>
							<xsl:value-of select="Text"/>
							<xsl:if test="Title!=''">
								<br/>
								<small class="opacity-75">
									<xsl:value-of select="Title"/>
								</small>
							</xsl:if>
						</a>
					</xsl:for-each>

					<xsl:for-each select="/Main/Forms/ArrayOfWFButton/WFButton">
						<a href="{Url}" class="btn btn-lg btn-outline-primary px-4 py-3 shadow-sm hover-lift">
							<xsl:if test="Title!=''">
								<xsl:attribute name="title">
									<xsl:value-of select="Title"/>
								</xsl:attribute>
							</xsl:if>
							<i class="ci-file-text me-2"></i>
							<xsl:value-of select="Text"/>
						</a>
					</xsl:for-each>
				</div>

			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
</xsl:stylesheet>
