<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWebHook.ascx.cs" Inherits="WaiverFile.Controls.FormWebHook" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
    function checkhttpbox() {
        String val = $('#<%=txtHookUrl.ClientID%>').val();
        if (val.regionMatches(true, 0, 'http:', 0, 5)) {
            $('#allowhttp').show();
        } else {
            $('#allowhttp').hide();
        }
    }

    $(document).ready(function () {
        $('#<%=txtHookUrl.ClientID %>').keyup(checkhttpbox());
        $('#<%=txtHookUrl.ClientID %>').change(checkhttpbox());
    });
</script>            


<div class="form-horizontal" role="form">
                <h3>Edit Rest Hook</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
                   <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                       <p class="help-block">A display name for internal use.</p>
                </div>
                 <div class="form-group">
                      <label for="<%=txtHookUrl.ClientID %>">Hook Url</label><asp:TextBox ID="txtHookUrl" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                  <div class="form-group" id="allowhttp" style="display:none;">
                      <label for="<%=chkAllowUnencrypted.ClientID %>"><asp:CheckBox ID="chkAllowUnencrypted" CssClass="form-control" runat="server" Checked="true"></asp:CheckBox> Allow unencrypted connection </label>
                     <p class="help-block"><strong>NOT RECOMMENDED.</strong> Live system connections should always be over HTTPS. Use this only for testing purposes if your development service does not support HTTPS. </p>
                </div>
               
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Status</label>
                     <asp:DropDownList runat="server" ID="cboStatus" CssClass="form-control"></asp:DropDownList>
                </div>
               
               
                 <div class="form-group">
                      <label for="<%=chkSkinnyPayloads.ClientID %>"><asp:CheckBox ID="chkSkinnyPayloads" CssClass="form-control" runat="server" Checked="true"></asp:CheckBox> Skinny Payloads </label>
                     <p class="help-block">Recommended. Skinny payloads just return the ID of the item. Use direct API calls to download the details of newly created or updated items. </p>
                </div>

               <h4>Triggers</h4>
        <div class="row">
            <div class="col-sm-6">
                <asp:CheckBox ID="chkNewWaiver" runat="server" Text="New Waiver" />
                <p class="help-block">Triggers when a new waiver is collected</p>
            </div>
            <div class="col-sm-6">
                  <asp:CheckBox ID="chkEditWaiver" runat="server" Text="Edit Waiver" />
                <p class="help-block">Triggers when changes to waiver values are saved</p>
            </div>
        </div>
     <div class="row">
            <div class="col-sm-6">
                <asp:CheckBox ID="chkNewEvent" runat="server" Text="New Event" />
                <p class="help-block">Triggers when a new event is saved</p>
            </div>
            <div class="col-sm-6">
                  <asp:CheckBox ID="chkEditEvent" runat="server" Text="Edit Event" />
                <p class="help-block">Triggers when changes to an event are saved</p>
            </div>
        </div>
     <div class="row">
            <div class="col-sm-6">
                <asp:CheckBox ID="chkNewCheckIn" runat="server" Text="New Check-In" />
                <p class="help-block">Triggers when a new check-in is saved</p>
            </div>
            <div class="col-sm-6">
                  <asp:CheckBox ID="chkUpdateCheckIn" runat="server" Text="Edit Check-In" />
                <p class="help-block">Triggers when changes to a check-in are saved (marked as checked-in again or check-in is unchecked)</p>
            </div>
        </div>
    
             
               
               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default" Text="Save" onclick="btnSave_Click" />
            </div>

            