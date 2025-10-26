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

		<div class="container my-4">
			<h2>Your Cart</h2>
			<asp:PlaceHolder id="phErrCustom" runat="server"></asp:PlaceHolder>
			<!-- Grouped Items -->
			<xsl:for-each select="BookingCart/ItemsGrouped/BookingCartItemGroup">
				<div class="card mb-3">
					<div class="card-header bg-light">
						<strong>
							<xsl:value-of select="GroupName"/>
							<xsl:text> - </xsl:text>
							<xsl:value-of select="GroupDescription"/>
						</strong>
						<span class="float-end">
							$<xsl:value-of select="TotalPrice"/>
						</span>
					</div>
					<div class="card-body">
						<!-- Items in Group -->
						<xsl:for-each select="Items/BookingCartItem">
							<xsl:call-template name="RenderItem">
								<xsl:with-param name="item" select="."/>
							</xsl:call-template>
						</xsl:for-each>
					</div>
				</div>
			</xsl:for-each>

			<!-- Ungrouped Items (excluding Fees and Tax which we show at bottom) -->
			<xsl:if test="BookingCart/ItemsUngrouped/BookingCartItem[ItemType!='Fee' and ItemType!='Tax' and ItemType!='Shipping' and ItemType!='Handling' and ItemType!='Shipping_and_Handling']">
				<div class="card">
					<div class="card-body">
						<xsl:for-each select="BookingCart/ItemsUngrouped/BookingCartItem[ItemType!='Fee' and ItemType!='Tax' and ItemType!='Shipping' and ItemType!='Handling' and ItemType!='Shipping_and_Handling']">
							<xsl:call-template name="RenderItem">
								<xsl:with-param name="item" select="."/>
							</xsl:call-template>
						</xsl:for-each>
					</div>
				</div>
			</xsl:if>
			
			<!-- Tax, Shipping, Fees at the bottom (minimal display) -->
			<xsl:for-each select="BookingCart/ItemsUngrouped/BookingCartItem[ItemType='Tax' or ItemType='Shipping' or ItemType='Handling' or ItemType='Shipping_and_Handling' or ItemType='Fee']">
				<xsl:if test="Price &gt; 0">
					<xsl:call-template name="RenderItem">
						<xsl:with-param name="item" select="."/>
						<xsl:with-param name="minimal">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>

			<!-- Cart Totals -->
			<div class="mt-4 text-end">
				<h4>
					Total: $<asp:Literal id="litGrandTotal" runat="server"></asp:Literal>
				</h4>
			</div>
			<div class="mt-4 text-end">
				<asp:Button runat="server" id="btnCheckOut" CssClass="btn btn-primary d-block w-100 py-3 fw-bold" Text="Check Out"></asp:Button>
			</div>
		</div>

	</xsl:template>

	<xsl:template name="RenderItem">
		<xsl:param name="item"/>
		<xsl:param name="minimal" select="false()"/>

		<!-- Check if item is system-calculated (not removable) -->
		<xsl:variable name="isSystemItem" select="$item/ItemType='Tax' or $item/ItemType='Fee' or $item/ItemType='Shipping' or $item/ItemType='Handling' or $item/ItemType='Shipping_and_Handling'"/>

		<xsl:choose>
			<xsl:when test="$minimal">
				<div class="d-flex justify-content-end py-1 small text-muted">
					<div class="me-2 text-end">
						<strong>
							<xsl:value-of select="$item/ItemName"/>
						</strong>
						<xsl:if test="string-length($item/ItemDescription) &gt; 0">
							<div class="small">
								<xsl:value-of select="$item/ItemDescription"/>
							</div>
						</xsl:if>
					</div>
					<div style="min-width: 80px; text-align: right;">
						$<xsl:value-of select="format-number($item/LineTotal, '#,##0.00')"/>
					</div>
				</div>
			</xsl:when>

			<xsl:otherwise>
				<!-- Full Item Rendering -->
				<div class="row align-items-center mb-3 border-bottom pb-2">
					<div class="col-md-2">
						<xsl:if test="$item/ImageUrl!=''">
							<img class="img-fluid" style="max-height: 80px;" src="{$item/ImageUrl}" alt="{$item/ItemName}"/>
						</xsl:if>
					</div>
					<div class="col-md-3">
						<strong>
							<xsl:value-of select="$item/ItemName"/>
						</strong>
						<div>
							<xsl:value-of select="$item/ItemDescription"/>
						</div>
					</div>
					<div class="col-md-2">
						$<xsl:value-of select="format-number($item/Price, '#,##0.00')"/>
					</div>
					<div class="col-md-2">
						<xsl:choose>
							<xsl:when test="$isSystemItem">
								<!-- Read-only quantity for system items -->
								<span class="text-muted">
									<xsl:value-of select="$item/Quantity"/>
								</span>
							</xsl:when>
							<xsl:otherwise>
								<!-- Editable quantity for user items -->
								<div class="d-flex align-items-center gap-1">
									<asp:TextBox ID="txtQty_{generate-id($item)}"
												 data-itemid="{$item/ID}"
												 runat="server"
												 CssClass="form-control form-control-sm text-center qty-input"
												 Text="{$item/Quantity}"
												 style="width: 60px;"
												 onkeyup="showUpdateButton(this);"
												 onchange="showUpdateButton(this);"/>
									<asp:Button ID="btnUpdate_{generate-id($item)}"
												runat="server"
												CommandName="UpdateQuantity"
												CommandArgument="{$item/ID}"
												CssClass="btn btn-sm btn-success update-qty-btn"
												Text="✓"
												style="display: none; padding: 0.25rem 0.5rem;"
												ToolTip="Update quantity"/>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<div class="col-md-2">
						$<xsl:value-of select="format-number($item/LineTotal, '#,##0.00')"/>
					</div>
					<div class="col-md-1 text-end">
						<xsl:if test="not($isSystemItem)">
							<!-- Only show remove button for user-added items -->
							<asp:LinkButton ID="btnRemove_{generate-id($item)}" runat="server" CssClass="btn btn-sm btn-outline-danger" CommandArgument="{$item/ID}">
								<i class="ci-trash">
									<xsl:text> </xsl:text>
								</i>
							</asp:LinkButton>
						</xsl:if>
					</div>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>