<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>

  <xsl:param name="BaseUrl">https://www.waiverfile.com</xsl:param>

  <xsl:template match="/">



    <xsl:if test="count(/ArrayOfExportQueue/ExportQueue)!=0">
      <h4>
        <xsl:choose>
          <xsl:when test="count(/ArrayOfExportQueue/ExportQueue[Status='Pending' or Status='Processing'])!=0">
            Processing
          </xsl:when>
          <xsl:otherwise>
            Complete
          </xsl:otherwise>
        </xsl:choose>
        <small>
        <a href="Export.aspx">
          <i class="fa fa-refresh">
            <xsl:text> </xsl:text>
          </i> Refresh</a>
        </small>
      </h4>

      <table class="table table-condensed">
        <thead>
          <tr>
            <th>
              <xsl:text> </xsl:text>
            </th>
            <th>Status</th>
            <th>Requested</th>
            <th>Waivers Included</th>
            <th>Action</th> 
          </tr>
          
        </thead>
        <tbody>
      <xsl:for-each select="/ArrayOfExportQueue/ExportQueue">

        <tr>
          <td>
            
            <xsl:choose>
              <xsl:when test="Status='Cancelled'">

                <i class="fa fa-times text-muted">
                  <xsl:text> </xsl:text>
                </i>

              </xsl:when>
              <xsl:when test="Status='Pending'">

                <i class="fa fas fa-spinner fa-spin">
                  <xsl:text> </xsl:text>
                </i>
                
              </xsl:when>
              <xsl:when test="Status='Processing'">

                <span class="text-success">
                  <i class="fa fas fa-spinner fa-spin">
                  <xsl:text> </xsl:text>
                </i>
                </span>
              </xsl:when>
              <xsl:when test="Status='Complete'">
                <i class="fa fa-check text-success">
                  <xsl:text> </xsl:text>
                </i>
              </xsl:when>
            </xsl:choose>

          </td>
          <td>
            
            <xsl:value-of select="Status"/>
          </td>
          <td>
            <xsl:value-of select="dt:month-in-year(RequestedOn)"/>
            <xsl:text>/</xsl:text>
            <xsl:value-of select="dt:day-in-month(RequestedOn)"/>
            <xsl:text>/</xsl:text>
            <xsl:value-of select="dt:year(RequestedOn)"/>
            <xsl:text> </xsl:text>

            <xsl:choose>
              <xsl:when test="dt:hour-in-day(RequestedOn)&gt;12">
                <xsl:value-of select="dt:hour-in-day(RequestedOn)-12"/>
                <xsl:text>:</xsl:text>
                <xsl:value-of select="format-number(dt:minute-in-hour(RequestedOn),'00')"/>
                <xsl:text> PM</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="dt:hour-in-day(RequestedOn)"/>
                <xsl:text>:</xsl:text>
                <xsl:value-of select="format-number(dt:minute-in-hour(RequestedOn),'00')"/>
                <xsl:text> AM</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <xsl:value-of select="WaiversIncluded"/>
          </td>
          <td>
            <xsl:choose>
              <xsl:when test="Status='Pending'">
                <asp:Button runat="server" CssClass="btn btn-danger btn-xs" Text="Cancel" CommandName="CANCEL" CommandArgument="{ID}"></asp:Button>
              </xsl:when>
              <xsl:when test="Status='Processing'">
                
              </xsl:when>
              <xsl:when test="Status='Error'">
              </xsl:when>
              <xsl:when test="Status='Cancelled'">
              </xsl:when>
              <xsl:when test="Status='Complete'">
                
                
                      <strong>Download File(s):</strong>
                <ul class="list-unstyled">
                  <xsl:for-each select="DownloadDetailsData/ArrayOfExportDownloadDetail/ExportDownloadDetail">
                    <li class="=">
                      <a href="{$BaseUrl}/Controls/DownloadArchive.ashx?qid={../../../ID}&amp;fileid={id}">
                        <i class="fa fa-file-archive-o">
                          <xsl:text> </xsl:text>
                        </i>
                        <xsl:text> </xsl:text>
                        <xsl:text>File </xsl:text>
                        <xsl:value-of select="position()"/>
                        <xsl:text></xsl:text>
                      </a>
                      <xsl:if test="size!=''">
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="size"/>
                        <xsl:text>)</xsl:text>
                      </xsl:if>
                    </li>
                  </xsl:for-each>

                </ul>
                
              </xsl:when>
            </xsl:choose>
          </td>
        </tr>
        
      </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
