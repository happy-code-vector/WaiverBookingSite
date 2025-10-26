<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenerateQR.aspx.cs" Inherits="WaiverFile.Controls.GenerateQR" %>

<%@ register src="~/Controls/GenerateQRDialog.ascx" tagprefix="uc1" tagname="GenerateQRDialog" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Generate QR Codes</title>
    <link href="/site/includes/bootstrap.custom.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:generateqrdialog runat="server" id="GenerateQRDialog" />
        </div>
    </form>
</body>
</html>
