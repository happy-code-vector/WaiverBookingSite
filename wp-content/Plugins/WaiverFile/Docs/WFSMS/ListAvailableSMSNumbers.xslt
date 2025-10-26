<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times"
    xmlns:cc1="remove" exclude-result-prefixes="cc1">

  <xsl:output method="xml"/>

  <xsl:template match="/">


    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">
         SMS Numbers
        </h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body no-padding">
        <table class="table">
          <thead>
            <tr>
              <th>Friendly Name</th>
              <th>Number</th>
              <th>Waiver Site</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="ArrayOfSendingNum/SendingNum">
              <tr>
                <td>
                  <xsl:value-of select="FriendlyName"/>
                </td>
                <td>
                  <xsl:value-of select="FromNumber"/>
                </td>
                <td>
                  <xsl:choose>
                    <xsl:when test="SiteName='NA'">
                      Unassigned
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="SiteName"/>
                      <xsl:text> (</xsl:text>
                      <a href="https://www.waiverfile.com/b/{SiteUrl}" target="_blank">
                        <xsl:text>Open site</xsl:text>
                        <xsl:text> </xsl:text>
                        <i class="fa fa-external-link">
                          <xsl:text> </xsl:text>
                        </i>
                      </a>
                      )
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
                <td>

                  <a href="/wp-admin/default.aspx?sc=WF_ASSIGN_SMS_NUMBER&amp;id={ID}&amp;c=1">
                    <xsl:choose>
                      <xsl:when test="SiteName='NA'">
                        Assign
                      </xsl:when>
                      <xsl:otherwise>
                        Edit
                      </xsl:otherwise>
                    </xsl:choose>
                  </a>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>

      </div>
    </div>

    
    
 
  </xsl:template>

</xsl:stylesheet>