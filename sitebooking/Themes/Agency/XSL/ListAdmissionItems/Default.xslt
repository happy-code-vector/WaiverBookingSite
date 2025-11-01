<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://exslt.org/math"
    version="1.0"
    xmlns:asp="remove"
    exclude-result-prefixes="math">

	<xsl:param name="BasePath"></xsl:param>
	
  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:template match="/">
    <div class="container my-5">
      <div class="row g-4">
        <xsl:for-each select="ArrayOfAdmissionItem/AdmissionItem">
          <div class="col-md-6 col-lg-4 mb-4">
            <div class="card h-100 shadow-sm hover-lift">

              <!-- Product Image (first image or placeholder) -->
              <xsl:variable name="thumb" select="Images/ItemImage[1]/SourceThumbUrl"/>
             

                <xsl:choose>
                  <xsl:when test="$thumb != ''">
                    <a href="{$BasePath}/ViewAdmissionItem.aspx?id={ID}" class="d-block overflow-hidden">
                      <img class="card-img-top hover-zoom" alt="{Name}" src="{$thumb}" style="transition: transform 0.3s ease;"/>
                    </a>
                  </xsl:when>
                  <xsl:otherwise>
                    <div class="card-img-top bg-light d-flex align-items-center justify-content-center" style="height: 250px;">
                      <i class="ci-image text-muted" style="font-size: 4rem;"></i>
                    </div>
                  </xsl:otherwise>
                </xsl:choose>
             
              <div class="card-body d-flex flex-column">
                <!-- Name -->
                <h5 class="card-title mb-2">
                  <a href="{$BasePath}/ViewAdmissionItem.aspx?id={ID}" class="text-decoration-none text-dark hover-primary">
                    <xsl:value-of select="Name"/>
                  </a>
                </h5>

                <!-- Description -->
                <p class="card-text">
                  <xsl:choose>
                    <xsl:when test="normalize-space(Description) != ''">
                      <xsl:value-of select="Description" disable-output-escaping="yes"/>
                    </xsl:when>
                    <xsl:otherwise>No description available.</xsl:otherwise>
                  </xsl:choose>
                </p>

                <!-- Pricing -->
                <div class="mt-auto pt-3 border-top">
                  <xsl:variable name="lowestPrice" select="math:min(CurrentPrices/AdmissionItemPrice/Price)"/>
                  <xsl:choose>
                    <xsl:when test="CurrentPrices/AdmissionItemPrice">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted small">Starting from</span>
                        <h5 class="text-primary mb-0 fw-bold">
                          $<xsl:value-of select="format-number($lowestPrice, '#,##0.00')"/>
                        </h5>
                      </div>
                    </xsl:when>
                    <xsl:otherwise>
                      <p class="text-muted mb-3 text-center">
                        <i class="ci-info-circle me-1"></i>Pricing unavailable
                      </p>
                    </xsl:otherwise>
                  </xsl:choose>

                  <!-- View Button -->
                  <a href="{$BasePath}/ViewAdmissionItem.aspx?id={ID}" class="btn btn-primary w-100">
                    <i class="ci-eye me-2"></i>View Details
                  </a>
                </div>

              </div>
            </div>
          </div>
        </xsl:for-each>
      </div>
    </div>
  </xsl:template>


</xsl:stylesheet>
