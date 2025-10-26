<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysAdminPage.aspx.cs" Inherits="WaiverFile.SysAdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8" />
    <title>WaiverFile</title>
    <link rel="stylesheet" href="/wp-content/styles/includes/bootstrap.min.css" />
    <link rel="stylesheet" href="/wp-content/adminlte/AdminLTE.min.css" />
    <link rel="stylesheet" href="/wp-content/adminlte/skin-blue.min.css" />
    <link rel="stylesheet" href="/wp-content/styles/wpadminstyle.css" />
    <script src="/wp-content/Common/Scripts/jquery-1.9.1.min.js"></script>
    <script src="/wp-content/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/wp-content/adminlte/AdminLTE.js"></script>
    <script src="/wp-content/adminlte/jquery.slimscroll.min.js"></script>
    <link href="/wp-content/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <form id="form1" runat="server">
            <asp:ScriptManager ID="WPScriptManager" runat="server"></asp:ScriptManager>

        <div class="wrapper">

            <header class="main-header">
        <!-- Logo -->
                    <a href="/wp-admin" class="logo">
                      <!-- mini logo for sidebar mini 50x50 pixels -->
                      <span class="logo-mini">
                          <img src="/wp-content/images/waiverfile-logo-square.png" alt="WaiverFile Logo" style="max-width:100%;" />
                      </span>
                      <!-- logo for regular state and mobile devices -->
                      <span class="logo-lg">
                          <img src="/wp-content/images/waiverfile-logo-lg.png" alt="WaiverFile Logo" style="max-width:100%;" />
                      </span>
                    </a>
                    <!-- Header Navbar: style can be found in header.less -->
                    <nav class="navbar navbar-static-top" role="navigation">
                      <!-- Sidebar toggle button-->
                      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                      </a>
                      <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                             <li>
                                  <a href="/.auth/logout"><i class="fa fa-sign-out"></i> Log Out</a>
                              </li>
                          

                        </ul>
                      </div>
                    </nav>
                  </header>



            <aside class="main-sidebar">
                <section class="sidebar">
                              <div class="sidebar-form">
                            <asp:Panel runat="server" DefaultButton="btnSearch" CssClass="input-group" ID="pnlSearch">
                                <asp:TextBox runat="server" ID="txtAdminSearch" placeholder="Search..." CssClass="form-control"></asp:TextBox>
                              <span class="input-group-btn">
                                  <asp:LinkButton runat="server" ID="btnSearch" class="btn btn-flat search-btn" OnClick="btnSearch_Click"><i class="fa fa-search"></i></asp:LinkButton>
                              </span>
                            </asp:Panel>
                          </div>

                    <asp:PlaceHolder ID="phSidebar" runat="server" />
                </section>
            </aside>

            <div class="content-wrapper">
                <section class="content-header">
                    <h1><%=ContextTitle %></h1>
                    <ol class="breadcrumb">
                       <asp:Repeater ID="rptBreadcrumb" runat="server" OnItemCommand="rptBreadcrumb_ItemCommand">
                            <ItemTemplate>
                                <asp:LinkButton 
                                    ID="lnkContext" 
                                    runat="server" 
                                    
                                    CommandName="JumpToContext" 
                                    CommandArgument='<%# Container.ItemIndex %>' 
                                    Text='<%# Eval("DisplayName") %>' 
                                    CssClass='<%# Container.ItemIndex == ((Waypoint.Forms.MenuContextCollection)Session["MENU_CONTEXT"]).Count - 1 ? "breadcrumb-current" : "breadcrumb-link" %>' 
                                    Enabled='<%# Container.ItemIndex != ((Waypoint.Forms.MenuContextCollection)Session["MENU_CONTEXT"]).Count - 1 %>' />
                                  <%# Container.ItemIndex < ((Waypoint.Forms.MenuContextCollection)Session["MENU_CONTEXT"]).Count - 1 ? "<span class='breadcrumb-separator'> | </span>" : "" %>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ol>
                </section>

                <section class="content">
                    <asp:PlaceHolder ID="ph0" runat="server" />
                </section>
            </div>
        </div>
    </form>
</body>
</html>
