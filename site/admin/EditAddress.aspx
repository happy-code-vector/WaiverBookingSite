<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditAddress.aspx.cs" Inherits="WaiverFile.site.admin.EditAddress" %>
    <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">


            
            
                <h3>Address</h3>
                   <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

                  <!-- Name Section -->
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="<%=txtFirstName.ClientID %>">First Name</label>
                        <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server" placeholder="Enter first name"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="<%=txtMiddleName.ClientID %>">Middle Name</label>
                        <asp:TextBox ID="txtMiddleName" CssClass="form-control" runat="server" placeholder="Enter middle name"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="<%=txtLastName.ClientID %>">Last Name</label>
                        <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server" placeholder="Enter last name"></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- Address Section -->
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="<%=txtAddress.ClientID %>">Street Address</label>
                        <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" placeholder="123 Main Street"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="<%=txtAddress2.ClientID %>">Address Line 2 <small class="text-muted">(Optional)</small></label>
                        <asp:TextBox ID="txtAddress2" CssClass="form-control" runat="server" placeholder="Apartment, suite, unit, etc."></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- City, State, Zip Row -->
            <div class="row">
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="<%=txtCity.ClientID %>">City</label>
                        <asp:TextBox ID="txtCity" CssClass="form-control" runat="server" placeholder="Enter city"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="<%=txtStateCode.ClientID %>">State</label>
                        <asp:TextBox ID="txtStateCode" CssClass="form-control" runat="server" placeholder="NY" MaxLength="2"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="<%=txtPostalZipCode.ClientID %>">ZIP Code</label>
                        <asp:TextBox ID="txtPostalZipCode" CssClass="form-control" runat="server" placeholder="12345"></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- Country -->
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="<%=txtCountryCode.ClientID %>">Country</label>
                        <asp:TextBox ID="txtCountryCode" CssClass="form-control" runat="server" placeholder="US"></asp:TextBox>
                    </div>
                </div>
            </div>

            <hr>

            <!-- Contact Section -->
            <h4 class="text-primary"><i class="fa fa-phone"></i> Contact Information</h4>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="<%=txtContactPhone.ClientID %>">Primary Phone</label>
                        <asp:TextBox ID="txtContactPhone" CssClass="form-control" runat="server" placeholder="(555) 123-4567"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="<%=txtContactPhoneAlt.ClientID %>">Alternate Phone <small class="text-muted">(Optional)</small></label>
                        <asp:TextBox ID="txtContactPhoneAlt" CssClass="form-control" runat="server" placeholder="(555) 987-6543"></asp:TextBox>
                    </div>
                </div>
            </div>

            <hr>

            <!-- Preferences Section -->
            <h4 class="text-primary"><i class="fa fa-cog"></i> Address Preferences</h4>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="checkbox">
                        <label>
                            <asp:CheckBox ID="chkIsDefaultShippingAddress" runat="server"></asp:CheckBox>
                            Set as Default Shipping Address
                        </label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="checkbox">
                        <label>
                            <asp:CheckBox ID="chkIsDefaultBillingAddress" runat="server"></asp:CheckBox>
                            Set as Default Billing Address
                        </label>
                    </div>
                </div>
            </div>
               
               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default" Text="Save" onclick="btnSave_Click" />
        

            

</asp:Content>
