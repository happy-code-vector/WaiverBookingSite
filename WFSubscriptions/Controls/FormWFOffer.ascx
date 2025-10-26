<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFOffer.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.FormWFOffer" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">WaiverFile Offer</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
                           <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 <div class="form-group">
                      <label for="<%=txtCode.ClientID %>">Code</label><asp:TextBox ID="txtCode" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
     
               
                 <div class="form-group">
                     <label for="<%=txtPercentOff.ClientID %>">Percent Off</label><asp:TextBox ID="txtPercentOff" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtNumMonths.ClientID %>">Number of Months</label><asp:TextBox ID="txtNumMonths" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=dtOfferExpires.ClientID %>">Offer Expires</label>
                       <telerik:RadDatePicker ID="dtOfferExpires" runat="server"></telerik:RadDatePicker>
                </div>
               
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Status</label><asp:DropDownList ID="cboStatus" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
               
                 <div class="form-group">
                     <label>Plans</label>
               <div class="checkboxlist">
                        <asp:CheckBoxList ID="cblPlans" runat="server" CssClass="entrycheckbox"></asp:CheckBoxList>
                    </div>
                     </div>

                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            