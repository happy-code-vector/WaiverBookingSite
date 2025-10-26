<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">
    
    <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="DateFormat"></xsl:param>

  <xsl:param name="CurrDate"></xsl:param>
  <xsl:param name="CurrName"></xsl:param>
  <xsl:param name="CurrNote"></xsl:param>

  <xsl:param name="WaiverID"></xsl:param>

  

  <xsl:template match="/">

    <span class="pull-right">
    <a class="btn btn-muted" href="ViewWaiver.aspx?id={$WaiverID}">Back to Waiver</a>
    </span>
    
    <h3>Waiver Note History</h3>
    <table class="table">
      <thead>
        <tr>
          <th>Note</th>
          <th>Date</th>
          <th>Saved By</th>

          <th>
            <xsl:text></xsl:text>
          </th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <xsl:value-of select="$CurrNote"/>
          </td>
          <td>
            <xsl:value-of select="$CurrDate"/>
            <xsl:value-of select="dt:format-date($CurrDate,$DateFormat)"/>
          </td>
          <td>
            <xsl:value-of select="$CurrName"/>
          </td>
          
          <td>
            <small>* Current Version</small>
          </td>
        </tr>
        <xsl:for-each select="/ArrayOfWaiverNoteHistory/WaiverNoteHistory">
          <tr>
            <td>
              <xsl:value-of select="Note"/>
            </td>
            <td>
              <xsl:choose>
                <xsl:when test="$DateFormat=''">
                  <xsl:value-of select="SavedOn"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="dt:format-date(SavedOn,$DateFormat)"/>
                </xsl:otherwise>
              </xsl:choose>

            </td>
            <td>
              <xsl:value-of select="SavedByFirstName"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="SavedByLastName"/>
            </td>

            <td>
              <xsl:text> </xsl:text>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
   
    </xsl:template>


</xsl:stylesheet>
