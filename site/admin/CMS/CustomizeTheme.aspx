<%@ Page Title="Customize Theme" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="CustomizeTheme.aspx.cs" Inherits="WaiverFile.site.admin.CMS.CustomizeTheme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .style-editor-section {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .style-editor-section h3 {
            margin-top: 0;
            padding-bottom: 10px;
            border-bottom: 2px solid #f4f4f4;
        }
        .form-group.color-picker input[type="text"] {
            display: inline-block;
            width: 120px;
            margin-right: 10px;
        }
        .form-group.color-picker input[type="color"] {
            vertical-align: middle;
            height: 34px;
            border: 1px solid #ccc;
        }
        .slider-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .slider-container input[type="range"] {
            flex: 1;
        }
        .slider-container .slider-value {
            min-width: 60px;
            text-align: right;
        }

       .slider-container {
    display: flex;
    align-items: center;
    gap: 10px;
}

.slider-container .form-control-range {
    flex: 1;
    margin: 0;
}

.slider-container .slider-value {
    width: 60px;
    text-align: center;
    flex-shrink: 0;
}

.slider-container span {
    flex-shrink: 0;
    min-width: 25px;
}
    </style>

    
    <script type="text/javascript">
        // Define globally so it's available when dynamic scripts execute
        function syncColorPicker(textboxId, pickerId) {
            var $textbox = $('#' + textboxId);
            var $picker = $('#' + pickerId);

            // Set initial picker value from textbox
            if ($textbox.val()) {
                $picker.val($textbox.val());
            }

            // Update textbox when picker changes
            $picker.on('change', function () {
                $textbox.val($(this).val());
            });

            // Update picker when textbox changes
            $textbox.on('change', function () {
                var val = $(this).val();
                if (val.match(/^#[0-9A-F]{6}$/i)) {
                    $picker.val(val);
                }
            });
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <asp:Panel ID="pnlEditor" runat="server">
        
         <h3>Customize Theme: <asp:Literal ID="litThemeName" runat="server"></asp:Literal></h3>

            <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert alert-success" style="margin-top: 20px;">
    <asp:Literal ID="litMessage" runat="server"></asp:Literal>
</asp:Panel>

        <!-- Colors Section -->
        <div class="style-editor-section">
            <h4><i class="fa fa-paint-brush"></i> Colors</h4>
            
            <div class="form-group color-picker">
                <label>Primary Color</label>
                <div>
                    <asp:TextBox ID="txtPrimaryColor" runat="server" CssClass="form-control" placeholder="#007bff" ClientIDMode="Static"></asp:TextBox>
                    <input type="color" id="cpPrimaryColor" />
                </div>
                <small class="form-text text-muted">Main brand color for buttons and links</small>
            </div>

            <div class="form-group color-picker">
                <label>Secondary Color</label>
                <div>
                    <asp:TextBox ID="txtSecondaryColor" runat="server" CssClass="form-control" placeholder="#6c757d" ClientIDMode="Static"></asp:TextBox>
                    <input type="color" id="cpSecondaryColor" />
                </div>
                <small class="form-text text-muted">Secondary accent color</small>
            </div>

            <div class="form-group color-picker">
                <label>Success Color</label>
                <div>
                    <asp:TextBox ID="txtSuccessColor" runat="server" CssClass="form-control" placeholder="#28a745" ClientIDMode="Static"></asp:TextBox>
                    <input type="color" id="cpSuccessColor" />
                </div>
            </div>

            <div class="form-group color-picker">
                <label>Background Color</label>
                <div>
                    <asp:TextBox ID="txtBackgroundColor" runat="server" CssClass="form-control" placeholder="#ffffff" ClientIDMode="Static"></asp:TextBox>
                    <input type="color" id="cpBackgroundColor" />
                </div>
            </div>
        </div>

        <!-- Typography Section -->
        <div class="style-editor-section">
            <h4><i class="fa fa-font"></i> Typography</h4>
            
            <div class="form-group">
                <label>Heading Font</label>
                <asp:DropDownList ID="ddlHeadingFont" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Arial">Arial</asp:ListItem>
                    <asp:ListItem Value="Helvetica">Helvetica</asp:ListItem>
                    <asp:ListItem Value="Georgia">Georgia</asp:ListItem>
                    <asp:ListItem Value="Times New Roman">Times New Roman</asp:ListItem>
                    <asp:ListItem Value="'Segoe UI', Tahoma">Segoe UI</asp:ListItem>
                    <asp:ListItem Value="'Trebuchet MS'">Trebuchet MS</asp:ListItem>
                    <asp:ListItem Value="Verdana">Verdana</asp:ListItem>
                    <asp:ListItem Value="'Courier New'">Courier New</asp:ListItem>
                </asp:DropDownList>
                <small class="form-text text-muted">Font family for headings (H1-H6)</small>
            </div>

            <div class="form-group">
                <label>Body Font</label>
                <asp:DropDownList ID="ddlBodyFont" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Arial">Arial</asp:ListItem>
                    <asp:ListItem Value="Helvetica">Helvetica</asp:ListItem>
                    <asp:ListItem Value="Georgia">Georgia</asp:ListItem>
                    <asp:ListItem Value="Times New Roman">Times New Roman</asp:ListItem>
                    <asp:ListItem Value="'Segoe UI', Tahoma">Segoe UI</asp:ListItem>
                    <asp:ListItem Value="'Trebuchet MS'">Trebuchet MS</asp:ListItem>
                    <asp:ListItem Value="Verdana">Verdana</asp:ListItem>
                </asp:DropDownList>
                <small class="form-text text-muted">Font family for body text</small>
            </div>

            <div class="form-group">
                <label>Base Font Size</label>
                <div class="slider-container">
                    <asp:TextBox ID="txtBaseFontSize" runat="server" CssClass="form-control" ClientIDMode="Static"
                        style="width: 80px;" Text="16" type="number" min="12" max="24"></asp:TextBox>
                    <span>px</span>
                </div>
            </div>
        </div>

        <!-- Layout Section -->
        <div class="style-editor-section">
            <h4><i class="fa fa-th-large"></i> Layout</h4>
            
            <div class="form-group">
                <label>Border Radius</label>
                <div class="slider-container">
                    <input type="range" id="sliderBorderRadius" min="0" max="50" value="4" 
                        class="form-control-range" />
                    <asp:TextBox ID="txtBorderRadius" runat="server" CssClass="form-control slider-value"  ClientIDMode="Static"
                        Text="4" readonly="true"></asp:TextBox>
                    <span>px</span>
                </div>
                <small class="form-text text-muted">Roundness of buttons and cards</small>
            </div>

            <div class="form-group">
                <label>Container Max Width</label>
                <div class="slider-container">
                    <asp:TextBox ID="txtContainerWidth" runat="server" CssClass="form-control"  ClientIDMode="Static"
                        style="width: 100px;" Text="1200" type="number"></asp:TextBox>
                    <span>px</span>
                </div>
            </div>
        </div>

        <!-- Advanced Section -->
        <div class="style-editor-section">
            <h4><i class="fa fa-code"></i> Advanced Custom CSS</h4>
            
            <div class="form-group">
                <label>Custom CSS</label>
                <asp:TextBox ID="txtAdvancedCss" runat="server" TextMode="MultiLine" ClientIDMode="Static"
                    Rows="10" CssClass="form-control" Font-Names="Courier New" 
                    placeholder="/* Add custom CSS rules here */"></asp:TextBox>
                <small class="form-text text-muted">
                    This CSS will be applied last, allowing you to override any styles. 
                    Be careful - invalid CSS may break your theme.
                </small>
            </div>
        </div>

     
     

    </asp:Panel>
       
       <!-- Action Buttons -->
   <div class="row">
       <div class="col-lg-12">
           <asp:Button ID="btnSave" runat="server" Text="Save Changes" 
               CssClass="btn btn-primary" OnClick="btnSave_Click" />
           <asp:Button ID="btnReset" runat="server" Text="Reset to Defaults" 
               CssClass="btn btn-warning" OnClick="btnReset_Click" 
               OnClientClick="return confirm('Are you sure you want to reset all customizations to theme defaults? This cannot be undone.');" />
           <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
               CssClass="btn btn-default" OnClick="btnCancel_Click" CausesValidation="false" />
       </div>
   </div>

     <script type="text/javascript">
         $(document).ready(function () {
             // Call for static controls
             syncColorPicker('txtPrimaryColor', 'cpPrimaryColor');
             syncColorPicker('txtSecondaryColor', 'cpSecondaryColor');
             syncColorPicker('txtSuccessColor', 'cpSuccessColor');
             syncColorPicker('txtBackgroundColor', 'cpBackgroundColor');

             // Sync slider with textbox
             $('#sliderBorderRadius').on('input', function () {
                 $('#txtBorderRadius').val($(this).val());
             });

             $('#txtBorderRadius').on('change', function () {
                 $('#sliderBorderRadius').val($(this).val());
             });
         });
     </script>

</asp:Content>