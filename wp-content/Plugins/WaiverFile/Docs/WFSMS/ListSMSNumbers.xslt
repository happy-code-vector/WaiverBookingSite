<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times"
    xmlns:cc1="remove" exclude-result-prefixes="cc1">

  <xsl:output method="xml"/>

  <xsl:template match="/">


    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">
          Your SMS Numbers
        </h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body no-padding">
        <table class="table">
          <thead>
            <tr>
              <th>Friendly Name</th>
              <th>Number</th>
              
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
       
              </tr>
            </xsl:for-each>
          </tbody>
        </table>

      </div>
    </div>




  </xsl:template>

</xsl:stylesheet>