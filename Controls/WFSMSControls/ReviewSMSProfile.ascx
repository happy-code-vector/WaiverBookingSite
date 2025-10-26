<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReviewSMSProfile.ascx.cs" Inherits="WaiverFile.Controls.WFSMSControls.ReviewSMSProfile" %>



<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">SMS Profile Request</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        
        <div class="row">
            <div class="col-xs-12">
                <div class="form-group">
                    <label>Site</label>
                    <asp:DropDownList runat="server" ID="cboSites" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">

                 <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit to Twilio - Part 1" OnClick="btnSave_Click" />

                 <asp:Button runat="server" ID="btnSavePart2" CssClass="btn btn-primary" Text="Submit to Twilio - Part 2" OnClick="btnSavePart2_Click" />

                <asp:Button runat="server" ID="btnRefreshStatus" CssClass="btn btn-default" Text="Refresh Status" OnClick="btnRefreshStatus_Click" />

                <asp:Panel runat="server" ID="pnlConfigurePlan">
                    <a href="default.aspx?sc=WF_CONFIGURE_SMS_PLAN&c=0&id=<%=profileID %>" class="btn btn-success">CONFIGURE SMS PLAN</a>
                </asp:Panel>
                

            </div>
        </div>

<asp:PlaceHolder ID="phDetails" runat="server"></asp:PlaceHolder>



    </div><!-- /.box-body -->
    
