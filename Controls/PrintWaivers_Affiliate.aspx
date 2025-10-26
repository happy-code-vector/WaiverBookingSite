<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintWaivers_Affiliate.aspx.cs" Inherits="WaiverFile.Controls.PrintWaivers_Affiliate" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<%@ register src="~/Controls/CRM/Aff_ViewWaiver.ascx" TagPrefix="uc1" TagName="Aff_ViewWaiver" %>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Print Waivers</title>
    <link type="text/css" rel="stylesheet" href="/wp-content/Plugins/WaiverFile/Docs/WaiverPrint.css?v=2.2" />
</head>
<body onload="window.print()">
    <form id="form1" runat="server">
        <div>
            <uc1:Aff_ViewWaiver runat="server" ID="Aff_ViewWaiver1" IsPrintMode="true" />
        </div>
    </form>
</body>
</html>
