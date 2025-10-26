<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times"
    xmlns:cc1="remove" exclude-result-prefixes="cc1">

  <xsl:output method="xml"/>

  <xsl:template match="/">


    <div id="frame">
      <div class="content">
        <div class="messages">
          <ul>
            <xsl:for-each select="ArrayOfAnyMessage/AnyMessage">
              <li class="sent smsmsg">
                <xsl:attribute name="class">
                  
                  <xsl:choose>
                    <xsl:when test="IsOutgoing='true' and DisplayName!=''">
                      <!-- bulk sent -->
                      <xsl:text>sent bulk</xsl:text>
                    </xsl:when>
                    <xsl:when test="IsOutgoing='true'">
                      <xsl:text>sent</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>replies</xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>
                 
                </xsl:attribute>
                <img src="http://emilcarlsson.se/assets/mikeross.png" alt="">
                  <xsl:attribute name="src">
                    <xsl:choose>
                      <xsl:when test="IsOutgoing='true' and DisplayName!=''">
                        <!-- bulk sent -->
                        <xsl:text>/wp-content/Plugins/WPSMS/images/chat-user.png</xsl:text>
                      </xsl:when>
                      <xsl:when test="IsOutgoing='true'">
                        <xsl:text>/wp-content/Plugins/WPSMS/images/chat-user.png</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>/wp-content/Plugins/WPSMS/images/chat-mobile.png</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                </img>
                <p class="smsmsg"  data-smsid="{ID}" data-status="{Status}">
                  <xsl:value-of select="Message" disable-output-escaping="no"/>

                  <time datetime="{Sent}">

                    <xsl:value-of select="DisplayName"/>
                    <xsl:text> | </xsl:text>

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
                    <xsl:if test="MessageType='Direct' and IsOutgoing='true'">
                      <xsl:text> | </xsl:text>
                      <xsl:value-of select="Status"/>
                    </xsl:if>
                  </time>
                </p>
              </li>

            </xsl:for-each>

          </ul>
        </div>
      </div>
    </div>
    
   
  </xsl:template>

</xsl:stylesheet>