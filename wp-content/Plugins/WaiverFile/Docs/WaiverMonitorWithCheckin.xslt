<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:param name="layout"></xsl:param>
  <xsl:param name="regionGenAdm"></xsl:param>
  <xsl:param name="regionEvts"></xsl:param>
  <xsl:param name="regionAdvance"></xsl:param>

  <xsl:param name="genAdmLabel"></xsl:param>

  <!-- DEFAULT TO 20 SO IT SHOWS BEFORE DLL IS UPDATED-->
  <xsl:param name="permissionLevel">20</xsl:param>
  
  <xsl:template match="/">


    <xsl:choose>
      <xsl:when test="$layout='1'">
        <xsl:call-template name="Layout1"/>
      </xsl:when>
      <xsl:when test="$layout='2'">
        <xsl:call-template name="Layout2"/>
      </xsl:when>
      <xsl:when test="$layout='3'">
        <xsl:call-template name="Layout3"/>
      </xsl:when>
      <xsl:when test="$layout='4'">
        <xsl:call-template name="Layout4"/>
      </xsl:when>
      <xsl:when test="$layout='5'">
        <xsl:call-template name="Layout5"/>
      </xsl:when>
    </xsl:choose>

  </xsl:template>


  <xsl:template name="Layout5">

    <script type="text/javascript">
      $(document).ready(function(){
      $("#monitormain").layout({
      south__size: 0.5,
      south__minSize: .1,
      south__maxSize: .9
      });


      });
    </script>

    <div id="monitormain" style="width:100%; height: 100%; min-height:400px;">
      <div class="ui-layout-center nopadding">



        <xsl:call-template name="RenderRegion">
          <xsl:with-param name="region">0</xsl:with-param>
        </xsl:call-template>

      </div>

    </div>
  </xsl:template>
  
  <xsl:template name="Layout1">

    <script type="text/javascript">
      $(document).ready(function(){
        $("#monitormain").layout({
              east__size: 0.5,
              east__minSize: .1,
              east__maxSize: .9
          });
          $("#monitorsub").layout({
              south__size: 0.5,
              south__minSize: .1,
              south__maxSize: .9
          });

      });
    </script>

    <div id="monitormain" style="width:100%; height: 100%; min-height:400px;">
      <div class="ui-layout-center nopadding">


        
        <div id="monitorsub"  style="width:100%; height: 100%; min-height:200px;">
          <div class="ui-layout-center nopadding">
            <xsl:call-template name="RenderRegion">
              <xsl:with-param name="region">0</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="ui-layout-south nopadding">
            <xsl:call-template name="RenderRegion">
              <xsl:with-param name="region">2</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>


      </div>
      <div class="ui-layout-east nopadding">
        <xsl:call-template name="RenderRegion">
          <xsl:with-param name="region">1</xsl:with-param>
        </xsl:call-template>

      </div>

    </div>
  </xsl:template>

  <xsl:template name="Layout2">

    <script type="text/javascript">
      $(document).ready(function(){
      $("#monitormain").layout({
      south__size: 0.5,
      south__minSize: .1,
      south__maxSize: .9
      });
    

      });
    </script>
    
    <div id="monitormain" style="width:100%; height: 100%; min-height:400px;">
      <div class="ui-layout-center nopadding">


        <xsl:call-template name="RenderRegion">
          <xsl:with-param name="region">0</xsl:with-param>
        </xsl:call-template>

      </div>
      <div class="ui-layout-south  nopadding">

        <xsl:call-template name="RenderRegion">
          <xsl:with-param name="region">1</xsl:with-param>
        </xsl:call-template>
      </div>

    </div>
  </xsl:template>

  <xsl:template name="Layout3">

    <script type="text/javascript">
      $(document).ready(function(){
      $("#monitormain").layout({
      east__size: 0.5,
      east__minSize: .1,
      east__maxSize: .9
      });
    

      });
    </script>
    
    <div id="monitormain" style="width:100%; height: 100%; min-height:400px;">
      <div class="ui-layout-center  nopadding">


        <xsl:call-template name="RenderRegion">
          <xsl:with-param name="region">0</xsl:with-param>
        </xsl:call-template>

      </div>
      <div class="ui-layout-east nopadding">

        <xsl:call-template name="RenderRegion">
          <xsl:with-param name="region">1</xsl:with-param>
        </xsl:call-template>
      </div>

    </div>
  </xsl:template>

  <xsl:template name="Layout4">
    <script type="text/javascript">
      $(document).ready(function(){
      $("#monitormain").layout({
      east__size: 0.5,
      east__minSize: .1,
      east__maxSize: .9
      });
      $("#monitorsub").layout({
      south__size: 0.5,
      south__minSize: .1,
      south__maxSize: .9
      });

      });
    </script>

    <div id="monitormain" style="width:100%; height: 100%; min-height:400px;">
      <div class="ui-layout-center nopadding">


        <xsl:call-template name="RenderRegion">
          <xsl:with-param name="region">0</xsl:with-param>
        </xsl:call-template>

      </div>
      <div class="ui-layout-east nopadding">

        <div id="monitorsub"  style="width:100%; height: 100%; min-height:200px;">
          <div class="ui-layout-center nopadding">
            <xsl:call-template name="RenderRegion">
              <xsl:with-param name="region">1</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="ui-layout-south nopadding">
            <xsl:call-template name="RenderRegion">
              <xsl:with-param name="region">2</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>

      </div>

    </div>
  </xsl:template>


  <xsl:template name="RenderRegion">
    <xsl:param name="region"></xsl:param>

 
    <xsl:if test="$regionGenAdm=$region">
      <xsl:call-template name="RenderGenAdm"/>
    </xsl:if>

    <xsl:if test="$regionEvts=$region">
      <xsl:call-template name="RenderEvents"/>
    </xsl:if>

    <xsl:if test="$regionAdvance=$region">
      <xsl:call-template name="RenderAdvance"/>
    </xsl:if>

  </xsl:template>

  <!-- render the actual main boxes -->
  <xsl:template name="RenderGenAdm">
      <table class="table table-condensed" id="GENADM">
        <thead>
          <tr>
            <th colspan="2">
              <h4>
                <xsl:value-of select="$genAdmLabel"/>                
              </h4>
            </th>
            <th class="groupedbox" colspan="2">
              Show
              <asp:DropDownList runat="server" id="cboShow" AutoPostBack="true">
                <asp:ListItem Value="today">Today</asp:ListItem>
                <asp:ListItem Value="past_week">Past Week</asp:ListItem>
                <asp:ListItem Value="past_month">Past Month</asp:ListItem>
                <asp:ListItem Value="100">100 Most Recent</asp:ListItem>
                <asp:ListItem Value="500">500 Most Recent</asp:ListItem>
                <asp:ListItem Value="1000">1000 Most Recent</asp:ListItem>
              </asp:DropDownList>
              <asp:CheckBox id="chkGenAdmGrouped" runat="server" AutoPostBack="true"></asp:CheckBox>
              Grouped
            </th>
            <!--<th class="form-inline">
              <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control input-sm">
                <asp:ListItem Value="0">Sort by Name</asp:ListItem>
                <asp:ListItem Value="1">Time (newest first)</asp:ListItem>
                <asp:ListItem Value="2">Time (oldest first)</asp:ListItem>
              </asp:DropDownList>
            </th>-->
            
          </tr>

          <tr>
            <th width="1%"></th>
            <th>
              <asp:LinkButton id="btnSort_GenAdm_Name"  data-sortsect="GENADM" CssClass="sort" data-sortasc="0" data-sortdesc="1" runat="server" Text="Name"/>
            </th>
            <th class="text-center">
              <asp:LinkButton id="btnSort_GenAdm_Age"  data-sortsect="GENADM" CssClass="sort" data-sortasc="4" data-sortdesc="5" runat="server" Text="Age"/>
            </th>
            <th class="text-center">
              <asp:LinkButton id="btnSort_GenAdm_Signed"  data-sortsect="GENADM" CssClass="sort" data-sortasc="3" data-sortdesc="2" runat="server" Text="Signed"/>
            </th>
          </tr>
        </thead>
        <tbody>
        <tr class="loadingrow">
          <td class="text-center" colspan="4">
            <img src="/wp-content/images/loading.gif" alt="Loading"/>
          </td>
        </tr>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="4" class="totalcell">
            </td>
          </tr>
        </tfoot>
      </table>
    
  </xsl:template>

  <!-- render the actual main boxes -->
  <xsl:template name="RenderEvents">

    <table class="table table-condensed events-table" id="{translate(WaiverEventID,'-','_')}" style="margin-bottom:1px;">
      <thead>
        <tr>
          <th>
            <h4>
              Events <small>
                <a href="/admin">
                  <i class="fa fa-refresh">
                    <xsl:text> </xsl:text>
                  </i>
                </a>
              </small>
            </h4>
          </th>
          <th class="groupedbox">
            <asp:CheckBox id="chkEventsGrouped" runat="server" AutoPostBack="true"></asp:CheckBox>
            Grouped
          </th>
        </tr>
        
      </thead>
    </table>
      
      <xsl:for-each select="/ArrayOfWaiverEvent/WaiverEvent">
      <table class="table table-condensed events-table" id="{translate(WaiverEventID,'-','_')}">
        <thead>
          <tr>
            <th colspan="4">
              <div class="pull-right" style="padding-right:5px;">

                <xsl:if test="$permissionLevel&gt;=20">
                  <a href="/admin/EditWaiverEvent.aspx?id={WaiverEventID}" style="padding-right:7px;">
                    <i class="fa fa-pencil">
                      <xsl:text> </xsl:text>
                    </i>
                    <xsl:text> Edit</xsl:text>
                  </a>
                </xsl:if>

                
                <a href="/admin/PrintEvent.aspx?id={WaiverEventID}" target="_blank">

                  <i class="fa fa-print">
                    <xsl:text> </xsl:text>
                  </i>
                  <xsl:text> Print</xsl:text>
                </a>
              </div>
              <h5>
                <a href="/admin/EventSignatures.aspx?id={WaiverEventID}">
                  <xsl:value-of select="Name"/>
                </a>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="TimeLabel"/>
              </h5>
            </th>
          </tr>
          <tr>
            <th width="1%"></th>
            <th>
              <asp:LinkButton id="btnSort_Evt_{translate(WaiverEventID,'-','_')}_Name" data-sortsect="EVT" data-eventid="{WaiverEventID}" CssClass="sort" data-sortasc="0" data-sortdesc="1" runat="server" Text="Name"/>
            </th>
            <th class="text-center">
              <asp:LinkButton id="btnSort_Evt_{translate(WaiverEventID,'-','_')}_Age"  data-sortsect="EVT" data-eventid="{WaiverEventID}" CssClass="sort" data-sortasc="4" data-sortdesc="5" runat="server" Text="Age"/>
            </th>
            <th class="text-center">
              <asp:LinkButton id="btnSort_Evt_{translate(WaiverEventID,'-','_')}_Signed"  data-sortsect="EVT" data-eventid="{WaiverEventID}" CssClass="sort" data-sortasc="3" data-sortdesc="2" runat="server" Text="Signed"/>
            </th>
          </tr>
        </thead>
        <tbody>
          <tr class="loadingrow">
            <td class="text-center" colspan="4">
              <img src="/wp-content/images/loading.gif" alt="Loading"/>
            </td>
          </tr>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="4" class="totalcell">
            </td>
          </tr>
        </tfoot>
      </table>
    </xsl:for-each>

    <xsl:if test="count(/ArrayOfWaiverEvent/WaiverEvent)=0">
      <table class="table table-condensed events-table">
        <tr>
          <td class="text-center">
            There are no upcoming events at this time.
          </td>
        </tr>

      </table>
      
    </xsl:if>
    
  </xsl:template>

  <!-- render the actual main boxes -->
  <xsl:template name="RenderAdvance">
      <table class="table table-condensed" id="ADVANCE">
        <thead>
        <tr>
          <th colspan="3">
            <h4>
              Signed in Advance
            </h4>
          </th>
          <th class="groupedbox">
            <asp:CheckBox id="chkAdvanceGrouped" runat="server" AutoPostBack="true"></asp:CheckBox>
            Grouped
          </th>
        </tr>

          <tr>
            <th width="1%"></th>
            <th>
              <asp:LinkButton id="btnSort_Advance_Name"  data-sortsect="ADVANCE" CssClass="sort" data-sortasc="0" data-sortdesc="1" runat="server" Text="Name"/>
            </th>
            <th class="text-center">
              <asp:LinkButton id="btnSort_Advance_Age" data-sortsect="ADVANCE" CssClass="sort" data-sortasc="4" data-sortdesc="5" runat="server" Text="Age"/>
            </th>
            <th class="text-center">
              <asp:LinkButton id="btnSort_Advance_Signed" data-sortsect="ADVANCE"  CssClass="sort" data-sortasc="3" data-sortdesc="2" runat="server" Text="Signed"/>
            </th>
          </tr>
        </thead>
        <tbody>
        <tr class="loadingrow">
          <td class="text-center" colspan="4">
            <img src="/wp-content/images/loading.gif" alt="Loading"/>
          </td>
        </tr>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="4" class="totalcell">
            </td>
          </tr>
        </tfoot>
      </table>
       
    
  </xsl:template>

</xsl:stylesheet>
