<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QRQuickView.aspx.cs" Inherits="WaiverFile.Connectors.Controls.QRQuickView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Barcode</title>
    
    <style type="text/css">
        img {
   position: absolute;
   top: 50%;
   left: 50%;
   width: 300px;
   height: 300px;
   margin-top: -150px; /* Half the height */
   margin-left: -150px; /* Half the width */
   max-width: 80%;
}
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <img src="/Controls/Connectors/GetQRCodeDirect.ashx?code=<%=Request.QueryString["code"] %>" alt="Error loading code. " />
        </div>
    </form>
</body>
</html>
