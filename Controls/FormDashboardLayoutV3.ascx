<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormDashboardLayoutV3.ascx.cs" Inherits="WaiverFile.Controls.FormDashboardLayoutV3" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<style type="text/css">
    /*remove the move all buttons, they are confusing */
    div.RadListBox .rlbTransferAllTo, div.RadListBox .rlbTransferAllFrom
    {
       display: none;
    }
</style>

<script type="text/javascript">
    function playSound(url) {
        if (url == '') {
            return;
        }
        const audio = new Audio('/wp-content/plugins/waiverfile/docs/audio/' + url);
        audio.play();
    }

    $(document).ready(function () {
        $('#btnLayout1').click(function () { $('#<%=rbLayout1.ClientID%>').prop("checked", true); });
        $('#btnLayout2').click(function () { $('#<%=rbLayout2.ClientID%>').prop("checked", true); });
        $('#btnLayout3').click(function () { $('#<%=rbLayout3.ClientID%>').prop("checked", true); });
        $('#btnLayout4').click(function () { $('#<%=rbLayout4.ClientID%>').prop("checked", true); });
        $('#btnLayout5').click(function () { $('#<%=rbLayout5.ClientID%>').prop("checked", true); });
    });

    function ClosePanels() {
        SelectPanel('');
    }
    function SelectPanel(pnl) {
        if (pnl == 'pnlColumns_SIA') { $('#pnlColumns_SIA').fadeIn(); } else { $('#pnlColumns_SIA').hide(); }
        if (pnl == 'pnlColumns_GA') { $('#pnlColumns_GA').fadeIn(); } else { $('#pnlColumns_GA').hide(); }
        if (pnl == 'pnlColumns_EVT') { $('#pnlColumns_EVT').fadeIn(); } else { $('#pnlColumns_EVT').hide(); }
    }
    $(function () {
        $('#btnColumns_SIA').click(function () { SelectPanel('pnlColumns_SIA'); });
        $('#btnColumns_GA').click(function () { SelectPanel('pnlColumns_GA'); });
        $('#btnColumns_EVT').click(function () { SelectPanel('pnlColumns_EVT'); });

        $('.btnpreview').click(function () {
            playSound($('#' + $(this).data('cbo')).val());
        });
       // HandleReportTypeExcel(false);
    });

</script>

<h3>Customize Dashboard Layout</h3>
<p>Select from the options below to customize the layout of your WaiverFile dashboard. </p>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

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



<div class="row">
    <div class="col-xs-12">
<h4><%=_genAdmLabel %></h4>
<div class="form-group">
    <label class="col-sm-4">Region</label>
    <div class="col-sm-8"><asp:DropDownList runat="server" ID="cbo_GA_Placeholder" CssClass="form-control">
        <asp:ListItem Value="-1">Hidden</asp:ListItem>
        <asp:ListItem Value="0">Region 1</asp:ListItem>
        <asp:ListItem Value="1">Region 2</asp:ListItem>
        <asp:ListItem Value="2">Region 3</asp:ListItem>
    </asp:DropDownList></div>
</div>

<div class="form-group" style="display:none;">
        <asp:CheckBox runat="server" ID="chk_GA_Split2cols" /> Split into two columns (when space allows)
</div>
<div class="form-group">
        <asp:CheckBox runat="server" ID="chk_GA_IncludeCheckin" /> Include Check-in Boxes
</div>
 <a id="btnColumns_GA" href="javascript:void(0)" class="btn btn-info btn-sm">Choose Columns</a>
<div class="panel panel-default" id="pnlColumns_GA" style="display:none; margin-top:10px;">
    <div class="panel-heading">Choose Columns</div>
    <div class="panel-body">
        <div class="row">
            <div class="col-xs-6"><telerik:RadListBox Skin="Bootstrap" ID="rlbGAExcluded" runat="server" AllowTransfer="true" TransferToID="rlbGAIncluded"></telerik:RadListBox></div>
            <div class="col-xs-6"><telerik:RadListBox Skin="Bootstrap" ID="rlbGAIncluded" runat="server" AllowReorder="true"></telerik:RadListBox></div>
        </div>
        
        <!--<a href="javascript:void(0)" class="btn btn-primary btnApply" onclick="ClosePanels()">Apply</a>-->
    </div>
</div>
        </div></div>
<hr />




<div class="row">
    <div class="col-xs-12">
<h4>Events</h4>
<div class="form-group">
    <label class="col-sm-4">Region</label>
    <div class="col-sm-8"><asp:DropDownList runat="server" ID="cbo_EVT_Placeholder" CssClass="form-control">
        <asp:ListItem Value="-1">Hidden</asp:ListItem>
        <asp:ListItem Value="0">Region 1</asp:ListItem>
        <asp:ListItem Value="1">Region 2</asp:ListItem>
        <asp:ListItem Value="2">Region 3</asp:ListItem>
    </asp:DropDownList></div>
</div>

   <div class="form-group">
        <label class="col-sm-4">Max Events to Load</label>
        <div class="col-sm-8"><asp:TextBox runat="server" ID="txtMaxEventsToLoad" CssClass="form-control"></asp:TextBox></div>
    </div>
    <div class="form-group">
        <label class="col-sm-4">Keep showing events after end time (Hours)</label>
        <div class="col-sm-8"><asp:TextBox runat="server" ID="txtHoursBack" CssClass="form-control"></asp:TextBox></div>
    </div>


