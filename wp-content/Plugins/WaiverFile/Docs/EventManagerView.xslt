<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>



  <xsl:template match="/">

   

    <style type="text/css">
      p.breakhere {page-break-before: always}
    </style>


    <xsl:for-each select="set:distinct(//WaiverEvent/WaiverEventID)">
      <xsl:variable name="evtid">
        <xsl:value-of select="."/>
      </xsl:variable>
      <xsl:variable name="combined">

        <data>
          <!--
          <xsl:for-each select="//WaiverParticipant[../../WaiverEvent/WaiverEventID=$evtid and IsCheckedIn='true']">
            <part>
              <ParticipantName>
                <xsl:value-of select="ParticipantName"/>
              </ParticipantName>
              <ParticipantNameFirst>
                <xsl:value-of select="ParticipantNameFirst"/>
              </ParticipantNameFirst>
              <SignedNameFirst>
                <xsl:value-of select="../../SignedNameFirst"/>
              </SignedNameFirst>
              <SignedName>
                <xsl:value-of select="../../SignedName"/>
              </SignedName>
              <date>
                <xsl:value-of select="dt:month-abbreviation(../../DateSigned)"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="dt:day-in-month(../../DateSigned)"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="dt:year(../../DateSigned)"/>
              </date>

            </part>
          </xsl:for-each>-->
          <xsl:for-each select="/WaiverEvent/ExtraParticipants/WaiverParticipantEvent[IsCheckedIn='true']/Participant">
            <part>
              <ParticipantName>
                <xsl:value-of select="ParticipantName"/>
              </ParticipantName>
              <ParticipantNameFirst>
                <xsl:value-of select="ParticipantNameFirst"/>
              </ParticipantNameFirst>
              <SignedNameFirst>
                <xsl:value-of select="../SignedByNameFirst"/>
              </SignedNameFirst>
              <SignedName>
                <xsl:value-of select="../SignedByName"/>
              </SignedName>
              <date>
                <xsl:value-of select="dt:month-abbreviation(../DateSaved)"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="dt:day-in-month(../DateSaved)"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="dt:year(../DateSaved)"/>
              </date>

            </part>
          </xsl:for-each>

        </data>

      </xsl:variable>

      <xsl:variable name="combined2">

        <data>
          <!--<xsl:for-each select="//WaiverParticipant[../../WaiverEvent/WaiverEventID=$evtid and IsCheckedIn!='true']">
            <part>
              <ParticipantName>
                <xsl:value-of select="ParticipantName"/>
              </ParticipantName>
              <ParticipantNameFirst>
                <xsl:value-of select="ParticipantNameFirst"/>
              </ParticipantNameFirst>
              <SignedNameFirst>
                <xsl:value-of select="../../SignedNameFirst"/>
              </SignedNameFirst>
              <SignedName>
                <xsl:value-of select="../../SignedName"/>
              </SignedName>
              <date>
                <xsl:value-of select="dt:month-abbreviation(../../DateSigned)"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="dt:day-in-month(../../DateSigned)"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="dt:year(../../DateSigned)"/>
              </date>

            </part>
          </xsl:for-each>-->
          <xsl:for-each select="/WaiverEvent/ExtraParticipants/WaiverParticipantEvent[IsCheckedIn!='true']/Participant">
            <part>
              <ParticipantName>
                <xsl:value-of select="ParticipantName"/>
              </ParticipantName>
              <ParticipantNameFirst>
                <xsl:value-of select="ParticipantNameFirst"/>
              </ParticipantNameFirst>
              <SignedNameFirst>
                <xsl:value-of select="../SignedByNameFirst"/>
              </SignedNameFirst>
              <SignedName>
                <xsl:value-of select="../SignedByName"/>
              </SignedName>
              <date>
                <xsl:value-of select="dt:month-abbreviation(../DateSaved)"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="dt:day-in-month(../DateSaved)"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="dt:year(../DateSaved)"/>
              </date>

            </part>
          </xsl:for-each>

        </data>

      </xsl:variable>


      <h3>
        <xsl:value-of select="//WaiverEvent[WaiverEventID=$evtid]/Name"/>
        <xsl:text> - </xsl:text>


        <xsl:choose>
          <xsl:when test="//WaiverEvent[WaiverEventID=$evtid]/IsAllDay='true'">
            <xsl:choose>
              <xsl:when test="//WaiverEvent[WaiverEventID=$evtid]/DateStart=//WaiverEvent[WaiverEventID=$evtid]/DateEnd">
                <xsl:value-of select="dt:format-date(//WaiverEvent[WaiverEventID=$evtid]/DateStart,'MMM d, yyyy')"/>
                <br/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="dt:format-date(//WaiverEvent[WaiverEventID=$evtid]/DateStart,'MMM d, yyyy')"/>
                <xsl:text> to </xsl:text>
                <xsl:value-of select="dt:format-date(//WaiverEvent[WaiverEventID=$evtid]/DateEnd,'MMM d, yyyy')"/>

              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="//WaiverEvent[WaiverEventID=$evtid]/DateStart=//WaiverEvent[WaiverEventID=$evtid]/DateEnd">
            <xsl:value-of select="dt:format-date(//WaiverEvent[WaiverEventID=$evtid]/DateStart,'MMMM d, yyyy h:mm a')"/>
          </xsl:when>
          <xsl:when test="dt:hour-in-day(//WaiverEvent[WaiverEventID=$evtid]/DateStart)=0 and dt:hour-in-day(//WaiverEvent[WaiverEventID=$evtid]/DateEnd)=0">
            <xsl:value-of select="dt:format-date(//WaiverEvent[WaiverEventID=$evtid]/DateStart,'MMMM d')"/>
            <xsl:text> to </xsl:text>
            <xsl:value-of select="dt:format-date(//WaiverEvent[WaiverEventID=$evtid]/DateEnd,'MMMM d, yyyy')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="dt:day-in-month(//WaiverEvent[WaiverEventID=$evtid]/DateStart) = dt:day-in-month(//WaiverEvent[WaiverEventID=$evtid]/DateEnd) and dt:month-in-year(//WaiverEvent[WaiverEventID=$evtid]/DateStart) = dt:month-in-year(//WaiverEvent[WaiverEventID=$evtid]/DateEnd)">
                <xsl:value-of select="dt:format-date(//WaiverEvent[WaiverEventID=$evtid]/DateStart,'MMMM d, yyyy h:mm a')"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="dt:format-date(//WaiverEvent[WaiverEventID=$evtid]/DateEnd,'h:mm a')"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="dt:format-date(//WaiverEvent[WaiverEventID=$evtid]/DateStart,'MMMM d, yyyy h:mm a')"/>
                <xsl:text> to </xsl:text>
                <xsl:value-of select="dt:format-date(//WaiverEvent[WaiverEventID=$evtid]/DateEnd,'MMMM d, yyyy h:mm a')"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>


        <a href="Default.aspx" class="btn btn-primary pull-right">Back to List</a>
      </h3>


      <div class="row">

        <xsl:if test="count(msxsl:node-set($combined)/data/part)!=0">
          <div class="col-sm-6">
            <h4>Waiver Signed and Checked In</h4>
            <table class="table table-condensed">
              <thead>
                <tr>
                  <th>Participant</th>
                  <th>Signed By</th>
                  <th>Date Signed</th>
                </tr>
              </thead>
              <tbody>





                <xsl:for-each select="msxsl:node-set($combined)/data/part">
                  <xsl:sort select="ParticipantName"/>
                  <xsl:sort select="ParticipantNameFirst"/>
                  <tr>
                    <td>
                      <xsl:value-of select="ParticipantNameFirst"/>
                      <xsl:if test="ParticipantNameFirst!=''">
                        <xsl:text> </xsl:text>
                      </xsl:if>
                      <xsl:value-of select="ParticipantName"/>
                    </td>
                    <td>
                      <xsl:value-of select="SignedNameFirst"/>
                      <xsl:if test="SignedNameFirst!=''">
                        <xsl:text> </xsl:text>
                      </xsl:if>
                      <xsl:value-of select="SignedName"/>
                    </td>
                    <td>
                      <xsl:value-of select="date"/>
                    </td>
                  </tr>
                </xsl:for-each>



              </tbody>
              <tfoot>
                <tr>
                  <td colspan="3">

                    <strong>
                      Count: <xsl:value-of select="count(msxsl:node-set($combined)/data/part)"/>
                    </strong>
                  </td>
                </tr>
              </tfoot>
            </table>


          </div>
        </xsl:if>

        <xsl:if test="count(//WaiverParticipant[../../WaiverEvent/WaiverEventID=$evtid and IsCheckedIn!='true'])!=0">
          <div class="col-sm-6">
            <xsl:if test="count(msxsl:node-set($combined)/data/part)!=0">
              <h4>Waiver Signed, Not Yet Checked In</h4>
            </xsl:if>
            <table class="table table-condensed">
              <thead>
                <tr>
                  <th>Participant</th>
                  <th>Signed By</th>
                  <th>Date Signed</th>
                </tr>
              </thead>
              <tbody>





                <xsl:for-each select="msxsl:node-set($combined2)/data/part">
                  <xsl:sort select="ParticipantName"/>
                  <xsl:sort select="ParticipantNameFirst"/>
                  <tr>
                    <td>
                      <xsl:value-of select="ParticipantNameFirst"/>
                      <xsl:if test="ParticipantNameFirst!=''">
                        <xsl:text> </xsl:text>
                      </xsl:if>
                      <xsl:value-of select="ParticipantName"/>
                    </td>
                    <td>
                      <xsl:value-of select="SignedNameFirst"/>
                      <xsl:if test="SignedNameFirst!=''">
                        <xsl:text> </xsl:text>
                      </xsl:if>
                      <xsl:value-of select="SignedName"/>
                    </td>
                    <td>
                      <xsl:value-of select="date"/>
                    </td>
                  </tr>
                </xsl:for-each>


              </tbody>
              <tfoot>
                <tr>
                  <td colspan="3">

                    <strong>
                      Count: <xsl:value-of select="count(msxsl:node-set($combined2)/data/part)"/>
                    </strong>
                  </td>
                </tr>
              </tfoot>
            </table>
          </div>
        </xsl:if>

      </div>

      <div class="row">
        <div class="col-xs-12">
          <br/>
          <br/>

          <strong>
            Total Participants:
            <xsl:value-of select="count(msxsl:node-set($combined)/data/part) + count(msxsl:node-set($combined2)/data/part)"/>
          </strong>
        </div>
      </div>

    </xsl:for-each>


  </xsl:template>
</xsl:stylesheet>
