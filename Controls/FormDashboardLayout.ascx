<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormDashboardLayout.ascx.cs" Inherits="WaiverFile.Controls.FormDashboardLayout" %>

<script type="text/javascript">
    $(document).ready(function () {
        $('#btnLayout1').click(function () { $('#<%=rbLayout1.ClientID%>').prop("checked", true); });
        $('#btnLayout2').click(function () { $('#<%=rbLayout2.ClientID%>').prop("checked", true); });
        $('#btnLayout3').click(function () { $('#<%=rbLayout3.ClientID%>').prop("checked", true); });
        $('#btnLayout4').click(function () { $('#<%=rbLayout4.ClientID%>').prop("checked", true); });
        $('#btnLayout5').click(function () { $('#<%=rbLayout5.ClientID%>').prop("checked", true); });
    });
</script>

<h3>Customize Dashboard Layout</h3>
<p>Select from the options below to customize the layout of your WaiverFile dashboard. </p>

<p>
    <label>Choose a Layout</label></p>
<div class="row">
    <div class="col-xs-2 text-center"><a href="javascript:void(0);" id="btnLayout1">
        <img src="/wp-content/Plugins/WaiverFile/Images/layout1.gif" alt="Layout 1" class="img-responsive" /></a></div>
    <div class="col-xs-2 text-center"><a href="javascript:void(0);" id="btnLayout2">
        <img src="/wp-content/Plugins/WaiverFile/Images/layout2.gif" alt="Layout 2" class="img-responsive" /></a></div>
    <div class="col-xs-2 text-center"><a href="javascript:void(0);" id="btnLayout3">
        <img src="/wp-content/Plugins/WaiverFile/Images/layout3.gif" alt="Layout 3" class="img-responsive" /></a></div>
    <div class="col-xs-2 text-center"><a href="javascript:void(0);" id="btnLayout4">
        <img src="/wp-content/Plugins/WaiverFile/Images/layout4.gif" alt="Layout 4" class="img-responsive" /></a></div>
    <div class="col-xs-2 text-center"><a href="javascript:void(0);" id="btnLayout5">
        <img src="/wp-content/Plugins/WaiverFile/Images/layout5.gif" alt="Layout 5" class="img-responsive" /></a></div>

</div>
<div class="row">
    <div class="col-xs-2 text-center">
        <asp:RadioButton runat="server" ID="rbLayout1" GroupName="layout" /></div>
    <div class="col-xs-2 text-center">
        <asp:RadioButton runat="server" ID="rbLayout2" GroupName="layout" /></div>
    <div class="col-xs-2 text-center">
        <asp:RadioButton runat="server" ID="rbLayout3" GroupName="layout" /></div>
    <div class="col-xs-2 text-center">
        <asp:RadioButton runat="server" ID="rbLayout4" GroupName="layout" /></div>
    <div class="col-xs-2 text-center">
        <asp:RadioButton runat="server" ID="rbLayout5" GroupName="layout" /></div>
</div>
<h4>Select a region for each data type:</h4>
<div class="form-group">
    <label class="col-sm-4"><%=_genAdmLabel %></label>
    <div class="col-sm-8"><asp:DropDownList runat="server" ID="cboRegionGenAdm" CssClass="form-control">
        <asp:ListItem Value="-1">Hidden</asp:ListItem>
        <asp:ListItem Value="0">Region 1</asp:ListItem>
        <asp:ListItem Value="1">Region 2</asp:ListItem>
        <asp:ListItem Value="2">Region 3</asp:ListItem>
    </asp:DropDownList></div>
</div>
<div class="form-group">
    <label class="col-sm-4">Events</label>
    <div class="col-sm-8"><asp:DropDownList runat="server" ID="cboRegionEvents" CssClass="form-control">
        <asp:ListItem Value="-1">Hidden</asp:ListItem>
        <asp:ListItem Value="0">Region 1</asp:ListItem>
        <asp:ListItem Value="1">Region 2</asp:ListItem>
        <asp:ListItem Value="2">Region 3</asp:ListItem>
    </asp:DropDownList></div>
</div>
<div class="form-group">
    <label class="col-sm-4">Signed in Advance</label>
    <div class="col-sm-8"><asp:DropDownList runat="server" ID="cboRegionAdvance" CssClass="form-control">
        <asp:ListItem Value="-1">Hidden</asp:ListItem>
        <asp:ListItem Value="0">Region 1</asp:ListItem>
        <asp:ListItem Value="1">Region 2</asp:ListItem>
        <asp:ListItem Value="2">Region 3</asp:ListItem>
    </asp:DropDownList></div>
</div>
<hr />
<div class="form-group">
    <label class="col-sm-4">Dashboard Mode</label>
    <div class="col-sm-8"><asp:DropDownList runat="server" ID="cboDashboardMode" CssClass="form-control">
         <asp:ListItem Value="SIMPLE">Simple</asp:ListItem>
        <asp:ListItem Value="CHECKIN">Checkin Mode</asp:ListItem>
        <asp:ListItem Value="CHECKIN_WITH_SIGNEE">Checkin With Signee Names</asp:ListItem>
        
    </asp:DropDownList></div>
</div>
<div class="form-group">
    <label>Automatically check in people who sign on the device address.</label>
    <asp:CheckBox runat="server" ID="chkAutoCheckInOnDevice" />
</div>
<p class="help-block">When checked, customers who sign their waiver on-site using kiosks configured to device-<%=site.Url %> will be automatically marked as checked in.</p>
<hr />
<div class="form-group">
    <asp:Button runat="server" ID="btnSave" Text="Save" CssClass="btn btn-primary"  OnClick="btnSave_Click"/>
</div>

