<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:asp="remove"
  xmlns:dt="http://exslt.org/dates-and-times"
  xmlns:set="http://exslt.org/sets"
  extension-element-prefixes="dt set">

  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:param name="SchemeAndDomain">https://www.waiverfile.com</xsl:param>

  <xsl:template match="/">
    <style type="text/css">
      .blocks .btn-default { padding:14px 12px; margin:0 5px; border-radius:0; }
      .blocks .fa { padding-bottom:10px; }
      .wf-card { margin-bottom:20px; }
      .wf-card .panel-body { min-height:180px; }
      .wf-card h4 { margin-top:10px; margin-bottom:10px; }
      .wf-card .small { display:block; margin-top:8px; }
      .wf-longlist .row { padding:8px 0; border-top:1px solid #eee; }
      .wf-longlist .row:first-child { border-top:0; }
    </style>

    <xsl:variable name="eligibleSites"
      select="/ArrayOfWaiverSite/WaiverSite[CustomerID!='00000000-0000-0000-0000-000000000000' and Status!='Deleted' and Status!='Pending_delete']"/>
    <xsl:variable name="siteCount" select="count(set:distinct($eligibleSites/ID))"/>

    <div class="row">
      <xsl:choose>
        <!-- CARDS when there are 10 or fewer sites (including the single-site case) -->
        <xsl:when test="$siteCount &lt;= 10">
          <div class="col-xs-12">
            <p>
              <xsl:choose>
                <xsl:when test="$siteCount=1">You have access to one account:</xsl:when>
                <xsl:otherwise>You have access to <strong><xsl:value-of select="$siteCount"/></strong> accounts:</xsl:otherwise>
              </xsl:choose>
            </p>
          </div>

          <xsl:for-each select="$eligibleSites">
            <xsl:sort select="Name" data-type="text" order="ascending"/>
            <xsl:variable name="wfsubid" select="WFSubscriptionID"/>
            <xsl:variable name="subCount"
              select="count(/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid and CustomerID!='00000000-0000-0000-0000-000000000000' and Status!='Deleted' and Status!='Pending_delete'])"/>

            <div class="col-sm-6 col-md-4 wf-card">
              <div class="panel panel-default">
                <div class="panel-body blocks">

                  <h4>
                    <xsl:value-of select="Name"/>
                  </h4>

                  <p>
					  <strong>Signature Link: </strong>
					  <br/>
                    <i class="fa fa-link" aria-hidden="true">
						<xsl:text> </xsl:text>
					</i>
                    <a href="{$SchemeAndDomain}/b/{Url}" target="_blank">
						<xsl:value-of select="$SchemeAndDomain"/>
						<xsl:text>/b/</xsl:text>
                        <xsl:value-of select="Url"/>
                    </a>
                  </p>
					<p>
						<a class="btn btn-primary" href="{$SchemeAndDomain}/b/{Url}/admin">
							Admin Dashboard
						</a>
					</p>
<!--
					
					<p>
					Visit the dashboard for: 
					<ul>
					<li>View Signed Waivers</li>
					<li>Manage Subscription</li>
					<li>Edit Waiver Forms</li>

					</ul>
				</p>-->
					
                  <xsl:if test="$subCount &gt; 1">
                    <span class="small text-muted">
                      <i class="fa fa-sitemap" aria-hidden="true">
						  <xsl:text> </xsl:text>
					  </i>
                      Part of a subscription with <xsl:value-of select="$subCount"/> accounts
                    </span>
                  </xsl:if>
                </div>
              </div>
            </div>
          </xsl:for-each>
        </xsl:when>

        <!-- LONG LIST when there are more than 10 sites -->
        <xsl:otherwise>
          <div class="col-xs-12">
            <p>You have access to multiple accounts. Select from the list below.</p>
          </div>

          <!-- group by subscription like your current logic -->
          <xsl:for-each select="set:distinct($eligibleSites/WFSubscriptionID)">
            <xsl:variable name="wfsubid" select="."/>
            <div class="col-xs-12 wf-longlist">
              <div class="row">
                <div class="col-xs-12">
                  <h4><xsl:value-of select="../Name"/></h4>
                </div>
              </div>

              <xsl:choose>
                <xsl:when test="count(/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid and CustomerID!='00000000-0000-0000-0000-000000000000' and Status!='Deleted' and Status!='Pending_delete']) &gt; 1">
                  <div class="hidden-xs">
                    <div class="row">
                      <div class="col-sm-4"><strong>Account Name</strong></div>
                      <div class="col-sm-4"><strong>Signature URL</strong></div>
                      <div class="col-sm-4"><strong>Admin Dashboard</strong></div>
                    </div>
                  </div>
                </xsl:when>
              </xsl:choose>

              <xsl:for-each select="/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid and CustomerID!='00000000-0000-0000-0000-000000000000' and Status!='Deleted' and Status!='Pending_delete']">
                <xsl:sort select="Name" data-type="text" order="ascending"/>
                <div class="row">
                  <div class="col-sm-4">
                    <xsl:value-of select="Name"/>
                  </div>
                  <div class="col-sm-4">
                    <a href="{$SchemeAndDomain}/b/{Url}" target="_blank">
                      waiverfile.com/b/<xsl:value-of select="Url"/>
                    </a>
                  </div>
                  <div class="col-sm-4">
                    <a href="{$SchemeAndDomain}/b/{Url}/admin" target="_blank">
                      waiverfile.com/b/<xsl:value-of select="Url"/>/admin
                    </a>
                  </div>
                </div>
              </xsl:for-each>
            </div>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>
    </div>

    <hr/>
  </xsl:template>
</xsl:stylesheet>
