<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove"  xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  
  <xsl:param name="BasePath"></xsl:param>
  <xsl:template match="/">

    
    <div class="pull-right">
      <a href="/MyAccount/" target="_blank" class="btn btn-default">
      <i class="fa fa-cog">
      <xsl:text> </xsl:text>
    </i>
        <xsl:text> </xsl:text>
      Account Settings</a>
      <xsl:text> </xsl:text>
    <asp:LinkButton runat="server" ID="btnLogOut" CssClass="btn btn-default">
    <i class="fa fa-sign-out">
      <xsl:text> </xsl:text>
    </i>
    <xsl:text> </xsl:text>
    Log Out
    </asp:LinkButton>
</div>
      
      <h1>Waiver Manager Access</h1>
      
         <xsl:if test="count(/Main/WF/DataSet/diffgr:diffgram/NewDataSet/Table)!=0">
      
      <table class="table">
        <thead>
          <tr>
            <th colspan="2">Name</th>
            <th>Waiver Link</th>
            <th>View Names</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="/Main/WF/DataSet/diffgr:diffgram/NewDataSet/Table">
            <tr>
              <td>
                <xsl:value-of select="Name"/>
              </td>
            <td>
              <xsl:value-of select="ButtonText"/>
              </td>
            <td>
            <!--/Workflow.aspx?stepid=c38e8093-16be-457f-bd0a-46b2dabce5ed&formid=f4374570-d623-431e-ae40-c4c932f84ccd-->
                <a href="{$BasePath}/Workflow.aspx?stepid={stepid}" class="btn btn-primary btn-sm" target="_blank">
                  <xsl:text>Waiver Link</xsl:text>
                </a>
              </td>
              <td>
                <a href="{$BasePath}/Manager/ViewWorkflow.aspx?stepid={stepid}" class="btn btn-primary btn-sm">
                  <xsl:text>View Names</xsl:text>
                </a>
              </td>
            
            </tr>
          
          </xsl:for-each>
        
        </tbody>
      </table>
          
    </xsl:if>
    
   
      
          
    <xsl:if test="count(/Main/Events/ArrayOfWaiverEvent/WaiverEvent)!=0">

      

      <table class="table">
        <thead>
          <tr>
            <th>Event Name</th>
            <th>Date/Time</th>
            <th>Waiver Link</th>
            <th>View Attendees</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="/Main/Events/ArrayOfWaiverEvent/WaiverEvent">

            <tr>
              <td>
                <xsl:value-of select="Name"/>
              </td>
              <td>




                <xsl:choose>
                  <xsl:when test="IsAllDay='true'">
                    <xsl:choose>
                      <xsl:when test="DateStart=DateEnd">
                        <xsl:value-of select="dt:format-date(DateStart,'MMM d')"/>
                        <br/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="dt:format-date(DateStart,'MMM d')"/>
                        <xsl:text> to </xsl:text>
                        <xsl:value-of select="dt:format-date(DateEnd,'MMM d')"/>

                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:when>
                  <xsl:when test="DateStart=DateEnd">
                    <xsl:value-of select="dt:format-date(DateStart,'MMMM d, yyyy h:mm a')"/>
                  </xsl:when>
                  <xsl:when test="dt:hour-in-day(DateStart)=0 and dt:hour-in-day(DateEnd)=0">
                    <xsl:value-of select="dt:format-date(DateStart,'MMMM d')"/>
                    <xsl:text> to </xsl:text>
                    <xsl:value-of select="dt:format-date(DateEnd,'MMMM d, yyyy')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="dt:day-in-month(DateStart) = dt:day-in-month(DateEnd) and dt:month-in-year(DateStart) = dt:month-in-year(DateEnd)">
                        <xsl:value-of select="dt:format-date(DateStart,'MMMM d, yyyy h:mm a')"/>
                        <xsl:text> - </xsl:text>
                        <xsl:value-of select="dt:format-date(DateEnd,'h:mm a')"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="dt:format-date(DateStart,'MMMM d, yyyy h:mm a')"/>
                        <xsl:text> to </xsl:text>
                        <xsl:value-of select="dt:format-date(DateEnd,'MMMM d, yyyy h:mm a')"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>



              </td>
              <td>
                <a href="{$BasePath}/Waiver.aspx?id={WaiverEventID}" class="btn btn-primary btn-sm"  target="_blank">
                  <xsl:text>Event Waiver Link</xsl:text>
                </a>
              </td>
              <td>
                <a href="{$BasePath}/Manager/ViewEvent.aspx?id={WaiverEventID}" class="btn btn-primary btn-sm">
                  <xsl:text>View Attendees</xsl:text>
                </a>
              </td>
            </tr>




          </xsl:for-each>
        </tbody>
      </table>

    </xsl:if>

  

  </xsl:template>
</xsl:stylesheet>