</div>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">SID'S</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
    <p>The below SID's are what has been generated in the process. Use this to review the status in more detail, or update them and save changes. </p>
        
        
        <div class="form-group">
            <label>CUSTOMER PROFILE SID</label>
            <asp:TextBox runat="server" ID="txtCustomerProfileSid" CssClass="form-control"></asp:TextBox>
        </div>

        <h3>Regular results (standard business types)</h3>

        <div class="form-group">
            <label>RESULT_1_3_customer_profile_business_information</label>
            <asp:TextBox runat="server" ID="RESULT_1_3_customer_profile_business_information" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_1_4_authorized_representative_1</label>
            <asp:TextBox runat="server" ID="RESULT_1_4_authorized_representative_1" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_1_5_authorized_representative_2</label>
            <asp:TextBox runat="server" ID="RESULT_1_5_authorized_representative_2" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_1_6_address</label>
            <asp:TextBox runat="server" ID="RESULT_1_6_address" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_1_6_1_customer_profile_address</label>
            <asp:TextBox runat="server" ID="RESULT_1_6_1_customer_profile_address" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_1_7_CustomerProfilesEntityAssignments_1</label>
            <asp:TextBox runat="server" ID="RESULT_1_7_CustomerProfilesEntityAssignments_1" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_1_7_CustomerProfilesEntityAssignments_2</label>
            <asp:TextBox runat="server" ID="RESULT_1_7_CustomerProfilesEntityAssignments_2" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_1_7_CustomerProfilesEntityAssignments_3</label>
            <asp:TextBox runat="server" ID="RESULT_1_7_CustomerProfilesEntityAssignments_3" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_1_7_CustomerProfilesEntityAssignments_4</label>
            <asp:TextBox runat="server" ID="RESULT_1_7_CustomerProfilesEntityAssignments_4" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_1_7_CustomerProfilesEntityAssignments_5</label>
            <asp:TextBox runat="server" ID="RESULT_1_7_CustomerProfilesEntityAssignments_5" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_1_8_customerProfilesEvaluations</label>
            <asp:TextBox runat="server" ID="RESULT_1_8_customerProfilesEvaluations" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_1_9_customerProfilesSubmitResult</label>
            <asp:TextBox runat="server" ID="RESULT_1_9_customerProfilesSubmitResult" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_2_2_createEmptyTrustBundle</label>
            <asp:TextBox runat="server" ID="RESULT_2_2_createEmptyTrustBundle" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_2_3_company_type</label>
            <asp:TextBox runat="server" ID="RESULT_2_3_company_type" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_2_4_trustBundleAssignment</label>
            <asp:TextBox runat="server" ID="RESULT_2_4_trustBundleAssignment" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_2_5_trustBundleAssignment2</label>
            <asp:TextBox runat="server" ID="RESULT_2_5_trustBundleAssignment2" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_2_6_trustBundleEvalResult</label>
            <asp:TextBox runat="server" ID="RESULT_2_6_trustBundleEvalResult" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_2_7_submitTrustBundleResult</label>
            <asp:TextBox runat="server" ID="RESULT_2_7_submitTrustBundleResult" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_3_createBrand</label>
            <asp:TextBox runat="server" ID="RESULT_3_createBrand" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_4_1_createMessagingSvc</label>
            <asp:TextBox runat="server" ID="RESULT_4_1_createMessagingSvc" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_5_2_usAppToPersonResource</label>
            <asp:TextBox runat="server" ID="RESULT_5_2_usAppToPersonResource" CssClass="form-control"></asp:TextBox>
        </div>
       

        <h3>Sole Proprietor results</h3>

        
        <div class="form-group">
            <label>RESULT_SP_1_3_customer_profile_business_information</label>
            <asp:TextBox runat="server" ID="RESULT_SP_1_3_starter_customer_profile_information" CssClass="form-control"></asp:TextBox>
        </div>
       
        <div class="form-group">
            <label>RESULT_SP_1_4_address</label>
            <asp:TextBox runat="server" ID="RESULT_SP_1_4_address" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_1_5_customer_profile_address</label>
            <asp:TextBox runat="server" ID="RESULT_SP_1_5_customer_profile_address" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_1_6_CustomerProfilesEntityAssignments_1</label>
            <asp:TextBox runat="server" ID="RESULT_SP_1_6_CustomerProfilesEntityAssignments_1" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_1_6_CustomerProfilesEntityAssignments_2</label>
            <asp:TextBox runat="server" ID="RESULT_SP_1_6_CustomerProfilesEntityAssignments_2" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_1_6_CustomerProfilesEntityAssignments_3</label>
            <asp:TextBox runat="server" ID="RESULT_SP_1_6_CustomerProfilesEntityAssignments_3" CssClass="form-control"></asp:TextBox>
        </div>
         <div class="form-group">
            <label>RESULT_SP_1_7_customerProfilesEvaluations</label>
            <asp:TextBox runat="server" ID="RESULT_SP_1_7_customerProfilesEvaluations" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_1_8_customerProfilesSubmitResult</label>
            <asp:TextBox runat="server" ID="RESULT_SP_1_8_customerProfilesSubmitResult" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_2_2_createEmptyTrustBundle</label>
            <asp:TextBox runat="server" ID="RESULT_SP_2_2_createEmptyTrustBundle" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_2_3_company_type</label>
            <asp:TextBox runat="server" ID="RESULT_SP_2_3_company_type" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_2_4_trustBundleAssignment</label>
            <asp:TextBox runat="server" ID="RESULT_SP_2_4_trustBundleAssignment" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_2_5_trustBundleAssignment2</label>
            <asp:TextBox runat="server" ID="RESULT_SP_2_5_trustBundleAssignment2" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_2_6_trustBundleEvalResult</label>
            <asp:TextBox runat="server" ID="RESULT_SP_2_6_trustBundleEvalResult" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_2_7_submitTrustBundleResult</label>
            <asp:TextBox runat="server" ID="RESULT_SP_2_7_submitTrustBundleResult" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_3_createBrand</label>
            <asp:TextBox runat="server" ID="RESULT_SP_3_createBrand" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_4_1_createMessagingSvc</label>
            <asp:TextBox runat="server" ID="RESULT_SP_4_1_createMessagingSvc" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>RESULT_SP_5_2_usAppToPersonResource</label>
            <asp:TextBox runat="server" ID="RESULT_SP_5_2_usAppToPersonResource" CssClass="form-control"></asp:TextBox>
        </div>


    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSaveChanges" CssClass="btn btn-primary" Text="Save result changes" OnClick="btnSaveChanges_Click" />
    </div>
</div>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">item ID lookup</h3>
    </div><!-- /.box-header -->
    <div class="box-body">

            <div class="form-group">
            <label>SID</label>
            <asp:TextBox runat="server" ID="txtSID" CssClass="form-control"></asp:TextBox>
        </div>

        <asp:PlaceHolder runat="server" ID="phLookupResult"></asp:PlaceHolder>

    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnLookup" CssClass="btn btn-primary" Text="Lookup" OnClick="btnLookup_Click" />
    </div>
</div>
