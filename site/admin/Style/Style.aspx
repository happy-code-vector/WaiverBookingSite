<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Style.aspx.cs" Inherits="WaiverFile.site.admin.Style.Style" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .just-padding {
            padding: 15px;
        }

        .list-group.list-group-root {
            padding: 0;
            overflow: hidden;
        }

        .list-group.list-group-root .list-group {
            margin-bottom: 0;
        }

        .list-group.list-group-root .list-group-item {
            border-radius: 0;
            border-width: 1px 0 0 0;
        }

        .list-group.list-group-root > .list-group-item:first-child {
            border-top-width: 0;
        }

        .list-group.list-group-root > .list-group > .list-group-item {
            padding-left: 30px;
        }

        .list-group.list-group-root > .list-group > .list-group > .list-group-item {
            padding-left: 45px;
        }

        .list-group.list-group-root > .list-group > .list-group > .list-group > .list-group-item {
            padding-left: 60px;
        }

        .list-group-item .glyphicon {
            margin-right: 5px;
        }

        li.list-group-item label {
            padding-left: 10px;
            min-width: 170px;
            line-height: 30px;
            margin: 0;
            font-weight: normal;
        }

        a.list-group-item {
            font-weight: bold;
        }
    </style>

    <script type="text/javascript">

        $(function () {

            $('#btnExpandAll').click(function () {
                $('.list-group-root > .list-group').each(function () { $(this).collapse('show'); });
                $('.list-group-root > .list-group .list-group').each(function () { $(this).collapse('show'); });
                $('.list-group-root > .list-group .list-group .list-group').each(function () { $(this).collapse('show'); });
            });
            $('#btnCollapseAll').click(function () {
                $('.list-group-root > .list-group').each(function () { $(this).collapse('hide'); });
                $('.list-group-root > .list-group .list-group').each(function () { $(this).collapse('hide'); });
                $('.list-group-root > .list-group .list-group .list-group').each(function () { $(this).collapse('hide'); });
            });
        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <h3>Customize Styles</h3>
    <p>Select options below to override default styles. Options left blank will use the default settings.</p>
    <p> <a id="btnExpandAll" href="javascript:void(0);" class="btn btn-primary btn-sm ">Expand All</a> <a id="btnCollapseAll" href="javascript:void(0);" class="btn btn-primary btn-sm">Collapse All</a> </p>

    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

    <asp:Panel runat="server" ID="pnlMain" CssClass="form-inline">
    <div class="list-group list-group-root"  style="padding-bottom:238px"><!-- padding to prevent cutoff of picker popup -->

        <a href="#item-1" class="list-group-item" data-toggle="collapse" aria-expanded="false">
            <i class="glyphicon glyphicon-chevron-right"></i>General Styles
        </a>
        <div class="list-group collapse " id="item-1">

                  <a href="#item-1-0" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                <i class="glyphicon glyphicon-chevron-right"></i>Alignment Options
            </a>
            <ul class="list-group collapse " id="item-1-0">
                <li class="list-group-item">
                    <label>Logo Alignment</label>
                    <asp:DropDownList runat="server" ID="cboLogoAlign" CssClass="form-control"></asp:DropDownList>
                </li>
               
            </ul>

            <a href="#item-1-1" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                <i class="glyphicon glyphicon-chevron-right"></i>Main Colors
            </a>
            <ul class="list-group collapse " id="item-1-1">
                <li class="list-group-item">
                    <label>Background</label>
                    <telerik:RadColorPicker runat="server" ID="cpMainBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                <li class="list-group-item">
                    <label>Text</label>
                    <telerik:RadColorPicker runat="server" ID="cpMainText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
            </ul>
            <a href="#item-1-2" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                <i class="glyphicon glyphicon-chevron-right"></i>Header Bar
            </a>
            <ul class="list-group collapse " id="item-1-2">
                <li class="list-group-item">
                    <label>Background</label>
                    <telerik:RadColorPicker runat="server" ID="cpHeadBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                <li class="list-group-item">
                    <label>Text</label>
                    <telerik:RadColorPicker runat="server" ID="cpHeadText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
            </ul>


            <a href="#item-3" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                <i class="glyphicon glyphicon-chevron-right"></i>Primary Buttons
            </a>
            <div class="list-group collapse " id="item-3">

                <a href="#item-3-1" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-chevron-right"></i>Normal
                </a>
                <ul class="list-group collapse " id="item-3-1">
                    <li class="list-group-item">
                        <label>Background</label>
                        <telerik:RadColorPicker runat="server" ID="cpBtnPrimaryBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                    <li class="list-group-item">
                        <label>Text</label>
                        <telerik:RadColorPicker runat="server" ID="cpBtnPrimaryText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                </ul>

                <a href="#item-3-2" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-chevron-right"></i>Hover (Mouse-over)
                </a>
                <ul class="list-group collapse " id="item-3-2">
                    <li class="list-group-item">
                        <label>Background</label>
                        <telerik:RadColorPicker runat="server" ID="cpBtnPrimaryHoverBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                    <li class="list-group-item">
                        <label>Text</label>
                        <telerik:RadColorPicker runat="server" ID="cpBtnPrimaryHoverText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                </ul>

                <a href="#item-3-3" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-chevron-right"></i>Selected/Active
                </a>
                <ul class="list-group collapse " id="item-3-3">
                    <li class="list-group-item">
                        <label>Background</label>
                        <telerik:RadColorPicker runat="server" ID="cpBtnPrimaryActiveBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                    <li class="list-group-item">
                        <label>Text</label>
                        <telerik:RadColorPicker runat="server" ID="cpBtnPrimaryActiveText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                </ul>
            </div>



            <a href="#item-4" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                <i class="glyphicon glyphicon-chevron-right"></i>Secondary Buttons
            </a>
            <div class="list-group collapse " id="item-4">

                <a href="#item-4-1" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-chevron-right"></i>Normal
                </a>
                <ul class="list-group collapse " id="item-4-1">
                    <li class="list-group-item">
                        <label>Background</label>
                        <telerik:RadColorPicker runat="server" ID="cpBtnSecondaryBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                    <li class="list-group-item">
                        <label>Text</label>
                        <telerik:RadColorPicker runat="server" ID="cpBtnSecondaryText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                </ul>

                <a href="#item-4-2" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-chevron-right"></i>Hover (Mouse-over)
                </a>
                <ul class="list-group collapse " id="item-4-2">
                    <li class="list-group-item">
                        <label>Background</label>
                         <telerik:RadColorPicker runat="server" ID="cpBtnSecondaryHoverBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                    <li class="list-group-item">
                        <label>Text</label>
                        <telerik:RadColorPicker runat="server" ID="cpBtnSecondaryHoverText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                </ul>

                <a href="#item-4-3" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-chevron-right"></i>Selected/Active
                </a>
                <ul class="list-group collapse " id="item-4-3">
                    <li class="list-group-item">
                        <label>Background</label>
                        <telerik:RadColorPicker runat="server" ID="cpBtnSecondaryActiveBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                    <li class="list-group-item">
                        <label>Text</label>
                        <telerik:RadColorPicker runat="server" ID="cpBtnSecondaryActiveText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                </ul>
            </div>


        </div>


         <a href="#item-5" class="list-group-item" data-toggle="collapse" aria-expanded="false">
            <i class="glyphicon glyphicon-chevron-right"></i>Welcome/Thank You Screens
        </a>
        <div class="list-group collapse " id="item-5">

            <a href="#item-5-1" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                <i class="glyphicon glyphicon-chevron-right"></i>Colors
            </a>
            <ul class="list-group collapse " id="item-5-1">
                <li class="list-group-item">
                    <label>Background</label>
                     <telerik:RadColorPicker runat="server" ID="cpWelcomeBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                <li class="list-group-item">
                    <label>Text</label>
                     <telerik:RadColorPicker runat="server" ID="cpWelcomeText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
            </ul>
            <a href="#item-6" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                <i class="glyphicon glyphicon-chevron-right"></i>Buttons
            </a>
            <div class="list-group collapse " id="item-6">

                <a href="#item-6-1" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-chevron-right"></i>Normal
                </a>
                <ul class="list-group collapse " id="item-6-1">
                    <li class="list-group-item">
                        <label>Background</label>
                          <telerik:RadColorPicker runat="server" ID="cpWelcomeBtnBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                    <li class="list-group-item">
                        <label>Text</label>
                         <telerik:RadColorPicker runat="server" ID="cpWelcomeBtnText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                </ul>

                <a href="#item-6-2" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-chevron-right"></i>Hover (Mouse-over)
                </a>
                <ul class="list-group collapse " id="item-6-2">
                    <li class="list-group-item">
                        <label>Background</label>
                           <telerik:RadColorPicker runat="server" ID="cpWelcomeBtnHoverBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                    <li class="list-group-item">
                        <label>Text</label>
                         <telerik:RadColorPicker runat="server" ID="cpWelcomeBtnHoverText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                </ul>

                <a href="#item-6-3" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-chevron-right"></i>Selected/Active
                </a>
                <ul class="list-group collapse " id="item-6-3">
                    <li class="list-group-item">
                        <label>Background</label>
                        <telerik:RadColorPicker runat="server" ID="cpWelcomeBtnActiveBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                    <li class="list-group-item">
                        <label>Text</label>
                        <telerik:RadColorPicker runat="server" ID="cpWelcomeBtnActiveText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                    </li>
                </ul>
            </div>



            </div>


        <!-- forms -->

         <a href="#item-7" class="list-group-item" data-toggle="collapse" aria-expanded="false">
            <i class="glyphicon glyphicon-chevron-right"></i>Forms and Inputs
        </a>
        <div class="list-group collapse " id="item-7">


             <a href="#item-7-3" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                <i class="glyphicon glyphicon-chevron-right"></i>Form Fields
            </a>
            <ul class="list-group collapse " id="item-7-3">
               <li class="list-group-item">
                    <label>Label Text</label>
                    <telerik:RadColorPicker runat="server" ID="cpFormLabelText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                 <li class="list-group-item">
                    <label>Form Field Text</label>
                    <telerik:RadColorPicker runat="server" ID="cpFormFieldText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                <li class="list-group-item">
                    <label>Form Field Border</label>
                    <telerik:RadColorPicker runat="server" ID="cpFormFieldBorder" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                 <li class="list-group-item">
                    <label>Form Field Background</label>
                    <telerik:RadColorPicker runat="server" ID="cpFormFieldBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                 <li class="list-group-item">
                    <label>Required Marker (star)</label>
                    <telerik:RadColorPicker runat="server" ID="cpFormFieldRequiredMarker" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                
                <li class="list-group-item">
                    <label>Invalid Label Text</label>
                    <telerik:RadColorPicker runat="server" ID="cpFormLabelTextValidate" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                <li class="list-group-item">
                    <label>Invalid Marker</label>
                    <telerik:RadColorPicker runat="server" ID="cpFormInvalidMarker" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                <li class="list-group-item">
                    <label>Invalid Highlight Border</label>
                    <telerik:RadColorPicker runat="server" ID="cpFormInvalidBorder" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                <li class="list-group-item">
                    <label>Invalid Background Color</label>
                    <telerik:RadColorPicker runat="server" ID="cpFormFieldInvalidBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
            </ul>

            
            <a href="#item-7-2" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                <i class="glyphicon glyphicon-chevron-right"></i>Error Box
            </a>
            <ul class="list-group collapse " id="item-7-2">
               <li class="list-group-item">
                    <label>Background</label>
                    <telerik:RadColorPicker runat="server" ID="cpErrBoxBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                 <li class="list-group-item">
                    <label>Border</label>
                    <telerik:RadColorPicker runat="server" ID="cpErrBoxBorder" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                <li class="list-group-item">
                    <label>Text</label>
                    <telerik:RadColorPicker runat="server" ID="cpErrBoxText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
            </ul>
            <a href="#item-7-1" class="list-group-item" data-toggle="collapse" aria-expanded="false">
                <i class="glyphicon glyphicon-chevron-right"></i>Information Box
            </a>
            <ul class="list-group collapse " id="item-7-1">
                <li class="list-group-item">
                    <label>Background</label>
                    <telerik:RadColorPicker runat="server" ID="cpInfoBoxBG" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                 <li class="list-group-item">
                    <label>Border</label>
                    <telerik:RadColorPicker runat="server" ID="cpInfoBoxBorder" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
                <li class="list-group-item">
                    <label>Text</label>
                    <telerik:RadColorPicker runat="server" ID="cpInfoBoxText" PaletteModes="All" RenderMode="Lightweight" ShowIcon="true"></telerik:RadColorPicker>
                </li>
            </ul>
            
        

        </div>



    </div>

   </asp:Panel>


    <!--
    Main Body background color - body
    Main body text color - body
    Welcome Screen background color - .bg-primary
    Welcome Screen button background color-  .btn-light
    Welcome Screen button text color - .btn-light
    Primary Button Color - .btn-primary
    Primary Button Text Color - .btn-primary
    Secondary Button Color - .btn-default
    Secondary Button Text - .btn-default
    top-bar color - .navbar-default
    top-bar background color - .navbar-default
    top-bar border-color - .navbar-default
    
    <h4>Font</h4>
    Waiver agreement text font - .ipa_waiver_text
    Waiver agreement text size - .ipa_waiver_text
    Waiver agreement text color - .ipa_waiver_text-->

    <asp:Button runat="server" CssClass="btn btn-primary" ID="btnSave" OnClick="btnSave_Click" Text="Save" />

</asp:Content>
