<%@ Control Language="C#" AutoEventWireup="true"  Inherits="WaiverFile.Core.Booking.WFSubControl" %>
<%@ Import Namespace="Waypoint.Core" %>
<%@ Import Namespace="WaiverFile.Core.Booking" %>
<%@ Import Namespace="WaiverFile.Core" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        ((WPPageLite)Page).EnsureManagedConnection("WaiverFileDB");
        SqlConnection conn = (SqlConnection)((WPPageLite)Page).ManagedConnections["WaiverFileDB"];

        WFImage img = WFImage.GetWFImage(conn, WaiverSiteRef.ID, "PUBLIC_HEADER");
        if (img != null)
        {
            phHeaderStylish.Controls.Add(new LiteralControl(string.Format("<img src=\"{1}\" alt=\"{0} Logo\" style=\"max-height: 40px;\"/>", WaiverSiteRef.Name, img.GetImageUrlDirectToSource())));
        }
        else
        {
            phHeaderStylish.Controls.Add(new LiteralControl(WaiverSiteRef.Name));
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
            lblCartItemCountStylish.Text = num.ToString();
        }
    }
    
    protected void btnCartIconStylish_Click(object sender, EventArgs e)
    {
        Response.Redirect(WaiverSiteRef.BasePathRelativeBooking + "/ViewCart.aspx");
    }
</script>

<!-- Sidebar Navigation -->
<div class="d-flex" id="wrapper-stylish">
    
    <!-- Sidebar -->
    <div class="bg-stylish-dark border-end" id="sidebar-wrapper-stylish">
        <div class="sidebar-heading border-bottom bg-stylish-dark text-white">
            <asp:PlaceHolder runat="server" ID="phHeaderStylish"></asp:PlaceHolder>
        </div>
        <div class="list-group list-group-flush">
            <a class="list-group-item list-group-item-action bg-stylish-dark text-white p-3" href="<%= WaiverSiteRef.BasePathRelativeBooking %>">
                <i class="ci-home"></i> Home
            </a>
            
            <% if (AuthenticatedCustomer != null) { %>
            <a class="list-group-item list-group-item-action bg-stylish-dark text-white p-3" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerBookings.aspx">
                <i class="ci-calendar"></i> My Bookings
            </a>
            <a class="list-group-item list-group-item-action bg-stylish-dark text-white p-3" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerOrders.aspx">
                <i class="ci-file-text"></i> Payment History
            </a>
            <% } else { %>
            <a class="list-group-item list-group-item-action bg-stylish-dark text-white p-3" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerLogin.aspx">
                <i class="ci-user"></i> Login
            </a>
            <% } %>
            
            <asp:LinkButton runat="server" ID="btnCartIconStylish" OnClick="btnCartIconStylish_Click" CssClass="list-group-item list-group-item-action bg-stylish-dark text-white p-3 position-relative">
                <i class="ci-shopping-bag"></i> Cart
                <span class="position-absolute top-50 end-0 translate-middle-y badge bg-stylish-primary rounded-pill me-3">
                   <asp:Label runat="server" ID="lblCartItemCountStylish">0</asp:Label>
                </span>
            </asp:LinkButton>
            
            <% if (AuthenticatedCustomer != null) { %>
            <a class="list-group-item list-group-item-action bg-stylish-dark text-white p-3 border-top" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerLogout.aspx">
                <i class="ci-log-out"></i> Log Out
            </a>
            <% } %>
        </div>
    </div>
    
    <!-- Page Content -->
    <div id="page-content-wrapper-stylish">
        
        <!-- Mobile Menu Toggle -->
        <div class="menu-toggle-stylish d-lg-none" onclick="toggleSidebar()">
            <i class="ci-menu fs-4"></i>
        </div>
        
        <script>
            function toggleSidebar() {
                document.getElementById('sidebar-wrapper-stylish').classList.toggle('active');
            }
            
            // Close sidebar when clicking outside on mobile
            document.addEventListener('click', function(event) {
                var sidebar = document.getElementById('sidebar-wrapper-stylish');
                var toggle = document.querySelector('.menu-toggle-stylish');
                
                if (window.innerWidth < 992) {
                    if (!sidebar.contains(event.target) && !toggle.contains(event.target)) {
                        sidebar.classList.remove('active');
                    }
                }
            });
        </script>
