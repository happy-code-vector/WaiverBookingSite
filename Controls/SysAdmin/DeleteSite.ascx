<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DeleteSite.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.DeleteSite" %>

  <!-- verify the site id on load in this field -->
        <asp:HiddenField runat="server" ID="hfSiteIDVerify" />

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Permanently Delete Waiver Site and Data
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

        <asp:Panel runat="server" ID="pnlMain">
        <div class="WPERR_Warning">WARNING! This will PERMANENTLY delete all waiver data for this site. This cannot be undone! </div>
        
       <div class="form-group">
            <label>Site Name</label>
            <asp:Label runat="server" ID="lblName"></asp:Label>
        </div>
        <div class="form-group">
            <label>Site URL</label>
            <asp:Label runat="server" ID="lblUrl"></asp:Label>
        </div>

            <h4>Usage stats</h4>
            <table class="table">
                <tr>
                    <td><label>Waivers</label></td>
                    <td><asp:Label ID="lblNumWaivers" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><label>Participants</label></td>
                    <td><asp:Label ID="lblNumParts" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><label>Forms (Active)</label></td>
                    <td><asp:Label ID="lblNumFormsActive" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><label>Forms (All)</label></td>
                    <td><asp:Label ID="lblNumForms" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><label>Events</label></td>
                    <td><asp:Label ID="lblNumEvents" runat="server"></asp:Label></td>
                </tr>

            </table>

          <div class="form-group">
              <label>Delete site and settings, or just waiver data?</label>
          </div>
            <div class="form-group">
                 <asp:RadioButton runat="server" ID="rbWaiverDataOnly" Text="Waiver Data" GroupName="DELMODE" Checked="true" />
                <asp:RadioButton runat="server" ID="rbFullData" Text="Waiver Data and Complete Site" GroupName="DELMODE" />
            </div>
      
        
        <div class="form-group">
            <asp:CheckBox runat="server" ID="chkConfirm" Text="I want to permanently delete all waiver data for this site" />
        </div>

         <div class="form-group">
            <label>Enter this site's URL to confirm</label>
            <asp:TextBox ID="txtURLVerify" runat="server" CssClass="form-control" placeholder="Enter the end portion of the URL"></asp:TextBox>
        </div>
    
            <div class="form-group">
                <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger" Text="DELETE SITE AND DATA" OnClick="btnDelete_Click" />
            </div>
            </asp:Panel>

    </div><!-- /.box-body -->
    <div class="box-footer">
        
    </div>
    
</div>
<asp:PlaceHolder ID="phErrorDetails" runat="server"></asp:PlaceHolder>