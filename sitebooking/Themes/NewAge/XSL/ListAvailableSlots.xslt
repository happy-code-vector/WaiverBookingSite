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

    <div class="container my-4">
      <h4 class="mb-4 text-gradient">
        <i class="ci-clock me-2"></i>Select a Time Slot
      </h4>
      
      <div class="row g-3">
        <xsl:for-each select="//AvailabilitySlot">

          <xsl:variable name="slotId" select="ID" />
          <xsl:variable name="uid" select="concat('slot_', position())" />
          <xsl:variable name="start" select="substring-after(substring-before(StartTime, 'H'), 'PT')" />
          <xsl:variable name="end" select="substring-after(substring-before(EndTime, 'H'), 'PT')" />

          <div class="col-6 col-md-4 col-lg-3">
            <input class="btn-check"
                   type="radio"
                   id="{$uid}"
                   name="TimeSlots"
                   value="{$slotId}" />

            <label class="btn btn-outline-primary w-100 py-3 d-flex flex-column align-items-center time-slot-btn" for="{$uid}">
              <i class="ci-clock fs-4 mb-2"></i>
              <div class="fw-bold">
                <xsl:call-template name="formatTime">
                  <xsl:with-param name="hour" select="$start" />
                </xsl:call-template>
              </div>
              <xsl:if test="$start != $end">
                <div class="small text-muted">to</div>
                <div class="fw-bold">
                  <xsl:call-template name="formatTime">
                    <xsl:with-param name="hour" select="$end" />
                  </xsl:call-template>
                </div>
              </xsl:if>
            </label>
          </div>

        </xsl:for-each>
      </div>
    </div>

  </xsl:template>


</xsl:stylesheet>
