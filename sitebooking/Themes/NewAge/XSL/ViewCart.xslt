<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                xmlns:asp="remove" xmlns:telerik="remove"
                exclude-result-prefixes="asp">

	<xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>

	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">
      
	    &lt;%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %&gt;
    </xsl:text>

		<div class="container my-5">
			<!-- Cart Header with Gradient -->
			<div class="d-flex align-items-center mb-5">
				<div class="bg-gradient-primary rounded-circle p-3 me-3 shadow-primary">
					<i class="ci-shopping-cart fs-1 text-white"></i>
				</div>
				<div>
					<h1 class="mb-0 text-gradient display-6 fw-bold">Shopping Cart</h1>
					<p class="text-muted mb-0">Review your items before checkout</p>
				</div>
			</div>
			
			<asp:PlaceHolder id="phErrCustom" runat="server"></asp:PlaceHolder>
			
			<div class="row g-4">
				<!-- Cart Items Column -->
				<div class="col-lg-8">
					
					<!-- Grouped Items -->
					<xsl:for-each select="BookingCart/ItemsGrouped/BookingCartItemGroup">
						<div class="card shadow-primary mb-4 hover-lift border-0">
							<div class="card-header">
								<div class="d-flex justify-content-between align-items-center">
									<div>
										<i class="ci-package me-2"></i>
										<strong>
											<xsl:value-of select="GroupName"/>
										</strong>
										<xsl:if test="string-length(GroupDescription) &gt; 0">
											<span class="ms-2 opacity-75">- <xsl:value-of select="GroupDescription"/></span>
										</xsl:if>
									</div>
									<span class="badge text-bg-light fs-6">
										$<xsl:value-of select="format-number(TotalPrice, '#,##0.00')"/>
									</span>
								</div>
							</div>
							<div class="card-body p-0">
								<xsl:for-each select="Items/BookingCartItem">
									<xsl:call-template name="RenderItem">
										<xsl:with-param name="item" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</div>
						</div>
					</xsl:for-each>

					<!-- Ungrouped Items -->
					<xsl:if test="BookingCart/ItemsUngrouped/BookingCartItem[ItemType!='Fee' and ItemType!='Tax' and ItemType!='Shipping' and ItemType!='Handling' and ItemType!='Shipping_and_Handling']">
						<div class="card shadow-primary hover-lift border-0">
							<div class="card-body p-0">
								<xsl:for-each select="BookingCart/ItemsUngrouped/BookingCartItem[ItemType!='Fee' and ItemType!='Tax' and ItemType!='Shipping' and ItemType!='Handling' and ItemType!='Shipping_and_Handling']">
									<xsl:call-template name="RenderItem">
										<xsl:with-param name="item" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</div>
						</div>
					</xsl:if>
				</div>

				<!-- Order Summary Column -->
				<div class="col-lg-4">
					<div class="card shadow-primary-lg sticky-top border-0" style="top: 20px;">
						<div class="card-header">
							<h5 class="mb-0">
								<i class="ci-calculator me-2"></i>Order Summary
							</h5>
						</div>
						<div class="card-body">
							<!-- Tax, Fees, Shipping -->
							<xsl:for-each select="BookingCart/ItemsUngrouped/BookingCartItem[ItemType='Tax' or ItemType='Shipping' or ItemType='Handling' or ItemType='Shipping_and_Handling' or ItemType='Fee']">
								<xsl:if test="Price &gt; 0">
									<div class="d-flex justify-content-between mb-3">
										<span class="text-muted">
											<xsl:value-of select="ItemName"/>
										</span>
										<span class="fw-semibold">
											$<xsl:value-of select="format-number(LineTotal, '#,##0.00')"/>
										</span>
									</div>
								</xsl:if>
							</xsl:for-each>
							
							<hr class="my-4"/>
							
							<!-- Grand Total -->
							<div class="d-flex justify-content-between align-items-center mb-4">
								<h4 class="mb-0">Total</h4>
								<h3 class="mb-0 text-gradient fw-bold">
									$<asp:Literal id="litGrandTotal" runat="server"></asp:Literal>
								</h3>
							</div>
							
							<!-- Checkout Button -->
							<asp:Button runat="server" id="btnCheckOut" CssClass="btn btn-primary btn-lg w-100 py-3 mb-3 shadow-primary" Text="Proceed to Checkout"></asp:Button>
							
							<!-- Continue Shopping Link -->
							<div class="text-center">
								<a href="/" class="text-decoration-none d-inline-flex align-items-center">
									<i class="ci-arrow-left me-2"></i>
									<span>Continue Shopping</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script>
			function showUpdateButton(input) {
				var btn = document.getElementById(input.id.replace('txtQty_', 'btnUpdate_'));
				if (btn) btn.style.display = 'inline-block';
			}
		</script>

	</xsl:template>

	<xsl:template name="RenderItem">
		<xsl:param name="item"/>
		<xsl:param name="minimal" select="false()"/>

		<xsl:variable name="isSystemItem" select="$item/ItemType='Tax' or $item/ItemType='Fee' or $item/ItemType='Shipping' or $item/ItemType='Handling' or $item/ItemType='Shipping_and_Handling'"/>

		<xsl:if test="not($minimal)">
			<div class="border-bottom p-4">
				<div class="row align-items-center g-3">
					<!-- Product Image -->
					<div class="col-3 col-md-2">
						<xsl:choose>
							<xsl:when test="$item/ImageUrl!=''">
								<img class="img-fluid rounded shadow-sm" src="{$item/ImageUrl}" alt="{$item/ItemName}"/>
							</xsl:when>
							<xsl:otherwise>
								<div class="bg-body-tertiary rounded d-flex align-items-center justify-content-center shadow-sm" style="height: 80px;">
									<i class="ci-image text-muted fs-2"></i>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					
					<!-- Product Info -->
					<div class="col-9 col-md-4">
						<h6 class="mb-1 fw-bold">
							<xsl:value-of select="$item/ItemName"/>
						</h6>
						<xsl:if test="string-length($item/ItemDescription) &gt; 0">
							<p class="text-muted small mb-0">
								<xsl:value-of select="$item/ItemDescription"/>
							</p>
						</xsl:if>
					</div>
					
					<!-- Price -->
					<div class="col-4 col-md-2 text-center">
						<div class="text-muted small mb-1">Price</div>
						<div class="fw-semibold">
							$<xsl:value-of select="format-number($item/Price, '#,##0.00')"/>
						</div>
					</div>
					
					<!-- Quantity -->
					<div class="col-4 col-md-2 text-center">
						<div class="text-muted small mb-2">Quantity</div>
						<xsl:choose>
							<xsl:when test="$isSystemItem">
								<span class="text-muted">
									<xsl:value-of select="$item/Quantity"/>
								</span>
							</xsl:when>
							<xsl:otherwise>
								<div class="d-flex align-items-center justify-content-center gap-2">
									<asp:TextBox ID="txtQty_{generate-id($item)}"
												 data-itemid="{$item/ID}"
												 runat="server"
												 CssClass="form-control form-control-sm text-center"
												 Text="{$item/Quantity}"
												 style="width: 70px;"
												 onkeyup="showUpdateButton(this);"
												 onchange="showUpdateButton(this);"/>
									<asp:Button ID="btnUpdate_{generate-id($item)}"
												runat="server"
												CommandName="UpdateQuantity"
												CommandArgument="{$item/ID}"
												CssClass="btn btn-sm btn-primary"
												Text="✓"
												style="display: none;"
												ToolTip="Update"/>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					
					<!-- Subtotal -->
					<div class="col-4 col-md-2 text-center">
						<div class="text-muted small mb-1">Subtotal</div>
						<div class="fw-bold text-gradient fs-5">
							$<xsl:value-of select="format-number($item/LineTotal, '#,##0.00')"/>
						</div>
					</div>
					
					<!-- Remove Button -->
					<xsl:if test="not($isSystemItem)">
						<div class="col-12 text-end mt-2">
							<asp:LinkButton ID="btnRemove_{generate-id($item)}" 
											runat="server" 
											CssClass="btn btn-sm btn-outline-danger rounded-pill" 
											CommandArgument="{$item/ID}"
											OnClientClick="return confirm('Remove this item from cart?');">
								<i class="ci-trash me-1"></i>Remove
							</asp:LinkButton>
						</div>
					</xsl:if>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
