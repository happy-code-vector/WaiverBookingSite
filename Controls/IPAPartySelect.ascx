<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IPAPartySelect.ascx.cs" Inherits="WaiverFile.Controls.IPAPartySelect" %>
<div class="ipa_small_button2 abstopleft">
    <a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/" class="btn btn-default"><%=site.GetLabel("GO_BACK", conn) %></a>
</div>
<h1><%=settings.PartySelectionHeading %></h1>
<div class="clear"></div>
<asp:PlaceHolder ID="ph0" runat="server"></asp:PlaceHolder>