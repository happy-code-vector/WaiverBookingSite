<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WorkflowNavigator.ascx.cs" Inherits="WaiverFile.Controls.WorkflowUI.WorkflowNavigator" %>
<%@ Register Src="~/Controls/WaiverFormEntry2.ascx" TagPrefix="uc1" TagName="WaiverFormEntry" %>

<asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

<div class="container">
<asp:PlaceHolder runat="server" ID="phBreadCrumbs"></asp:PlaceHolder>
<asp:PlaceHolder runat="server" ID="phProgressBar"></asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="phErr2"></asp:PlaceHolder>
    </div>

<% if(phButtons.Controls.Count>0){ %>
<aside class="call-to-action bg-primary" runat="server" id="aside1">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
<asp:PlaceHolder runat="server" ID="phButtons"></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </aside>
<%} %>



<%if(WaiverFormEntry1.Visible){ %>
<section class="about" id="about" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                   
            <uc1:WaiverFormEntry runat="server" ID="WaiverFormEntry1" IsWorkflowMode="true" />
        
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>
<%} %>



