<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GTMPixel.ascx.cs" Inherits="WaiverFile.Controls.GTMPixel" %>

         


<asp:Panel runat="server" ID="pnlLogin" Visible="false">
    <script>
         window.dataLayer = window.dataLayer || [];
         window.dataLayer.push({
             'event': 'login',
             'user_id': '<%=GetUserID()%>',              
             'user_type': '<%=GetUserType()%>'
         })
    </script>
</asp:Panel>

<asp:Panel runat="server" ID="pnlCreateAccount" Visible="false">
    <script>
         window.dataLayer = window.dataLayer || [];
         window.dataLayer.push({
             'event': 'create_account',
             'user_id': '<%=GetUserID()%>',       
             'user_type': 'free_trial'
         })
    </script>
</asp:Panel>

<asp:Panel runat="server" ID="pnlAddToCart" Visible="false">
    <script>
         window.dataLayer = window.dataLayer || [];
         window.dataLayer.push({
             event: 'add_to_cart',                  // name of the event. In this case, it always must be add_to_cart
             ecommerce: {
                 currency: "USD",
                 value: <%=_ecomTotalValue%>,
                 <%=_ecomItemsJS%>
             }
         });
    </script>
</asp:Panel>

<asp:Panel runat="server" ID="pnlBeginCheckout" Visible="false">
    <script>
         window.dataLayer = window.dataLayer || [];
         window.dataLayer.push({
             event: 'begin_checkout',              // name of the event. In this case, it always must be begin_checkout
             ecommerce: {
                 currency: "USD",
                 value: <%=_ecomTotalValue%>,
                 <%=_ecomItemsJS%>
             }
         });

    </script>
</asp:Panel>

<asp:Panel runat="server" ID="pnlPurchase" Visible="false">
    <script>
         window.dataLayer = window.dataLayer || [];
         window.dataLayer.push({
             event: 'purchase',            // name of the event. In this case, it always must be purchase
             ecommerce: {
                 currency: 'USD',
                 value: <%=_ecomTotalValue%>,                       // order total (price of all products + shipping)
                 tax: 0.00,                          // tax
                 shipping: 0.00,                 // shipping costs
                 transaction_id: '',           // unique transaction id
                 coupon: '',          // if coupon was applied to the order, include it here
                 <%=_ecomItemsJS%>,


                 firstname: '<%=_firstName%>',
                 lastname: '<%=_lastName%>',
                 email: '<%=_email%>',
                 phone: '<%=_phone%>'
                
         }
});

    </script>
</asp:Panel>

