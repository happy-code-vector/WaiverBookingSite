<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormAffiliate.ascx.cs" Inherits="WaiverFile.CRM.Controls.FormAffiliate" %>
<%@ Register Assembly="Waypoint" Namespace="Waypoint.Forms" TagPrefix="cc1" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Affiliate</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtCode.ClientID %>">Affiliate Code</label><asp:TextBox ID="txtCode" CssClass="form-control" runat="server" placeholder="Leave blank to auto-generate"></asp:TextBox>
                </div>
               
                <div class="form-group">
                      <label for="<%=txtCommissionRate.ClientID %>">Commission Rate</label><asp:TextBox ID="txtCommissionRate" CssClass="form-control" runat="server" ></asp:TextBox>
                    <p class="help-block">Enter as a percentage (e.g. 20 = 20%)</p>
                </div>
                <div class="form-group">
                      <label for="<%=txtCommissionExpiration.ClientID %>">Commission Expiration (months)</label><asp:TextBox ID="txtCommissionExpiration" CssClass="form-control" runat="server" ></asp:TextBox>
                        <p class="help-block">Number of months to offer the commission from when clients begin paying. Leave blank for unending commission. </p>
                </div>
               
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Affiliate Status</label><asp:DropDownList runat="server" ID="cboStatus" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                     <label for="<%=chkViewAccess.ClientID %>">Has View-Waiver Access</label><asp:CheckBox runat="server" ID="chkViewAccess" CssClass="form-control"></asp:CheckBox>
                    <p class="help-block">* This will grant access to view all client waiver data to this affiliate.</p>
                </div>
                <div class="form-group">
                     <label for="<%=chkUsageTotalAccess.ClientID %>">Has Usage Data Access</label><asp:CheckBox runat="server" ID="chkUsageTotalAccess" CssClass="form-control"></asp:CheckBox>
                    <p class="help-block">* This will grant access to usage data for all clients of this affiliate.</p>
                </div>


   <div class="form-group"><label>Title</label><asp:DropDownList ID="cboTitle" runat="server" CssClass="form-control"></asp:DropDownList></div>
   <div class="form-group"><label>First Name</label><asp:TextBox ID="txtFirst" runat="server" CssClass="form-control"></asp:TextBox></div>
   <div class="form-group"><label>Middle Name</label><asp:TextBox ID="txtMiddle" runat="server" CssClass="form-control"></asp:TextBox></div>
   <div class="form-group"><label>Last Name</label><asp:TextBox ID="txtLast" runat="server" CssClass="form-control"></asp:TextBox></div>
   <div class="form-group"><label>Company</label><asp:TextBox ID="txtCompany" runat="server" CssClass="form-control"></asp:TextBox></div>
   <div class="form-group"><label>Suffix</label><asp:DropDownList ID="cboSuffix" runat="server" CssClass="form-control"></asp:DropDownList></div>
   <div class="form-group"><label>Email Address</label><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox></div>
   <div class="form-group"><label>New Password</label><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></div>
   <div class="form-group"><label>Confirm Password</label><asp:TextBox ID="txtPassword2" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></div>
   <div class="form-group"><label>Notes</label></div>
   <div class="form-group"><asp:TextBox ID="txtAdminNotes" runat="server" TextMode="MultiLine"></asp:TextBox></div>
    <p class="help-block">Customer notes are visible to site administrators only. Customers cannot see notes.</p>
   


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>


