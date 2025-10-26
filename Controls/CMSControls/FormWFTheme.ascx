<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFTheme.ascx.cs" Inherits="WaiverFile.Controls.CMSControls.FormWFTheme" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Theme</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtDescription.ClientID %>">Description</label><asp:TextBox ID="txtDescription" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                                 
     
                
                 <div class="form-group">
                      <label for="<%=txtFolderName.ClientID %>">FolderName</label><asp:TextBox ID="txtFolderName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtMasterPageFullWidth.ClientID %>">MasterPageFullWidth</label><asp:TextBox ID="txtMasterPageFullWidth" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtMasterPageLeftNav.ClientID %>">MasterPageLeftNav</label><asp:TextBox ID="txtMasterPageLeftNav" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtMasterPageRightSidebar.ClientID %>">MasterPageRightSidebar</label><asp:TextBox ID="txtMasterPageRightSidebar" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtMasterPageThreeColumn.ClientID %>">MasterPageThreeColumn</label><asp:TextBox ID="txtMasterPageThreeColumn" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
               
         

            

                 <div class="form-group">
                      <label for="<%=txtPreviewImageUrl.ClientID %>">PreviewImageUrl</label><asp:TextBox ID="txtPreviewImageUrl" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Status</label>
                     <asp:DropDownList ID="cboStatus" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
              


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            