<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="Subject"></xsl:param>
  <xsl:param name="SenderName"></xsl:param>
  <xsl:param name="SenderEmail"></xsl:param>
  
  
  
  
  <xsl:param name="BaseUrl"></xsl:param>
  <xsl:param name="SiteUrl"></xsl:param>
  <xsl:param name="WFSubscriptionID"></xsl:param>
  
  <xsl:template match="/">

 
    <xsl:variable name="UnsubscribeUrl">
      <xsl:text>{UnsubscribeUrl}</xsl:text>
    </xsl:variable>

    <html>
      <head>
        <meta name="viewport" content="width=device-width"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>
          <xsl:value-of select="$Subject"/>
        </title>
        <style type="text/css">
          /* -------------------------------------
          INLINED WITH https://putsmail.com/inliner
          ------------------------------------- */
          /* -------------------------------------
          RESPONSIVE AND MOBILE FRIENDLY STYLES
          ------------------------------------- */
          @media only screen and (max-width: 620px) {
          table[class=body] h1 {
          font-size: 28px !important;
          margin-bottom: 10px !important; }
          table[class=body] p,
          table[class=body] ul,
          table[class=body] ol,
          table[class=body] td,
          table[class=body] span,
          table[class=body] a {
          font-size: 16px !important; }
          table[class=body] .wrapper,
          table[class=body] .article {
          padding: 10px !important; }
          table[class=body] .content {
          padding: 0 !important; }
          table[class=body] .container {
          padding: 0 !important;
          width: 100% !important; }
          table[class=body] .main {
          border-left-width: 0 !important;
          border-radius: 0 !important;
          border-right-width: 0 !important; }
          table[class=body] .btn table {
          width: 100% !important; }
          table[class=body] .btn a {
          width: 100% !important; }
          table[class=body] .img-responsive {
          height: auto !important;
          max-width: 100% !important;
          width: auto !important; }}
          /* -------------------------------------
          PRESERVE THESE STYLES IN THE HEAD
          ------------------------------------- */
          @media all {
          .ExternalClass {
          width: 100%; }
          .ExternalClass,
          .ExternalClass p,
          .ExternalClass span,
          .ExternalClass font,
          .ExternalClass td,
          .ExternalClass div {
          line-height: 100%; }
          .apple-link a {
          color: inherit !important;
          font-family: inherit !important;
          font-size: inherit !important;
          font-weight: inherit !important;
          line-height: inherit !important;
          text-decoration: none !important; }
          .btn-primary table td:hover {
          background-color: #34495e !important; }
          .btn-primary a:hover {
          background-color: #34495e !important;
          border-color: #34495e !important; } }
        </style>
      </head>
      <body class="" style="">

        <xsl:choose>
          <xsl:when test="/Main/Customer/FirstName!=''">
            <xsl:text>Hi </xsl:text>
            <xsl:value-of select="/Main/Customer/FirstName"/>
            <xsl:text>,</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>Hi!</xsl:text>  
        </xsl:otherwise>
          
        </xsl:choose><br/><br/>

        <xsl:value-of select="/Main/WFOffer2/EmailMessage" disable-output-escaping="yes"/>
        
        <br/><br/>
        
        Offer Details:<br/>
        <strong>
          <xsl:value-of select="/Main/WFOffer2/DisplayName"/>
        </strong><br/>
        <xsl:value-of select="/Main/WFOffer2/Details"></xsl:value-of>
        <br/>
        <xsl:if test="/Main/WFOffer2Customer/Expires!='1753-01-01T00:00:00'">
          <strong>Expires: </strong>
          <xsl:value-of select="dt:month-abbreviation(/Main/WFOffer2Customer/Expires)"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="dt:day-in-month(/Main/WFOffer2Customer/Expires)"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="dt:year(/Main/WFOffer2Customer/Expires)"/>
          <br/>
        </xsl:if>
        <br/>
        
        <strong>Claim:</strong><br/>        
        
          <xsl:variable name="url">
        <xsl:value-of select="$BaseUrl"/>
            <xsl:text>/b/</xsl:text>
            <xsl:value-of select="$SiteUrl"/>
            <xsl:text>/admin/Settings/Renew.aspx?id=</xsl:text>
            <xsl:value-of select="$WFSubscriptionID"/>
            <xsl:text>&amp;code=</xsl:text>
            <xsl:value-of select="/Main/WFOffer2Customer/Code"/>
        </xsl:variable>
          
            
        <a href="{$url}">Claim Offer</a>
        


        <br/><br/>
          
          
          <!-- SIGNATURE -->
        <xsl:choose>
          <xsl:when test="$SenderEmail='mmccloy@waiverfile.com' or $SenderEmail='mmccloy@twinharbor.com'">
           <div>
              <br />
              Thanks,<br />
              Mike<br /><br />
              <strong>Mike McCloy</strong><br />
              <a href="mailto:mmccloy@waiverfile.com">mmccloy@waiverfile.com</a>
            </div>
            <div>
              <a href="http://www.waiverfile.com/">www.waiverfile.com</a><br />
              Direct: 516.714.3372<br />
              Toll Free: 877.791.9984
            </div></xsl:when>
          <xsl:when test="$SenderEmail='christy@waiverfile.com'">
           <div>
              <br />
              Thanks,<br />
              Christy<br />
              <br />
              <strong>Christy Sorensen</strong><br />
              <a href="mailto:christy@waiverfile.com">christy@waiverfile.com</a>
            </div>
            <div>
              <a href="http://www.waiverfile.com/">www.waiverfile.com</a><br />
              Toll Free: 877.791.9984
            </div></xsl:when>
          <xsl:when test="$SenderEmail!='' and $SenderName!=''">
          <div>
              <br />
              Thanks,<br />
            <xsl:value-of select="$SenderName"/><br />
            
              <a href="mailto:{$SenderEmail}">
                <xsl:value-of select="$SenderEmail"/>
              </a>
            </div>
            <div>
              <a href="http://www.waiverfile.com/">www.waiverfile.com</a><br />
              Toll Free: 877.791.9984
            </div>
            
          </xsl:when>
          <xsl:otherwise>
            <div>
              <br />
              Thanks!<br />
           The WaiverFile Team<br />
            <br/>
              <a href="mailto:info@waiverfile.com">
                info@waiverfile.com
              </a>
            </div>
            <div>
              <a href="http://www.waiverfile.com/">www.waiverfile.com</a><br />
              Toll Free: 877.791.9984
            </div>
        
          
          </xsl:otherwise>
        
        </xsl:choose>
           
        
          
        
        
        <a href="https://www.waiverfile.com">
          <img src="https://www.waiverfile.com/wp-content/images/waiverfile-logo-xsm.gif" alt="WaiverFile logo" style="border:0 none;" border="0"></img>
        </a>
        
        <br />
        Accept waivers on your tablet, phone or website.<br />
        <br />
Want to stop receiving these emails? <a href="{$UnsubscribeUrl}" style="">Unsubscribe</a>.

        
        
      </body>
    </html>


  </xsl:template>
</xsl:stylesheet>
