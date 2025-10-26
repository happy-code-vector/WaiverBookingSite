<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFPlanGroup.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.FormWFPlanGroup" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">WFPlanGroup</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtGroupName.ClientID %>">GroupName</label><asp:TextBox ID="txtGroupName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtDescription.ClientID %>">Description</label><asp:TextBox ID="txtDescription" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                  <div class="form-group">
                      <label for="<%=chkIsPrimaryPublic.ClientID %>">Main Public Plan List</label><asp:CheckBox ID="chkIsPrimaryPublic" CssClass="form-control" runat="server"></asp:CheckBox>
                      <p class="help-block">This is to mark the main, public list of plans that are available to everyone. Everyone will have access to select these plans.</p>
                </div>
                <div class="form-group">
                      <label for="<%=chkIsPrimaryHighSecurity.ClientID %>">High Security Plan List</label><asp:CheckBox ID="chkIsPrimaryHighSecurity" CssClass="form-control" runat="server"></asp:CheckBox>
                      <p class="help-block">Sites that are in high security mode will have access to these plans.</p>
                </div>

                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            