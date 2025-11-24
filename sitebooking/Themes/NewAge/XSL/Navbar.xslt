<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                xmlns:asp="remove" xmlns:telerik="remove"
                exclude-result-prefixes="asp">

  <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>

	<xsl:param name="BasePath"></xsl:param>
	<xsl:param name="CurrPath"></xsl:param>
	<xsl:param name="CustomerIsAuthenticated"></xsl:param>

  <xsl:template match="/">
	 
	  <nav class="offcanvas offcanvas-start" id="navbarNavNewAge" tabindex="-1" aria-labelledby="navbarNavNewAgeLabel">
		  <div class="offcanvas-header py-4 border-bottom">
			  <h5 class="offcanvas-title text-gradient fw-bold fs-4" id="navbarNavNewAgeLabel">
				  <i class="ci-menu me-2"></i>Menu
			  </h5>
			  <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>

		  <div class="offcanvas-body pt-4 pb-4 py-lg-0 mx-lg-auto">
			  <ul class="navbar-nav position-relative">

				  <xsl:for-each select="/ArrayOfSitePage/SitePage[NavbarMode='Show_always' or (NavbarMode='Show_if_logged_in' and $CustomerIsAuthenticated='true')]">
					  <li class="nav-item py-lg-2 mb-2">
						  <a href="{$BasePath}{Path}{Slug}" aria-current="page">
							  <xsl:attribute name="class">
								  <xsl:text>nav-link rounded-3 px-3 py-2 </xsl:text>
								  <xsl:if test="$CurrPath = Path + Slug">
									  <xsl:text>active fw-bold bg-gradient-primary text-white shadow-primary</xsl:text>
								  </xsl:if>
							  </xsl:attribute>
							  <xsl:value-of select="CurrentInstance/NavbarLink" />
						  </a>
					  </li>
				  </xsl:for-each>

			  </ul>
		  </div>
	  </nav>
	  
  </xsl:template>

</xsl:stylesheet>
