<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                xmlns:asp="remove" xmlns:telerik="remove"
                exclude-result-prefixes="asp">

  <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>

  <xsl:param name="mode"></xsl:param>
  <xsl:template match="/">
	  <style tyle="text/css">
		  @media (max-width: 575.98px) {
		  ordersummaryaside{ margin-top: -50px; padding-top: 0;}
		  }
	  </style>
    <xsl:choose>
      <xsl:when test="$mode='orderpreview'">

        <!-- Offcanvas Cart Preview -->
        <div class="offcanvas offcanvas-end pb-sm-2 px-sm-2" id="orderPreview" tabindex="-1" aria-labelledby="orderPreviewLabel" style="width: 500px" aria-modal="true" role="dialog">
          <div class="offcanvas-header py-3 pt-lg-4 border-bottom">
            <h4 class="offcanvas-title text-gradient" id="orderPreviewLabel">Your order</h4>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
          </div>
          <div class="offcanvas-body d-flex flex-column gap-3 py-2">
            <!-- grouped items first -->
            <xsl:for-each select="BookingCart/ItemsGrouped/BookingCartItemGroup">
              <h5>
                <xsl:value-of select="GroupName"/>
                <span class="float-end">
                  $<xsl:value-of select="TotalPrice"/>
                </span>
              </h5>

              <xsl:for-each select="Items/BookingCartItem">
                <div class="d-flex align-items-center">
                  <a class="flex-shrink-0">
                    <img src="{ImageUrl}" width="110" alt="{ItemName}"/>
                  </a>
                  <div class="w-100 min-w-0 ps-2 ps-sm-3">
                    <h5 class="d-flex animate-underline mb-2">
                      <span class="d-block fs-sm fw-medium text-truncate animate-target">
                        <xsl:value-of select="ItemName"/>
                      </span>
                    </h5>
                    <div class="h6 mb-0">
                      $<xsl:value-of select="Price"/>
                    </div>
                    <div class="fs-xs pt-2">
                      Qty: <xsl:value-of select="Quantity"/>
                    </div>
                  </div>
                </div>
                
              </xsl:for-each>
                
              
              
            </xsl:for-each>


            <xsl:for-each select="BookingCart/ItemsUngrouped/BookingCartItem[ItemType!='Fee']">
              <div class="d-flex align-items-center">
                <a class="flex-shrink-0">
                  <img src="{ImageUrl}" width="110" alt="{ItemName}"/>
                </a>
                <div class="w-100 min-w-0 ps-2 ps-sm-3">
                  <h5 class="d-flex animate-underline mb-2">
                    <span class="d-block fs-sm fw-medium text-truncate animate-target">
                      <xsl:value-of select="ItemName"/>
                    </span>
                  </h5>
                  <div class="h6 mb-0">
                    $<xsl:value-of select="Price"/>
                  </div>
                  <div class="fs-xs pt-2">
                    Qty: <xsl:value-of select="Quantity"/>
                  </div>
                </div>
              </div>
            </xsl:for-each>
          </div>
          <div class="offcanvas-header">
            <a class="btn btn-lg btn-outline-secondary w-100" href="ViewCart.aspx">Edit cart</a>
          </div>
        </div>
      </xsl:when>
      <xsl:otherwise>

        <!-- Sidebar Order Summary -->
        <aside class="col-lg-4 offset-xl-1 ordersummaryaside" style="">
          <div class="position-sticky top-0" style="padding-top: 100px">
            <div class="bg-body-tertiary rounded-5 p-4 mb-3">
              <div class="p-sm-2 p-lg-0 p-xl-2">
                <div class="border-bottom pb-4 mb-4">
                  <div class="d-flex align-items-center justify-content-between mb-4">
                    <h5 class="mb-0 text-gradient">Order summary</h5>
                    <div class="nav">
                      <a class="nav-link text-decoration-underline p-0" href="ViewCart.aspx">Edit</a>
                    </div>
                  </div>
                  <a class="d-flex align-items-center gap-2 text-decoration-none" href="#orderPreview" data-bs-toggle="offcanvas">

                    <xsl:for-each select="BookingCart/ItemsCombined/BookingCartItem[ItemType!='Fee']">
                      <div class="ratio ratio-1x1" style="max-width: 64px">
                        <img src="{ImageUrl}" class="d-block p-1" alt="{ItemName}"/>
                      </div>
                    </xsl:for-each>
                    <i class="ci-chevron-right text-body fs-xl p-0 ms-auto"></i>
                  </a>
                </div>
				  <ul class="list-unstyled fs-sm gap-3 mb-0">
					  <li class="d-flex justify-content-between">
						  Subtotal:
						  <span class="text-dark-emphasis fw-medium">
							  $<xsl:value-of select="BookingCart/SubTotal"/>
						  </span>
					  </li>

					  <!-- Booking Fee first -->
					  <xsl:if test="BookingCart/ItemsUngrouped/BookingCartItem[ItemType='Fee']">
						  <li class="d-flex justify-content-between">
							  Booking Fee:
							  <span class="text-dark-emphasis fw-medium">
								  $<xsl:value-of select="format-number(sum(BookingCart/ItemsUngrouped/BookingCartItem[ItemType='Fee']/Price), '#,##0.00')"/>
							  </span>
						  </li>
					  </xsl:if>

					  <!-- Shipping second -->
					  <xsl:if test="BookingCart/ItemsUngrouped/BookingCartItem[ItemType='Shipping' or ItemType='Handling' or ItemType='Shipping_and_Handling']">
						  <li class="d-flex justify-content-between">
							  Shipping:
							  <span class="text-dark-emphasis fw-medium">
								  $<xsl:value-of select="format-number(sum(BookingCart/ItemsUngrouped/BookingCartItem[ItemType='Shipping' or ItemType='Handling' or ItemType='Shipping_and_Handling']/Price), '#,##0.00')"/>
							  </span>
						  </li>
					  </xsl:if>

					  <!-- Tax last -->
					  <xsl:if test="BookingCart/ItemsUngrouped/BookingCartItem[ItemType='Tax']">
						  <xsl:for-each select="BookingCart/ItemsUngrouped/BookingCartItem[ItemType='Tax']">
							  <li class="d-flex justify-content-between">
								  <xsl:value-of select="ItemName"/>:
								  <span class="text-dark-emphasis fw-medium">
									  $<xsl:value-of select="format-number(Price, '#,##0.00')"/>
								  </span>
							  </li>
						  </xsl:for-each>
					  </xsl:if>
				  </ul>
                <div class="border-top pt-4 mt-4">
                  <div class="d-flex justify-content-between mb-3">
                    <span class="fs-sm">Estimated total:</span>
                    <span class="h5 mb-0 text-gradient">
                      $<xsl:value-of select="BookingCart/GrandTotal"/>
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </aside>
      </xsl:otherwise>
    </xsl:choose>


  </xsl:template>

</xsl:stylesheet>
