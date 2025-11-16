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

	 
	  <nav class="offcanvas offcanvas-start" id="navbarNav" tabindex="-1" aria-labelledby="navbarNavLabel">
		  <div class="offcanvas-header py-3">
			  <h5 class="offcanvas-title" id="navbarNavLabel">
				  logo
			  </h5>
			  <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>

		  <div class="offcanvas-body pt-3 pb-4 py-lg-0 mx-lg-auto">
			  <ul class="navbar-nav position-relative">

				  <xsl:for-each select="/ArrayOfSitePage/SitePage[NavbarMode='Show_always' or (NavbarMode='Show_if_logged_in' and $CustomerIsAuthenticated='true')]">
					  <li class="nav-item py-lg-2">
						  <a class="nav-link active" href="{$BasePath}{Path}{Slug}" aria-current="page">
							  <xsl:attribute name="class">
								  <xsl:text>nav-link</xsl:text>
								  <xsl:if test="$CurrPath = Path + Slug">
									  <xsl:text> active</xsl:text>
								  </xsl:if>
							  </xsl:attribute>
							  <xsl:value-of select="CurrentInstance/NavbarLink" />

						  </a>
						  
					  </li>
				  </xsl:for-each>
				  <!-- Home -->



			  </ul>
		  </div>

		  
		  <!-- Account button visible on screens < 768px wide (md breakpoint) -->
		  <!--
		  <div class="offcanvas-header nav border-top px-0 py-3 mt-3 d-md-none">
			  <a class="nav-link justify-content-center w-100" href="account-signin.html">
				  <i class="ci-user fs-lg opacity-60 ms-n2 me-2"></i>
				  Account
			  </a>
		  </div>-->
	  </nav>

	  
	  
  </xsl:template>

</xsl:stylesheet>
