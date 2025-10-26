<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:param name="TimeZoneName"></xsl:param>
    <xsl:output method="html" omit-xml-declaration="yes"/>
  <xsl:param name="DateFormat"></xsl:param>
  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="UserRole"></xsl:param>
  <xsl:param name="IncludeButtons">true</xsl:param>
  <xsl:param name="ShowLimitedDataWarning"></xsl:param>
  <xsl:param name="IncludeEditWaiver"></xsl:param>
  <xsl:param name="WPSMSMobileNumID"></xsl:param>
  <xsl:param name="LoadOriginalVersion"></xsl:param><!-- true -->
  <xsl:param name="OPT_IN_SELECTION"></xsl:param>
  <xsl:param name="WORKFLOW_ALT_STEP_LABEL_TEXT">Workflow Step</xsl:param>

  <xsl:param name="RefIDLabel1">Reference ID</xsl:param>
  <xsl:param name="RefIDLabel2">Reference ID 2</xsl:param>
  <xsl:param name="RefIDLabel3">Reference ID 3</xsl:param>

  <xsl:param name="PARENT_GUARDIAN_INFO"></xsl:param>
  <xsl:param name="ENTER_PARTICIPANTS_NAMES"></xsl:param>
  
  <xsl:variable name="DateFormatWithTime">
    <xsl:value-of select="$DateFormat"/>
    <xsl:text> h:mm a</xsl:text>
  </xsl:variable>

  
  <xsl:template match="/">
    
    <xsl:if test="$LoadOriginalVersion='true'">
      <div class="WPERR_Information">
        This is the original version of this waiver. <a href="viewWaiver.aspx?ID={/Main/Waiver/WaiverID}" class="btn btn-sm btn-muted">
          <i class="fa fa-arrow-left">
            <xsl:text> </xsl:text>
          </i> Back to current version</a>
        <xsl:text> </xsl:text>
        <asp:LinkButton runat="server" ID="btnRestore" CssClass="btn btn-sm btn-primary">
          <i class="fa fa-undo">
            <xsl:text> </xsl:text>
          </i>  Restore original</asp:LinkButton>
        
      </div>
    </xsl:if>

    
    <style type="text/css">
    <xsl:for-each select="/Main/Flags/ArrayOfWaiverFlag/WaiverFlag">
      <xsl:variable name="currFlagID">
        <xsl:value-of select="ID"/>
      </xsl:variable>

      <xsl:text>input.wfflag.wfflag</xsl:text>
      <xsl:value-of select="position()"/>
      <xsl:text>[type=checkbox]:checked + label:before{ color: </xsl:text>
      <xsl:value-of select="Color"/>
      <xsl:text>; }</xsl:text>
      
      </xsl:for-each>
    </style>

    <xsl:for-each select="/Main/Waiver">
    <xsl:if test="WaiverIsDeleted='true'">
      <div class="alert alert-danger">
        <strong>Waiver Archived</strong>
        This waiver has been archived. To restore waivers, go to Archive &gt;&gt; <a href="RestoreWaivers.aspx">Restore Waivers</a>
      </div>
    </xsl:if>
      <xsl:if test="OriginalDataVerified='true' and $LoadOriginalVersion!='true'">
        <div class="WPERR_Information">
          This waiver has been edited. <a href="ViewWaiverOriginal.aspx?ID={WaiverID}">View Original</a>
        </div>
      </xsl:if>

      <xsl:if test="Expired='true'">
        <div class="alert alert-danger">
          <xsl:text> This Waiver is Expired</xsl:text>
        </div>
        
      

      </xsl:if>
      
      

      <xsl:if test="$ShowLimitedDataWarning='true'">
        <div class="alert alert-danger">
          <strong>Sensitive Data Hidden</strong>
          Your account does not have permission to view custom fields of this waiver. These fields have been hidden.
        </div>
      </xsl:if>

 

      <div class="row">
        <div class="col-sm-6">
          <h3>
            <xsl:value-of select="WaiverForm/Name"/>
          </h3>
        </div>
        <div class="col-sm-6 text-right">

          <xsl:if test="$IncludeButtons and $LoadOriginalVersion!='true'">
            <div class="pull-right" style="padding-top:15px;">

              <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                  <i class="fa fa-wrench">
                    <xsl:text> </xsl:text>
                  </i>
                  Waiver Tools
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu pull-right">
                  <li>
                    <asp:LinkButton ID="btnEmailCustomer" runat="server" CssClass="" >
                      <i class="fa fa-envelope">
                        <xsl:text> </xsl:text>
                      </i>
                      <xsl:text> Email Copy to Signee</xsl:text>
                    </asp:LinkButton>
                  </li>
                  <li>
                    <asp:LinkButton ID="btnEmailMe" runat="server" CssClass="" >
                      <i class="fa fa-envelope">
                        <xsl:text> </xsl:text>
                      </i>
                      <xsl:text> Email Copy to Me</xsl:text>
                    </asp:LinkButton>
                    <xsl:text> </xsl:text>
                  </li>
                  <li>
                    <asp:LinkButton ID="btnDownloadPDF" runat="server" CssClass="" >
                      <i class="fa fa-file-pdf-o">
                        <xsl:text> </xsl:text>
                      </i>
                      <xsl:text> Download PDF</xsl:text>
                    </asp:LinkButton>
                  </li>
                  <li>
                    <a href="/Controls/PrintWaivers.aspx?siteid={SiteID}&amp;waiverid={WaiverID}" class="" target="_blank">
                      <i class="fa fa-print"></i>
                      <xsl:text> Print</xsl:text>
                    </a>
                  </li>
                  <xsl:if test="$IncludeEditWaiver='true'">
                    <li>
                      <a href="EditWaiverNote.aspx?waiverid={WaiverID}" class="">
                        <i class="fa fa-sticky-note"></i>
                        <xsl:text> Add a Note</xsl:text>
                      </a>
                    </li>

                    <li>
                      <a href="EditWaiver.aspx?ID={WaiverID}">
                        <i class="fa fa-pencil">
                          <xsl:text> </xsl:text>
                        </i>
                        <xsl:text> Edit Waiver</xsl:text>
                      </a>
                    </li>
                    <xsl:if test="OriginalDataVerified='true'">
                      <li>
                        <a href="ViewWaiverOriginal.aspx?ID={WaiverID}">
                          <i class="fa fa-undo">
                            <xsl:text> </xsl:text>
                          </i>
                          <xsl:text>View Original</xsl:text>
                        </a>
                      </li>
                    </xsl:if>
                  </xsl:if>
                  <xsl:if test="$WPSMSMobileNumID!='' and $WPSMSMobileNumID!='00000000-0000-0000-0000-000000000000'">
                    <li>
                      <a href="SMS/SMSConvo.aspx?mobilenumid={$WPSMSMobileNumID}">
                        <i class="fa fa-mobile">
                          <xsl:text> </xsl:text>
                        </i>
                        <xsl:text> </xsl:text>
                        <xsl:text>Open SMS Messages</xsl:text>
                      </a>
                    </li>
                  </xsl:if>
                  <li>
                    <asp:LinkButton ID="btnDeleteWaiver" runat="server" CssClass="text-danger">
                      <i class="fa fa-trash">
                        <xsl:text> </xsl:text>
                      </i>
                      <xsl:text> </xsl:text>
                      Archive Waiver
                    </asp:LinkButton>
                  </li>

                  <xsl:if test="count(/Main/WorkflowSessionWaivers/ArrayOfWaiver/Waiver)&gt;1">
                    <li role="separator" class="divider">
                      <xsl:text> </xsl:text>
                    </li>
                    <li class="dropdown-header">
                      <xsl:text> Waiver Series (</xsl:text>
                      <xsl:value-of select="count(/Main/WorkflowSessionWaivers/ArrayOfWaiver/Waiver)"/>
                      <xsl:text>)</xsl:text>
                    </li>
                    <li>
                      <asp:LinkButton ID="btnDownloadAll" runat="server" CssClass="text-danger">
                        <i class="fa fa-download">
                          <xsl:text> </xsl:text>
                        </i>
                        <xsl:text> Download All</xsl:text>
                      </asp:LinkButton>
                    </li>
                    <li>
                      <asp:LinkButton ID="btnEmailAllToSignee" runat="server" CssClass="text-danger">
                        <i class="fa fa-envelope-o">
                          <xsl:text> </xsl:text>
                        </i>
                        <xsl:text> Email All To Signee</xsl:text>
                      </asp:LinkButton>
                    </li>
                    <li>
                      <asp:LinkButton ID="btnEmailAllToMe" runat="server" CssClass="text-danger">
                        <i class="fa fa-envelope-o"></i>
                        <xsl:text> Email All To Me</xsl:text>
                      </asp:LinkButton>
                    </li>
                  </xsl:if>

                </ul>
              </div>



              <!--
      <asp:Button ID="btnEmailCustomer" runat="server" CssClass="btn btn-default" Text="Email Copy to Signee"></asp:Button>
      <xsl:text> </xsl:text>
      <asp:Button ID="btnEmailMe" runat="server" CssClass="btn btn-default" Text="Email Copy to Me"></asp:Button>
      <xsl:text> </xsl:text>
      <asp:Button ID="btnDownloadPDF" runat="server" CssClass="btn btn-default" Text="Download PDF"></asp:Button>
      <xsl:text> </xsl:text>
      <a href="/Controls/PrintWaivers.aspx?siteid={SiteID}&amp;waiverid={WaiverID}" class="btn btn-default" target="_blank">
        Print
      </a>-->
              <xsl:text> </xsl:text>




            </div>
          </xsl:if>
          <xsl:if test="$IncludeButtons and $LoadOriginalVersion='true'">
            <div class="pull-right" style="padding-top:15px;">

              <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                  <i class="fa fa-wrench">
                    <xsl:text> </xsl:text>
                  </i>
                  Waiver Tools
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu pull-right">
                  <li>
                    <asp:LinkButton ID="btnEmailCustomer_ORIG" runat="server" CssClass="" >
                      <i class="fa fa-envelope">
                        <xsl:text> </xsl:text>
                      </i>
                      <xsl:text> Email Copy to Signee</xsl:text>
                    </asp:LinkButton>
                  </li>
                  <li>
                    <asp:LinkButton ID="btnEmailMe_ORIG" runat="server" CssClass="" >
                      <i class="fa fa-envelope">
                        <xsl:text> </xsl:text>
                      </i>
                      <xsl:text> Email Copy to Me</xsl:text>
                    </asp:LinkButton>
                    <xsl:text> </xsl:text>
                  </li>
                  <li>
                    <asp:LinkButton ID="btnDownloadPDF_ORIG" runat="server" CssClass="" >
                      <i class="fa fa-file-pdf-o">
                        <xsl:text> </xsl:text>
                      </i>
                      <xsl:text> Download PDF</xsl:text>
                    </asp:LinkButton>
                  </li>
                  <li>
                    
                    <a href="/Controls/PrintWaivers.aspx?siteid={SiteID}&amp;waiverid={WaiverID}&amp;original=true" class="" target="_blank">
                      <i class="fa fa-print"></i>
                      <xsl:text> Print</xsl:text>
                    </a>
                  </li>

                </ul>
              </div>



              <!--
      <asp:Button ID="btnEmailCustomer" runat="server" CssClass="btn btn-default" Text="Email Copy to Signee"></asp:Button>
      <xsl:text> </xsl:text>
      <asp:Button ID="btnEmailMe" runat="server" CssClass="btn btn-default" Text="Email Copy to Me"></asp:Button>
      <xsl:text> </xsl:text>
      <asp:Button ID="btnDownloadPDF" runat="server" CssClass="btn btn-default" Text="Download PDF"></asp:Button>
      <xsl:text> </xsl:text>
      <a href="/Controls/PrintWaivers.aspx?siteid={SiteID}&amp;waiverid={WaiverID}" class="btn btn-default" target="_blank">
        Print
      </a>-->
              <xsl:text> </xsl:text>




            </div>
          </xsl:if>

        </div>
      </div>


      <xsl:if test="count(/Main/WorkflowSessionWaivers/ArrayOfWaiver/Waiver)&gt;1 and $LoadOriginalVersion!='true'">
        <div class="row">
          <div class="col-xs-12">
            <h4>This waiver is part of a series.</h4>
            <table class="table table-condensed">
              <thead>
                <tr>
                  <th>Waiver Form</th>
                  <th>Signed</th>
                  <th>View</th>

                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="/Main/WorkflowSessionWaivers/ArrayOfWaiver/Waiver">
                  <tr>
                    <td>
                      <a href="ViewWaiver.aspx?id={WaiverID}">
                        <xsl:value-of select="WaiverForm/Name"/>
                      </a>
                    </td>
                    <td>
                      <xsl:choose>
                        <xsl:when test="$DateFormat=''">
                          <xsl:value-of select="dt:format-date(DateSigned,'MMMM d, yyyy h:mm a')"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:variable name="combined_format_str">
                            <xsl:value-of select="$DateFormat"></xsl:value-of>
                            <xsl:text> h:mm a</xsl:text>
                          </xsl:variable>
                          <xsl:value-of select="dt:format-date(DateSigned,$combined_format_str)"/>

                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <td>
                      <a href="ViewWaiver.aspx?id={WaiverID}">
                        View
                      </a>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>


          </div>
        </div>
      </xsl:if>
      
      <!-- notes here-->
      <xsl:if test="$LoadOriginalVersion!='true' and count(/Main/Notes/ArrayOfWaiverNote/WaiverNote)!=0">

        <div class="row">
        <xsl:for-each select="/Main/Notes/ArrayOfWaiverNote/WaiverNote">
          <xsl:sort select="CreatedOn" order="descending"/>

          <div class="col-sm-4">
          <div class="panel panel-default">
            <div class="panel-body">
              <xsl:value-of select="Note"/>
            </div>
            <div class="panel-footer" style="padding:5px 15px;">
              <small>
                <xsl:value-of select="CreatedByFirstName"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="CreatedByLastName"/>
                <xsl:if test="CreatedByEmail!=ModifiedByEmail">
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="ModifiedByFirstName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="ModifiedByFirstName"/>
                </xsl:if>
                <xsl:text> </xsl:text>
               
              </small>
          
              
           <span class="pull-right">
             
             <a href="EditWaiverNote.aspx?id={ID}" class="btnRemove" title="Edit Note">
               <i class="fa fa-pencil">
                 <xsl:text> </xsl:text>
               </i>
               <xsl:text> </xsl:text>
               Edit 
             </a>

           </span>

           <br/>
           <small>
             <xsl:choose>
               <xsl:when test="$DateFormat=''">
                 <xsl:value-of select="dt:format-date(LastModifiedOn,'MMMM d, yyyy')"/>
               </xsl:when>
               <xsl:otherwise>
                 <xsl:variable name="combined_format_str">
                   <xsl:value-of select="$DateFormat"></xsl:value-of>
                 </xsl:variable>
                 <xsl:value-of select="dt:format-date(LastModifiedOn,$combined_format_str)"/>

               </xsl:otherwise>
             </xsl:choose>
           </small>
           <span class="pull-right">
             <a href="WaiverNoteHistory.aspx?id={ID}" class="btnRemove" title="History">
               <i class="fa fa-history">
                 <xsl:text> </xsl:text>
               </i>
               <xsl:text> </xsl:text>
               History
             </a>
             <asp:LinkButton runat="server" CommandName="DELETE_NOTE" CommandArgument="{ID}" CssClass="btnRemove">
               <i class="fa fa-trash">
                 <xsl:text> </xsl:text>
               </i>
               <xsl:text> </xsl:text>
               Delete
             </asp:LinkButton>
              </span>
              
         </div>

       </div>
          
        
          </div>
          
          <xsl:if test="position() mod 3 = 0">
            <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;div class="row"&gt;</xsl:text>
          </xsl:if>
        </xsl:for-each>
        </div>
        <!-- and notes exist -->
        



      </xsl:if>

      <xsl:variable name="EmailConfirmed">
        <xsl:if test="Email=ValuesXml/data/field[@label='Confirm Email Address']/value">true</xsl:if>
      </xsl:variable>
      <xsl:variable name="EmailVerified">
        <xsl:if test="EmailVerification/VerifyStatus='Verified'">true</xsl:if>
      </xsl:variable>

    
 
      
      <xsl:variable name="dataMain">
        <data>

      
              <xsl:if test="WaiverEvent/Name!=''">
                <item>
                  <label>
                    Event
                  </label>
                  <value>
                    <xsl:value-of select="WaiverEvent/Name"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="WaiverEvent/TimeLabel"/>
                  </value>
                </item>
              </xsl:if>


          <item>
            <label>Signee Name</label>
            <value>
              <xsl:value-of select="SignedNameFirst"/>
              <xsl:if test="SignedNameFirst!=''">
                <xsl:text> </xsl:text>
              </xsl:if>
              <xsl:value-of select="SignedName"/>
            </value>
          </item>
          <xsl:if test="DOB!='' and DOB!='1/1/1753'">
            <item>
              <label>Date of Birth</label>
              <value>
                <xsl:choose>
                  <xsl:when test="$DateFormat=''">
                    <xsl:value-of select="DOB"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="dt:format-date(dt:parse-date(DOB,'M/d/yyyy'),$DateFormat)=''">
                        <!-- the app puts it in a format with - instead of / -->
                        <xsl:value-of select="dt:format-date(dt:parse-date(DOB,'M-d-yyyy'),$DateFormat)"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="dt:format-date(dt:parse-date(DOB,'M/d/yyyy'),$DateFormat)"/>
                      </xsl:otherwise>
                    </xsl:choose>
                 
                    
                  </xsl:otherwise>
                </xsl:choose>
              </value>
            </item>
          </xsl:if>
          <xsl:if test="DateAttending!='' and dt:year(DateAttending) &gt; 1753">
            <item>
              <label>Date Attending</label>
              <value>
                <xsl:choose>
                  <xsl:when test="$DateFormat=''">
                    <xsl:value-of select="dt:format-date(DateAttending,'MMMM d, yyyy')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:variable name="combined_format_str">
                      <xsl:value-of select="$DateFormat"></xsl:value-of>
                    </xsl:variable>
                    <xsl:value-of select="dt:format-date(DateAttending,$combined_format_str)"/>

                  </xsl:otherwise>
                </xsl:choose>
              </value>
            </item>
          </xsl:if>
          <xsl:if test="Address!=''">
            <item>
              <label>Address</label>
              <value>
                <xsl:value-of select="Address"/>
              </value>
            </item>
          <xsl:if test="Address2!=''">
            <item>
              <label>Address 2</label>
              <value>
                <xsl:value-of select="Address2"/>
              </value>
            </item>
          </xsl:if>
          <item>
            <label>City, State, Zip</label>
            <value>
              <xsl:value-of select="City"/>
              <xsl:text>, </xsl:text>
              <xsl:value-of select="State"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="Zip"/>
            </value>
          </item>
          </xsl:if>
          <xsl:if test="Phone!=''">
            <item>
              <label>Phone</label>
              <value>
                <xsl:value-of select="Phone"/>
              </value>
            </item>
          </xsl:if>
          <xsl:if test="Email!=''">
            <item>
              <label>Email</label>
              <value>
                <a href="mailto:{Email}">
                  <xsl:value-of select="Email"/>
                </a>

                <xsl:if  test="$EmailVerified='true' or $EmailConfirmed='true'">
                  <xsl:text> (</xsl:text>
                  <xsl:if test="$EmailConfirmed='true'">
                    <xsl:text>confirmed</xsl:text>
                    <xsl:if test="$EmailVerified='true'">
                      <xsl:text>, </xsl:text>
                    </xsl:if>
                  </xsl:if>
                    <xsl:if test="$EmailVerified='true'">
                      <xsl:text>verified</xsl:text>
                    </xsl:if>
                  <xsl:text>)</xsl:text>
                </xsl:if>


              </value>
            </item>
          </xsl:if>
          <xsl:if test="OptIn='true' or $OPT_IN_SELECTION = 'ASK_DEFAULT_CHECKED' or $OPT_IN_SELECTION = 'ASK_DEFAULT_UNCHECKED'">
            <item>
              <label>Mailing List Opt-In</label>
              <value>
                <xsl:choose>
                  <xsl:when test="OptIn='true'">Yes</xsl:when>
                  <xsl:otherwise>No</xsl:otherwise>
                </xsl:choose>
              </value>
            </item>
          </xsl:if>
          <item>
            <label>Client IP Address</label>
            <value>
              <xsl:value-of select="ClientIP"/>
            </value>
          </item>
          <xsl:if test="ReferenceID1!=''">
            <item>
              <label>
                <xsl:value-of select="$RefIDLabel1"/>
              </label>
              <value>
                <xsl:value-of select="ReferenceID1"/>
              </value>
            </item>
          </xsl:if>
          <xsl:if test="ReferenceID2!=''">
            <item>
              <label>
                <xsl:value-of select="$RefIDLabel2"/>
              </label>
              <value>
                <xsl:value-of select="ReferenceID2"/>
              </value>
            </item>
          </xsl:if>
          <xsl:if test="ReferenceID3!=''">
            <item>
              <label>
                <xsl:value-of select="$RefIDLabel3"/>
              </label>
              <value>
                <xsl:value-of select="ReferenceID3"/>
              </value>
            </item>
          </xsl:if>
          <item>
            <label>Signing Method</label>
            <value>
              <xsl:choose>
                <xsl:when test="ClientType='Web'">Public Signature Area (Web)</xsl:when>
                <xsl:when test="ClientType='iFrame'">Embedded in Website</xsl:when>
                <xsl:when test="ClientType='Device'">Device Signature Area (Web)</xsl:when>
                <xsl:when test="ClientType='iOS_app'">
                  iOS App
                </xsl:when>
                <xsl:when test="ClientType='Android_app'">Android App</xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="translate(ClientType,'_',' ')"/>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:if test="Device/DeviceName!=''">
                <xsl:text> (</xsl:text>
                <xsl:value-of select="Device/DeviceName"/>
                <xsl:text>)</xsl:text>
              </xsl:if>
            </value>
          </item>




          <!-- custom questions -->


          <xsl:choose>
            <xsl:when test="count(/Main/Waiver/ValuesXml/data/field[@cid!=''])!=0">
              <!-- NEW FORMAT, ADDS CID ATTRIB TO VALS -->

              <xsl:for-each select="FieldsXml/data/fields">
                <xsl:variable name="pos">
                  <xsl:value-of select="position()"/>
                </xsl:variable>
                <xsl:variable name="cid">
                  <xsl:value-of select="cid"/>
                </xsl:variable>
                <xsl:variable name="cidother">
                  <xsl:value-of select="cid"/>
                  <xsl:text>_other</xsl:text>
                </xsl:variable>
                <xsl:variable name="currlbl">
                  <xsl:value-of select="label"/>
                </xsl:variable>
                <xsl:variable name="currlblother">
                  <xsl:value-of select="label"/>
                  <xsl:text> - Other</xsl:text>
                </xsl:variable>

                
                <item>
                  <label>
                    <xsl:value-of select="label"/>
                  </label>
                  <value>
                    <xsl:value-of select="../../../ValuesXml/data/field[@cid=$cid]/value"/>
                  </value>
                  <xsl:if test="field_options/description!=''">
                    <desc>
                      <xsl:value-of select="field_options/description"/>
                    </desc>
                  </xsl:if>
                </item>

                <!-- check for 'other' field and add it here so it appears alongside the main question -->
                <xsl:if test="field_options/include_other_option='true'">
                  <item>
                    <label>
                      <xsl:value-of select="label"/>
                      <xsl:text> - Other</xsl:text>
                    </label>
                    <value>
                      <xsl:value-of select="../../../ValuesXml/data/field[@cid=$cidother]/value"/>
                    </value>
                  </item>
                </xsl:if>
              </xsl:for-each>

              <!-- add any custom fields that are NOT in the fields xml (extra data can be pushed into the values) -->
              <xsl:for-each select="ValuesXml/data/field">
                <xsl:variable name="pos">
                  <xsl:value-of select="position()"/>
                </xsl:variable>
                <xsl:variable name="currlbl">
                  <xsl:value-of select="label"/>
                </xsl:variable>
                <xsl:variable name="cid">
                  <xsl:value-of select="@cid"/>
                </xsl:variable>
                <xsl:variable name="cidother">
                  <xsl:value-of select="@cid"/>
                  <xsl:text>_other</xsl:text>
                </xsl:variable>

                <xsl:variable name="currlblsansother">
                  <xsl:value-of select="str:replace( label, ' - Other','')"/>

                </xsl:variable>

                <xsl:if test="$cid='' or ( count(../../../FieldsXml/data/fields[cid=$cid])=0 and not(contains($cid,'_other')) )">

                  <item>
                    <cid>
                      <xsl:value-of select="$cid"/>
                    </cid>
                    <count>
                      <xsl:value-of select="count(../../../FieldsXml/data/fields[cid=$cid])"/>
                    </count>
                    <label>
                      <xsl:value-of select="label"/>
                    

                    </label>
                    <value>
                      <xsl:value-of select="../../../ValuesXml/data/field[label=$currlbl]/value"/>
                    </value>
                    <xsl:if test="field_options/description!=''">
                      <desc>
                        <xsl:value-of select="field_options/description"/>
                      </desc>
                    </xsl:if>
                  </item>
                </xsl:if>
              </xsl:for-each>

              
              
              
            </xsl:when>
            <xsl:otherwise>
              <!-- OLD FORMAT, NO CID ATTRIB. HANDLE DUPE VALS AS BEST WE CAN -->


              <xsl:for-each select="FieldsXml/data/fields">
                <xsl:variable name="pos">
                  <xsl:value-of select="position()"/>
                </xsl:variable>
                <xsl:variable name="currlbl">
                  <xsl:value-of select="label"/>
                </xsl:variable>
                <xsl:variable name="currlblother">
                  <xsl:value-of select="label"/>
                  <xsl:text> - Other</xsl:text>
                </xsl:variable>


                <!-- only add items that are unique. we will handle items with duplicates separately-->
                <xsl:if test="count(../fields[label=$currlbl])=1">
                  
              
                
                <item>
                  <label>
                    <xsl:value-of select="label"/>
                  </label>
                  <value>
                    <xsl:value-of select="../../../ValuesXml/data/field[label=$currlbl]/value"/>
                  </value>
                  <xsl:if test="field_options/description!=''">
                    <desc>
                      <xsl:value-of select="field_options/description"/>
                    </desc>
                  </xsl:if>
                </item>

                <!-- check for 'other' field and add it here so it appears alongside the main question -->
                <xsl:if test="field_options/include_other_option='true'">
                  <item>
                    <label>
                      <xsl:value-of select="label"/>
                      <xsl:text> - Other</xsl:text>
                    </label>
                    <value>
                      <xsl:value-of select="../../../ValuesXml/data/field[label=$currlblother]/value"/>
                    </value>
                  </item>
                </xsl:if>
                </xsl:if>
                
              </xsl:for-each>

              <!-- add items with duplicte counts, try to get the values in order! -->
              <xsl:for-each select="set:distinct(FieldsXml/data/fields/label)">

                <xsl:variable name="currlbl">
                  <xsl:value-of select="."/>
                </xsl:variable>

                <xsl:if test="count(/Main/Waiver/FieldsXml/data/fields[label=$currlbl])&gt;1">

                  <xsl:for-each select="/Main/Waiver/FieldsXml/data/fields[label=$currlbl]">
                    <xsl:variable name="pos1">
                      <xsl:value-of select="position()"/>
                    </xsl:variable>

                    <item>
                      <label>
                        <xsl:value-of select="label"/>
                      </label>
                      <value>
                        <xsl:value-of select="/Main/Waiver/ValuesXml/data/field[label=$currlbl][position()=$pos1]/value"/>
                      </value>
                      <xsl:if test="/Main/Waiver/ValuesXml/data/field[label=$currlbl][position()=$pos1]/field_options/description!=''">
                        <desc>
                          <xsl:value-of select="/Main/Waiver/ValuesXml/data/field[label=$currlbl][position()=$pos1]/field_options/description"/>
                        </desc>
                      </xsl:if>
                    </item>
                    
                  </xsl:for-each>
                  
                </xsl:if>



              </xsl:for-each>
              
              <!-- add any custom fields that are NOT in the fields xml (extra data can be pushed into the values) -->
              <xsl:for-each select="ValuesXml/data/field">
                <xsl:variable name="pos">
                  <xsl:value-of select="position()"/>
                </xsl:variable>
                <xsl:variable name="currlbl">
                  <xsl:value-of select="label"/>
                </xsl:variable>

                <xsl:variable name="currlblsansother">
                  <xsl:value-of select="str:replace( label, ' - Other','')"/>

                </xsl:variable>


                <xsl:if test="count(../../../FieldsXml/data/fields[label=$currlbl])=0 and count(../../../FieldsXml/data/fields[label=$currlblsansother])=0">

                  <item>
                    <label>
                      <xsl:value-of select="label"/>

                    </label>
                    <value>
                      <xsl:value-of select="../../../ValuesXml/data/field[label=$currlbl]/value"/>
                    </value>
                    <xsl:if test="field_options/description!=''">
                      <desc>
                        <xsl:value-of select="field_options/description"/>
                      </desc>
                    </xsl:if>
                  </item>
                </xsl:if>
              </xsl:for-each>

              
            </xsl:otherwise>
          </xsl:choose>



          
          <!--
          
          this just spits out the saved values. optional fields are not shown. that's why we were going through the fields first. 
          
          <xsl:for-each select="ValuesXml/data/field">
            <xsl:variable name="pos">
              <xsl:value-of select="position()"/>
            </xsl:variable>
            <xsl:variable name="currlbl">
              <xsl:value-of select="label"/>
            </xsl:variable>


            <item>
              <label>
                <xsl:value-of select="label"/>
              </label>
              <value>
                <xsl:value-of select="value"/>
              </value>
              <xsl:if test="../../../FieldsXml/data/fields[label=$currlbl]/field_options/description!=''">
                    <desc>
                      <xsl:value-of select="../../../FieldsXml/data/fields[label=$currlbl]/field_options/description"/>
                    </desc>
              </xsl:if>
            </item>


          </xsl:for-each>
