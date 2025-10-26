<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFSystemInstance.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.FormWFSystemInstance" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">System Instance</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtCodeName.ClientID %>">Code Name</label><asp:TextBox ID="txtCodeName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtServiceURL.ClientID %>">Service URL</label><asp:TextBox ID="txtServiceURL" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Status</label><asp:DropDownList ID="cboStatus" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

                 <div class="form-group">
                     <label for="<%=cboAuthMode.ClientID %>">Auth Mode</label><asp:DropDownList ID="cboAuthMode" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                 <div class="form-group">
      <label for="<%=txtAuthUrl.ClientID %>">Auth URL</label><asp:TextBox ID="txtAuthUrl" CssClass="form-control" runat="server"></asp:TextBox>
</div>
                 <div class="form-group">
      <label for="<%=txtLogoUrl.ClientID %>">Logo URL</label><asp:TextBox ID="txtLogoUrl" CssClass="form-control" runat="server"></asp:TextBox>
</div>

               
                 <div class="form-group">
                      <label for="<%=txtNotes.ClientID %>">Notes</label><asp:TextBox ID="txtNotes" CssClass="form-control" runat="server" TextMode="Multiline"></asp:TextBox>
                </div>
               


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            