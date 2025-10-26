<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>



  <xsl:template match="/">

    <xsl:for-each select="/data/fields">
      
      
      <xsl:choose>
        
        <xsl:when test="field_type='text'">
          <div class="form-group">
            
            <label runat="server" data-fieldcid="{cid}"   class="col-xs-12 col-sm-3"><xsl:value-of select="label"/><xsl:if test="required='true'"><span class="text-danger">*</span></xsl:if></label>
            <div class="col-xs-12 col-sm-9">
              <asp:TextBox runat="server" CssClass="form-control" data-codename="CUSTOM:{label}" data-labelname="{label}" data-required="{required}"></asp:TextBox>
              
              <xsl:if test="field_options/description!=''">
                <p class="help-block"><xsl:value-of select="field_options/description"/></p>
              </xsl:if>
            </div>
            </div>
        </xsl:when>
        
        <xsl:when test="field_type='checkboxes'">
          <div class="form-group">
            <label runat="server" data-fieldcid="{cid}"  class="col-xs-12 col-sm-3"><xsl:value-of select="label"/><xsl:if test="required='true'"><span class="text-danger">*</span></xsl:if></label>
            <div class="col-xs-12 col-sm-9 form-inline">
              <asp:CheckBoxList runat="server" data-labelname="{label}" data-codename="CUSTOM:{label}" data-required="{required}" RepeatLayout="Flow">
                <xsl:for-each select="field_options/options">
                  <asp:ListItem value="{label}">
                    <xsl:if test="checked='false'">
                      <xsl:attribute name="Checked"><xsl:text>true</xsl:text></xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="label"/></asp:ListItem>
                </xsl:for-each>
                <xsl:if test="field_options/include_other_option='true'">
                  <asp:ListItem value="Other">Other</asp:ListItem>
                </xsl:if>
              </asp:CheckBoxList>
              <xsl:if test="field_options/include_other_option='true'">
                  <asp:TextBox runat="server" CssClass="form-control" data-codename="CUSTOM_OTHER:{label}" data-labelname="{label} - Other"></asp:TextBox>
                </xsl:if>
              <xsl:if test="field_options/description!=''">
                <p class="help-block"><xsl:value-of select="field_options/description"/></p>
              </xsl:if>
            </div>
          </div>
        </xsl:when>
        
        
        <xsl:when test="field_type='radio'">
          <div class="form-group">
            <label runat="server" data-fieldcid="{cid}"  class="col-xs-12 col-sm-3"><xsl:value-of select="label"/><xsl:if test="required='true'"><span class="text-danger">*</span></xsl:if></label>
            <div class="col-xs-12 col-sm-9 form-inline">
              <asp:RadioButtonList runat="server" data-labelname="{label}" data-required="{required}" data-codename="CUSTOM:{label}" RepeatLayout="Flow">
                <xsl:for-each select="field_options/options">
                  <asp:ListItem value="{label}">
                    <xsl:if test="checked='false'">
                      <xsl:attribute name="Checked"><xsl:text>true</xsl:text></xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="label"/></asp:ListItem>
                </xsl:for-each>
                <xsl:if test="field_options/include_other_option='true'">
                  <asp:ListItem value="Other">Other</asp:ListItem>
                </xsl:if>
              </asp:RadioButtonList>
              <xsl:if test="field_options/include_other_option='true'">
                <asp:TextBox runat="server" CssClass="form-control" data-codename="CUSTOM_OTHER:{label}" data-labelname="{label} - Other"></asp:TextBox>
              </xsl:if>
              
              <xsl:if test="field_options/description!=''">
                <p class="help-block"><xsl:value-of select="field_options/description"/></p>
              </xsl:if>
            </div>
          </div>
        </xsl:when>
        
        <xsl:when test="field_type='dropdown'">
          <div class="form-group">
            <label runat="server" data-fieldcid="{cid}"  class="col-xs-12 col-sm-3"><xsl:value-of select="label"/><xsl:if test="required='true'"><span class="text-danger">*</span></xsl:if></label>
            <div class="col-xs-12 col-sm-9">
              <asp:DropDownList runat="server" CssClass="form-control" data-codename="CUSTOM:{label}" data-labelname="{label}" data-required="{required}">
                <xsl:for-each select="field_options/options">
                  <asp:ListItem value="{label}">
                    <xsl:if test="checked='false'">
                      <xsl:attribute name="Checked"><xsl:text>true</xsl:text></xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="label"/></asp:ListItem>
                </xsl:for-each>
                <xsl:if test="field_options/include_other_option='true'">
                  <asp:ListItem value="Other">Other</asp:ListItem>
                </xsl:if>
              </asp:DropDownList>
              <xsl:if test="field_options/include_other_option='true'">
                If other, please specify: <asp:TextBox runat="server" CssClass="form-control" data-codename="CUSTOM_OTHER:{label}" data-labelname="{label} - Other"></asp:TextBox>
              </xsl:if>
              
              <xsl:if test="field_options/description!=''">
                <p class="help-block"><xsl:value-of select="field_options/description"/></p>
              </xsl:if>
            </div>
          </div>
        </xsl:when>
        
        <xsl:when test="field_type='paragraph'">
          <div class="form-group">
            <label runat="server" data-fieldcid="{cid}"  class="col-xs-12 col-sm-3"><xsl:value-of select="label"/><xsl:if test="required='true'"><span class="text-danger">*</span></xsl:if></label>
            <div class="col-xs-12 col-sm-9">
              <asp:TextBox runat="server" CssClass="form-control" data-labelname="{label}" data-codename="CUSTOM:{label}" TextMode="MultiLine" data-required="{required}"></asp:TextBox>
              
              <xsl:if test="field_options/description!=''">
                <p class="help-block"><xsl:value-of select="field_options/description"/></p>
              </xsl:if>
            </div>
          </div>
        </xsl:when>
        <!--
          text
          checkboxes
          paragraph
          radio
          dropdown
          
          
          not doing now (disable in the formbuilder JS)
          date
          time
          website
          price
          number
          email
          address
          -->
        
      </xsl:choose>
    </xsl:for-each>
    
  </xsl:template>
</xsl:stylesheet>