<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WaiverFile.sitebooking.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="https://js.stripe.com/v3/"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>


    <asp:Panel runat="server" ID="pnlWrapAll">
    <!-- Hidden Fields -->
    <asp:HiddenField ID="hfCurrentStepId" runat="server" Value="ContactInfo" />
    <asp:HiddenField ID="hfPaymentMethodId" runat="server" />
    <asp:HiddenField ID="hfConnectedAccountId" runat="server" Value="acct_YOUR_CONNECTED_ACCOUNT_ID" />
    <asp:HiddenField ID="hfTotalAmountInCents" runat="server" Value="0" />
    <asp:HiddenField ID="hfApplicationFeeAmountInCents" runat="server" Value="0" />
    <asp:HiddenField ID="HiddenField1" runat="server" Value="ContactInfo" />
    <asp:HiddenField ID="hfBillingAddressDetails" runat="server" />
    <asp:HiddenField ID="hfShippingAddressDetails" runat="server" />

    <asp:HiddenField ID="hfName" runat="server" />
    <asp:HiddenField ID="hfEmail" runat="server" />
    <asp:HiddenField ID="hfPhone" runat="server" />


    <div class="container py-5">
        <div class="row pt-1 pt-sm-3 pt-lg-4 pb-2 pb-md-3 pb-lg-4 pb-xl-5">
            <div class="col-lg-8 col-xl-7 mb-5 mb-lg-0">
                <div class="accordion" id="checkoutSteps">

                    <!-- Contact Info -->
                    <asp:Panel runat="server" ID="pnlContactInfo" CssClass="d-flex align-items-start">
                        <div id="divStepNumOrIconContactInfo" runat="server" class="d-flex align-items-center justify-content-center bg-primary text-white rounded-circle fs-sm fw-semibold lh-1 flex-shrink-0" style="width: 2rem; height: 2rem; margin-top: -.125rem">
                             <asp:Literal runat="server" ID="litStepNumOrIconContactInfo"></asp:Literal>
                        </div>
                        <div class="ps-3 ps-md-4 w-100">
                            <div class="float-sm-end">
                                <asp:LinkButton runat="server" ID="btnEditStepContactInfo" CssClass="nav-link text-decoration-underline p-0" OnClick="btnEditStepContactInfo_Click">Edit</asp:LinkButton>
                            </div>
                            <h2 class="h5 mb-md-4">Your Info</h2>
                            <asp:Panel ID="pnlContactInfoDone" runat="server" >
                                <div class="accordion-body">
                               
                                  

                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlContactInfoEdit" runat="server" >
                                <div class="accordion-body">
                                    <div class="mb-3">
                                        <label for="<%= txtName.ClientID %>" class="form-label">Full Name</label>
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="<%= txtEmail.ClientID %>" class="form-label">Email</label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="<%= txtPhone.ClientID %>" class="form-label">Phone</label>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                                    </div>
                                    <div class="form-check">
                                        <asp:CheckBox ID="chkSMS" runat="server" CssClass="form-check-input" />
                                        <label class="form-check-label" for="<%= chkSMS.ClientID %>">Receive SMS updates</label>
                                    </div>

                                    <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-lg btn-primary w-100 d-lg-flex mb-4" OnClick="btnNext_Click" />

                                </div>
                                </asp:Panel>
                            </div>
                       
                    </asp:Panel>

               <!-- Billing Info -->
