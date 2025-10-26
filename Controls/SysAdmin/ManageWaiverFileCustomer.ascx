<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageWaiverFileCustomer.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.ManageWaiverFileCustomer" %>
<%@ Register Assembly="Telerik.Web.UI"
  Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>



<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">WaiverFile Sites and Subscriptions</h3>
    </div><!-- /.box-header -->
    <div class="box-body">

        <asp:PlaceHolder ID="phCancelReasons" runat="server"></asp:PlaceHolder>
        <asp:PlaceHolder ID="phWaiverSites" runat="server"></asp:PlaceHolder>


    </div><!-- /.box-body -->
</div>

  
<asp:PlaceHolder ID="phOverview" runat="server"></asp:PlaceHolder>
