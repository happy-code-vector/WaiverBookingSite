<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWaiverSite.ascx.cs" Inherits="WaiverFile.Controls.FormWaiverSite" %>

          
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="row">

  

    <div class="col-sm-6">


        
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Change Settings</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                     <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

                    <div class="form-group">
                        <label>Site Name</label>
                       <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Url</label>
                        <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control"></asp:TextBox>
                        <p class="help-block">Changing the URL will create a redirect from the old url to the new one. Old url's cannot be used again unless manually deleted from the database (tblWaiverSiteOldUrl).</p>
                    </div>
                    <div class="form-group">
                        <label>Status</label>
                       <asp:DropDownList id="cboStatus" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>

                    
                <div class="form-group">
                    <label>Disable Analytic Tracking </label>
                    <asp:CheckBox ID="chkDisableAnalytics" runat="server" />
                </div> 

                    

                    
                    <div class="form-group">
                        <label>Redirect to Instance - URL</label>
                       <asp:TextBox ID="txtSITE_REDIRECT_TO_INSTANCE_URL" CssClass="form-control" runat="server"></asp:TextBox>
                        <p class="help-block">To use this, add a scheme and domain for an instance, e.g. https://client.waiverfile.com. When specified, this will redirect all requests to this site to the same path at the new subdomain. Leave blank to disable. </p>
                        <p class="help-block text-danger">USE CAUTION WITH THIS. REDIRECTS ALL REQUESTS TO THE SITE TO THIS URL! </p>
                    </div>

                </div><!-- /.box-body -->
                <div class="box-footer">
                    <asp:Button runat="server" Text="Save Changes" CssClass="btn btn-primary" ID="btnSave" OnClick="btnSave_Click" />
                </div>
            </div>


          <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Delete Site</h3>
                </div><!-- /.box-header -->
                <div class="box-body">

                    <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger" Text="Mark as Pending Delete" OnClick="btnDelete_Click" />
                    <p class="help-block">This will mark the site as pending delete. No data is actually deleted. Go to the data deletion screen to delete sites that are pending.</p>
                    </div></div>

    </div>
   
       <div class="col-sm-6">

       
          <div class="box box-primary">
              <div class="box-header with-border">
                  <h3 class="box-title">Plugins</h3>
              </div><!-- /.box-header -->
              <div class="box-body">
                  <asp:PlaceHolder runat="server" ID="phErrPlugins"></asp:PlaceHolder>
                  <div class="form-group">
                      <asp:CheckBox runat="server" ID="chkEnablePlugin_Expedia" Text="Expedia" />
                  </div>
              </div><!-- /.box-body -->
               <div class="box-footer">
        <asp:Button runat="server" ID="btnSavePlugins" CssClass="btn btn-primary" Text="Save" OnClick="btnSavePlugins_Click" />
    </div>

          </div>



  </div>


</div>






            



            