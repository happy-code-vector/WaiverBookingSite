<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintWaivers.aspx.cs" Inherits="WaiverFile.Controls.PrintWaivers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Print Waivers</title>
    <link type="text/css" rel="stylesheet" href="/wp-content/Plugins/WaiverFile/Docs/WaiverPrint.css?v=2.3" />
    <link href="/site/fonts/Roboto.css" rel="stylesheet" type="text/css"/>
    <link href="/site/fonts/marck-script.css" rel="stylesheet" type="text/css"/>
</head>
<body onload="window.print()">
    <form id="form1" runat="server">

    <asp:PlaceHolder ID="phOut" runat="server"></asp:PlaceHolder> 

    </form>
</body>
</html>
