<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFPlan.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.FormWFPlan" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Plan</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
                

               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                    <div class="form-group">
                      <label for="<%=cboStatus.ClientID %>">Status</label><asp:DropDownList ID="cboStatus" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                    <div class="form-group">
                      <label for="<%=cboService.ClientID %>">Service</label><asp:DropDownList ID="cboService" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

                   <div class="form-group">
                     <label for="<%=cboPlanGroup.ClientID %>">Plan Group</label><asp:DropDownList runat="server" ID="cboPlanGroup" CssClass="form-control"></asp:DropDownList>
                </div>
                 <div class="form-group">
                      <label for="<%=txtDescription.ClientID %>">Description</label><asp:TextBox ID="txtDescription" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
             

                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>




            