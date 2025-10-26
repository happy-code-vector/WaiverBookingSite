<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:param name="regionGenAdm"></xsl:param>
  <xsl:param name="regionEvts"></xsl:param>
  <xsl:param name="regionAdvance"></xsl:param>

  <xsl:param name="genAdmLabel"></xsl:param>

  <!-- DEFAULT TO 20 SO IT SHOWS BEFORE DLL IS UPDATED-->
  <xsl:param name="permissionLevel">20</xsl:param>
  
  <xsl:template match="/">
    
    <!--  <xsl:copy-of select="/"/> -->
    
    <xsl:variable name="layout">
      <xsl:value-of select="/Dashboard/SettingsXml/Settings/setting[@key='DASH_LAYOUT']/@value"/>
    </xsl:variable>
     
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
      $("#dashmain").layout({
      south__size: 0.5,
      south__minSize: .1,
      south__maxSize: .9
      });


      });
    </script>

    <div id="dashmain" style="width:100%; height: 100%; min-height:400px;">
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
        $("#dashmain").layout({
              east__size: 0.5,
              east__minSize: .1,
              east__maxSize: .9
          });
          $("#dashsub").layout({
              south__size: 0.5,
              south__minSize: .1,
              south__maxSize: .9
          });

      });
    </script>

    <div id="dashmain" style="width:100%; height: 100%; min-height:400px;">
      <div class="ui-layout-center nopadding">


        
        <div id="dashsub"  style="width:100%; height: 100%; min-height:200px;">
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
      $("#dashmain").layout({
      south__size: 0.5,
      south__minSize: .1,
      south__maxSize: .9
      });
    

      });
    </script>
    
    <div id="dashmain" style="width:100%; height: 100%; min-height:400px;">
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
      $("#dashmain").layout({
      east__size: 0.5,
      east__minSize: .1,
      east__maxSize: .9
      });
    

      });
    </script>
    
    <div id="dashmain" style="width:100%; height: 100%; min-height:400px;">
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
      $("#dashmain").layout({
      east__size: 0.5,
      east__minSize: .1,
      east__maxSize: .9
      });
      $("#dashsub").layout({
      south__size: 0.5,
      south__minSize: .1,
      south__maxSize: .9
      });

      });
    </script>

    <div id="dashmain" style="width:100%; height: 100%; min-height:400px;">
      <div class="ui-layout-center nopadding">


        <xsl:call-template name="RenderRegion">
          <xsl:with-param name="region">0</xsl:with-param>
        </xsl:call-template>

      </div>
      <div class="ui-layout-east nopadding">

        <div id="dashsub"  style="width:100%; height: 100%; min-height:200px;">
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

    

    <xsl:for-each select="/Dashboard/Boxes/DashboardBox[Placeholder=$region]">

      <table width="100%" border="0" cellpadding="3" cellspacing="0" data-dashboxid="{ID}" data-includecheckin="{SettingsXml/data/settings/setting[@key='INCLUDE_CHECKIN']/@value}">
        <xsl:attribute name="class">
          <xsl:text>table table-condensed dashbox dashboxhead </xsl:text>
          <xsl:choose>
            <xsl:when test="DataType='General_admission'">
              <xsl:text> GENADM</xsl:text>
            </xsl:when>
            <xsl:when test="DataType='Events'">
              <xsl:text> EVENTS</xsl:text>
            </xsl:when>
            <xsl:when test="DataType='Signed_in_advance'">
              <xsl:text> SIA</xsl:text>
            </xsl:when>
          </xsl:choose>
        </xsl:attribute>
        <thead>
        <tr>
          <th>
            <h4>
              <xsl:choose>
                <xsl:when test="DataType='General_admission'">
                  <xsl:value-of select="$genAdmLabel"/>
                </xsl:when>
                <xsl:when test="DataType='Events'">
                  <xsl:text>Events</xsl:text>
                </xsl:when>
                <xsl:when test="DataType='Signed_in_advance'">
                  <xsl:text>Signed in Advance</xsl:text>
                </xsl:when>
              </xsl:choose>
            </h4>
          </th>
          <xsl:variable name="selectedShow">
            <xsl:value-of select="SettingsXml/data/settings/setting[@key='SHOW']/@value"/>
          </xsl:variable>
          <th style="text-align:right;">
            <xsl:choose>
              <xsl:when test="DataType='General_admission'">
                Show
              
                
                <select class="cboShow">
                  <option value="today">
                    <xsl:if test="$selectedShow='today'">
                      <xsl:attribute name="selected">selected</xsl:attribute>
                    </xsl:if>
                    <xsl:text>Today</xsl:text>
                  </option>
                  <option value="past_week">
                    <xsl:if test="$selectedShow='past_week'">
                      <xsl:attribute name="selected">selected</xsl:attribute>
                    </xsl:if>
                    <xsl:text>Past Week</xsl:text>
                  </option>
                <option value="past_month">
                    <xsl:if test="$selectedShow='past_month'">
                      <xsl:attribute name="selected">selected</xsl:attribute>
                    </xsl:if>
                    <xsl:text>Past Month</xsl:text>
                  </option>
                <option value="100">
                  <!-- defailt option -->
                    <xsl:if test="$selectedShow='100' or $selectedShow=''">
                      <xsl:attribute name="selected">selected</xsl:attribute>
                    </xsl:if>
                    <xsl:text>100 Most Recent</xsl:text>
                  </option>
              <option value="500">
                    <xsl:if test="$selectedShow='500'">
                      <xsl:attribute name="selected">selected</xsl:attribute>
                    </xsl:if>
                    <xsl:text>500 Most Recent</xsl:text>
                  </option>
                    <option value="1000">
                    <xsl:if test="$selectedShow='1000'">
                      <xsl:attribute name="selected">selected</xsl:attribute>
                    </xsl:if>
                    <xsl:text>1000 Most Recent</xsl:text>
                  </option>
                  
                
                </select>
              
                
              
              </xsl:when>
              <xsl:when test="DataType='Events'">
              </xsl:when>
              <xsl:when test="DataType='Signed_in_advance'">
                Attending
                
                   <select class="cboShow">
                  <option value="today">
                    <xsl:if test="$selectedShow='today'">
                      <xsl:attribute name="selected">selected</xsl:attribute>
                    </xsl:if>
                    <xsl:text>Today</xsl:text>
                  </option>
                  <option value="tomorrow">
                    <xsl:if test="$selectedShow='tomorrow'">
                      <xsl:attribute name="selected">selected</xsl:attribute>
                    </xsl:if>
                    <xsl:text>Tomorrow</xsl:text>
                  </option>
                <option value="yesterday">
                    <xsl:if test="$selectedShow='yesterday'">
                      <xsl:attribute name="selected">selected</xsl:attribute>
                    </xsl:if>
                    <xsl:text>Yesterday</xsl:text>
                  </option>
               
                
                </select>
                        
                   
              </xsl:when>
            </xsl:choose>
            <asp:CheckBox id="chkGrouped{translate(ID,'-','_')}" runat="server" CssClass="chkGrouped">
              <xsl:if test="SettingsXml/data/settings/setting[@key='GROUPED']/@value='True'">
                <xsl:attribute name="Checked">True</xsl:attribute>
              </xsl:if>
            </asp:CheckBox>
            Grouped
          </th>
        </tr>
        </thead>
      </table>
      
      <div class="ui-layout-content">
        
     <xsl:variable name="numcols">
      <xsl:choose>
        <xsl:when test="SettingsXml/data/settings/setting[@key='INCLUDE_CHECKIN']/@value='True'">
          <xsl:value-of select="count(ColumnsXml/ArrayOfDashColumn/DashColumn) + 1"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="count(ColumnsXml/ArrayOfDashColumn/DashColumn)"/>
        </xsl:otherwise>
      </xsl:choose>
      </xsl:variable>

      
      <table class="" data-dashboxid="{ID}" data-dashboxtype="{DataType}" 
             data-pagesize="{SettingsXml/data/settings/setting[@key='PAGESIZE']/@value}"
             data-pageidx="{PageIdx}" 
             data-grouped="{Grouped}" 
             data-includecheckin="{SettingsXml/data/settings/setting[@key='INCLUDE_CHECKIN']/@value}" >
        <xsl:attribute name="class">
          <xsl:text>table table-condensed dashbox dashboxmain </xsl:text>
          <xsl:choose>
            <xsl:when test="DataType='General_admission'">
              <xsl:text> GENADM</xsl:text>
            </xsl:when>
            <xsl:when test="DataType='Events'">
              <xsl:text> EVENTS</xsl:text>
            </xsl:when>
            <xsl:when test="DataType='Signed_in_advance'">
              <xsl:text> SIA</xsl:text>
            </xsl:when>
          </xsl:choose>
        </xsl:attribute>
        <thead>
          

          <tr>
            <xsl:if test="DataType='Events'">
              <xsl:attribute name="class">dashboxeventhead</xsl:attribute>
            </xsl:if>
            <xsl:if test="SettingsXml/data/settings/setting[@key='INCLUDE_CHECKIN']/@value='True'">
            <th width="1%"></th>
            </xsl:if>

            <xsl:for-each select="ColumnsXml/ArrayOfDashColumn/DashColumn[FieldName!='waiverLink' and FieldName!='IsCheckedIn']">
              <xsl:variable name="fieldName">
                <xsl:value-of select="FieldName"/>
              </xsl:variable>
              <!-- not sure if sortidx is correct below. check it. -->
              <th >
                <a href="javascript:void(0);" data-fieldname="{FieldName}" data-sortdirection="{../../../ColumnSort/DashColSort[FieldName=$fieldName]/SortDirection}" title="{HeaderText}">
                  <xsl:attribute name="class">
                    <xsl:text>dashsort sort </xsl:text>
                    <xsl:choose>
                      <xsl:when test="../../../ColumnSort/DashColSort[position()=1 and FieldName=$fieldName]/SortDirection='Ascending'">sortactive sortasc</xsl:when>
                      <xsl:when test="../../../ColumnSort/DashColSort[position()=1 and FieldName=$fieldName]/SortDirection='Descending'">sortactive sortdesc</xsl:when>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:choose>
                    <xsl:when test="string-length(HeaderText) &gt; 25">
                      <xsl:value-of select="substring(HeaderText,1,22)"/>
                      <xsl:text>...</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="HeaderText"/>
                    </xsl:otherwise>
                  </xsl:choose>
                  
                </a>
              </th>
            </xsl:for-each>

          <xsl:if test="ColumnsXml/ArrayOfDashColumn/DashColumn[FieldName='waiverLink']">
            <th>
              View Waiver
            </th>
          
            </xsl:if>
          
          </tr>
        </thead>
        <tbody>
          <xsl:if test="DataType!='Events'">
            <xsl:attribute name="class">dashboxbody</xsl:attribute>
          </xsl:if>
          <tr class="loadingrow">
            <td class="text-center" colspan="{$numcols}">
              <img src="/wp-content/images/loading.gif" alt="Loading"/>
            </td>
          </tr>
          <xsl:choose>
            <xsl:when test="DataType='Events'">
              
            
            
            </xsl:when>
             <xsl:otherwise>
               <tr class="norecordsrow" style="display:none;">
            <td class="text-center" colspan="{$numcols}">
              <em>No waivers yet...</em>
            </td>
          </tr>
             
          </xsl:otherwise>
          </xsl:choose>
         
        </tbody>
        
      </table>
      
      </div>

      <xsl:if test="DataType!='Events'">
        <div class="dashboxfooter" data-dashboxid="{ID}">
          <xsl:attribute name="class">
            <xsl:text>dashboxfooter </xsl:text>
            <xsl:choose>
              <xsl:when test="DataType='General_admission'">
                <xsl:text> GENADM</xsl:text>
              </xsl:when>
              <xsl:when test="DataType='Events'">
                <xsl:text> EVENTS</xsl:text>
              </xsl:when>
              <xsl:when test="DataType='Signed_in_advance'">
                <xsl:text> SIA</xsl:text>
              </xsl:when>
            </xsl:choose>
          </xsl:attribute>


        </div>
      </xsl:if>
      
    </xsl:for-each>

   
    
  </xsl:template>

  
</xsl:stylesheet>
