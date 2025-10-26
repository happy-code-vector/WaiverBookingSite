<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="xml"/>


  <xsl:template match="/">

    <Items>
      <xsl:for-each select="/DBFieldList/Items/DBField">
        <Item Text="{HeaderText}" Value="{FieldName}" />
      </xsl:for-each>
    </Items>
    


    <!--
    <Tree>
    <Node Text="North America" Expanded="True" Value="1">
      <Node Text="U.S.A." Expanded="True">
        <Node Text="New York" Value="2" />
        <Node Text="Los Angeles" />
        <Node Text="Boston" />
        <Node Text="Chicago" />
      </Node>
      <Node Text="Canada">
-->


  </xsl:template>

</xsl:stylesheet>
