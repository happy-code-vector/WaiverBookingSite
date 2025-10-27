<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFSubControl" %>
<%@ Import Namespace="Waypoint.Core" %>
<%@ Import Namespace="WaiverFile.Core.Booking" %>
<%@ Import Namespace="WaiverFile.Core" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Register Src="~/sitebooking/Controls/NavbarBooking.ascx" TagPrefix="uc1" TagName="NavbarBooking" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        ((WPPageLite)Page).EnsureManagedConnection("WaiverFileDB");
        SqlConnection conn = (SqlConnection)((WPPageLite)Page).ManagedConnections["WaiverFileDB"];

        WFImage img = WFImage.GetWFImage(conn, WaiverSiteRef.ID, "PUBLIC_HEADER");
        if (img != null)
        {
            phHeader.Controls.Add(new LiteralControl(string.Format("<img src=\"{1}\" alt=\"{0} Logo\" class=\"img-fluid\" style=\"max-height: 50px;\"/>", WaiverSiteRef.Name, img.GetImageUrlDirectToSource())));
        }
        else
        {
            phHeader.Controls.Add(new LiteralControl(string.Format("<span class=\"fs-4 fw-bold text-primary\">{0}</span>", WaiverSiteRef.Name)));
        }

        BookingCart cart = BookingCart.GetCart(Page, WaiverSiteRef);
        if (cart != null && cart.ItemsCombined != null)
        {
            int num = 0;
            foreach (var curr in cart.ItemsCombined)
            {
                if (curr.ItemType != BookingUtils.ItemTypeEnum.Tax && 
                    curr.ItemType != BookingUtils.ItemTypeEnum.Fee && 
                    curr.ItemType != BookingUtils.ItemTypeEnum.Shipping && 
                    curr.ItemType != BookingUtils.ItemTypeEnum.Handling && 
                    curr.ItemType != BookingUtils.ItemTypeEnum.Shipping_and_Handling)
                {
                    num += curr.Quantity;
                }
            }
            lblCartItemCount.Text = num.ToString();
        }
    }
    
    protected void btnCartIcon_Click(object sender, EventArgs e)
    {
        Response.Redirect(WaiverSiteRef.BasePathRelativeBooking + "/ViewCart.aspx");
    }
</script>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
    <div class="container">
        <!-- Logo -->
        <a class="navbar-brand d-flex align-items-center" href="<%= WaiverSiteRef.BasePathRelativeBooking %>">
            <asp:PlaceHolder runat="server" ID="phHeader"></asp:PlaceHolder>
        </a>
        
        <!-- Mobile Toggle Button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <!-- Navigation Menu -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <uc1:NavbarBooking runat="server" id="NavbarBooking" CssClass="navbar-nav ms-auto mb-2 mb-lg-0" />
            
            <!-- Placeholder for drag-drop widgets -->
            <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
            
            <!-- User Account & Cart -->
            <div class="d-flex align-items-center gap-2 ms-lg-3">
                <!-- User Account Dropdown -->
                <% if (AuthenticatedCustomer != null) { %>
                    <div class="dropdown">
                        <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle"></i>
                            <span class="d-none d-md-inline ms-1">Account</span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                            <li><a class="dropdown-item" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerBookings.aspx">
                                <i class="bi bi-calendar-check me-2"></i>My Bookings
                            </a></li>
                            <li><a class="dropdown-item" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerOrders.aspx">
                                <i class="bi bi-receipt me-2"></i>Payment History
                            </a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-danger" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerLogout.aspx">
                                <i class="bi bi-box-arrow-right me-2"></i>Log Out
                            </a></li>
                        </ul>
                    </div>
                <% } else { %>
                    <a href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerLogin.aspx" class="btn btn-outline-secondary">
                        <i class="bi bi-person-circle"></i>
                        <span class="d-none d-md-inline ms-1">Log In</span>
                    </a>
                <% } %>
                
                <!-- Shopping Cart -->
                <asp:LinkButton runat="server" ID="btnCartIcon" OnClick="btnCartIcon_Click" CssClass="btn btn-primary position-relative">
                    <i class="bi bi-cart3"></i>
                    <span class="d-none d-md-inline ms-1">Cart</span>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                        <asp:Label runat="server" ID="lblCartItemCount">0</asp:Label>
                        <span class="visually-hidden">items in cart</span>
                    </span>
                </asp:LinkButton>
            </div>
        </div>
    </div>
</nav>
