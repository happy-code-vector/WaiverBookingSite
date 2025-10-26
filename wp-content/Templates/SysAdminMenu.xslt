<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove">
	<xsl:output method="xml" indent="no" encoding="utf-8" omit-xml-declaration="yes" />

	<xsl:param name="CURRENT_CONTEXT"></xsl:param>
	<xsl:template match="Category">

		<!-- leaving off here - rework this to match the new menu format. then continue working on the default.aspx -->


		<ul class="sidebar-menu">
			<!--<li>
        <a href="/">
          <i class="fa fa-arrow-circle-o-up">
            <xsl:text> </xsl:text>
          </i>Back to Website</a>
      </li>-->
			<li class="header">Admin Navigation</li>

			<xsl:apply-templates>
				<xsl:sort select="@Order"/>
				<xsl:sort select="@Name"/>
			</xsl:apply-templates>
		</ul>

	</xsl:template>
	<xsl:template match="MenuItem">
		<li>
			<xsl:attribute name="class">
				<xsl:if test="@ContextRef=$CURRENT_CONTEXT or *[@ContextRef=$CURRENT_CONTEXT]">
					<xsl:text>active</xsl:text>
				</xsl:if>
				<xsl:if test="MenuItem">
					<xsl:text> treeview</xsl:text>
				</xsl:if>

			</xsl:attribute>
			<a href="default.aspx?sc={@ContextRef}&amp;c=0">
				<!-- still want to support icons? time to move on and just use fontawesome icons maybe -->
				<xsl:choose>
					<xsl:when test="@Icon">
						<img src="" alt="">
							<xsl:attribute name="src">
								<xsl:value-of select="@Icon"/>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="@Name"/>
							</xsl:attribute>
						</img>
					</xsl:when>
					<xsl:when test="@IconClass!=''">
						<i class="fa {@IconClass}">
							<xsl:text> </xsl:text>
						</i>
					</xsl:when>
					<xsl:otherwise>
						<i class="fa fa-circle-o">
							<xsl:text> </xsl:text>
						</i>
					</xsl:otherwise>
				</xsl:choose>

				<span>
					<xsl:value-of select="@Name"/>
				</span>
				<xsl:if test="MenuItem">
					<i class="fa fa-angle-left pull-right">
						<xsl:text> </xsl:text>
					</i>
				</xsl:if>
			</a>
			<xsl:if test="MenuItem">
				<ul class="treeview-menu">
					<xsl:apply-templates>
						<xsl:sort select="@Order"/>
					</xsl:apply-templates>
				</ul>
			</xsl:if>

		</li>

	</xsl:template>
	<!-- <xsl:template match="MenuItem">
		<asp:LinkButton runat="server" CommandName="{@ContextRef}">
		<img src="" alt="">
		<xsl:attribute name="src">
		<xsl:text>/images/admin/</xsl:text>
		<xsl:value-of select="@Icon"/>
		</xsl:attribute>
		<xsl:attribute name="alt">
		<xsl:value-of select="@Name"/>
		</xsl:attribute>
		</img>
		</asp:LinkButton>
		<br />
		</xsl:template>	-->
	<xsl:template match="Contexts"> </xsl:template>
</xsl:stylesheet>