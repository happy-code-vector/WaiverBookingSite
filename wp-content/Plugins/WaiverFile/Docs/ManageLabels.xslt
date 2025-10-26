<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:template match="/">

    
    <table class="table">
      <thead>
        <tr>
          <th>Name</th>
          <th>Current Value</th>
          <th>Default Value</th>
          <th>Reset</th>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="/ArrayOfWaiverSiteLabel/WaiverSiteLabel">
          <xsl:sort select="Name"/>

          <tr>
            <td>
              <xsl:value-of select="Name"/>
            </td>
            <td>
              <input type="text" id="txt_{Code}" name="txt_{Code}" value="{Value}" class="form-control" data-default="{DefaultValue}"></input>
            </td>
            <td>
              <input type="text" readonly="readonly" value="{DefaultValue}" class="form-control"></input>

            </td>
            <td>
              <a href="javascript:void(0);" class="btn btn-default btn-sm btnReset" data-btnid="txt_{Code}">Reset</a>
            </td>
          </tr>

        </xsl:for-each>

      </tbody>
    </table>


  </xsl:template>
</xsl:stylesheet>
