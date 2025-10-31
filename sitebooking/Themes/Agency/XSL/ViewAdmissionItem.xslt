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
      <div class="container mt-5">
        <div class="row">

          <!-- Left: Image Gallery -->
          <div class="col-md-6">
            <xsl:variable name="mainImage" select="Images/ItemImage[1]/SourceUrl"/>
            <img id="mainImage" src="{$mainImage}" class="img-fluid rounded shadow mb-3" alt="{Name}" />

            <div class="d-flex flex-wrap gap-2">
              <xsl:for-each select="Images/ItemImage">
                <img src="{SourceThumbUrl}" data-full="{SourceUrl}" class="img-thumbnail thumb-swap" style="width: 80px;" />
              </xsl:for-each>
            </div>
          </div>

          <!-- Right: Info & Booking -->
          <div class="col-md-6">
            <h2>
              <xsl:value-of select="Name"/>
            </h2>

            <p class="text-muted">
              <xsl:choose>
                <xsl:when test="normalize-space(Description) != ''">
                  <xsl:value-of select="Description" disable-output-escaping="yes"/>
                </xsl:when>
                <xsl:otherwise>No description available.</xsl:otherwise>
              </xsl:choose>
            </p>

            <!-- Pricing Breakdown -->
            <h4 class="mt-4">Pricing</h4>
            <xsl:for-each select="PricingGridRef/TimeRules/PricingGridTimeRule">
              <xsl:variable name="timeRuleId" select="ID"/>
              <div class="mb-3 border rounded p-2">
                <h5 class="text-primary mb-2">
                  <xsl:value-of select="Name"/>
                </h5>
                <ul class="list-unstyled mb-0">
                  <xsl:for-each select="../../PersonTypes/PricingGridPersonType">
                    <xsl:variable name="ptId" select="ID"/>
                    <xsl:variable name="price"
select="/AdmissionItem/CurrentPrices/AdmissionItemPrice[PersonTypeID = $ptId and TimeRuleID = $timeRuleId]/Price"/>

                    <li>
                      <strong>
                        <xsl:value-of select="Name"/>:
                      </strong>
                      <xsl:choose>
                        <xsl:when test="$price">
                          $<xsl:value-of select="$price"/>
                        </xsl:when>
                        <xsl:otherwise>Not available</xsl:otherwise>
                      </xsl:choose>
                    </li>
                  </xsl:for-each>
                </ul>
              </div>
            </xsl:for-each>

            <!-- Booking Section -->
            <h4 class="mt-4">Book Your Visit</h4>
            <div class="row mb-3">
              <div class="col-md-6">
                <label class="form-label fw-bold">Date</label>
                <br/>
                <telerik:RadDatePicker ID="rdpCheckIn" runat="server" skin="Bootstrap"  AutoPostBack="true"  />
				 
              </div>
				
             
            </div>
            <div class="row mb-3">
              <div class="col-12">
                <asp:PlaceHolder id="phSlots" runat="server"></asp:PlaceHolder>
                
              </div>
            </div>  
            <xsl:for-each select="PricingGridRef/PersonTypes/PricingGridPersonType">
              <div class="mb-3 row align-items-center">
                <div class="col-6">
                  <label class="form-label fw-bold">
                    <xsl:value-of select="Name"/>
                  </label>
                </div>
                <div class="col-6">
                  <asp:TextBox runat="server" CssClass="form-control" min="0" data-pid="{ID}" style="width:60px;"></asp:TextBox>
                </div>
              </div>
            </xsl:for-each>

            <!-- Add to Cart -->
            <div class="mt-4">
				<asp:PlaceHolder id="phAddToCartErr" runat="server"></asp:PlaceHolder>
              <asp:Button ID="btnAddToCart" runat="server" CssClass="btn btn-primary w-100"
                          Text="Add to Cart" CommandArgument="{ID}" />
            </div>
          </div>
        </div>
      </div>
    </telerik:RadAjaxPanel>

    <!-- jQuery script for thumbnail image swap -->
    <script type="text/javascript">
      $(document).ready(function () {
      $('.thumb-swap').on('click', function () {
      var newSrc = $(this).attr('data-full');
      $('#mainImage').attr('src', newSrc);
      });
      });
    </script>
  </xsl:template>


</xsl:stylesheet>