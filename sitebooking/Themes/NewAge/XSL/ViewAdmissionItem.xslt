<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://exslt.org/math"  xmlns:telerik="remove"
    version="1.0"
    xmlns:asp="remove"
    exclude-result-prefixes="math">



  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:template match="/AdmissionItem">

	  
    
    <xsl:text disable-output-escaping="yes">
      
	    &lt;%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %&gt;
    </xsl:text>

    <style type="text/css">
      .unavailable-date {
      background-color: #fdd;
      text-decoration: line-through;
      cursor: not-allowed;
      }
    </style>
    
    <telerik:RadAjaxPanel runat="server" ID="pnlAdmissionItem" LoadingPanelID="RadAjaxLoadingPanel1">
      <div class="container my-5">
        <div class="row g-4">

          <!-- Left: Image Gallery -->
          <div class="col-lg-6">
            <div class="sticky-top" style="top: 20px;">
              <xsl:variable name="mainImage" select="Images/ItemImage[1]/SourceUrl"/>
              <div class="position-relative mb-3 overflow-hidden rounded shadow-lg">
                <img id="mainImage" src="{$mainImage}" class="img-fluid w-100" alt="{Name}" style="max-height: 500px; object-fit: cover;" />
              </div>

              <!-- Thumbnail Gallery -->
              <div class="d-flex flex-wrap gap-2">
                <xsl:for-each select="Images/ItemImage">
                  <div class="thumb-swap-container position-relative" style="cursor: pointer;">
                    <img src="{SourceThumbUrl}" data-full="{SourceUrl}" class="img-thumbnail thumb-swap hover-zoom" style="width: 100px; height: 100px; object-fit: cover; transition: all 0.3s ease;" />
                  </div>
                </xsl:for-each>
              </div>
            </div>
          </div>

          <!-- Right: Info & Booking -->
          <div class="col-lg-6">
            <!-- Product Header -->
            <div class="mb-4">
              <h1 class="display-5 fw-bold mb-3">
                <xsl:value-of select="Name"/>
              </h1>

              <div class="lead text-muted">
                <xsl:choose>
                  <xsl:when test="normalize-space(Description) != ''">
                    <xsl:value-of select="Description" disable-output-escaping="yes"/>
                  </xsl:when>
                  <xsl:otherwise>No description available.</xsl:otherwise>
                </xsl:choose>
              </div>
            </div>

            <!-- Pricing Breakdown -->
            <div class="card shadow-primary mb-4 hover-lift">
              <div class="card-header bg-gradient-primary text-white">
                <h5 class="mb-0">
                  <i class="ci-dollar-sign me-2"></i>Pricing Options
                </h5>
              </div>
              <div class="card-body">
                <xsl:for-each select="PricingGridRef/TimeRules/PricingGridTimeRule">
                  <xsl:variable name="timeRuleId" select="ID"/>
                  <div class="mb-3 p-3 bg-light rounded">
                    <h6 class="text-gradient fw-bold mb-3">
                      <i class="ci-clock me-2"></i>
                      <xsl:value-of select="Name"/>
                    </h6>
                    <div class="row g-2">
                      <xsl:for-each select="../../PersonTypes/PricingGridPersonType">
                        <xsl:variable name="ptId" select="ID"/>
                        <xsl:variable name="price"
select="/AdmissionItem/CurrentPrices/AdmissionItemPrice[PersonTypeID = $ptId and TimeRuleID = $timeRuleId]/Price"/>

                        <div class="col-6">
                          <div class="d-flex justify-content-between align-items-center">
                            <span class="text-muted">
                              <i class="ci-user me-1"></i>
                              <xsl:value-of select="Name"/>
                            </span>
                            <span class="fw-bold text-gradient">
                              <xsl:choose>
                                <xsl:when test="$price">
                                  $<xsl:value-of select="format-number($price, '#,##0.00')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                  <span class="text-muted small">N/A</span>
                                </xsl:otherwise>
                              </xsl:choose>
                            </span>
                          </div>
                        </div>
                      </xsl:for-each>
                    </div>
                  </div>
                </xsl:for-each>
              </div>
            </div>

            <!-- Booking Section -->
            <div class="card shadow-primary-lg border-0 hover-lift">
              <div class="card-header bg-gradient-primary text-white">
                <h5 class="mb-0">
                  <i class="ci-calendar me-2"></i>Book Your Visit
                </h5>
              </div>
              <div class="card-body p-4">
                
                <!-- Date Selection -->
                <div class="mb-4">
                  <label class="form-label fw-bold d-flex align-items-center">
                    <i class="ci-calendar text-gradient me-2"></i>
                    Select Date
                  </label>
                  <telerik:RadDatePicker ID="rdpCheckIn" runat="server" skin="Bootstrap" AutoPostBack="true" CssClass="form-control-lg" />
                </div>

                <!-- Time Slots -->
                <div class="mb-4">
                  <label class="form-label fw-bold d-flex align-items-center">
                    <i class="ci-clock text-gradient me-2"></i>
                    Available Time Slots
                  </label>
                  <asp:PlaceHolder id="phSlots" runat="server"></asp:PlaceHolder>
                </div>

                <!-- Quantity Selection -->
                <div class="mb-4">
                  <label class="form-label fw-bold d-flex align-items-center mb-3">
                    <i class="ci-user text-gradient me-2"></i>
                    Number of Guests
                  </label>
                  <xsl:for-each select="PricingGridRef/PersonTypes/PricingGridPersonType">
                    <div class="mb-3">
                      <div class="d-flex justify-content-between align-items-center p-3 bg-light rounded">
                        <div>
                          <label class="form-label mb-0 fw-semibold">
                            <xsl:value-of select="Name"/>
                          </label>
                        </div>
                        <div class="d-flex align-items-center gap-2">
                          <asp:TextBox runat="server" CssClass="form-control form-control-lg text-center" min="0" data-pid="{ID}" style="width: 80px;" Text="0" type="number"></asp:TextBox>
                        </div>
                      </div>
                    </div>
                  </xsl:for-each>
                </div>

                <!-- Error Messages -->
                <asp:PlaceHolder id="phAddToCartErr" runat="server"></asp:PlaceHolder>

                <!-- Add to Cart Button -->
                <asp:Button ID="btnAddToCart" runat="server" CssClass="btn btn-primary btn-lg w-100 py-3 shadow" CommandArgument="{ID}" Text="Add to Cart"></asp:Button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </telerik:RadAjaxPanel>

    <!-- jQuery script for thumbnail image swap with animation -->
    <script type="text/javascript">
      $(document).ready(function () {
        $('.thumb-swap').on('click', function () {
          var newSrc = $(this).attr('data-full');
          $('#mainImage').fadeOut(200, function() {
            $(this).attr('src', newSrc).fadeIn(200);
          });
          
          // Highlight selected thumbnail
          $('.thumb-swap').removeClass('border-primary').css('border-width', '1px');
          $(this).addClass('border-primary').css('border-width', '3px');
        });
        
        // Highlight first thumbnail by default
        $('.thumb-swap').first().addClass('border-primary').css('border-width', '3px');
      });
    </script>
  </xsl:template>


</xsl:stylesheet>