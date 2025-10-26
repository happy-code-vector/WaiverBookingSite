<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormDesigner.ascx.cs" Inherits="WaiverFile.Controls.FormDesigner" %>



<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<asp:Panel ID="pnlMain" runat="server">

    
  <link rel="stylesheet" href="/wp-content/styles/formbuilder/formbuilder.css" />

  <script type="text/javascript" src="/wp-content/Scripts/vendor.js"></script>
  <script type="text/javascript" src="/wp-content/Scripts/formbuilder.custom.js"></script>

<script type="text/javascript">
    var fb;
    
    var saveSuccess = true;
    $(function () {
        fb = new Formbuilder({
            selector: '.fb-main',
            bootstrapData: 
              <%=jsonText %>
            
            });

        
        fb.on('save', function (payload) {
            //SAVE THE RESULTS. 
            $.post("/Controls/FormDesignerSave.ashx", { siteid: '<%=siteid%>', waiverformid:'<%=id.ToString()%>', data: payload},
                  function (data) {
                      //clear items from controlToUpdate
                      if (data == "SUCCESS") {
                          saveSuccess = true;
                          $('#<%=btnSave2.ClientID %>').click();
                          //SAVED.
                      }else{
                          saveSuccess = false;
                          alert(data);
                      }
                  });

        });
        fb.on('formSaved', function (payload) {
            //SAVE THE RESULTS. 
            $.post("/Controls/FormDesignerSave.ashx", { waiverformid:'<%=id.ToString()%>', data: payload},
                  function (data) {
                      //clear items from controlToUpdate
                      if (data == "SUCCESS") {
                          saveSuccess = true;
                          $('#<%=btnSave2.ClientID %>').click();
                          //SAVED.
                      }else{
                          saveSuccess = false;
                          alert(data);
                      }
                  });

        });

      

        $('#<%=chkFieldInclude_Email.ClientID%>').change(function(){ ensureUnChecked($(this), $('#<%=chkFieldRequire_Email.ClientID%>')); });
        $('#<%=chkFieldRequire_Email.ClientID%>').change(function(){ ensureChecked($(this), $('#<%=chkFieldInclude_Email.ClientID%>')); });

        $('#<%=chkFieldInclude_Address.ClientID%>').change(function(){ ensureUnChecked($(this), $('#<%=chkFieldRequire_Address.ClientID%>')); });
        $('#<%=chkFieldRequire_Address.ClientID%>').change(function(){ ensureChecked($(this), $('#<%=chkFieldInclude_Address.ClientID%>')); });

        $('#<%=chkFieldInclude_Phone.ClientID%>').change(function(){ ensureUnChecked($(this), $('#<%=chkFieldRequire_Phone.ClientID%>')); });
        $('#<%=chkFieldRequire_Phone.ClientID%>').change(function(){ ensureChecked($(this), $('#<%=chkFieldInclude_Phone.ClientID%>')); });

        $('#<%=chkFieldInclude_DOB.ClientID%>').change(function(){ ensureUnChecked($(this), $('#<%=chkFieldRequire_DOB.ClientID%>')); });
        $('#<%=chkFieldRequire_DOB.ClientID%>').change(function(){ ensureChecked($(this), $('#<%=chkFieldInclude_DOB.ClientID%>')); });

    });

    function ensureUnChecked(sender, target){
        if(!$(sender).is(':checked') && $(target).is(':checked')){
            $(target).prop('checked', false);
        }
    }
    function ensureChecked(sender, target){
        //SOME CHECKBOXES DEPEND ON OTHERS
        if($(sender).is(':checked') && !$(target).is(':checked')){
            $(target).prop('checked', true);
        }
    }
    function HandleSave(){
        //var result = fb.mainView.doAjaxSave(''); 
        //var result = fb.save();
        if(fb.mainView.formSaved){
            return true;
        }
        fb.mainView.saveForm.call(fb.mainView);
        return false; 
    }
       
    </script>

           <div class="widget">
                <h3>Standard Form Fields</h3>
                <div class="widgetcontent">


