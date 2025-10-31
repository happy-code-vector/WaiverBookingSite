<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://exslt.org/math"
    version="1.0"
    xmlns:asp="remove"
    exclude-result-prefixes="math">

	<xsl:param name="BasePath"></xsl:param>
	
  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:template match="/">
    <div class="container">
      <div class="row">
        <xsl:for-each select="ArrayOfAdmissionItem/AdmissionItem">
          <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">

              <!-- Product Image (first image or placeholder) -->
              <xsl:variable name="thumb" select="Images/ItemImage[1]/SourceThumbUrl"/>
             

                <xsl:choose>
                  <xsl:when test="$thumb != ''">
                    <a href="{$BasePath}/ViewAdmissionItem.aspx?id={ID}">
                      <img class="card-img-top" alt="{Name}" src="{$thumb}"/>
                    </a>
                  </xsl:when>
                  <xsl:otherwise>
                  <!-- could add a blank image here -->
                  </xsl:otherwise>
                </xsl:choose>
             
              <div class="card-body d-flex flex-column">
                <!-- Name -->
                <h5 class="card-title">
                  <a href="{$BasePath}/ViewAdmissionItem.aspx?id={ID}">
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
                <div class="mt-auto">
                  <xsl:variable name="lowestPrice" select="math:min(CurrentPrices/AdmissionItemPrice/Price)"/>
                  <xsl:choose>
                    <xsl:when test="CurrentPrices/AdmissionItemPrice">
                      <p class="text-primary fw-bold mb-2">
                        From $<xsl:value-of select="$lowestPrice"/>
                      </p>
                    </xsl:when>
                    <xsl:otherwise>
                      <p class="text-muted mb-2">Pricing unavailable</p>
                    </xsl:otherwise>
                  </xsl:choose>

                  <!-- View Button -->
                  <a href="{$BasePath}/ViewAdmissionItem.aspx?id={ID}" class="btn btn-outline-primary w-100">View Details</a>
                </div>

              </div>
            </div>
          </div>
        </xsl:for-each>
      </div>
    </div>
  </xsl:template>


</xsl:stylesheet>
