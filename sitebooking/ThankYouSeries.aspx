<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="ThankYouSeries.aspx.cs" Inherits="WaiverFile.sitebooking.ThankYouSeries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:PlaceHolder ID="phErr" runat="server"/>
<asp:Panel ID="pnlMain" runat="server">
    
     <div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-12 col-lg-8 col-xl-6">
            
            <div class="text-center mb-4">
                <h1 class="mb-3"><%=strHeading %></h1>
                <%if(strSubHeading!=""){ %>
                <h3 class="mb-3"><%=strSubHeading %></h3>
                <%} %>
            </div>

            <div class="text-center mb-4">
                <%=strBody %>
            </div>

            <div class="d-flex flex-wrap justify-content-center gap-2 mb-4">
                <%if(_showPrintButton){ %>
                <a href="/Controls/PrintWaiverEndUser.aspx?addr=<%=site.Url %>" 
                   class="btn btn-primary" 
                   target="_blank"><%=strPrintButton %></a>
                <% } %>
                
                <%if (_showEmailButton) { %>
                <asp:Button runat="server" 
                            CssClass="btn btn-primary" 
                            ID="btnEmailCopy" 
                            Text="Email me a Copy" 
                            OnClick="btnEmailCopy_Click" />
                <% } %>
                
                <asp:Button runat="server" 
                            ID="btnContinue" 
                            Text="Continue" 
                            CssClass="btn btn-primary" 
                            OnClick="btnContinue_Click" />
            </div>

            <asp:PlaceHolder runat="server" ID="phQRTicket"></asp:PlaceHolder>

        </div>
    </div>
</div>

</asp:Panel>
<asp:PlaceHolder ID="phCustomOut" runat="server" />


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
