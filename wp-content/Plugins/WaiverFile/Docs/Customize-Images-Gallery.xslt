<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  
  <xsl:template match="/">

    <script type="text/javascript">
      
      var idList = [

      <xsl:for-each select="/Main/ArrayOfWFImage/WFImage">
        <xsl:if test="position()!=1">,</xsl:if>
        <xsl:text>'</xsl:text>
        <xsl:value-of select="ID"/>
        <xsl:text>'</xsl:text>
      </xsl:for-each>
      ];
      
      
      $(document).ready(function(){
      
      $('.galleryitemopen').each(function(){
      $(this).click(function(){
      <xsl:text disable-output-escaping="yes">$('#modalimg').html('&lt;img class="img-responsive" src="/Controls/GetImg.ashx?ID=' + $(this).data('id') + '"/&gt;');</xsl:text>
      $('#modalColumns').modal('show');
      });});

      
      
      });


    </script>

    
    
    <div class="row">
    <xsl:for-each select="/Main/ArrayOfWFImage/WFImage">

      <div class="col-sm-3">
        <div class="wfgalleryitem">
          <a href="javascript:void(0);" class="galleryitemopen" data-id="{ID}">
          <img src="/Controls/GetImg.ashx?ID={ID}&amp;type=thumb" class="img-responsive"/>
          </a>
          <p class="text-center" style="margin:10px 0 0 0;">
            <asp:LinkButton runat="server" CssClass="" CommandArgument="{ID}" CommandName="DELETE">
              <i class="fa fa-trash">
                <xsl:text> </xsl:text>
              </i>
            </asp:LinkButton>
          </p>
          
        </div>
      </div>
      <xsl:if test="position() mod 4 = 0">
        <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;div class="row"&gt;</xsl:text>
      </xsl:if>
      
     
    </xsl:for-each>
    </div>




    <div class="modal fade" id="modalColumns" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">
                <xsl:text disable-output-escaping="yes">&amp;times;</xsl:text>
              </span>
            </button>
            <h4 class="modal-title" id="myModalLabel">Image</h4>
          </div>
          <div class="modal-body">
            <div id="modalimg"></div>
          </div>
         <!-- <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
          </div>-->
        </div>
      </div>
    </div>
    
    
  </xsl:template>

  
</xsl:stylesheet>