<div class="form-group"<div class="form-group" style="display:none;">
        <asp:CheckBox runat="server" ID="chk_EVT_Split2cols" /> Split into two columns (when space allows)
</div>
<div class="form-group">
        <asp:CheckBox runat="server" ID="chk_EVT_IncludeCheckin" /> Include Check-in Boxes
</div>
 <a id="btnColumns_EVT" href="javascript:void(0)" class="btn btn-info btn-sm">Choose Columns</a>
<div class="panel panel-default" id="pnlColumns_EVT" style="display:none; margin-top:10px;">
    <div class="panel-heading">Choose Columns</div>
    <div class="panel-body">
     <div class="row">
            <div class="col-xs-6"><telerik:RadListBox Skin="Bootstrap" ID="rlbEVTExcluded" runat="server" AllowTransfer="true" TransferToID="rlbEVTIncluded"></telerik:RadListBox></div>
            <div class="col-xs-6"><telerik:RadListBox Skin="Bootstrap" ID="rlbEVTIncluded" runat="server" AllowReorder="true"></telerik:RadListBox></div>
        </div>
        <!--<a href="javascript:void(0)" class="btn btn-primary btnApply" onclick="ClosePanels()">Apply</a>-->
    </div>
</div>
        </div></div>
<hr />



<div class="row">
    <div class="col-xs-12">
<h4>Signed in Advance</h4>
<p>This section will show the names of those who have already signed and filled in the date-attending field. This view is filtered to names on the date that they indicated they would attend </p>
<div class="form-group">
    <label class="col-sm-4">Region</label>
    <div class="col-sm-8"><asp:DropDownList runat="server" ID="cbo_SIA_Placeholder" CssClass="form-control">
        <asp:ListItem Value="-1">Hidden</asp:ListItem>
        <asp:ListItem Value="0">Region 1</asp:ListItem>
        <asp:ListItem Value="1">Region 2</asp:ListItem>
        <asp:ListItem Value="2">Region 3</asp:ListItem>
    </asp:DropDownList></div>
</div>

<div class="form-group" style="display:none;">
        <asp:CheckBox runat="server" ID="chk_SIA_Split2cols" /> Split into two columns (when space allows)
</div>
<div class="form-group">
        <asp:CheckBox runat="server" ID="chk_SIA_IncludeCheckin" /> Include Check-in Boxes
</div>
 <a id="btnColumns_SIA" href="javascript:void(0)" class="btn btn-info btn-sm">Choose Columns</a>
<div class="panel panel-default" id="pnlColumns_SIA" style="display:none; margin-top:10px;">
    <div class="panel-heading">Choose Columns</div>
    <div class="panel-body">

        <div class="row">
            <div class="col-xs-6"><telerik:RadListBox ID="rlbSIAExcluded" runat="server" AllowTransfer="true" TransferToID="rlbSIAIncluded" Skin="Bootstrap"></telerik:RadListBox></div>
            <div class="col-xs-6"><telerik:RadListBox ID="rlbSIAIncluded" runat="server" AllowReorder="true" Skin="Bootstrap"></telerik:RadListBox></div>
        </div>
        
        

        
        <!--<a href="javascript:void(0)" class="btn btn-primary btnApply" onclick="ClosePanels()">Apply</a>-->
    </div>
</div>
        </div></div>
<hr />
    <h4>Alert Sounds</h4>
    <p>Enable sounds when new waivers, check-ins or flags are detected. This can be helpful when using multiple terminals to view the dashboard. </p>


    <table class="table">
        <tr>
            <td><label>New Waiver</label></td>
            <td><asp:DropDownList runat="server" ID="cboSoundNewWaiver" CssClass="form-control"></asp:DropDownList></td>
            <td><a href="javascript:void(0);" title="Preview" class="btnpreview btn btn-default" data-cbo="<%=cboSoundNewWaiver.ClientID %>"><i class="fa fa-play"></i></a></td>
        </tr>
        <tr>
            <td><label>New Check-In</label></td>
            <td><asp:DropDownList runat="server" ID="cboSoundNewCheckIn" CssClass="form-control"></asp:DropDownList></td>
            <td><a href="javascript:void(0);" title="Preview" class="btnpreview btn btn-default" data-cbo="<%=cboSoundNewCheckIn.ClientID %>"><i class="fa fa-play"></i></a></td>
        </tr>
        <tr>
            <td><label>New Flag</label></td>
            <td><asp:DropDownList runat="server" ID="cboSoundNewFlag" CssClass="form-control"></asp:DropDownList></td>
            <td><a href="javascript:void(0);" title="Preview" class="btnpreview btn btn-default" data-cbo="<%=cboSoundNewFlag.ClientID %>"><i class="fa fa-play"></i></a></td>
        </tr>
        <tr>
            <td><label>New Notification</label></td>
            <td><asp:DropDownList runat="server" ID="cboSoundNewNotification" CssClass="form-control"></asp:DropDownList></td>
            <td><a href="javascript:void(0);" title="Preview" class="btnpreview btn btn-default" data-cbo="<%=cboSoundNewNotification.ClientID %>"><i class="fa fa-play"></i></a></td>
        </tr>


    </table>

    <hr />


<div class="form-group">
    <asp:Button runat="server" ID="btnSave" Text="Save" CssClass="btn btn-primary"  OnClick="btnSave_Click"/>
</div>

