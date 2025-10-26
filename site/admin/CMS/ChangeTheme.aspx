<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ChangeTheme.aspx.cs" Inherits="WaiverFile.site.admin.CMS.ChangeTheme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
        .template-mapping-row:hover {
            background-color: #f9f9f9;
        }
        .panel-body {
            padding: 15px;
        }
        #pageList { 
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

     <asp:Panel ID="pnlMain" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                    
                    <asp:Literal ID="litThemeInfo" runat="server"></asp:Literal>
                    
                    <asp:Literal ID="litSummary" runat="server"></asp:Literal>
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>Template Mappings</h4>
                            <p class="help-block">Review and adjust how your current page templates will be mapped to the new theme's templates.</p>
                        </div>
                        <div class="panel-body">
                            <asp:PlaceHolder ID="phMappings" runat="server"></asp:PlaceHolder>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <asp:Button ID="btnActivateTheme" runat="server" 
                            Text="Activate New Theme" 
                            CssClass="btn btn-primary" 
                            OnClick="btnActivateTheme_Click"
                            OnClientClick="return confirm('Are you sure you want to change the theme? This will update all pages immediately.');" />
                        
                        <a href="CustomizeSite.aspx" class="btn btn-default">Cancel</a>
                    </div>
                </div>
            </div>
        </asp:Panel>
</asp:Content>
