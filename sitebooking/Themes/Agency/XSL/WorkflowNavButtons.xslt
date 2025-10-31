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

				<!-- Bootstrap 5 select -->
				<select class="form-select" id="linkselect">
					<option value="">Select...</option>

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

			</xsl:when>
			<xsl:otherwise>

				<xsl:for-each select="/Main/Steps/ArrayOfWFButton/WFButton">
					<a href="{Url}" class="btn btn-lg btn-light me-2 mb-2">
						<xsl:if test="Title!=''">
							<xsl:attribute name="title">
								<xsl:value-of select="Title"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="Text"/>
						<xsl:if test="Title!=''">
							<br/>
							<small class="text-muted">
								<xsl:value-of select="Title"/>
							</small>
						</xsl:if>
					</a>
				</xsl:for-each>

				<xsl:for-each select="/Main/Forms/ArrayOfWFButton/WFButton">
					<a href="{Url}" class="btn btn-lg btn-light me-2 mb-2">
						<xsl:if test="Title!=''">
							<xsl:attribute name="title">
								<xsl:value-of select="Title"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="Text"/>
					</a>
				</xsl:for-each>

			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
</xsl:stylesheet>