<asp:Panel runat="server" ID="pnlBillingInfo" CssClass="d-flex align-items-start">
    <div id="divStepNumOrIconBillingInfo" runat="server" class="d-flex align-items-center justify-content-center bg-body-secondary text-body-secondary rounded-circle fs-sm fw-semibold lh-1 flex-shrink-0" style="width: 2rem; height: 2rem; margin-top: -.125rem">
        <asp:Literal runat="server" ID="litStepNumOrIconBillingInfo"></asp:Literal>
    </div>
    <div class="ps-3 ps-md-4 w-100">
        <div class="float-sm-end">
            <asp:LinkButton runat="server" ID="btnEditStepBillingInfo" CssClass="nav-link text-decoration-underline p-0" OnClick="btnEditStepBillingInfo_Click">Edit</asp:LinkButton>
        </div>
        <h2 class="h5 mb-md-4">Billing Information</h2>
        
        <asp:Panel ID="pnlBillingInfoDone" runat="server">
            <div class="accordion-body">
                <p class="fs-sm"><asp:Label ID="lblBillingAddress" runat="server" /></p>
            </div>
        </asp:Panel>
        
        <asp:Panel ID="pnlBillingInfoEdit" runat="server">
            <div class="accordion-body">
                
                <!-- Saved Billing Addresses -->
                <asp:Panel runat="server" ID="pnlSavedBillingAddresses" Visible="false">
                    <h6 class="mb-3">Saved Addresses</h6>
                    <asp:Repeater runat="server" ID="rptSavedBillingAddresses">
                        <ItemTemplate>
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="radio" name="billingAddressChoice" 
                                       id="savedBilling_<%# Eval("ID") %>" 
                                       value="<%# Eval("ID") %>"
                                       <%# (bool)Eval("IsDefaultBillingAddress") ? "checked" : "" %>
                                       onclick="toggleBillingAddressSelection(true, '<%# Eval("ID") %>')">
                                <label class="form-check-label" for="savedBilling_<%# Eval("ID") %>">
                                    <div class="small">
                                        <%# FormatAddressForDisplay((WaiverFile.Core.Booking.Address)Container.DataItem) %>
                                    </div>
                                    <%# (bool)Eval("IsDefaultBillingAddress") ? "<span class='badge bg-primary ms-2'>Default</span>" : "" %>
                                </label>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="radio" name="billingAddressChoice" 
                               id="useNewBillingAddress" value="new" onclick="toggleBillingAddressSelection(false, '')">
                        <label class="form-check-label" for="useNewBillingAddress">
                            <strong>Add a new address</strong>
                        </label>
                    </div>
                    
                    <hr class="my-3" />
                </asp:Panel>

                <!-- New Billing Address Entry -->
                <asp:Panel runat="server" ID="pnlNewBillingAddressEntry">
                    <div id="billing-address-element" class="mb-3"></div>
                    <div id="billing-address-errors" class="text-danger"></div>
                </asp:Panel>
                
            </div>
            <asp:HiddenField ID="hfSelectedBillingAddressId" runat="server" />
            <asp:Button ID="btnSaveBilling" runat="server" Text="Next" CssClass="btn btn-lg btn-primary w-100  d-lg-flex mb-4" OnClientClick="return saveBillingAddressBeforePost();" OnClick="btnSaveBilling_Click" />
        </asp:Panel>
    </div>
</asp:Panel>

            <!-- Shipping Info -->
