<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditAvailabilitySlot.aspx.cs" Inherits="WaiverFile.site.admin.EditAvailabilitySlot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <script>
    $(document).ready(function () {
        var $txtMaxParts = $('#<%= txtMaxParts.ClientID %>');

        $txtMaxParts.on('input', function () {
            var value = parseInt($(this).val(), 10);

            // Remove any previous warning
            $(this).closest('.form-group').removeClass('has-error');
            $(this).tooltip('destroy');

            if (!isNaN(value) && value === 0) {
                // Highlight with Bootstrap error style
                $(this).closest('.form-group').addClass('has-error');

                // Show a Bootstrap tooltip warning
                $(this).tooltip({
                    title: 'Entering 0 means this slot will not be available.',
                    placement: 'right',
                    trigger: 'manual'
                }).tooltip('show');
            }
        });
    });
    </script>

                <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
                <h3>Availability Slot</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
                   
                       <div class="form-group">
        <label for="TimePicker">Start Time</label>
        <div class="form-inline">
        <telerik:RadTimePicker ID="tpStart" runat="server" Width="150px" SelectedTime="00:00:00" Skin="Bootstrap">
        </telerik:RadTimePicker>
            </div>
                       

    </div>
                   <div class="form-group">
        <label for="TimePicker">End Time</label>
        <div class="form-inline">
        <telerik:RadTimePicker ID="tpEnd" runat="server" Width="150px" SelectedTime="00:00:00" Skin="Bootstrap">
        </telerik:RadTimePicker>
            </div>
    </div>


                     <div class="form-group" style="margin-bottom:0;">  <label>Days of the Week</label></div>
                          <div class="form-group">
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkMonday" runat="server" /> Monday
        </label>
    </div>
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkTuesday" runat="server" /> Tuesday
        </label>
    </div>
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkWednesday" runat="server" /> Wednesday
        </label>
    </div>
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkThursday" runat="server" /> Thursday
        </label>
    </div>
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkFriday" runat="server" /> Friday
        </label>
    </div>
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkSaturday" runat="server" /> Saturday
        </label>
    </div>
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkSunday" runat="server" /> Sunday
        </label>
    </div>
</div>
               
                 <div class="form-group">
                     <label for="<%=txtMaxParts.ClientID %>">Max Participants</label><asp:TextBox ID="txtMaxParts" CssClass="form-control" runat="server" style="width: 100px;"></asp:TextBox>
                </div>
               
              
               
               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default" Text="Save" onclick="btnSave_Click" />

            

</asp:Content>
