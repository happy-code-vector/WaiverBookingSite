<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" xmlns:asp="remove" exclude-result-prefixes="str dt">

  <xsl:output method="xml" omit-xml-declaration="yes"/>

  <xsl:param name="SubscribableItemID"></xsl:param>
  <xsl:param name="IsNewSubscription"></xsl:param>


  <xsl:template match="/">

    <div class="row">

      <xsl:for-each select="/SubscriptionCustomFormFields/Section[(@SubscribableItemID='' or @SubscribableItemID=$SubscribableItemID) and count(Fields/Field[$IsNewSubscription='true' or @onlyfornewsub!='true'])&gt;0]">

        <div class="col-xs-12 col-sm-6">
          <xsl:if test="@Name!=''">
            <h3>
              <xsl:value-of select="@Name"/>
            </h3>
          </xsl:if>
          <xsl:if test="@Description!=''">
            <p>
              <xsl:value-of select="@Description"/>
            </p>
          </xsl:if>



          <xsl:for-each select="Fields/Field[$IsNewSubscription='true' or @onlyfornewsub!='true']">

            <xsl:choose>
              <xsl:when test="@type='text'">

                <div class="form-group">
                  <label>
                    <xsl:value-of select="@name"/>
                  </label>

                  <asp:TextBox
                  id="WPSUBCUSTFORM_{@id}"
                  runat="server"
                  Text="{@DefaultValue}"
                  CssClass="form-control">
                    <xsl:if test="@textmode='multiline'">
                      <xsl:attribute name="TextMode">
                        <xsl:text>MultiLine</xsl:text>
                      </xsl:attribute>
                    </xsl:if>
                  </asp:TextBox>
                  <xsl:if test="@description!=''">
                    <small>
                      <xsl:value-of select="@description"/>
                    </small>
                  </xsl:if>

                </div>


              </xsl:when>
              <!-- todo: handle more data types -->
            </xsl:choose>
          </xsl:for-each>
        </div>

        <xsl:if test="position() mod 2 = 0">
          <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;div class="row"&gt;</xsl:text>
        </xsl:if>


      </xsl:for-each>
    </div>

  </xsl:template>

</xsl:stylesheet>