<asp:Panel runat="server" ID="pnlShippingInfo" CssClass="d-flex align-items-start">
    <div id="divStepNumOrIconShippingInfo" runat="server" class="d-flex align-items-center justify-content-center bg-body-secondary text-body-secondary rounded-circle fs-sm fw-semibold lh-1 flex-shrink-0" style="width: 2rem; height: 2rem; margin-top: -.125rem">
        <asp:Literal runat="server" ID="litStepNumOrIconShippingInfo"></asp:Literal>
    </div>
    <div class="ps-3 ps-md-4 w-100">
        <div class="float-sm-end">
            <asp:LinkButton runat="server" ID="btnEditStepShippingInfo" CssClass="nav-link text-decoration-underline p-0" OnClick="btnEditStepShippingInfo_Click">Edit</asp:LinkButton>
        </div>
        <h2 class="h5 mb-md-4">Shipping Information</h2>
        
        <asp:Panel ID="pnlShippingInfoDone" runat="server">
            <div class="accordion-body">
                <p class="fs-sm"><asp:Label ID="lblShippingAddress" runat="server" /></p>
            </div>
        </asp:Panel>
        
        <asp:Panel ID="pnlShippingInfoEdit" runat="server">
            <div class="accordion-body">

                <!-- Checkbox to copy billing to shipping -->
                <div class="form-check mb-3">
                    <asp:CheckBox ID="chkSameAsBilling" runat="server" CssClass="form-check-input" onclick="toggleShippingAddress(this.checked)" />
                    <label class="form-check-label" for="<%= chkSameAsBilling.ClientID %>">
                        Shipping address is the same as billing
                    </label>
                </div>

                <asp:HiddenField ID="hfSameAsBilling" runat="server" />

                <div id="shippingAddressSelectionArea">
                    <!-- Saved Shipping Addresses -->
                    <asp:Panel runat="server" ID="pnlSavedShippingAddresses" Visible="false">
                        <h6 class="mb-3">Saved Addresses</h6>
                        <asp:Repeater runat="server" ID="rptSavedShippingAddresses">
                            <ItemTemplate>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="radio" name="shippingAddressChoice" 
                                           id="savedShipping_<%# Eval("ID") %>" 
                                           value="<%# Eval("ID") %>"
                                           <%# (bool)Eval("IsDefaultShippingAddress") ? "checked" : "" %>
                                           onclick="toggleShippingAddressSelection(true, '<%# Eval("ID") %>')">
                                    <label class="form-check-label" for="savedShipping_<%# Eval("ID") %>">
                                        <div class="small">
                                            <%# FormatAddressForDisplay((WaiverFile.Core.Booking.Address)Container.DataItem) %>
                                        </div>
                                        <%# (bool)Eval("IsDefaultShippingAddress") ? "<span class='badge bg-primary ms-2'>Default</span>" : "" %>
                                    </label>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        
                        <div class="form-check mb-3">
                            <input class="form-check-input" type="radio" name="shippingAddressChoice" 
                                   id="useNewShippingAddress" value="new" onclick="toggleShippingAddressSelection(false, '')">
                            <label class="form-check-label" for="useNewShippingAddress">
                                <strong>Add a new address</strong>
                            </label>
                        </div>
                        
                        <hr class="my-3" />
                    </asp:Panel>

                    <!-- New Shipping Address Entry -->
                    <asp:Panel runat="server" ID="pnlNewShippingAddressEntry">
                        <div id="shipping-address-element" class="mb-3"></div>
                        <div id="shipping-address-errors" class="text-danger"></div>
                    </asp:Panel>
                </div>
                
            </div>
            <asp:HiddenField ID="hfSelectedShippingAddressId" runat="server" />
            <asp:Button ID="btnSaveShipping" runat="server" Text="Next" CssClass="btn btn-lg btn-primary w-100  d-lg-flex mb-4" OnClick="btnSaveShipping_Click" OnClientClick="return saveShippingAddressBeforePost();" />
        </asp:Panel>
    </div>
</asp:Panel>

                    <!-- Waivers -->
                    <asp:Panel runat="server" ID="pnlWaivers" CssClass="d-flex align-items-start">
                        <div id="divStepNumOrIconWaivers" runat="server"  class="d-flex align-items-center justify-content-center bg-body-secondary text-body-secondary rounded-circle fs-sm fw-semibold lh-1 flex-shrink-0" style="width: 2rem; height: 2rem; margin-top: -.125rem">
                            <asp:Literal runat="server" ID="litStepNumOrIconWaivers"></asp:Literal>
                        </div>
                        <div class="ps-3 ps-md-4 w-100">
                             <div class="float-sm-end">
                                <asp:LinkButton runat="server" ID="btnEditStepWaivers" CssClass="nav-link text-decoration-underline p-0" OnClick="btnEditStepWaivers_Click">Edit</asp:LinkButton>
                            </div>
                            <h2 class="h5 mb-md-4">Agreements</h2>
                              <asp:Panel ID="pnlWaiversDone" runat="server" >
                                <div class="accordion-body">
                                    <!-- display something that indicates that waivers are completed here  -->
                                    Waivers Complete
                                </div>
                            </asp:Panel>
                              <asp:Panel ID="pnlWaiversEdit" runat="server" >
                                <div class="accordion-body">
                                    waivers will load here
                                      <asp:PlaceHolder runat="server" ID="phWaivers"></asp:PlaceHolder>
                                </div>
                                  <asp:Button ID="btnSaveWaivers" runat="server" Text="Next" CssClass="btn btn-lg btn-primary w-100 d-lg-flex mb-4" OnClick="btnSaveWaivers_Click" />
                            </asp:Panel>
                          
                        </div>
                    </asp:Panel>

                   <!-- Payment -->
