<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SMSEditOptIn.aspx.cs" Inherits="WaiverFile.site.admin.SMS.SMSEditOptIn" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
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
     <asp:PlaceHolder ID="phErrOuter" runat="server"></asp:PlaceHolder>

    <asp:Panel runat="server" ID="pnlMain">

                    
            
                <h3>SMS Opt-In Configuration</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name (Not displayed publicly)</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-6">
                 <div class="form-group">
                     <label for="<%=cboOptInType.ClientID %>">Where will numbers be collected?</label><asp:DropDownList ID="cboOptInType" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
        </div>

         <div class="row">
            <div class="col-sm-6">
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Status</label><asp:DropDownList ID="cboStatus" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="col-sm-6">
                  <div class="form-group">
                      <label for="<%=txtCheckboxLabel.ClientID %>">Opt-In Checkbox Label</label><asp:TextBox ID="txtCheckboxLabel" CssClass="form-control" runat="server"></asp:TextBox>
                     <p class="help-block">The label for the checkbox that users must check in order to opt-in to SMS messaging</p>
                </div>

            </div>
        </div>
      
        <div class="row">
            <div class="col-sm-6">
                  <div class="form-group">
                      <label for="<%=txtMobileNumLabel.ClientID %>">Mobile Number Field Label</label><asp:TextBox ID="txtMobileNumLabel" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                      <label for="<%=txtMobileNumHelpText.ClientID %>">Mobile Number Help Text</label><asp:TextBox ID="txtMobileNumHelpText" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
                 
              
               
                
               
                        
        <div class="row">
            <div class="col-xs-12">
                    
                 
               
                 <div class="form-group">
                      <label for="<%=txtTermsText.ClientID %>>Privacy Policy / Terms and Conditions</label>
                     <p class="help-block">Use this to place terms and conditions in a popup on the screen. </p>
                </div>
                 <div class="form-group">
                   <telerik:RadEditor id="txtTermsText" 
                        width="100%" height="440px" runat="server" enableresize="True" allowscripts="True"  
                             toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverFileToolsNonWaiver.xml"
                        spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
                        imagemanager-viewpaths="/images"  
                        imagemanager-uploadpaths="/images">
                        <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />
                        </telerik:RadEditor>
                     </div>

            </div>
        </div>
               
                
         <div class="row">
            <div class="col-sm-6">
                  <div class="form-group">
                      <label for="<%=txtTermsLinkText.ClientID %>">Terms Link Label</label><asp:TextBox ID="txtTermsLinkText" CssClass="form-control" runat="server"></asp:TextBox>
                     <p class="help-block">The label of the link to the terms. </p>
                </div>
            </div>
            <div class="col-sm-6">
                  <div class="form-group">
                      <label for="<%=txtTermsUrl.ClientID %>">Terms Url</label><asp:TextBox ID="txtTermsUrl" CssClass="form-control" runat="server"></asp:TextBox>
                     <p class="help-block">If your terms are hosted on a web page, add the URL here </p>
                </div>
            </div>
        </div>

           
                  <div class="form-group">
                     <asp:CheckBox ID="chkIsDefault" runat="server" Text=" Set as Default Opt-in Method"></asp:CheckBox>
                </div>
                
               
               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default" Text="Save" onclick="btnSave_Click" />
           

            




    </asp:Panel>
</asp:Content>
