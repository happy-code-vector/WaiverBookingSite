<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ReviewOptInSettings.aspx.cs" Inherits="WaiverFile.site.admin.SMS.ReviewOptInSettings" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style type="text/css">
.reToolbar .WaiverFileImage
{
  background-image: url(/wp-content/Common/images/WaypointImage.gif) !important;
}
.reToolbar .WaypointFile
{
  background-image: url(/wp-content/Common/images/WaypointFile.gif) !important;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
     
    <h3>Confirm SMS Opt-In Configuration</h3>
        <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

    <div style="max-width:900px;">
         <p>Opt-in checkboxes for mobile numbers will be incorporated into your waiver form(s). A privacy policy and terms of use must be displayed. You can utilize the default policy provided, edit it, or substitute it with your own. Modification can be done at any time in SMS settings.
    </p>

   
   
    
      <div class="form-group">
                      <label for="<%=txtTermsText.ClientID %>>Privacy Policy / Terms and Conditions</label>
                
                </div>
                 <div class="form-group">
                   <telerik:RadEditor id="txtTermsText" 
                        width="100%" height="440px" runat="server" enableresize="True" allowscripts="True"  
                             toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverFileToolsSimple.xml"
                        spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
                        imagemanager-viewpaths="/images"  
                        imagemanager-uploadpaths="/images">
                        <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />
                        </telerik:RadEditor>
                     </div>

     
         </div>

    <asp:Button runat="server" ID="btnSubmit" Text="Save and Continue" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />

</asp:Content>
