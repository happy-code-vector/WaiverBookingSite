<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DashboardV3Sidebar.ascx.cs" Inherits="WaiverFile.Controls.DashboardV3Sidebar" %>

<script type="text/javascript">
    $(document).ready(function () {
        $('#<%=cboCheckinSelection.ClientID%>').change(function () {
            ChangeCheckinSelection($('#<%=cboCheckinSelection.ClientID%>').val());
            $.ajax({
                type: "POST",
                url: "/Controls/DashboardV3Util.ashx",
                data: { cmd: "SET_CHECKIN_VIEW", CHECKIN_VIEW: $('.cboCheckinSelection').val(), dashid:'<%=dash.ID%>' },
                success: function (dataRaw) {
                    BumpReloadData(true); 
                },
                complete: function () {
                }
            });
        });
    });
</script>

<ul class="nav in">
    <li class="sidebar-search">
        <label>Check-in View</label>
        <asp:DropDownList runat="server" ID="cboCheckinSelection" CssClass="form-control cboCheckinSelection"></asp:DropDownList>
        
    </li>
  
</ul>
