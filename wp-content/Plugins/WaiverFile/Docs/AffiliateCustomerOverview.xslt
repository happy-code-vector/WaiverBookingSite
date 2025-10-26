<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>

  <xsl:output method="xml" omit-xml-declaration="yes"/>

  
  <xsl:template match="/Main">

 
    <div class="row">
      <div class="col-sm-6">

       
        <xsl:variable name="Email">

          <xsl:choose>
            <xsl:when test="/Main/Customer/Email!=''">
              <xsl:value-of select="/Main/Customer/Email"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="/Main/Lead/Email"/>
            </xsl:otherwise>
          </xsl:choose>

        </xsl:variable>


        <xsl:variable name="Company">

          <xsl:choose>
            <xsl:when test="/Main/Customer/Company!=''">
              <xsl:value-of select="/Main/Customer/Company"/>
            </xsl:when>

            <xsl:otherwise>
              <xsl:value-of select="/Main/Customer/FirstName"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="/Main/Customer/LastName"/>
            </xsl:otherwise>
          </xsl:choose>

        </xsl:variable>


        <h2>
          <xsl:value-of select="$Company"/>
        </h2>
       
        <xsl:text>Customer #: </xsl:text>
        <xsl:value-of select="/Main/Customer/CustomerNumber"/>
        <br/>
        <xsl:value-of select="/Main/Customer/FirstName"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="/Main/Customer/LastName"/>



        <br/>
        <a href="mailto:{$Email}">
          <xsl:value-of select="$Email"/>
        </a>
        <br/>
        <xsl:if test="/Main/Lead/DataXml/Settings/setting[@key='Phone']/@value!=''">
          <label>Phone: </label>
          <xsl:text> </xsl:text>
          <xsl:value-of select="/Main/Lead/DataXml/Settings/setting[@key='Phone']/@value"></xsl:value-of>
        </xsl:if>
        <xsl:if test="count(/Customer/Addresses/Address[IsDefaultBillingAddress='true'])!=0">
          <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/Address1"/>
          <xsl:if test="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/Address2!=''">
            <br/>
            <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/Address2"/>
          </xsl:if>
          <xsl:if test="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/Address3!=''">
            <br/>
            <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/Address3"/>
          </xsl:if>
          <br/>
          <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/City"/>
          <xsl:text>, </xsl:text>
          <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/StateCode"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/ZipCode"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/CountryCode"/>
        </xsl:if>

        <xsl:if test="/Main/CustomerData/Details/CustomSettings/KeysAndValues">
          
          <xsl:for-each select="/Main/CustomerData/Details/CustomSettings/KeysAndValues/Key">
            <br/><label>
            <xsl:choose>
              <xsl:when test=".='WESTBEND_POLICYNUM'">
                <xsl:text>Policy Number</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="."/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:text>: </xsl:text>
            </label>
            <xsl:value-of select="../Value"/>
          </xsl:for-each>
                        
        </xsl:if>
        
      </div>
    </div>

    <br/>
    <br/>
  </xsl:template>
</xsl:stylesheet>
