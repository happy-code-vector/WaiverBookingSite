<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FieldSelector.ascx.cs" Inherits="WaiverFile.Controls.FieldSelector" %>
  <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadScriptBlock runat="server">
  <script type="text/javascript">
      function clientTransferred(sender, args) {
          sender.trackChanges();
          var items = args.get_items();
          for (var i = 0; i < items.length; i++) {
              items[i].disable();
          }
          sender.commitChanges();
      }

      function OnClientSelectedIndexChanging(sender, args) {
          args.set_cancel(true);
      }

      </script>
</telerik:RadScriptBlock>

<telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" Width="256px" Height="64px"  Skin="Default" Modal="true">

</telerik:RadAjaxLoadingPanel>

<telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" EnableAJAX="true" LoadingPanelID="LoadingPanel1" >

      <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

  <div class="row">
      <div class="col-xs-12">
          <h3>Choose Fields</h3>
      </div>
  </div>

    <div class="row">
        
           
            
            <div class="col-sm-4">
                 <h4>Forms</h4>
                 <telerik:RadListBox RenderMode="Lightweight" ID="RadListBox1" CssClass="RadListBox1" runat="server"  Skin="MetroTouch" 
                    AutoPostBack="true"  DataKeyField="ID" DataValueField="ID" Width="100%" Height="360px"
                    DataTextField="Name"
                     
                     >
                   
                </telerik:RadListBox>

            </div>
            <div class="col-sm-4">
                 <h4>Fields</h4>
                   <telerik:RadListBox RenderMode="Lightweight" runat="server" ID="RadListBox2" CssClass="RadListBox2"  Skin="MetroTouch" 
                       DataKeyField="ID" Width="100%" Height="360px"
                    DataValueField="ID" DataTextField="Name"  TransferMode="Copy"
                        OnClientTransferred="clientTransferred"
                       EnableDragAndDrop="true"
                        SelectionMode="Multiple" AllowTransfer="true"  TransferToID="RadListBox3" AutoPostBackOnTransfer="true"
                       >
                  
                </telerik:RadListBox>
            </div>
            <div class="col-sm-4">
                 <h4>Shown on Report:</h4>
                 <telerik:RadListBox RenderMode="Lightweight" runat="server" ID="RadListBox3" CssClass="RadListBox3" 
                    Width="100%" Height="360px" SelectionMode="Multiple"
                    Skin="MetroTouch" OnDeleted="RadListBox3_Deleted"
                     
                     EnableDragAndDrop="true"  AutoPostBackOnDelete="true"
                     AllowReorder="true" AutoPostBackOnReorder="true" AutoPostBackOnTransfer="true" AllowDelete="true"
                     >
                </telerik:RadListBox>
           
            </div>

            
          
               
             
               


        
        </div>
        </telerik:RadAjaxPanel>