<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="xml"/>


  <xsl:template match="/">

    
    <Tree>
      <xsl:for-each select="/ArrayOfDBFieldListBase/DBFieldListBase[count(Items/DBField)!=0]">
        <Node Text="{Name}" Expanded="False" Value="1">
          <xsl:for-each select="Items/DBField">
            <Node Text="{HeaderText}" Value="{FieldName}" />
          </xsl:for-each>
        </Node>
      </xsl:for-each>
      
      
      <!-- old format: -->
      <xsl:for-each select="/ArrayOfDBFieldList/DBFieldList[count(Items/DBField)!=0]">
        <Node Text="{Name}" Expanded="False" Value="1">
          <xsl:for-each select="Items/DBField">
            <Node Text="{HeaderText}" Value="{FieldName}" />
          </xsl:for-each>
        </Node>
      </xsl:for-each>
    </Tree>

    
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
