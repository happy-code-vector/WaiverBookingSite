<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintWaiverEndUser.aspx.cs" Inherits="WaiverFile.Controls.PrintWaiverEndUser" %>

<%@ register src="~/Controls/PrintWaiverPublic.ascx" TagPrefix="uc1" TagName="PrintWaiverPublic" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
     <title>Print Waivers</title>
    <link type="text/css" rel="stylesheet" href="/wp-content/Plugins/WaiverFile/Docs/WaiverPrint.css?v=2.3" />
     <link href="/site/fonts/Roboto.css" rel="stylesheet" type="text/css"/>
    <link href="/site/fonts/marck-script.css" rel="stylesheet" type="text/css"/>
</head>
<body onload="window.print()">
    <form id="form1" runat="server">
    <div>
        <uc1:PrintWaiverPublic runat="server" ID="PrintWaiverPublic" />
    </div>
    </form>
</body>
</html>
