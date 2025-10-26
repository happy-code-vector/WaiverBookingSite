<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="ShowMore"></xsl:param>
  <xsl:param name="Today"></xsl:param>
  <xsl:param name="Tomorrow"></xsl:param>
  <xsl:param name="DayCutoffHour"></xsl:param><!-- the hour that the day ends. might not be midnight. -->
  <xsl:param name="catid"></xsl:param>
  <xsl:param name="MaxedOutMessage">Event is full</xsl:param>

  
  <xsl:param name="WorkflowStepID"></xsl:param>
  <xsl:template match="/">


    
    <xsl:for-each select="/ArrayOfWaiverEventGroup/WaiverEventGroup">

      <div class="event-group">
      <h3>
        <xsl:value-of select="Heading"/>
      </h3>

      

          <xsl:for-each select="Items/WaiverEvent">



            <div class="col-sm-6 col-md-4">

              <xsl:choose>
                <xsl:when test="MaxParts!='' and MaxParts!='-1' and SpotsRemaining!='' and SpotsRemaining &lt;=0">
                  <div class="event maxedout">

                    <xsl:apply-templates select="." mode="inner">
                    </xsl:apply-templates>

                  </div>
                </xsl:when>
                <xsl:otherwise>
                  <a href="" class="event">

                    <xsl:attribute name="href">
                      <xsl:choose>
                        <xsl:when test="MaxParts!='' and MaxParts!='-1' and SpotsRemaining!='' and SpotsRemaining &lt;=0">
                          <!-- sold out -->
                          <xsl:text>#</xsl:text>
                        </xsl:when>
                        <xsl:when test="$WorkflowStepID!=''">
                          <xsl:text>Workflow.aspx?stepid=</xsl:text>
                          <xsl:value-of select="$WorkflowStepID"/>
                          <xsl:text>&amp;eventid=</xsl:text>
                          <xsl:value-of select="WaiverEventID"/>
                        </xsl:when>


                        <xsl:when test="NumWaiverForms=1">
                          <xsl:text>Waiver.aspx?id=</xsl:text>
                          <xsl:value-of select="WaiverEventID"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:text>ChooseWaiver.aspx?eventid=</xsl:text>
                          <xsl:value-of select="WaiverEventID"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <xsl:if test="MaxParts!='' and MaxParts!='-1' and SpotsRemaining!='' and SpotsRemaining &lt;=0">
                      <xsl:attribute name="class">
                        event maxedout
                      </xsl:attribute>
                    </xsl:if>


                    <xsl:apply-templates select="." mode="inner">

                    </xsl:apply-templates>

                  </a>
                </xsl:otherwise>
              </xsl:choose>

            </div>
          </xsl:for-each>

       
        
        <div class="clear">
          <xsl:text> </xsl:text>
        </div>
      </div>
    </xsl:for-each>
    
  
    <xsl:if test="count(/ArrayOfWaiverEventGroup/WaiverEventGroup/Items/WaiverEvent)=0">
      
      <div class="row">
        <div class="container">
          <p>
            
              Sorry, we have no upcoming events scheduled
            
          </p>
        </div>
      </div>
      
    </xsl:if>

    <xsl:if test="$ShowMore='True'">
      <div class="row">
        <div class="container">
          <p>
    <a href="?action=showmore" class="btn btn-primary">
      <xsl:if test="$catid!=''">
        <xsl:attribute name="href">
          <xsl:text>?action=showmore&amp;catid=</xsl:text>
          <xsl:value-of select="$catid"/>
        </xsl:attribute>
      </xsl:if>
      Show more events</a>
          </p>
        </div>
      </div>
    </xsl:if>


  </xsl:template>
  
  <xsl:template match="*" mode="inner">
    <span class="evt-datepart">

      <xsl:variable name="EventDurationInHours">
        <xsl:value-of select="dt:seconds(dt:difference(DateStart, DateEnd)) div 3600 "></xsl:value-of>
      </xsl:variable>


      <xsl:choose>
        <xsl:when test="IsAllDay='true'">
          <xsl:choose>
            <xsl:when test="DateStart=DateEnd">
              <xsl:value-of select="dt:format-date(DateStart,'MMM d')"/>
              <br/>
            </xsl:when>
            <xsl:otherwise>
              <span class="evt-ln-3">
                <span class="evt-ln">
                  <xsl:value-of select="dt:format-date(DateStart,'MMM d')"/>
                </span>
                <span class="evt-to">to</span>
                <span class="evt-ln">
                  <xsl:value-of select="dt:format-date(DateEnd,'MMM d')"/>
                </span>
              </span>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="DateStart=DateEnd">
          <span class="evt-ln-3">
            <span class="evt-ln">
              <xsl:value-of select="dt:format-date(DateStart,'h:mm a')"/>
            </span>
          </span>
        </xsl:when>
        <xsl:when test="dt:hour-in-day(DateStart)=0 and dt:hour-in-day(DateEnd)=0">
          <span class="evt-ln-3">
            <span class="evt-ln">
              <xsl:value-of select="dt:format-date(DateStart,'MMM d')"/>
            </span>
            <span class="evt-to">to</span>
            <span class="evt-ln">
              <xsl:value-of select="dt:format-date(DateEnd,'MMM d')"/>
            </span>
          </span>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="dt:day-in-month(DateStart) = dt:day-in-month(DateEnd) and dt:month-in-year(DateStart) = dt:month-in-year(DateEnd)">
              <span class="evt-ln-3">
                <span class="evt-ln">
                  <xsl:value-of select="dt:format-date(DateStart,'h:mm a')"/>
                </span>
                <span class="evt-to">to</span>
                <span class="evt-ln">
                  <xsl:value-of select="dt:format-date(DateEnd,'h:mm a')"/>
                </span>

              </span>
            </xsl:when>
            <xsl:otherwise>
              <span class="evt-ln-3">
                <span class="evt-ln">
                  <xsl:value-of select="dt:format-date(DateStart,'MMM d h:mm a')"/>
                </span>
                <span class="evt-to">to</span>
                <span class="evt-ln">
                  <xsl:value-of select="dt:format-date(DateEnd,'MMM d h:mm a')"/>
                </span>
              </span>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
      <!-- previous  code 
                  <xsl:choose>

                    <xsl:when test="$EventDurationInHours&gt;8">
                      <span class="evt-ln-3">
                        <xsl:choose>
                          <xsl:when test="dt:hour-in-day(DateStart)=0 and dt:hour-in-day(DateEnd)=0">

                            <span class="evt-ln">
                              <xsl:value-of select="dt:format-date(DateStart,'MMM d')"/>
                            </span>
                            <span class="evt-to">to</span>
                            <span class="evt-ln">
                              <xsl:value-of select="dt:format-date(DateEnd,'MMM d')"/>
                            </span>
                          </xsl:when>
                          <xsl:otherwise>
                            <span class="evt-ln">
                              <xsl:value-of select="dt:format-date(DateStart,'MMMM d, yyyy h:mm a')"/>
                            </span>
                            <span class="evt-to">to</span>
                            <span class="evt-ln">
                              <xsl:value-of select="dt:format-date(DateEnd,'MMMM d, yyyy h:mm a')"/>
                            </span>

                          </xsl:otherwise>
                        </xsl:choose>
                      </span>
                    </xsl:when>
                    <xsl:when test="$EventDurationInHours &gt; 0">
                      <span class="evt-ln-3">
                        <span class="evt-ln">
                          <xsl:value-of select="dt:format-date(DateStart,'h:mm a')"/>
                        </span>
                        <span class="evt-to">to</span>
                        <span class="evt-ln">
                          <xsl:value-of select="dt:format-date(DateEnd,'h:mm a')"/>
                        </span>
                      </span>
                    </xsl:when>
                    <xsl:otherwise>
                      <span class="evt-ln-2">
                        <span class="evt-ln">
                          <xsl:value-of select="dt:format-date(DateStart,'h:mm')"/>
                        </span>
                        <span class="evt-ln">
                          <xsl:value-of select="dt:format-date(DateStart,'a')"/>
                        </span>
                      </span>
                    </xsl:otherwise>
                  </xsl:choose>
-->

    </span>
    <!-- <xsl:value-of select="dt:format-date(DateStart,'h:mm a')"/> -->
    <span href="" class="evt-main">

      <xsl:value-of select="Name"/>
      <xsl:if test="Settings/Location!=''">
        <br/>
        <span class="evtlocation">
          <xsl:value-of select="Settings/Location"/>
        </span>
      </xsl:if>
      <xsl:if test="MaxParts!='' and MaxParts!='-1' and SpotsRemaining!='' and SpotsRemaining &lt;=0">
        <br/>
        <span class="maxedout">
          <xsl:value-of select="$MaxedOutMessage"/>
        </span>
      </xsl:if>
    </span>
  </xsl:template>
</xsl:stylesheet>
