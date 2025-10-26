<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFImageLocation.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.FormWFImageLocation" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">WFImageLocation</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Status</label><asp:DropDownList ID="cboStatus" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                         <div class="form-group">
                      <label for="<%=txtCodeName.ClientID %>">Code Name</label><asp:TextBox ID="txtCodeName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtDescription.ClientID %>">Description</label><asp:TextBox ID="txtDescription" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtRecommendedWidth.ClientID %>">RecommendedWidth</label><asp:TextBox ID="txtRecommendedWidth" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtRecommendedHeight.ClientID %>">RecommendedHeight</label><asp:TextBox ID="txtRecommendedHeight" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtUploadMinWidth.ClientID %>">UploadMinWidth</label><asp:TextBox ID="txtUploadMinWidth" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
               
                 <div class="form-group">
                     <label for="<%=txtUploadMinHeight.ClientID %>">UploadMinHeight</label><asp:TextBox ID="txtUploadMinHeight" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 <div class="form-group">
                     <label for="<%=txtUploadMaxWidth.ClientID %>">UploadMaxWidth</label><asp:TextBox ID="txtUploadMaxWidth" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtUploadMaxHeight.ClientID %>">UploadMaxHeight</label><asp:TextBox ID="txtUploadMaxHeight" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtAutoResizeBoundingBoxWidth.ClientID %>">AutoResizeBoundingBoxWidth</label><asp:TextBox ID="txtAutoResizeBoundingBoxWidth" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtAutoResizeBoundingBoxHeight.ClientID %>">AutoResizeBoundingBoxHeight</label><asp:TextBox ID="txtAutoResizeBoundingBoxHeight" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                
               


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            