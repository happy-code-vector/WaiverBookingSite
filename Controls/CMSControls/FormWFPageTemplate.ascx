<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFPageTemplate.ascx.cs" Inherits="WaiverFile.Controls.CMSControls.FormWFPageTemplate" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">PageTemplate</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                                 <div class="form-group">
     <label for="<%=cboTheme.ClientID %>">Theme</label><asp:DropDownList ID="cboTheme" CssClass="form-control" runat="server"></asp:DropDownList>
</div>
               

                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                   <div class="form-group">
       <label for="<%=cboStatus.ClientID %>">Status</label><asp:DropDownList ID="cboStatus" CssClass="form-control" runat="server"></asp:DropDownList>
  </div>
               
               
                 <div class="form-group">
                      <label for="<%=txtUserControlPath.ClientID %>">User Control Path</label><asp:TextBox ID="txtUserControlPath" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtDescription.ClientID %>">Description</label><asp:TextBox ID="txtDescription" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtPreviewImageUrl.ClientID %>">Preview Image Url</label><asp:TextBox ID="txtPreviewImageUrl" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                 <div class="form-group">
                     <asp:CheckBox runat="server" ID="chkUseForStandardPages" Text="Use for Standard Pages" />
            </div>

                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            