<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WaiverNameReport.ascx.cs" Inherits="WaiverFile.Controls.WaiverNameReport" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">


    function Clickheretoprint() {
        var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
        disp_setting += "scrollbars=yes,width=650, height=600, left=100, top=25";
        var content_vlue = document.getElementById("print_content").innerHTML;

        var docprint = window.open("", "", disp_setting);
        docprint.document.open();
        docprint.document.write('<html><head><title>WaiverFile Report</title>');
        docprint.document.write('<link rel="stylesheet" type="text/css" href="/site/includes/bootstrap.custom.min.css"/>');
        docprint.document.write('</head><body onLoad="self.print()">');
        docprint.document.write(content_vlue);
        docprint.document.write('</body></html>');
        docprint.document.close();
        docprint.focus();
    }
    function checkAll() {
        $('.entrycheckbox').find("input[type=checkbox]").each(function () {
            $(this).attr('checked', true);

        });
    }

    function uncheckAll() {
        $('.entrycheckbox').find("input[type=checkbox]").each(function () {
            $(this).attr('checked', false);
        });
    }

</script>


    <h3>WaiverFile Report</h3>
    <p>Select a date range and click Find Events to load a list of events for that date range. Then select any events for that range and click Run Report to generate a list of results.</p>
    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
<div class="form-inline">
    <div class="form-group"><label>Start Date</label> <telerik:RadDateTimePicker ID="dtStart" runat="server">
        </telerik:RadDateTimePicker></div>

        <div class="form-group"><label>End Date</label> <telerik:RadDateTimePicker ID="dtEnd" runat="server">
        </telerik:RadDateTimePicker></div>
    </div>

       <div class="form-group"><asp:Button ID="btnFindReports" runat="server" Text="Find Events" CssClass="btn btn-primary" onclick="btnFindReports_Click" />
       <input type="button" name="CheckAll" value="Check All" onclick="checkAll()" class="btn btn-default"/> 
 <input type="button" name="UnCheckAll" value="Uncheck All" onclick="uncheckAll()" class="btn btn-default"/></div>
            <asp:PlaceHolder ID="phEventMessage" runat="server"></asp:PlaceHolder>
            
            <div class="checkboxlist">
            <asp:CheckBoxList ID="cblEvents" runat="server" CssClass="entrycheckbox"></asp:CheckBoxList>
            </div>
       
       <div class="form-inline"><div class="form-group"><label>Select a Report</label> <asp:DropDownList ID="cboReport" runat="server" CssClass="form-control"></asp:DropDownList></div></div>
       <div class="form-group"><asp:Button ID="btnRunReport" runat="server" Text="Run Report" CssClass="btn btn-primary" 
            onclick="btnRunReport_Click" />     
            </div>
        

        <a href="#" onclick="Clickheretoprint()" class="btn btn-sm btn-primary pull-right">Print</a>
    <h3>Results</h3>
    <div id="print_content">
        <asp:PlaceHolder ID="phResults" runat="server"></asp:PlaceHolder>
    </div>