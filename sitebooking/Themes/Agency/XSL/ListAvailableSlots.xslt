<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://exslt.org/math"  xmlns:telerik="remove"
    version="1.0"
    xmlns:asp="remove"
    exclude-result-prefixes="math">

  <xsl:output method="html" omit-xml-declaration="yes" />


  <!-- Helper: Convert 24hr to 12hr AM/PM -->
  <xsl:template name="formatTime">
    <xsl:param name="hour" />
    <xsl:variable name="intHour" select="number($hour)" />
    <xsl:choose>
      <xsl:when test="$intHour = 0">12:00 AM</xsl:when>
      <xsl:when test="$intHour &lt; 12">
        <xsl:value-of select="$intHour" />:00 AM
      </xsl:when>
      <xsl:when test="$intHour = 12">12:00 PM</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$intHour - 12" />:00 PM
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="/">



    <div class="d-flex flex-wrap">
      <xsl:for-each select="//AvailabilitySlot">

        <xsl:variable name="slotId" select="ID" />
        <xsl:variable name="uid" select="concat('slot_', position())" />
        <xsl:variable name="start" select="substring-after(substring-before(StartTime, 'H'), 'PT')" />
        <xsl:variable name="end" select="substring-after(substring-before(EndTime, 'H'), 'PT')" />

        <input class="btn-check"
               type="radio"
               id="{$uid}"
               name="TimeSlots"
               value="{$slotId}" />

        <label class="btn btn-outline-primary m-1" for="{$uid}">
          <xsl:call-template name="formatTime">
            <xsl:with-param name="hour" select="$start" />
          </xsl:call-template>
          <xsl:if test="$start != $end">
            <xsl:text> - </xsl:text>
            <xsl:call-template name="formatTime">
              <xsl:with-param name="hour" select="$end" />
            </xsl:call-template>
          </xsl:if>
        </label>

      </xsl:for-each>
    </div>

  </xsl:template>


</xsl:stylesheet>
