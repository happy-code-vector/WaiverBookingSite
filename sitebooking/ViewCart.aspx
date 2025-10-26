<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="WaiverFile.sitebooking.ViewCart" %>
   <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   

        <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

    <asp:PlaceHolder runat="server" ID="phMain"></asp:PlaceHolder>


    <script type="text/javascript">
function showUpdateButton(input) {
    // Find the update button next to this input
    var container = input.parentElement;
    var updateBtn = container.querySelector('.update-qty-btn');
    
    if (updateBtn) {
        // Get original value from data attribute (set on page load)
        if (!input.hasAttribute('data-original-value')) {
            input.setAttribute('data-original-value', input.value);
        }
        
        var originalValue = input.getAttribute('data-original-value');
        var currentValue = input.value.trim();
        
        // Show button if value changed
        if (currentValue !== originalValue) {
            updateBtn.style.display = 'inline-block';
        } else {
            updateBtn.style.display = 'none';
        }
    }
}

// Initialize original values on page load
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.qty-input').forEach(function(input) {
        input.setAttribute('data-original-value', input.value);
    });
});
    </script>

     

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
