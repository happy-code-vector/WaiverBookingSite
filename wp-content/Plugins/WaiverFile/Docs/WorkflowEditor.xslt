<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="html" standalone="no"/>

  <xsl:param name="WorkflowID"></xsl:param>
  <xsl:param name="CurrentStepID"></xsl:param>
  <!-- <xsl:param name="Host"></xsl:param>
  <xsl:param name="SiteName"></xsl:param>-->


  <xsl:template match="/">




    <div class="pull-right" style="margin-top:20px;">
      <a href="WFExcelImport.aspx?id={$WorkflowID}&amp;stepid={$CurrentStepID}" id="btnImport" class="btn btn-primary">
        <i class="fa fa-upload"></i> Excel Import
      </a>
    </div>

    <h3 style="display:inline-block;">Workflow Editor</h3>



    <!-- breadcrumbs -->

    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li>
          <a href="Workflows.aspx">Workflows</a>
        </li>
        <xsl:for-each select="/Main/Breadcrumbs/ArrayOfWorkflowStep/WorkflowStep">
          
          <xsl:choose>
            <xsl:when test="position()=count(/Main/Breadcrumbs/ArrayOfWorkflowStep/WorkflowStep)">
              <li class="breadcrumb-item active" aria-current="page">
                <xsl:value-of select="ButtonText"/>
              </li>
            </xsl:when>
            <xsl:otherwise>
              <li class="breadcrumb-item">
                <a href="?id={/Main/Workflow/Workflow/ID}&amp;stepid={ID}">
                  <xsl:value-of select="ButtonText"/>
                </a>
              </li>
            </xsl:otherwise>
          </xsl:choose>

        </xsl:for-each>

      </ol>
    </nav>

    <div class="pull-left">
    <h4>
      <xsl:value-of select="/Main/CurrentStep/WorkflowStep/ButtonText"/>
      <xsl:if test="/Main/CurrentStep/WorkflowStep/ButtonText!=/Main/CurrentStep/WorkflowStep/Title">
        <xsl:text> | </xsl:text>
          <xsl:value-of select="/Main/CurrentStep/WorkflowStep/Title"/>
      </xsl:if>
      
    </h4>
    </div>

    <div class="pull-right">
      <asp:LinkButton runat="server" ID="btnDeleteSelected" class="btn btn-danger btnDeleteSelected"  style="display:none;">
        <i class="fa fa-trash"></i> Delete Selected
      </asp:LinkButton>
      <xsl:text> </xsl:text>
      <a href="javascript:void(0);" onclick="moveSelected()" class="btn btn-primary" id="btnMoveSelected" style="display:none;">
        <i class="fa fa-arrows"></i> Move Selected
      </a>
    </div>
    <div style="clear:both;">
      <xsl:text> </xsl:text>
    </div>

    <xsl:if test="/Main/CurrentStep/WorkflowStep/DescriptionText!=''" >
    <xsl:value-of select="/Main/CurrentStep/WorkflowStep/DescriptionText"/>
    </xsl:if>
   
    

    <!-- child steps -->
    <!--
    <ul>
    <xsl:for-each select="/Main/Workflow/Workflow//WorkflowStep[ParentID=/Main/CurrentStep/WorkflowStep/ID]">
      <li>
        <xsl:value-of select="ButtonText"/>
      </li>
    
    </xsl:for-each>
    </ul>
    -->
    

  </xsl:template>
  


</xsl:stylesheet>
