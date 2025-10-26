<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:template match="/">

    <xsl:variable name="code1">_x0030_</xsl:variable>
    <xsl:variable name="code2">_x002F_</xsl:variable>


    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">
          Details and Usage
        </h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
      
      
    <table class="table table-condensed">

    <xsl:for-each select="/DataSet/xs:schema/xs:element/xs:complexType/xs:choice/xs:element/xs:complexType/xs:sequence/xs:element">

      <xsl:variable name="name">
        <xsl:value-of select="@name"/>
      </xsl:variable>

      <xsl:if test="$name!='name1' and $name!='url1'">
      <tr>
        <td>
          <xsl:value-of select="str:replace(str:replace(@name, $code1, ''), $code2, '/')"/>
        </td>
        <td>
          <xsl:value-of select="/DataSet/diffgr:diffgram/NewDataSet/Usage/*[local-name() = $name]"/>

        </td>
      </tr>
      </xsl:if>
    </xsl:for-each>

    </table>


      </div>
    </div>


  </xsl:template>
</xsl:stylesheet>
