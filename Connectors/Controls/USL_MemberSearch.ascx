<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="USL_MemberSearch.ascx.cs" Inherits="WaiverFile.Connectors.Controls.USL_MemberSearch" %>




<%if (IsParticipantMode) { %>
<div class="col-sm-6">
    <%}else{ %>
<div class="col-xs-12">
<% } %>

<div class="signoptionshow" runat="server" id="divMemSearch">
    <label for="<%=txtUSLNumber.ClientID %>">US Lacrosse Member Number <small>(<a href="https://usl.ebiz.uapps.net/PersonifyEbusiness/Default.aspx?TabID=266" target="_blank">Find Your Number</a>)</small></label>
    <asp:TextBox ID="txtUSLNumber" runat="server" CssClass="form-control"></asp:TextBox>
</div>
 <asp:HiddenField ID="hf_divMemSearch_visible" runat="server"></asp:HiddenField>

<%if(IsParticipantMode){ %>
</div>
   <%}else{ %>
</div>

<% } %>