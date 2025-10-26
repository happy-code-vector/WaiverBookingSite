<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:asp="remove" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="SiteName"></xsl:param>
  <xsl:param name="SiteUrl"></xsl:param>
  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="BaseUrl"></xsl:param>
  <xsl:param name="SchemeAndDomain"></xsl:param>
  
  <xsl:param name="IncludePrintButton">true</xsl:param>
  <xsl:param name="IncludeEmailButton">true</xsl:param>
  <xsl:param name="IncludeDownloadButton">true</xsl:param>

  <xsl:param name="EmailButtonText">Email All</xsl:param>
  <xsl:param name="PrintButtonText">Print All</xsl:param>
  <xsl:param name="DownloadButtonText">Download All</xsl:param>

  <xsl:template match="/">

    <xsl:if test="/Main/ConfirmationPage/WPObjectStatus='Current'">
      <xsl:for-each select="/Main/ConfirmationPage">
        <xsl:if test="Settings/Heading!=''">
          <h1>
            <xsl:value-of select="Settings/Heading"/>
          </h1>
        </xsl:if>
        <xsl:if test="Settings/SubHeading!=''">
          <h3>
            <xsl:value-of select="Settings/SubHeading"/>
          </h3>
        </xsl:if>
        <xsl:value-of select="Settings/Body" disable-output-escaping="yes"/>
        
      </xsl:for-each>
    </xsl:if>
    <h3>Completed Waivers</h3>
    <table class="table">
      <thead>
        <tr>
          <th>
            <xsl:text> </xsl:text>
          </th>
          <th>
            <xsl:text> </xsl:text>
          </th>
          <xsl:if test="$IncludeEmailButton='true'">
          <th>
            Email
          </th>
          </xsl:if>
           <xsl:if test="$IncludeDownloadButton='true'">
          <th>
            Download
          </th>
          </xsl:if>
          <xsl:if test="$IncludePrintButton='true'">
            <th>
              Print
            </th>
          </xsl:if>
        </tr>
      </thead>
      <xsl:for-each select="/Main/WorkflowSession/Settings/Items/WorkflowSessionDetailItem">
        <tr>
          <td class="workflow-form-status">
            <xsl:choose>
              <xsl:when test="Status='Complete'">
                <i class="fa fa-check-circle">
                  <xsl:text> </xsl:text>
                </i>
              </xsl:when>
              <xsl:when test="Status='Skipped'">
                <i class="fa fa-times-circle text-muted">
                  <xsl:text> </xsl:text>
                </i>
              </xsl:when>
              <xsl:otherwise>
                <i class="fa fa-times-circle text-muted">
                  <xsl:text> </xsl:text>
                </i>
              </xsl:otherwise>
              
            </xsl:choose>
          </td>
          <td>
            <span>
              <xsl:if test="Status='Skipped'">
                <xsl:attribute name="class">text-muted</xsl:attribute>
              </xsl:if>
              <xsl:value-of select="WaiverFormName"/>
            </span>
           
          </td>
          <xsl:if test="$IncludeEmailButton='true'">
            <td>
              <xsl:if test="Status='Complete'">
              <asp:LinkButton runat="server" CssClass="" CommandName="EMAIL" CommandArgument="{WaiverID}">
                <i class="fa fa-envelope">
                  <xsl:text> </xsl:text>
                </i>
              </asp:LinkButton>
              </xsl:if>
            </td>
          </xsl:if>
           <xsl:if test="$IncludeDownloadButton='true'">
          <td>
            <xsl:if test="Status='Complete'">
              <a href="/Controls/DownloadWaiverEndUser.ashx?wid={WaiverID}" target="_blank">
                <i class="fa fa-file-pdf-o">
                  <xsl:text> </xsl:text>
                </i>
              </a>
            </xsl:if>
          </td>
          </xsl:if>
          <xsl:if test="$IncludePrintButton='true'">
            <td>
              <xsl:if test="Status='Complete'">
                <a href="/Controls/PrintWaiverEndUser.aspx?addr={$SiteUrl}&amp;id={WaiverID}"  target="_blank">
                  <i class="fa fa-print">
                    <xsl:text> </xsl:text>
                  </i>

                </a>
              </xsl:if>

            </td>
          </xsl:if>
        </tr>
      </xsl:for-each>
    </table>

    <div class="row">
    <div class="col-sm-7"><div class="text-center text-left-sm">
      <p>
    <xsl:if test="$IncludeEmailButton='true'">
      
        <asp:LinkButton runat="server" CssClass="btn btn-primary" CommandName="EMAILALL">
          <i class="fa fa-envelope">
            <xsl:text> </xsl:text>
          </i>
          <xsl:text> </xsl:text>
          <xsl:value-of select="$EmailButtonText"/>
        </asp:LinkButton>
      
    </xsl:if>
     <xsl:text> </xsl:text>
    <xsl:if test="$IncludePrintButton='true'">
       <a href="/Controls/PrintWaiverEndUser.aspx?addr={$SiteUrl}&amp;mode=wfall&amp;original=true" class="btn btn-primary" target="_blank">
                      <i class="fa fa-print"><xsl:text> </xsl:text></i>
                      <xsl:text> </xsl:text>
          <xsl:value-of select="$PrintButtonText"/>
       </a>
    </xsl:if>   <xsl:text> </xsl:text>
    <xsl:if test="$IncludeDownloadButton='true'">
      <a href="" class="btn btn-primary" target="_blank">
        <xsl:attribute name="href">
          <xsl:choose>
            <xsl:when test="count(/Main/WorkflowSession/Settings/Items/WorkflowSessionDetailItem)=1">
              <xsl:text>/Controls/DownloadWaiverEndUser.ashx?wid=</xsl:text>
              <xsl:value-of select="/Main/WorkflowSession/Settings/Items/WorkflowSessionDetailItem/WaiverID"></xsl:value-of>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>/Controls/DownloadWaiverEndUser.ashx?mode=series</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <i class="fa fa-download">
          <xsl:text> </xsl:text>
        </i>
        <xsl:text> </xsl:text>
        <xsl:value-of select="$DownloadButtonText"/>
      </a>
    </xsl:if></p>
    </div>
      </div>
    <div class="col-sm-5"><div class="text-center text-right-sm">
      <p>
  <asp:Button runat="server" id="btnContinue" CommandName="CONTINUE" text="Continue" CssClass="btn btn-primary"></asp:Button>
    </p>
  </div>
    </div>
      </div>

    
  </xsl:template>





</xsl:stylesheet>
