<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewShareButton.ascx.cs" Inherits="WaiverFile.Controls.ViewShareButton" %>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/clipboard.min.js"></script>
<script type="text/javascript" >
    $(function () {
        new Clipboard('.copybutton');
    });


</script>

<h1>Share Button: <%=obj.Name %></h1>
    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
<div class="row">

    
    <div class="col-sm-6">
        
        <h4>Code</h4>
        <pre id="code" style="white-space: pre-wrap;"><asp:PlaceHolder ID="phCode" runat="server"></asp:PlaceHolder></pre>
        <div class="text-right"><a href="javascript:void(0);" class="btn btn-default btn-sm copybutton" data-clipboard-target="#code">Copy Code</a>
                </div>
        <h4>Preview</h4>
        <iframe width="100%" height="500px" src="/Controls/ShareButtonPreview.aspx" style="border:2px solid #cfcfcf;" >

        </iframe>
    </div>
     
    <div class="col-sm-6">
        <h4>Customize Settings</h4>
        <p>Configure your button using the options below and click Update to update the code.</p>
         <div class="form-group" runat="server" id="divUrl">
            <label>Url</label>
             <asp:TextBox runat="server" CssClass="form-control" ID="txtUrl"></asp:TextBox>
        </div>
          <div class="form-group" runat="server" id="divSiteName">
            <label>Site Name</label>
              <asp:TextBox runat="server" CssClass="form-control" ID="txtSiteName"></asp:TextBox>
              <small class="help-block">Changing this only changes the text in share button. To change your site name, go to Settings, General Settings.</small>
        </div>

        
          <div class="form-group">
            <label>Your Website URL</label>
              <asp:TextBox runat="server" CssClass="form-control" ID="txtYourWebsiteURL" placeholder="https://www.mywebsite.com"></asp:TextBox>
              <small class="help-block text-danger"><strong>* Important *</strong> To ensure the embedded function works properly, be sure to add your website's address here, e.g. https://www.mywebsite.com</small>
        </div>


        <asp:PlaceHolder ID="phCustomization" runat="server"></asp:PlaceHolder>

        <asp:Button runat="server" ID="btnUpdateCode" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdateCode_Click" />
    </div>

</div>