<asp:Panel runat="server" ID="pnlPayment" CssClass="d-flex align-items-start">
    <div id="divStepNumOrIconPayment" runat="server" class="d-flex align-items-center justify-content-center bg-body-secondary text-body-secondary rounded-circle fs-sm fw-semibold lh-1 flex-shrink-0" style="width: 2rem; height: 2rem; margin-top: -.125rem">
       <asp:Literal runat="server" ID="litStepNumOrIconPayment"></asp:Literal>
    </div>
    <div class="ps-3 ps-md-4 w-100">
        <h2 class="h5 mb-md-4">Payment</h2>   
        <asp:Panel runat="server" ID="pnlPaymentEdit">
        
        <div class="accordion-body">
            
            <!-- Saved Payment Methods -->
            <asp:Panel runat="server" ID="pnlSavedPaymentMethods" Visible="false">
                <h6 class="mb-3">Saved Payment Methods</h6>
                <asp:Repeater runat="server" ID="rptSavedPaymentMethods">
                    <ItemTemplate>
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="radio" name="paymentMethodChoice" 
                                   id="savedCard_<%# Eval("ID") %>" 
                                   value="<%# Eval("StripePaymentMethodID") %>"
                                   <%# (bool)Eval("IsDefault") ? "checked" : "" %>
                                   onclick="togglePaymentMethodSelection(true)">
                            <label class="form-check-label" for="savedCard_<%# Eval("ID") %>">
                                <i class="ci-card"></i> 
                                <%# Eval("CardBrand") %> ending in <%# Eval("Last4") %> 
                                (Exp: <%# Eval("ExpMonth") %>/<%# Eval("ExpYear") %>)
                                <%# (bool)Eval("IsDefault") ? "<span class='badge bg-primary ms-2'>Default</span>" : "" %>
                            </label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                
                <div class="form-check mb-3">
                    <input class="form-check-input" type="radio" name="paymentMethodChoice" 
                           id="useNewCard" value="new" onclick="togglePaymentMethodSelection(false)">
                    <label class="form-check-label" for="useNewCard">
                        Use a new card
                    </label>
                </div>
                
                <hr class="my-3" />
            </asp:Panel>

            <!-- New Card Entry -->
            <asp:Panel runat="server" ID="pnlNewCardEntry">
                <div class="form-group mb-3">
                  <label for="card-element" class="form-label">Credit or Debit Card</label>
                  <div id="card-element" class="form-control"></div>
                </div>
                <div id="card-errors" class="invalid-feedback d-block mt-1"></div>

                 <div class="form-group mb-3">
                     <asp:CheckBox runat="server" ID="chkSaveCard" CssClass="form-check-input" /> 
                     <label class="form-check-label" for="<%= chkSaveCard.ClientID %>">Save this card for future use</label>
                 </div>
            </asp:Panel>

        </div>
            
            <asp:HiddenField ID="hfSelectedPaymentMethodId" runat="server" />
            <asp:Button ID="btnSubmitPayment" runat="server" Text="Complete Purchase" CssClass="btn btn-success" OnClientClick="return preparePayment();" OnClick="btnSubmitPayment_Click"   />
            </asp:Panel>
    </div>
</asp:Panel>

                </div>

                <!-- Navigation Buttons -->
                <div class="d-flex justify-content-between mt-4">
                    
                    
                    
                </div>
            </div>

            <asp:PlaceHolder ID="phCartSummary" runat="server" />
        </div>
    </div>

<script type="text/javascript">
    var stripe = Stripe('<%=_stripePublishableKey%>', { stripeAccount: '<%=_stripeActiveAccountID%>' });
    var elements = stripe.elements();
    var card = null;
    var shippingAddress = null;
    var billingAddress = null;
    // Store saved addresses for reference - same addresses used for both billing and shipping
    var savedBillingAddresses = <%=AddressesJson%>;
    var savedShippingAddresses = <%=AddressesJson%>;

    const style = {
        base: {
            color: '#495057',
            fontSize: '1rem',
            fontFamily: 'inherit',
            '::placeholder': {
                color: '#6c757d'
            },
            padding: '0.375rem 0.75rem',
            border: '1px solid #ced4da',
            borderRadius: '0.375rem',
            backgroundColor: '#fff',
        },
        invalid: {
            color: '#dc3545',
            iconColor: '#dc3545'
        }
    };

    <% if (pnlPaymentEdit.Visible) { %>
    console.log('Payment section initialized');

    // Check if saved payment methods exist
    var hasSavedMethods = document.querySelector('input[name="paymentMethodChoice"]') !== null;

    if (hasSavedMethods) {
        // Start with saved method selected, hide new card entry
        var defaultChecked = document.querySelector('input[name="paymentMethodChoice"]:checked');
        if (defaultChecked && defaultChecked.value !== 'new') {
            document.getElementById('<%=pnlNewCardEntry.ClientID%>').style.display = 'none';
        } else {
            // Mount card element if "new" is selected by default
            card = elements.create('card', { style });
            card.mount('#card-element');
            card.on('change', handleCardChange);
        }
    } else {
        // No saved methods, always show new card entry
        card = elements.create('card', { style });
        card.mount('#card-element');
        card.on('change', handleCardChange);
    }
    <%}%>

    function handleCardChange(event) {
        var displayError = document.getElementById('card-errors');
        if (event.error) {
            displayError.textContent = event.error.message;
        } else {
            displayError.textContent = '';
        }
    }

    function togglePaymentMethodSelection(usingSavedCard) {
        var newCardPanel = document.getElementById('<%=pnlNewCardEntry.ClientID%>');

        if (usingSavedCard) {
            // Hide new card entry
            newCardPanel.style.display = 'none';
            // Unmount card element if it exists
            if (card) {
                card.unmount();
                card = null;
            }
        } else {
            // Show new card entry
            newCardPanel.style.display = 'block';
            // Mount card element if not already mounted
            if (!card) {
                card = elements.create('card', { style });
                card.mount('#card-element');
                card.on('change', handleCardChange);
            }
        }
    }

    function preparePayment() {
        // Check if using saved payment method
        var selectedRadio = document.querySelector('input[name="paymentMethodChoice"]:checked');

        if (selectedRadio && selectedRadio.value !== 'new') {
            // Using saved payment method
            document.getElementById('<%= hfSelectedPaymentMethodId.ClientID %>').value = selectedRadio.value;
            document.getElementById('<%= hfPaymentMethodId.ClientID %>').value = selectedRadio.value;
            __doPostBack('<%= btnSubmitPayment.UniqueID %>', '');
            return false;
        } else {
            // Creating new payment method
            return createPaymentMethod();
        }
    }

    function createPaymentMethod() {
        var billingDetails = {
            name: document.getElementById('<%= hfName.ClientID %>').value,
            email: document.getElementById('<%= hfEmail.ClientID %>').value,
            phone: document.getElementById('<%= hfPhone.ClientID %>').value
        };

        try {
            var addressJson = document.getElementById('<%= hfBillingAddressDetails.ClientID %>').value;
            if (addressJson) {
                var address = JSON.parse(addressJson);
                billingDetails.address = {
                    line1: address.line1 || '',
                    line2: address.line2 || '',
                    city: address.city || '',
                    state: address.state || '',
                    postal_code: address.postal_code || '',
                    country: address.country || ''
                };
            }
        } catch (e) {
            console.warn('Invalid billing address JSON', e);
        }

        stripe.createPaymentMethod({
            type: 'card',
            card: card,
            billing_details: billingDetails
        }).then(function (result) {
            if (result.error) {
                document.getElementById('card-errors').textContent = result.error.message;
            } else {
                document.getElementById('<%= hfPaymentMethodId.ClientID %>').value = result.paymentMethod.id;
                document.getElementById('<%= hfSelectedPaymentMethodId.ClientID %>').value = result.paymentMethod.id;
                __doPostBack('<%= btnSubmitPayment.UniqueID %>', '');
            }
        });

        return false; // Always prevent the default postback
    }

    <%if (pnlBillingInfoEdit.Visible) { %>
    var hasSavedBilling = document.querySelector('input[name="billingAddressChoice"]') !== null;

    if (hasSavedBilling) {
        var defaultBillingChecked = document.querySelector('input[name="billingAddressChoice"]:checked');
        if (defaultBillingChecked && defaultBillingChecked.value !== 'new') {
            document.getElementById('<%=pnlNewBillingAddressEntry.ClientID%>').style.display = 'none';
        // Set the selected address
        toggleBillingAddressSelection(true, defaultBillingChecked.value);
    } else {
        // Mount billing address element for new address
        var savedBilling = getStoredAddress('<%= hfBillingAddressDetails.ClientID %>');
        billingAddress = elements.create('address', {
            mode: 'billing',
            fields: { phone: 'always' },
            defaultValues: savedBilling || {
                name: document.getElementById('<%= hfName.ClientID %>').value
            },
            appearance: { theme: 'flat' }
        });
        billingAddress.mount('#billing-address-element');
        billingAddress.on('change', function (event) {
            var displayError = document.getElementById('billing-address-errors');
            displayError.textContent = event.error ? event.error.message : '';
            if (event.complete && event.value) {
                document.getElementById('<%= hfBillingAddressDetails.ClientID %>').value = JSON.stringify(event.value);
            }
        });
    }
} else {
    // No saved addresses, always show new address entry
    var savedBilling = getStoredAddress('<%= hfBillingAddressDetails.ClientID %>');
    billingAddress = elements.create('address', {
        mode: 'billing',
        fields: { phone: 'always' },
        defaultValues: savedBilling || {
            name: document.getElementById('<%= hfName.ClientID %>').value
        },
        appearance: { theme: 'flat' }
    });
    billingAddress.mount('#billing-address-element');
    billingAddress.on('change', function (event) {
        var displayError = document.getElementById('billing-address-errors');
        displayError.textContent = event.error ? event.error.message : '';
        if (event.complete && event.value) {
            document.getElementById('<%= hfBillingAddressDetails.ClientID %>').value = JSON.stringify(event.value);
        }
    });
}
    <%} %>

    <%if (pnlShippingInfoEdit.Visible) { %>
    var hasSavedShipping = document.querySelector('input[name="shippingAddressChoice"]') !== null;

    if (hasSavedShipping) {
        var defaultShippingChecked = document.querySelector('input[name="shippingAddressChoice"]:checked');
        if (defaultShippingChecked && defaultShippingChecked.value !== 'new') {
            document.getElementById('<%=pnlNewShippingAddressEntry.ClientID%>').style.display = 'none';
        // Set the selected address
        toggleShippingAddressSelection(true, defaultShippingChecked.value);
    } else {
        // Mount shipping address element for new address
        var savedShipping = getStoredAddress('<%= hfShippingAddressDetails.ClientID %>');
        shippingAddress = elements.create('address', {
            mode: 'shipping',
            fields: { phone: 'always' },
            defaultValues: savedShipping || {
                name: document.getElementById('<%= hfName.ClientID %>').value
            },
            appearance: { theme: 'flat' }
        });
        shippingAddress.mount('#shipping-address-element');
        shippingAddress.on('change', function (event) {
            var displayError = document.getElementById('shipping-address-errors');
            displayError.textContent = event.error ? event.error.message : '';
            if (event.complete && event.value) {
                document.getElementById('<%= hfShippingAddressDetails.ClientID %>').value = JSON.stringify(event.value);
            }
        });
    }
} else {
    // No saved addresses, always show new address entry
    var savedShipping = getStoredAddress('<%= hfShippingAddressDetails.ClientID %>');
    shippingAddress = elements.create('address', {
        mode: 'shipping',
        fields: { phone: 'always' },
        defaultValues: savedShipping || {
            name: document.getElementById('<%= hfName.ClientID %>').value
        },
        appearance: { theme: 'flat' }
    });
    shippingAddress.mount('#shipping-address-element');
    shippingAddress.on('change', function (event) {
        var displayError = document.getElementById('shipping-address-errors');
        displayError.textContent = event.error ? event.error.message : '';
        if (event.complete && event.value) {
            document.getElementById('<%= hfShippingAddressDetails.ClientID %>').value = JSON.stringify(event.value);
        }
    });
}
    <%} %>

    function getStoredAddress(fieldId) {
        try {
            return JSON.parse(document.getElementById(fieldId).value);
        } catch {
            return undefined;
        }
    }

    function toggleShippingAddress(checkboxChecked) {
        const hfSameAsBilling = document.getElementById('<%= hfSameAsBilling.ClientID %>');
       const shippingSelectionArea = document.getElementById('shippingAddressSelectionArea');

       hfSameAsBilling.value = checkboxChecked;

       if (checkboxChecked) {
           // Copy billing to shipping
           const billingVal = document.getElementById('<%= hfBillingAddressDetails.ClientID %>').value;
        if (billingVal) {
            document.getElementById('<%= hfShippingAddressDetails.ClientID %>').value = billingVal;
           }
           shippingSelectionArea.style.display = 'none';
       } else {
           // Show shipping input again
           shippingSelectionArea.style.display = '';

           // Re-initialize if needed
           var hasSavedShipping = document.querySelector('input[name="shippingAddressChoice"]') !== null;
           if (hasSavedShipping) {
               var defaultShippingChecked = document.querySelector('input[name="shippingAddressChoice"]:checked');
               if (defaultShippingChecked && defaultShippingChecked.value !== 'new') {
                   toggleShippingAddressSelection(true, defaultShippingChecked.value);
               }
           }
       }
   }

    function reinitializeShippingAddress() {
        if (shippingAddress) {
            shippingAddress.unmount();
            shippingAddress = null;
        }
        const saved = getStoredAddress('<%= hfShippingAddressDetails.ClientID %>');
        shippingAddress = elements.create('address', {
            mode: 'shipping',
            fields: { phone: 'always' },
            defaultValues: saved || { name: document.getElementById('<%= hfName.ClientID %>').value },
            appearance: { theme: 'flat' }
        });

        shippingAddress.mount('#shipping-address-element');
        shippingAddress.on('change', function (event) {
            var displayError = document.getElementById('shipping-address-errors');
            displayError.textContent = event.error ? event.error.message : '';
            if (event.complete && event.value) {
                document.getElementById('<%= hfShippingAddressDetails.ClientID %>').value = JSON.stringify(event.value);
            }
        });
    }

    window.addEventListener('DOMContentLoaded', function () {
        const checkbox = document.getElementById('<%= chkSameAsBilling.ClientID %>');
        if (checkbox && checkbox.checked) {
            toggleShippingAddress(true);
        }
    });

    function saveBillingAddressBeforePost() {
        if (billingAddress) {
            return billingAddress
                .getValue()
                .then(function (result) {
                    if (result && result.value) {
                        document.getElementById('<%= hfBillingAddressDetails.ClientID %>').value = JSON.stringify(result.value);
                    }
                    return true; // allow postback
                }).catch(function (err) {
                    console.error(err);
                    return true;
                });
        }
        return true;
    }

    function saveShippingAddressBeforePost() {
        if (shippingAddress) {
            return shippingAddress
                .getValue()
                .then(function (result) {
                    if (result && result.value) {
                        document.getElementById('<%= hfShippingAddressDetails.ClientID %>').value = JSON.stringify(result.value);
                    }
                    return true;
                }).catch(function (err) {
                    console.error(err);
                    return true;
                });
        }
        return true;
    }

  

    function toggleBillingAddressSelection(usingSavedAddress, addressId) {
        var newAddressPanel = document.getElementById('<%=pnlNewBillingAddressEntry.ClientID%>');

    if (usingSavedAddress && addressId) {
        // Hide new address entry
        newAddressPanel.style.display = 'none';

        // Unmount billing address element if it exists
        if (billingAddress) {
            billingAddress.unmount();
            billingAddress = null;
        }

        // Store the selected address ID
        document.getElementById('<%= hfSelectedBillingAddressId.ClientID %>').value = addressId;

        // Set the billing address details from saved address
        if (savedBillingAddresses[addressId]) {
            document.getElementById('<%= hfBillingAddressDetails.ClientID %>').value = JSON.stringify(savedBillingAddresses[addressId]);
        }
    } else {
        // Show new address entry
        newAddressPanel.style.display = 'block';
        document.getElementById('<%= hfSelectedBillingAddressId.ClientID %>').value = '';

        // Mount billing address element if not already mounted
        if (!billingAddress) {
            var savedBilling = getStoredAddress('<%= hfBillingAddressDetails.ClientID %>');
            billingAddress = elements.create('address', {
                mode: 'billing',
                fields: { phone: 'always' },
                defaultValues: savedBilling || {
                    name: document.getElementById('<%= hfName.ClientID %>').value
                },
                appearance: { theme: 'flat' }
            });
            billingAddress.mount('#billing-address-element');
            billingAddress.on('change', function (event) {
                var displayError = document.getElementById('billing-address-errors');
                displayError.textContent = event.error ? event.error.message : '';
                if (event.complete && event.value) {
                    document.getElementById('<%= hfBillingAddressDetails.ClientID %>').value = JSON.stringify(event.value);
                }
            });
            }
        }
    }

    function toggleShippingAddressSelection(usingSavedAddress, addressId) {
        var newAddressPanel = document.getElementById('<%=pnlNewShippingAddressEntry.ClientID%>');

        if (usingSavedAddress && addressId) {
            // Hide new address entry
            newAddressPanel.style.display = 'none';

            // Unmount shipping address element if it exists
            if (shippingAddress) {
                shippingAddress.unmount();
                shippingAddress = null;
            }

            // Store the selected address ID
            document.getElementById('<%= hfSelectedShippingAddressId.ClientID %>').value = addressId;

            // Set the shipping address details from saved address
            if (savedShippingAddresses[addressId]) {
                document.getElementById('<%= hfShippingAddressDetails.ClientID %>').value = JSON.stringify(savedShippingAddresses[addressId]);
            }
        } else {
            // Show new address entry
            newAddressPanel.style.display = 'block';
            document.getElementById('<%= hfSelectedShippingAddressId.ClientID %>').value = '';

            // Mount shipping address element if not already mounted
            if (!shippingAddress) {
                var savedShipping = getStoredAddress('<%= hfShippingAddressDetails.ClientID %>');
                shippingAddress = elements.create('address', {
                    mode: 'shipping',
                    fields: { phone: 'always' },
                    defaultValues: savedShipping || {
                        name: document.getElementById('<%= hfName.ClientID %>').value
                    },
                    appearance: { theme: 'flat' }
                });
                shippingAddress.mount('#shipping-address-element');
                shippingAddress.on('change', function (event) {
                    var displayError = document.getElementById('shipping-address-errors');
                    displayError.textContent = event.error ? event.error.message : '';
                    if (event.complete && event.value) {
                        document.getElementById('<%= hfShippingAddressDetails.ClientID %>').value = JSON.stringify(event.value);
                    }
                });
            }
        }

    }
</script>

</asp:Panel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:PlaceHolder runat="server" ID="phOrderPreview" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server" />
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server" />