<p>Select which form fields you want to include and make required.</p>
                 <div class="form-group checkrow">
                      <label class="col-sm-2 control-label" for="<%=chkFieldInclude_Email.ClientID %>">Email</label><div class="col-sm-10"> Include: <asp:CheckBox ID="chkFieldInclude_Email" runat="server" Checked="true"></asp:CheckBox> Require: <asp:CheckBox ID="chkFieldRequire_Email" runat="server" Checked="true"></asp:CheckBox></div>
                </div>
               
                 <div class="form-group checkrow">
                      <label class="col-sm-2 control-label" for="<%=chkFieldInclude_Address.ClientID %>">Address</label><div class="col-sm-10"> Include: <asp:CheckBox ID="chkFieldInclude_Address" runat="server" Checked="true"></asp:CheckBox> Require: <asp:CheckBox ID="chkFieldRequire_Address" runat="server" Checked="true"></asp:CheckBox></div>
                </div>
               
                 <div class="form-group checkrow">
                      <label class="col-sm-2 control-label" for="<%=chkFieldInclude_Phone.ClientID %>">Phone</label><div class="col-sm-10"> Include: <asp:CheckBox ID="chkFieldInclude_Phone" runat="server" Checked="true"></asp:CheckBox> Require: <asp:CheckBox ID="chkFieldRequire_Phone" runat="server" Checked="true"></asp:CheckBox></div>
                </div>
               
                 <div class="form-group checkrow">
                      <label class="col-sm-2 control-label" for="<%=chkFieldInclude_DOB.ClientID %>">Date of Birth</label><div class="col-sm-10"> Include: <asp:CheckBox ID="chkFieldInclude_DOB" runat="server" Checked="true"></asp:CheckBox> Require: <asp:CheckBox ID="chkFieldRequire_DOB" runat="server" Checked="true"></asp:CheckBox></div>
                </div>
<hr />
<h3>Ask Customers to Join Your Mailing List</h3>
                    <p>Use these options to choose how to ask customers if they would like to opt in to your mailing list. Integrations with mailing services will use this to determine which names to send.</p>
         <div class="form-group">
             <asp:RadioButtonList runat="server" ID="cblOptIn">

                 <asp:ListItem Value="ASK_DEFAULT_CHECKED" Selected="true">Ask to join, check the box by default</asp:ListItem>
                 <asp:ListItem Value="ASK_DEFAULT_UNCHECKED">Ask to join, don&#39;t check the box by default</asp:ListItem>
                 <asp:ListItem Value="DONT_ASK">Don&#39;t ask to join</asp:ListItem>

             </asp:RadioButtonList>
         </div>  
                    <div class="form-group">
                    <label class="col-sm-2 control-label">Join Label</label><div class="col-sm-10"><asp:TextBox ID="txtOptInLabel" runat="server" Checked="true" CssClass="form-control" Text="Join our mailing list"></asp:TextBox></div>
                        </div>
                    <div class="form-group">
                    <label class="col-sm-2 control-label">Additional Details</label><div class="col-sm-10"><asp:TextBox ID="txtOptInDesc" runat="server" Checked="true" CssClass="form-control" Text=""></asp:TextBox></div>
                         <p class="help-block">This text will be displayed under the question.</p>
                        </div>

<hr />
<h3>Custom Form Fields</h3>
<p>Use the options below to add additional form fields to your waiver form.</p>

<div class='fb-main'></div>


    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" OnClientClick="return HandleSave()" OnClick="btnSave_Click" />
    <div style="display:none;"><asp:Button ID="btnSave2" runat="server" CssClass="btn btn-primary" Text="Save 2" OnClick="btnSave_Click" /></div>

                    </div>
               </div>
    </asp:Panel> 