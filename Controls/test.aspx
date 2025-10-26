<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="WaiverFile.Controls.test" %>

<%@ Register Assembly="Telerik.Web.UI, Version=2014.2.724.0, Culture=neutral, PublicKeyToken=29ac1a93ec063d92" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title></title>
  
    <script type="text/javascript" src="/wp-content/Common/Scripts/jquery-1.9.1.min.js"></script>
    <link href="/site/includes/bootstrap.custom.min.css" rel="stylesheet" type="text/css" />

   <script src="/site/includes/bootstrap.min.js?v=2"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:scriptmanager runat="server"></asp:scriptmanager>  
    <div>
    just testing

        
<script type="text/javascript">
    var success = false;
    $(function () {
        $('.riTextBox').attr('placeholder', 'MM/DD/YYYY');
        $('.riTextBox').attr('type', 'date');
    });

</script>
        date pleasE: <br />
           <telerik:RadDateInput runat="server" CssClass="form-control" ID="rdiDOB" MinDate="" Width="100%" DateFormat="MMMM d, yyyy">
        <IncrementSettings InterceptMouseWheel="false" />
                    </telerik:RadDateInput><br /><br />

        <asp:TextBox CssClass="form-control" ID="txtZip" runat="server" MaxLength="5" type="number" step="0.01"></asp:TextBox>

    </div>
    </form>
</body>
</html>
