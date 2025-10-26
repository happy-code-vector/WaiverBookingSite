<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:param name="FilePath"></xsl:param>
  <xsl:param name="ClientID"></xsl:param>
  <xsl:param name="FileDisplayName"></xsl:param>


  <xsl:template match="/">



    <h4>Microsoft Word Version</h4>
    <p>Using online waiver forms is the fastest and easiest way to collect, but if you'd still like a Word version you can download it below. </p>
    <ul class="list-unstyled">
      <li>
        <a href="javascript:void(0);" id="{$ClientID}_btnmodal" class="showthemodal" data-modaltarget=".{$ClientID}filemodal">
          <i class="fa fa-file-word-o" aria-hidden="true">
            <xsl:text> </xsl:text>
          </i>
          <xsl:text> </xsl:text>
          <xsl:value-of select="$FileDisplayName"/>
        </a>
      </li>
    </ul>
    

    <div class="modal fade {$ClientID}filemodal" tabindex="-1" role="dialog">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">
                <xsl:text disable-output-escaping="yes">&amp;times;</xsl:text>
              </span>
            </button>
            <h4 class="modal-title">
              <asp:Label runat="server" ID="lblDialogHeadingInitialSignature">Download File</asp:Label>
            </h4>
          </div>
          <div class="modal-body" >
            <asp:PlaceHolder id="phErrModal" runat="server"></asp:PlaceHolder>
            <p>Enter your email to get the sample waiver and learn more about how electronic waivers can help streamline your business!</p>
            <div class="form-group">
              <label>Email Address</label>
              <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" Placeholder="Email Address" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary" Text="Submit"></asp:Button>
            <hr/>
            <p class="text-muted">
              I don't want to take advantage of online waiver forms. <a href="{$FilePath}" target="_blank">Download the form</a>.
            </p>
          </div>
        </div>


      </div>
    </div>


  </xsl:template>




</xsl:stylesheet>
