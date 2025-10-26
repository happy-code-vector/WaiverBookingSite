<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>



  <xsl:template match="/">

    
    <h3>Order Items</h3>

    
    <table class="table table-condensed">
      <thead>
        <tr>
          <th>Plan</th>
          <th>Description</th>
          <th>Price</th>
          <th>Quantity</th>
          <th>Total</th>
        </tr>
      </thead>
      <tobdy>
       <!-- <tr>
          <td>
            <div id="cell_sel_item"></div>
          </td>
          <td>
            <div id="cell_sel_desc"></div>
          </td>
          <td>
            <div id="cell_sel_price"></div>
          </td>
          <td>
            <div id="cell_sel_qty"></div>
          </td>
          <td>
            <div id="cell_sel_total"></div>
          </td>
        </tr>-->
        <xsl:if test="count(/CheckoutState/Cart/Items/Element)=0">
          <tr>
            <td>
              No items to be billed today
            </td>
            <td>
              <xsl:text> </xsl:text>
            </td>
            <td>
              <xsl:text> </xsl:text>
            </td>
            <td>
              0
            </td>
            <td>
              <xsl:text>$</xsl:text>
              <xsl:value-of select="format-number(0,'0.00')"/>
            </td>
          </tr>
        </xsl:if>
        <xsl:for-each select="/CheckoutState/Cart/Items">


          <xsl:for-each select="Element">
            <tr>
              <td>
                <xsl:value-of select="ItemName"/>
              </td>
              <td>
                <xsl:value-of select="ItemDescription"/>
              </td>
              <td>
                <xsl:text>$</xsl:text>
                <xsl:value-of select="format-number(ItemPrice,'0.00')"/>
              </td>
              <td>
                <xsl:value-of select="ItemQuantity"/>
              </td>
              <td>
                <xsl:text>$</xsl:text>
                <xsl:value-of select="format-number(ItemPrice * ItemQuantity,'0.00')"/>
              </td>
            </tr>
          </xsl:for-each>
          <tr>
            <td></td>
            <td></td>
            <td colspan="2" style="text-align:right; font-weight:700;">Total Payment Today:</td>
            <td>
              <strong>
                <div id="cell_grand_total" data-initval="{format-number(GrandTotal,'0.00')}">
                  <xsl:text>$</xsl:text>
                  <xsl:value-of select="format-number(GrandTotal,'0.00')"/>
                </div>

              </strong>
            </td>
          </tr>
        </xsl:for-each>
      </tobdy>
    </table>

  </xsl:template>
</xsl:stylesheet>
