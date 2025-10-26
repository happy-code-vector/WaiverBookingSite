<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times"
    xmlns:cc1="remove" exclude-result-prefixes="cc1">

  <xsl:param name="title"></xsl:param>
  <xsl:output method="xml"/>

  <xsl:template match="/">



          <xsl:for-each select="ArrayOfAnyMessage/AnyMessage">

            <xsl:variable name="currpos">
              <xsl:value-of select="position()"/>
            </xsl:variable>



            <!--only show time if previous doesnt exist or if it's more than like 5 minutes-->
            <xsl:if test="$currpos!=1 and  dt:seconds(dt:difference(/ArrayOfAnyMessage/AnyMessage[position()=($currpos - 1)]/Sent, Sent))>300">


              <div class="date">
                <xsl:value-of select="dt:month-in-year(Sent)"/>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="dt:day-in-month(Sent)"/>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="dt:year(Sent)"/>
                <xsl:text> </xsl:text>

                <xsl:choose>
                  <xsl:when test="dt:hour-in-day(Sent)&gt;12">
                    <xsl:value-of select="dt:hour-in-day(Sent)-12"/>
                    <xsl:text>:</xsl:text>
                    <xsl:value-of select="dt:minute-in-hour(Sent)"/>
                    <xsl:text> PM</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="dt:hour-in-day(Sent)"/>
                    <xsl:text>:</xsl:text>
                    <xsl:value-of select="format-number(dt:minute-in-hour(Sent),'00')"/>
                    <xsl:text> AM</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </div>

            </xsl:if>
            
            
              <xsl:choose>
                <xsl:when test="IsOutgoing='true'">
                  <div class="row">
                    <div class="message message-out pull-right smsmsg"  data-smsid="{ID}" data-status="{Status}">
                      <xsl:value-of select="Message" disable-output-escaping="no"/>
                    </div>
                  </div>
                  <xsl:if test="MessageType='Direct'">
                    <div class="row">
                      <div class="pull-right sentstatus">
                        <xsl:value-of select="Status"/>
                      </div>
                    </div>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="MessageType='Direct'">
                  <div class="row">
                    <div class="message message-in pull-left smsmsg"  data-smsid="{ID}" data-status="{Status}">
                      <xsl:value-of select="Message" disable-output-escaping="no"/>
                    </div>
                  </div>
                </xsl:when>
                <xsl:otherwise>
                  <div class="row">
                    <div class="message message-in pull-left smsmsg"  data-smsid="{ID}" data-status="{Status}">
                      <xsl:value-of select="Message" disable-output-escaping="no"/>
                    </div>
                    (<xsl:value-of select="MessageType"/>)
                  </div>
                </xsl:otherwise>
              </xsl:choose>

             

            
          </xsl:for-each>











  </xsl:template>

</xsl:stylesheet>