-->
          
          

        </data>
      </xsl:variable>


      <!--<xsl:copy-of select="$dataMain"/>-->
      
      <xsl:variable name="dataMainCount" select="count(msxsl:node-set($dataMain)/data/item)"/>

      <h4>
        <xsl:value-of select="$PARENT_GUARDIAN_INFO"/>
      </h4>
      <div class="row">
        <div class="col-sm-6">

          <table class="table table-condensed" style="margin-bottom:0">
            <tbody>
            <xsl:for-each select="msxsl:node-set($dataMain)/data/item[position()&lt;=($dataMainCount div 2)]">
              <tr>
                <td>
                  <strong>
                    <xsl:value-of select="label"/>
                  </strong>
                </td>
                <td>
                  <xsl:value-of select="value"/>
                </td>
              </tr>
              <xsl:if test="desc!=''">
                <tr>
                  <td colspan="2">
                    <small>
                      <xsl:value-of select="desc"/>
                    </small>
                  </td>
                </tr>
              </xsl:if>
            </xsl:for-each>
            </tbody>
          </table>
          
        </div>
        <div class="col-sm-6">

          <table class="table table-condensed" style="margin-bottom:0">
            <tbody>

              <xsl:for-each select="msxsl:node-set($dataMain)/data/item[position()&gt;($dataMainCount div 2)]">
                <tr>
                  <td>
                    <strong>
                      <xsl:value-of select="label"/>
                    </strong>
                  </td>
                  <td>
                    <xsl:value-of select="value"/>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>


        </div>
      </div>
      <div class="row">
        <div class="col-xs-12">
          <div style="height:20px;">
            <xsl:text> </xsl:text>
          </div>
        </div>
      </div>


        <xsl:if test="count(Particpants/WaiverParticipant[IsSignee!='true'])!=0">

          <h4 style="margin-top:0;">
            <xsl:value-of select="$ENTER_PARTICIPANTS_NAMES"/>
          </h4>

          <div class="row">
          <xsl:choose>
            <xsl:when test="Particpants/WaiverParticipant[IsSignee!='true']/ValuesXml/Values/Value">
              <!-- custom values have been specified. render them in chunks -->


              <xsl:for-each select="Particpants/WaiverParticipant[IsSignee!='true']">
                <div class="col-sm-6">
               
                <table class="table table-condensed">

                  <thead>
                    <tr>
                      <th>
                        <xsl:value-of select="ParticipantNameFirst"/>
                        <xsl:if test="ParticipantNameFirst!=''">
                          <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="ParticipantName"/>
                      </th>
                    </tr>
                  </thead>
                  
                  <tbody>



                    <xsl:if test="DOB!='' and DOB!='1/1/1753'">
                      <tr>
                        <td>
                          <strong>Date of Birth</strong>
                        </td>
                        <td>
                          <xsl:choose>
                            <xsl:when test="$DateFormat=''">
                              <xsl:value-of select="DOB"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:choose>
                                <xsl:when test="dt:format-date(dt:parse-date(DOB,'M/d/yyyy'),$DateFormat)=''">
                                  <!-- the app puts it in a format with - instead of / -->
                                  <xsl:value-of select="dt:format-date(dt:parse-date(DOB,'M-d-yyyy'),$DateFormat)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:value-of select="dt:format-date(dt:parse-date(DOB,'M/d/yyyy'),$DateFormat)"/>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                    </xsl:if>

                    <xsl:for-each select="ValuesXml/Values/Value">
                      <tr>
                        <td>
                          <strong>
                            <xsl:value-of select="@label"/>
                          </strong>
                        </td>
                        <td>
                          <xsl:value-of select="."/>
                        </td>
                      </tr>

                    </xsl:for-each>
                  </tbody>
                </table>
                </div>

                <xsl:if test="position() mod 2 = 0">
                  <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;div class="row"&gt;</xsl:text>
                </xsl:if>
              </xsl:for-each>

            </xsl:when>
            <xsl:otherwise>

              <div class="col-xs-12">
              <table class="table table-condensed">
                <thead>
                  <tr>
                    <th>Name</th>
                    <xsl:if test="count(Particpants/WaiverParticipant[IsSignee!='true' and DOB!='' and DOB!='1/1/1753'])!=0">
                      <th>
                        <strong>Date of Birth</strong>
                      </th>
                    </xsl:if>
                    <xsl:if test="/Main/Waiver/WorkflowStepID!='00000000-0000-0000-0000-000000000000'">
                      <th>
                        <xsl:value-of select="$WORKFLOW_ALT_STEP_LABEL_TEXT"/>
                      </th>
                    </xsl:if>
                  </tr>
                </thead>
                <tbody>
                  <!-- changing this so it will show the signee if a workflow was used -->
                  <xsl:for-each select="Particpants/WaiverParticipant[IsSignee!='true' or /Main/Waiver/WorkflowStepID!='00000000-0000-0000-0000-000000000000']">
                    <xsl:variable name="WaiverParticipantID" select="WaiverParticipantID"></xsl:variable>
                    <tr>
                      <td width="50%">
                        <xsl:value-of select="ParticipantNameFirst"/>
                        <xsl:if test="ParticipantNameFirst!=''">
                          <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="ParticipantName"/>
                      </td>
                      <xsl:if test="count(../../Particpants/WaiverParticipant[IsSignee!='true' and DOB!='' and DOB!='1/1/1753'])!=0">
                        <xsl:if test="DOB!='' and DOB!='1/1/1753'">
                          <td width="50%">
                            <xsl:choose>
                              <xsl:when test="$DateFormat=''">
                                <xsl:value-of select="DOB"/>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:choose>
                                  <xsl:when test="dt:format-date(dt:parse-date(DOB,'M/d/yyyy'),$DateFormat)=''">
                                    <!-- the app puts it in a format with - instead of / -->
                                    <xsl:value-of select="dt:format-date(dt:parse-date(DOB,'M-d-yyyy'),$DateFormat)"/>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="dt:format-date(dt:parse-date(DOB,'M/d/yyyy'),$DateFormat)"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </xsl:otherwise>
                            </xsl:choose>
                          </td>
                        </xsl:if>
                      </xsl:if>

                      <xsl:if test="/Main/Waiver/WorkflowStepID!='00000000-0000-0000-0000-000000000000'">
                        <td>
                          <xsl:value-of select="/Main/WorkflowStepsForParts/DataSet/diffgr:diffgram/NewDataSet/Table[IsIncluded='true' and WaiverParticipantID=$WaiverParticipantID and IsCurrent='true']/ButtonText"/>
                          <xsl:if test="/Main/WorkflowStepsForParts/DataSet/diffgr:diffgram/NewDataSet/Table[IsCurrent='false']/ID!=''">
                            <xsl:text> </xsl:text>
                            <a href="javascript:void(0);" class="btnShowWorkflowStepHistory" title="History">
                              <i class="fa fa-history"></i>
                            </a>
                          </xsl:if>
                        </td>
                      </xsl:if>
                      
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
              </div>
            </xsl:otherwise>
          </xsl:choose>

          </div>


        </xsl:if>





      <div class="row">
        <div class="col-xs-12">
          <xsl:value-of select="WaiverText/AgreementText" disable-output-escaping="yes"/>
        </div>
      </div>

      <div class="row">
        <div class="col-xs-6">
          <div class="form-group">
            <label>Signed By</label>
            <br/>
            <xsl:value-of select="SignedNameFirst"/>
            <xsl:if test="SignedNameFirst!=''">
              <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:value-of select="SignedName"/>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group">
            <label>Signed On</label>
            <br/>
            <xsl:choose>
              <xsl:when test="$DateFormat=''">
                <xsl:value-of select="dt:format-date(DateSigned,'MMMM d, yyyy h:mm a')"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="combined_format_str">
                  <xsl:value-of select="$DateFormat"></xsl:value-of>
                  <xsl:text> h:mm a</xsl:text>
                </xsl:variable>
                <xsl:value-of select="dt:format-date(DateSigned,$combined_format_str)"/>

              </xsl:otherwise>
            </xsl:choose>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$TimeZoneName"/>
          </div>
          
        </div>
      </div>
      
      
        <xsl:if test="HasSignature='true'">
          <div class="row">
            <div class="col-xs-12">
              <div class="signaturewrap">
                <xsl:choose>
                  <xsl:when test="count(/Main/Signatures/ArrayOfWFSignature2/WFSignature2[EntryType='Typed' and LocationIndexes[int=-1]])!=0">
                    <span class="sigtyped">
                      <xsl:value-of select="str:replace(/Main/Signatures/ArrayOfWFSignature2/WFSignature2[EntryType='Typed' and LocationIndexes[int=-1]]/SigData,'__TYPED__','')"></xsl:value-of>
                    </span>
                  </xsl:when>
                  <xsl:otherwise>
                    <img src="/Controls/GetSignature.ashx?id={WaiverID}" class="" alt="Signature"></img>
                  </xsl:otherwise>
                </xsl:choose>

              </div>
            </div>
          </div>

        </xsl:if>







    </xsl:for-each>


    
    <xsl:if test="count(/Main/Waiver/Images/WaiverImage[UploadStatus='Complete'])!=0">
      <h3>Images</h3>

      <div class="clear">
        <xsl:text> </xsl:text>
      </div>

      <div class="row">
        <!-- images - just put them first for now-->
        <xsl:for-each select="/Main/Waiver/Images/WaiverImage[UploadStatus='Complete']">


          <xsl:variable name="diff">

            <xsl:value-of select="((MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Width']/Value * (300 div MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Width']/Value)) - (MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Height']/Value) * (300 div MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Width']/Value)) div 2 "/>
          </xsl:variable>

          <div class="waiverimgwrap">
            <xsl:if test="MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='STEPTITLE']/Value!=''">
              <h5>
                <xsl:value-of select="MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='STEPTITLE']/Value"/>
              </h5>
            </xsl:if>


            <div class="">
              <xsl:attribute name="class">
                <xsl:text>waiverimg orient</xsl:text>
                <xsl:value-of select="MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Orientation']/Value"/>
              </xsl:attribute>
              <xsl:attribute name="style">
                <xsl:text>width: 300px; height:</xsl:text>
                <xsl:value-of select="MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Height']/Value * (300 div MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Width']/Value)"/>
                <xsl:text>px;</xsl:text>

                <xsl:choose>
                  <xsl:when test="MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Orientation']/Value =5 or MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Orientation']/Value =6 ">
                    <xsl:text>margin-left:-</xsl:text>
                    <xsl:value-of select="$diff"/>
                    <xsl:text>px; </xsl:text>
                    <xsl:text>margin-top:</xsl:text>
                    <xsl:value-of select="$diff * 2"/>
                    <xsl:text>px; </xsl:text>

                  </xsl:when>

                  <xsl:when test="MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Orientation']/Value =8 or MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Orientation']/Value =7 ">
                    <xsl:text>margin-left:-</xsl:text>
                    <xsl:value-of select="$diff"/>
                    <xsl:text>px; </xsl:text>
                    <xsl:text>margin-bottom:</xsl:text>
                    <xsl:value-of select="$diff * 2"/>
                    <xsl:text>px; </xsl:text>

                  </xsl:when>

                  <xsl:when test="MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Orientation']/Value &gt;=5 ">
                    <xsl:text>margin-left:-</xsl:text>
                    <xsl:value-of select="$diff"/>
                    <xsl:text>px; </xsl:text>
                    <xsl:text>margin-bottom:</xsl:text>
                    <xsl:value-of select="$diff"/>
                    <xsl:text>px; </xsl:text>

                  </xsl:when>
                </xsl:choose>



              </xsl:attribute>

              <a href="/Controls/GetWaiverImage.ashx?id={ID}" class="imgpop">





                <img src="/Controls/GetWaiverImage.ashx?id={ID}" class="">

                  <xsl:attribute name="style">
                    <xsl:text>width: 300px; height:</xsl:text>
                    <xsl:value-of select="MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Height']/Value * (300 div MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Width']/Value)"/>
                    <xsl:text>px;</xsl:text>


                    <xsl:if test="MetaData/ArrayOfNameValuePairXML/NameValuePairXML[Name='Orientation']/Value &gt;=5 ">
                      <xsl:text>margin-left:-</xsl:text>
                      <xsl:value-of select="$diff"/>
                      <xsl:text>px; </xsl:text>


                    </xsl:if>



                  </xsl:attribute>
                </img>
              </a>
            </div>

            <p class="help-block">
              <xsl:text>Taken </xsl:text>
              <xsl:value-of select="dt:format-date(DateTaken,$DateFormatWithTime)"/>
              <xsl:if test="/Main/Waiver/Device/DeviceName!=''">
                <xsl:text> on </xsl:text>
                <xsl:value-of select="/Main/Waiver/Device/DeviceName"/>
              </xsl:if>
            </p>
          </div>



        </xsl:for-each>
      </div>


    </xsl:if>

    <!-- DON'T SHOW ALL THIS STUFF IF WE ARE LOADING AN ORIGINAL VERSION -->
    <xsl:if test="$LoadOriginalVersion!='true'">

    
      
    <xsl:if test="count(/Main/Waiver/Attachments/WaiverAttachment)!=0 or count(/Main/AttachmentSteps/ArrayOfAttachmentStep/AttachmentStep)!=0">
      <h3>Attachments</h3>

      <div class="clear">
        <xsl:text> </xsl:text>
      </div>

      <table class="table">
        <thead>
          <tr>
            <th>File</th>
            <th>Attachment</th>
            <th>Date Added</th>
            <th>Uploaded By</th>
            <th colspan="2">Action</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="/Main/Waiver/Attachments/WaiverAttachment">
            <xsl:variable name="stepid">
              <xsl:value-of select="AttachmentStepID"/>
            </xsl:variable>
            <tr>
             
              <td>
                <a href="/Controls/GetWaiverAttachment.ashx?id={ID}">

                  <!-- only these icons exist, so show those icons otherwise show the 'other' icon-->
                  <xsl:choose>
                    <xsl:when test="BlobInfo/Extension = 'avi'
                              or BlobInfo/Extension = 'css'
                              or BlobInfo/Extension = 'doc'
                              or BlobInfo/Extension = 'docx'
                              or BlobInfo/Extension = 'eps'
                              or BlobInfo/Extension = 'html'
                              or BlobInfo/Extension = 'jpg'
                              or BlobInfo/Extension = 'keynote'
                              or BlobInfo/Extension = 'm4v'
                              or BlobInfo/Extension = 'mov'
                              or BlobInfo/Extension = 'mp3'
                              or BlobInfo/Extension = 'mp4'
                              or BlobInfo/Extension = 'mpg'
                              or BlobInfo/Extension = 'numbers'
                              or BlobInfo/Extension = 'other'
                              or BlobInfo/Extension = 'pages' 
                              or BlobInfo/Extension = 'pdf'
                              or BlobInfo/Extension = 'png'
                              or BlobInfo/Extension = 'ppt'
                              or BlobInfo/Extension = 'pptx'
                              or BlobInfo/Extension = 'psd'
                              or BlobInfo/Extension = 'qt'
                              or BlobInfo/Extension = 'rar'
                              or BlobInfo/Extension = 'txt'
                              or BlobInfo/Extension = 'wav'
                              or BlobInfo/Extension = 'wmv'
                              or BlobInfo/Extension = 'xls'
                              or BlobInfo/Extension = 'xlsx'
                              or BlobInfo/Extension = 'zip'
                              ">
                      <img src="/wp-content/Common/Icons2/png/{BlobInfo/Extension}.png" alt="{BlobInfo/Extension} file" class="fileicon"></img>
                    </xsl:when>
                    <xsl:otherwise>
                      <img src="/wp-content/Common/Icons2/png/other.png" alt="{BlobInfo/Extension} file" class="fileicon"></img>
                    </xsl:otherwise>
                  </xsl:choose>



                  <xsl:text> </xsl:text>
                  <xsl:value-of select="BlobInfo/OriginalFilename"></xsl:value-of>
                </a>
              </td>
              <td>
                <xsl:value-of select="/Main/AttachmentSteps/ArrayOfAttachmentStep/AttachmentStep[ID=$stepid]/Title"/>
              </td>
              <td>
                
                <xsl:value-of select="dt:format-date(DateCreated,$DateFormatWithTime)"/>
              </td>
              <td>
                <xsl:choose>
                  <xsl:when test="WPUserID='00000000-0000-0000-0000-000000000000'">Signee</xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="User/First_Name"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="User/Last_Name"/>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
              <td colspan="2">
                <asp:Button runat="server" CommandName="DELETE_ATTACHMENT" CommandArgument="{ID}" text="Delete" CssClass="btn btn-danger btn-sm"></asp:Button>
              </td>
            </tr>

          </xsl:for-each>

          <!-- show the files not uploaded -->
          <xsl:for-each select="/Main/AttachmentSteps/ArrayOfAttachmentStep/AttachmentStep">
            <xsl:variable name="stepid">
              <xsl:value-of select="ID"/>
            </xsl:variable>
            <xsl:if test="count(/Main/Waiver/Attachments/WaiverAttachment[AttachmentStepID=$stepid])=0">
              <tr>
               
                <td>
                  <span class="text-muted">Not uploaded</span>
                </td>
                <td>
                  <xsl:value-of select="Title"  />
                </td>
                <td>
                  <xsl:text> </xsl:text>
                </td>
                <td>
                  <xsl:text> </xsl:text>
                </td>
                <td>
                  <asp:FileUpload runat="server" data-stepid="{ID}" id="fileUpload_{translate(ID,'-','_')}"></asp:FileUpload>

                </td>
                <td>
                  <asp:Button runat="server" CommandName="UPLOAD_ATTACHMENT" CommandArgument="{ID}" text="Upload" CssClass="btn btn-primary btn-sm"></asp:Button>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </tbody>  
      </table>
        
      
    </xsl:if>
    
    

          <xsl:if test="/Main/CheckInHistory/ArrayOfDataSet/DataSet/diffgr:diffgram/NewDataSet/Table">
      <h3>Check-in History</h3>
      <table class="table table-condensed">
        <xsl:for-each select="/Main/CheckInHistory/ArrayOfDataSet/DataSet">
          <thead>
            <tr>
              <th colspan="{7 + count(/Main/Flags/ArrayOfWaiverFlag/WaiverFlag)}">
                <h4>
                  <xsl:value-of select="diffgr:diffgram/NewDataSet/Table/ParticipantNameFirst"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="diffgr:diffgram/NewDataSet/Table/ParticipantName"/>
                </h4>
              </th>
              <th class="text-right">
                <a href="javascript:void(0);" class="btn btn-default btncheckin" data-wpe="{diffgr:diffgram/NewDataSet/Table/ID}">
                  <i class="fa fa-plus-circle"> </i> New Check In
                </a>
              </th>
             
            </tr>

            <tr>
              <th>Checked In</th>
              <th>
              <xsl:for-each select="/Main/Flags/ArrayOfWaiverFlag/WaiverFlag">
                  <xsl:value-of select="Name"/>
              </xsl:for-each>
                <xsl:text> </xsl:text>
              </th>
              <th>Event</th>
              <th>Event Date</th>
              <th>View Event</th>
              <th>Added to Event</th>

              <xsl:if test="/Main/Waiver/WorkflowStepID!='00000000-0000-0000-0000-000000000000'">
                <th>
                  <xsl:value-of select="$WORKFLOW_ALT_STEP_LABEL_TEXT"/>
                </th>
              </xsl:if>
              
              <th>Checked In</th>
              <th>
                <xsl:text> </xsl:text>
              </th>
            </tr>
          </thead>
            <tbody>
          <xsl:for-each select="diffgr:diffgram/NewDataSet/Table">
            <xsl:variable select="ID" name="ID"></xsl:variable>
            <xsl:variable select="WaiverParticipantID" name="WaiverParticipantID"></xsl:variable>
            <tr>
              <td>

                <input type="checkbox" class="checkin" id="checkin{translate(ID,'-','_')}" value="{ID}" data-eventid="{WaiverEventID}">
                  <xsl:if test="IsCheckedIn='true'">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                  </xsl:if>
                </input>
                <label for="checkin{translate(ID,'-','_')}">
                  <xsl:text> </xsl:text>
                </label>

                
              
              </td>

              <xsl:variable name="flagVals">
                <xsl:copy-of select="flags"/>
              </xsl:variable>
              
              <xsl:for-each select="/Main/Flags/ArrayOfWaiverFlag/WaiverFlag">
                <xsl:variable name="currFlagID">
                  <xsl:value-of select="ID"/>
                </xsl:variable>
                <td>

                  

                  
                  
                  <input type="checkbox" data-flagid="{ID}" value="{$ID}" class="wfflag wfflag{position()}" id="{translate($ID,'-','_')}" data-eventid="{WaiverEventID}">
                    <xsl:if test="msxsl:node-set($flagVals)/flags/flag[@id=$currFlagID]='true'">
                      <xsl:attribute name="checked">checked</xsl:attribute>
                    </xsl:if>
                  </input>
                  <label for="{translate($ID,'-','_')}">
                    <xsl:text> </xsl:text>
                  </label>
                </td>
              </xsl:for-each>

            
              <td>
                <xsl:value-of select="EventName"/>
              </td>
              <td>
                <xsl:if test="WaiverEventID!='00000000-0000-0000-0000-000000000000'">
                  <xsl:value-of select="dt:format-date(DateStart,$DateFormatWithTime)"/>
                </xsl:if>
              </td>
              <td>
                <xsl:if test="WaiverEventID!='00000000-0000-0000-0000-000000000000'">
                  <a href="{$BasePathRelative}/admin/EventSignatures.aspx?id={WaiverEventID}">View Event</a>
                </xsl:if>

              </td>
              <td>

                <xsl:choose>
                  <xsl:when test="dt:year(DateStart) &lt; 1800">
                    <xsl:value-of select="dt:format-date(/Main/Waiver/DateSigned,$DateFormatWithTime)"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="DateStart__DT_FORMATTED"/>
                  </xsl:otherwise>
                </xsl:choose>
                
                
              
              </td>
              <xsl:if test="/Main/Waiver/WorkflowStepID!='00000000-0000-0000-0000-000000000000'">
                <td>
                  
                  <xsl:value-of select="/Main/WorkflowStepsForParts/DataSet/diffgr:diffgram/NewDataSet/Table[IsIncluded='true' and WaiverParticipantID=$WaiverParticipantID and IsCurrent='true']/ButtonText"/>

                  <xsl:if test="/Main/WorkflowStepsForParts/DataSet/diffgr:diffgram/NewDataSet/Table[IsCurrent='false']/ID!=''">
                    <xsl:text> </xsl:text>
                    <a href="javascript:void(0);" class="btnShowWorkflowStepHistory" title="History">
                      <i class="fa fa-history"></i>
                    </a>
                  </xsl:if>
                  
                </td>
              </xsl:if>
              <td>

                <xsl:choose>
                  <xsl:when test="IsCheckedIn!='true'">
                    N/A
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="DateSaved__DT_FORMATTED"/>
                  </xsl:otherwise>
                </xsl:choose>
                
                


              </td>

            
              
              <td>
                <asp:LinkButton runat="server" Text="Delete Check-In" CommandName="DELETE" CommandArgument="{ID}"></asp:LinkButton>
              </td>
            </tr>
          </xsl:for-each>
            </tbody>
          </xsl:for-each>

        </table>

    </xsl:if>




      <xsl:if test="/Main/Scans/DataSet/diffgr:diffgram/NewDataSet/Table">
        <h3>Barcode Scan History</h3>
        
          <xsl:for-each select="/Main/Scans/DataSet">
            <table class="table table-condensed">
            <thead>
              <tr>
                <th>Scan Date</th>
                <th>Device</th>
                <th>Event</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="diffgr:diffgram/NewDataSet/Table">
                <xsl:variable select="ID" name="ID"></xsl:variable>
                <tr>
                  <td>

                    <xsl:value-of select="DateScanned__DT_FORMATTED"/>
                    
                  </td>
                  <td>
                    <xsl:value-of select="DeviceName"/>
                  </td>
                  <td>
                    <a href="{$BasePathRelative}/admin/EventSignatures.aspx?id={WaiverEventID}">
                    <xsl:value-of select="Name"/>
                    </a>
                    
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
            </table>
          </xsl:for-each>

       

      </xsl:if>

    <!-- only show the link for administrator or higher -->
    <xsl:if test="$UserRole &gt;=30">
      <h3>Waiver View Log</h3>
      <p>The waiver view log tracks all the views, exports and prints of this waiver.</p>
      <a href="WaiverViewLog.aspx?id={/Main/Waiver/WaiverID}" class="btn btn-primary">View Log</a>
    </xsl:if>


    </xsl:if>
    <!-- END: HIDE IF SHOWING ORIGINAL -->


    <!-- Modal -->
    <div class="modal fade" id="modalWorkflowHistory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">X</span>
            </button>
            <h4 class="modal-title" id="myModalLabel">Participant History</h4>
          </div>
          <div class="modal-body">


            <table class="table table-condensed">
              
              <tbody>
                <xsl:for-each select="/Main/Waiver/Particpants/WaiverParticipant">
                  <xsl:variable name="WaiverParticipantID" select="WaiverParticipantID"></xsl:variable>
                  <tr>
                    <td colspan="9">
                      <h4>
                        <xsl:value-of select="ParticipantNameFirst"/>
                        <xsl:if test="ParticipantNameFirst!=''">
                          <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="ParticipantName"/>
                      </h4>
                    </td>
                  </tr>
                  <tr>
                    <th>TEAM(SWAP THIS)</th>
                    <th>Saved On</th>
                    <th>Saved By</th>
                    <th>
                      <xsl:text> </xsl:text>
                    </th>
                  </tr>
                  <xsl:for-each select="/Main/WorkflowStepsForParts/DataSet/diffgr:diffgram/NewDataSet/Table[IsIncluded='true' and WaiverParticipantID=$WaiverParticipantID]">

                    <tr>
                      <td>
                        <xsl:value-of select="ButtonText"/>
                      </td>
                      <td>
                         <xsl:choose>
                        <xsl:when test="$DateFormat=''">
                          <xsl:value-of select="dt:format-date(DateSaved,'MMMM d, yyyy h:mm a')"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:variable name="combined_format_str">
                            <xsl:value-of select="$DateFormat"></xsl:value-of>
                            <xsl:text> h:mm a</xsl:text>
                          </xsl:variable>
                          <xsl:value-of select="dt:format-date(DateSaved,$combined_format_str)"/>

                        </xsl:otherwise>
                      </xsl:choose>
                      </td>
                      <td>
                        <xsl:value-of select="First_Name"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="Last_Name"/>
                        <xsl:text> </xsl:text>
                        <xsl:if test="Email_Address!=''">
                          <a href="mailto:{Email_Address}">
                            <xsl:value-of select="Email_Address"/>
                          </a>
                        </xsl:if>
                      </td>
                      <td>
                        <xsl:if test="IsCurrent='true'">
                          <strong>Current</strong>
                        </xsl:if>
                      </td>
                    </tr>
                    
                  </xsl:for-each>

                </xsl:for-each>
              </tbody>
            </table>
            
          </div>
          
        </div>
      </div>
    </div>
  
    
    


  </xsl:template>


  <xsl:template mode="icons" match="*">
    <xsl:choose>
      <xsl:when test=".='' or test">
        
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>
