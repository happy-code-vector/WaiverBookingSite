<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubscriptionAdminDisabler.ascx.cs" Inherits="WaiverFile.Controls.SubscriptionAdminDisabler" %>
<%if(_disableThisPage){ %>
    <style type="text/css">
        #main-content-area{ display:none; }
    </style>
<%} %>

<%if(ph0.Controls.Count>0){ %>
<div class="row">
                <div class="col-xs-12">
<asp:PlaceHolder ID="ph0" runat="server"></asp:PlaceHolder>
                    </div></div>
<%} %>