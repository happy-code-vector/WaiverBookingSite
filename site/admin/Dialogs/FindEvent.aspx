<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminDialog.Master" AutoEventWireup="true" CodeBehind="FindEvent.aspx.cs" Inherits="WaiverFile.site.admin.Dialogs.FindEvent" %>
<%@ Register Assembly="WaiverFile" Namespace="WaiverFile.Core" TagPrefix="cc2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph0" runat="server">

     <script type="text/javascript">

         function selectEvent(evtid, eventname) {
             window.parent.closeModal(evtid, eventname);
         }
         function ShowHideDateBoxes(){
             var selVal = $('#<%=rblMode.ClientID%> input:checked').val();
             if (selVal == 'range') {
                 $('#div_dtrange').show();
                 $('#div_dtsingle').hide();
             } else {
                 $('#div_dtrange').hide();
                 $('#div_dtsingle').show();
             }
         }
         $(document).ready(function () {
             ShowHideDateBoxes();
             $('#<%=rblMode.ClientID%> input').click(function () {
                 ShowHideDateBoxes();
             });

             $('.selectevent').each(function () {
                 $(this).click(function () {
                     selectEvent($(this).data('evtid'), $(this).data('evtname'));
                 });
             });
         });
     </script>

     <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

    <h3>Find an Event</h3>
    <div class="form-group">
        <label for="<%=txtName.ClientID %>">Event Name</label>
        <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group" id="div_dtsingle">
        <label for="<%=dtpSingle.ClientID %>">Date</label>
            <telerik:RadDatePicker runat="server" ID="dtpSingle" Skin="Bootstrap"></telerik:RadDatePicker>
          
    </div>
    <div class="form-group">
        <label>Date Mode</label>
    </div>
    <div class="form-group radiobuttonlist">
        <asp:RadioButtonList ID="rblMode" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
            <asp:ListItem Value="around" Selected="True">On or about this date</asp:ListItem>
            <asp:ListItem Value="exact">Exactly this date</asp:ListItem>
            <asp:ListItem Value="range">Specify a date range</asp:ListItem>
        </asp:RadioButtonList>
    </div>
    
    
    <div id="div_dtrange">
       <div class="form-group">
        <label for="<%=dtpRangeBegin.ClientID %>">Date</label>
               <telerik:RadDatePicker runat="server" ID="dtpRangeBegin" Skin="Bootstrap"></telerik:RadDatePicker>
        </div>
        <div class="form-group">
        <label for="<%=dtpRangeEnd.ClientID %>">Date</label>
            <telerik:RadDatePicker runat="server" ID="dtpRangeEnd" Skin="Bootstrap"></telerik:RadDatePicker>
        </div>
    </div>

    <div class="form-group">
        <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
    </div>

     <asp:PlaceHolder ID="phResults" runat="server"></asp:PlaceHolder>

</asp:Content>
