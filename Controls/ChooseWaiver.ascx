<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChooseWaiver.ascx.cs" Inherits="WaiverFile.Controls.ChooseWaiver" %>
<div class="ipa_small_button2 abstopleft">
    <a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/" class="btn btn-default"><%=site.GetLabel("GO_BACK", conn) %></a>
</div>
<h1>
    <%=WaiverFile.Core.WaiverSite.GetWaiverSite((Waypoint.Core.WPPageLite)Page).GetLabel("CHOOSE_A_WAIVER",(Waypoint.Core.WPPageLite)Page) %>
</h1>
<div class="clear"></div>
<asp:PlaceHolder ID="ph0" runat="server"></asp:PlaceHolder>