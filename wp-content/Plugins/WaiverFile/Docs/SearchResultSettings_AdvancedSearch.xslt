<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:asp="remove" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>



  <xsl:param name="LoadOriginalVersion"></xsl:param>


  <xsl:template match="/">


    <div class="panel-group" id="accordion2">

      <xsl:for-each select="/Main/ArrayOfDBFieldList/DBFieldList">



        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion2" href="#collapseb{position()}">
                <xsl:choose>
                  <xsl:when test="Name=''">Standard Fields</xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="Name"/>
                  </xsl:otherwise>
                </xsl:choose>
              </a>
            </h4>
          </div>
          <div id="collapseb{position()}" class="panel-collapse collapse">
            <xsl:if test="position()=1">
              <xsl:attribute name="class">
                panel-collapse collapse in
              </xsl:attribute>
            </xsl:if>
            <div class="panel-body">

              <ul class="list-unstyled">
                <xsl:for-each select="Items/DBField">
                  <xsl:variable name="currFieldName">
                    <xsl:value-of select="FieldName"/>
                  </xsl:variable>
                  <li class="">
                    <asp:CheckBox runat="server" data-field="{FieldName}" data-fieldheadertext="{HeaderText}" class="advbox">
                      <xsl:if test="/Main/WaiverSite/SettingsPack/AdvancedSearchFields/Items/DBField[FieldName=$currFieldName]">
                        <xsl:attribute name="checked">true</xsl:attribute>
                      </xsl:if>
                    </asp:CheckBox>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="HeaderText"/>
                  </li>
                </xsl:for-each>
              </ul>

            </div>
          </div>
        </div>

      </xsl:for-each>

    </div>

    <hr/>
  </xsl:template>


</xsl:stylesheet>
