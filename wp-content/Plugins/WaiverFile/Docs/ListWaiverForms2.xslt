<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>
  
  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="BaseUrlAbsolute"></xsl:param>


  <xsl:template match="/">

    
    <h3>
      Waiver Forms
<a href="{$BasePathRelative}/admin/SetupNew2.aspx" class="btn btn-primary pull-right" style="margin-bottom:10px;">
      <i class="fa fa-plus-circle"></i> New Waiver Form
    </a>
    </h3>
    
    
    <xsl:if test="count(ArrayOfWaiverForm/WaiverForm[Status='Active'])=0">
      <div class="WPERR_Information">Looks like you don't have any active waiver forms! <a href="{$BasePathRelative}/admin/SetupNew2.aspx">Create a form here</a>
    </div>
    </xsl:if>


    <xsl:if test="count(ArrayOfWaiverForm/WaiverForm[Status='Active'])>0 and count(ArrayOfWaiverForm/WaiverForm[Status='Disabled'])>0 ">
    
    </xsl:if>
    <div class="row">
    <xsl:for-each select="ArrayOfWaiverForm/WaiverForm[Status='Active']">
      <xsl:sort select="Name"/>
      <xsl:call-template name="RenderForm">
        <xsl:with-param name="id">
          <xsl:value-of select="ID"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    </div>
    



    <xsl:if test="count(ArrayOfWaiverForm/WaiverForm[Status='Disabled'])>0 ">
      <hr/>
      <h4>Disabled Waiver Forms</h4>

      <div class="row">
        <xsl:for-each select="ArrayOfWaiverForm/WaiverForm[Status='Disabled']">
          <xsl:sort select="Name"/>
          <xsl:call-template name="RenderForm">
            <xsl:with-param name="id">
              <xsl:value-of select="ID"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </div>
    </xsl:if>


    <xsl:if test="count(ArrayOfWaiverForm/WaiverForm[Status='Deleted'])>0 ">
      
      <a href="javascript:void(0);" id="show_deleted">Show Deleted Waiver Forms</a>

      <div id="deleted_waiver_forms" style="display:none;">
      <h4>Deleted Waiver Forms</h4>

      <div class="row">
        <xsl:for-each select="ArrayOfWaiverForm/WaiverForm[Status='Deleted']">
          <xsl:sort select="Name"/>
          <xsl:call-template name="RenderForm">
            <xsl:with-param name="id">
              <xsl:value-of select="ID"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </div>

      </div>
    </xsl:if>
    
    



  </xsl:template>

  <xsl:template name="RenderForm">
    <xsl:param name="id"/>
    

    <xsl:for-each select="/ArrayOfWaiverForm/WaiverForm[ID=$id]">
     
    
    
    <div class="col-md-6">
      <div class="well well-sm waiverlist">
        <h5>
          <strong>
            <xsl:value-of select="Name"/>
            <a href="{$BasePathRelative}/Waiver.aspx?formid={ID}" class="pull-right" target="_blank" title="Direct link to the signing screen for this form">

              Direct Link
              <i class="fa fa-external-link">
                <xsl:text> </xsl:text>
              </i>
            </a>
          </strong>
        </h5>


        <div class="row">
          <div class="col-sm-6">

            <a href="{$BasePathRelative}/admin/Setup.aspx?id={ID}" class="btn btn-default btn-block btn-sm">
              <i class="fa fa-file-text-o">
                <xsl:text> </xsl:text>
              </i>
              Edit Waiver Form
            </a>
            
            <a href="{$BasePathRelative}/admin/Settings/Waiver-Forms/Edit-Waiver-General.aspx?id={ID}" class="btn btn-default btn-block btn-sm">
              <i class="fa fa-cog">
                <xsl:text> </xsl:text>
              </i>
              Advanced Settings
            </a>

            <!--
            <a href="{$BasePathRelative}/admin/Settings/Waiver-Forms/Edit-Waiver-Form-Fields.aspx?id={ID}" class="btn btn-default btn-block btn-sm">
              <i class="fa fa-check-square-o">
                <xsl:text> </xsl:text>
              </i>
              Main Questions
            </a>-->
            <a href="{$BasePathRelative}/admin/Settings/Waiver-Forms/Edit-Participant-Form-Fields.aspx?id={ID}" class="btn btn-default btn-block btn-sm">
              <i class="fa fa-check-square-o">
                <xsl:text> </xsl:text>
              </i>
              Participant Questions
            </a>
            
          </div>
          <div class="col-sm-6">
            <!--<a href="{$BasePathRelative}/admin/Settings/Waiver-Forms/Edit-Waiver-Agreement-Text.aspx?id={ID}" class="btn btn-default btn-block btn-sm">
              <i class="fa fa-file-text-o">
                <xsl:text> </xsl:text>
              </i>
              Agreement Text
            </a>-->
            <a href="{$BasePathRelative}/admin/Settings/Waiver-Forms/Edit-Waiver-Labels.aspx?id={ID}" class="btn btn-default btn-block btn-sm">
              <i class="fa fa-file-text-o">
                <xsl:text> </xsl:text>
              </i>
              Customize Labels
            </a>
            <a href="{$BasePathRelative}/admin/GenerateQR.aspx?formid={ID}" class="btn btn-default btn-block btn-sm">
              <i class="fa fa-qrcode">
                <xsl:text> </xsl:text>
              </i>
              Get QR Code
            </a>
           
          </div>
        </div>
       

      
        <hr/>

        <xsl:choose>
          <xsl:when test="Status='Deleted'">
            <asp:LinkButton runat="server" CssClass="btn btn-success btn-block" CommandName="RESTORE" CommandArgument="{ID}">Restore</asp:LinkButton>
          </xsl:when>
          <xsl:when test="Status='Disabled'">
            <div class="row">
              <div class="col-xs-12">
                <asp:LinkButton  CssClass="btn btn-sm btn-block btn-success" runat="server" CommandName="ACTIVATE" Text="Activate" CommandArgument="{ID}"></asp:LinkButton>
              </div>
            </div>
            <hr/>
            <div class="row">
             
             
              <div class="col-xs-6">
                <asp:LinkButton CssClass="btn btn-default btn-sm btn-block" runat="server" CommandName="DUPLICATE" Text="Duplicate" CommandArgument="{ID}"></asp:LinkButton>
              </div>
              <div class="col-xs-6">
                <asp:LinkButton  CssClass="btn btn-sm btn-block btn-danger" runat="server" CommandName="DELETE" Text="Delete" CommandArgument="{ID}"></asp:LinkButton>
              </div>
            </div>
          </xsl:when>

          <xsl:otherwise>
            <div class="row">
              <div class="col-xs-6">
                <asp:LinkButton CssClass="btn btn-default btn-sm btn-block" runat="server" CommandName="DUPLICATE" Text="Duplicate" CommandArgument="{ID}"></asp:LinkButton>
              </div>
              <div class="col-xs-6">
                <asp:LinkButton  CssClass="btn btn-sm btn-block btn-danger" runat="server" CommandName="DISABLE" Text="Disable" CommandArgument="{ID}"></asp:LinkButton>
              </div>
            </div>
          </xsl:otherwise>
        </xsl:choose>
        
      

      </div>
    </div>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
