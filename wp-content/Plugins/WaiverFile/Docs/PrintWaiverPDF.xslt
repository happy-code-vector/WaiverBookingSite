<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="last">false</xsl:param>
  <xsl:param name="TimeZoneName"></xsl:param>
  <xsl:param name="SiteName"></xsl:param>
  <xsl:param name="DateFormat"></xsl:param>
  <xsl:param name="BaseUrl"></xsl:param>
  <xsl:param name="SchemeAndDomain"></xsl:param>
  <xsl:param name="ConvertSVG"></xsl:param>
  <xsl:param name="ExcludeImages">false</xsl:param>
  <xsl:param name="LogoPath"></xsl:param>
  <xsl:param name="ShowLimitedDataWarning"></xsl:param>
  <xsl:param name="OPT_IN_SELECTION"></xsl:param>
  <xsl:param name="PARENT_GUARDIAN_INFO"></xsl:param>
  <xsl:param name="ENTER_PARTICIPANTS_NAMES"></xsl:param>

  <xsl:param name="LoadOriginalVersion"></xsl:param>

  <!-- !! IMPORTANT NOTICE! 
  
  WHEN EDITING THIS FILE, BE SURE TO EDIT BOTH THE MAIN DOCS VERSION AND ALSO THE VERSION IN WFAUTOMATOR
  OTHERWISE THE ARCHIVE BULK DOWNLOAD PDF'S WILL BE WRONG. 
  
  -->

  <xsl:variable name="DateFormatWithTime">
    <xsl:value-of select="$DateFormat"/>
    <xsl:text> h:mm a</xsl:text>
  </xsl:variable>

  <xsl:variable name="TableWidth">
    <xsl:text>100%</xsl:text>
    <!-- previous was 600 -->
  </xsl:variable>
  <xsl:variable name="masked">
    <xsl:text>***********</xsl:text>
  </xsl:variable>

  <xsl:template match="/">






    <html>
      <head>
        <title>Print Waivers</title>
        <style type="text/css">
          <xsl:text disable-output-escaping="yes">
 body {

          font-family: Tahoma, sans-serif;
          font-size: 12px;
          color: #162440;

          }
          
          a, a:link, a:visited {
          color: #009fe9;
          font-weight: bold;
          font-weight: 700;

          }
         
          td h3{ margin:0; }
          th{ text-align:left; }
          td > strong{   font-family: Tahoma, sans-serif; color: #162440; }
          
          td small{ font-size:11px; color: #808080;}
          .structuretable, .datatable{ border-collapse:collapse;}
          .structuretable &gt; tr &gt; td{ padding:0 5px; }
          .datatable td{ border-top:1px solid #eaeaea; width:100%; }

          .datatable td.no-top-border{ border-top: 1px solid transparent;}

          .agreementcell, .signaturecell{ padding-top: 15px; padding-bottom:15px; font-size:11px;}
          .signaturewrap img{   width:500px;  max-width:100%; display:block;}
        .wfinitial{ max-height:120px; max-width:100%;display:block;  }
  .wfsignature{ max-height:100px; max-width:100%;display:block;  }

#initialpreview, .initialtyped {
    font-family: 'Marck Script';
    font-size: 27px;
    padding: 10px;
    color: #333;
}

a:link span.initialtyped {
    color: #333;
}

a:hover span.initialtyped, a:active span.initialtyped {
    color: #333;
    text-decoration: none;
}

a:link span.sigtyped {
    color: #333;
}

a:hover span.sigtyped, a:active span.sigtyped {
    color: #333;
    text-decoration: none;
}

#signpreview, .sigtyped {
    font-family: 'Marck Script', cursive;
    font-size: 27px;
    padding: 10px;
}

.signature {
    border: 2px solid #ccc;
    height: 284px;
    margin: 0;
    padding: 0;
}
.waiverimgwrap{ float:left; padding: 0 25px 25px 0;}
.waiverimg{

  
    display: block;
    position: relative;
    
    
}
.waiverimg img{ 
    max-width:100%;
   width:auto; height:auto;
    max-height:100%;
    display:inline-block;
    border:1px solid #bbb;
}


    .orient1{ image-orientation: none;   }
    .orient2{ image-orientation: none; transform: scaleX(-1);  }
    .orient3{ image-orientation: none; transform: rotate(180deg); }
    .orient4{ image-orientation: none; transform: rotate(180deg);transform: scaleX(-1);  }
    .orient5{ image-orientation: none; transform: rotate(90deg);transform: scaleX(-1);  }
    .orient6{ image-orientation: none; transform: rotate(90deg);  }
    .orient7{ image-orientation: none; transform: rotate(270deg);transform: scaleX(-1);  }
    .orient8{ image-orientation: none; transform: rotate(270deg);  }
    
        </xsl:text>
        </style>


        <link href="https://www.waiverfile.com/site/fonts/Roboto.css" rel="stylesheet" type="text/css"/>
        <link href="https://www.waiverfile.com/site/fonts/marck-script.css" rel="stylesheet" type="text/css"/>

      </head>
      <body>

        <div>

          <xsl:apply-templates mode="inner" select="/Waiver"></xsl:apply-templates>
        </div>

      </body>
    </html>







  </xsl:template>

  <xsl:template match="*" mode="inner">

    <!-- wrap this in a document, make it nice -->


    <style type="text/css">
      p.breakhere {page-break-before: always}
    </style>

    <xsl:choose>
      <xsl:when test="OriginalDataVerified='true' and $LoadOriginalVersion!='true'">
        <p style="text-align:center; font-weight:bold;color: red;">
          This waiver has been edited.
        </p>
      </xsl:when>
    </xsl:choose>


    <!-- header -->
    <table width="{$TableWidth}" style="background-color:#ffffff; " cellpadding="10">
      <tr>

        <xsl:choose>
          <xsl:when test="$LogoPath!=''">


            <td width="50%" style="width:50%">
              <img src="{$LogoPath}" alt="Logo" style="max-height:40px; max-width:100%;"/>
            </td>
            <td style="color:#333333; font-size: 22px; text-align:right;">
              <xsl:value-of select="$SiteName"/>
            </td>


          </xsl:when>
          <xsl:otherwise>

            <td colspan="2" style="color:#333333; font-size: 22px;">
              <xsl:value-of select="$SiteName"/>
            </td>
          </xsl:otherwise>
        </xsl:choose>


      </tr>
      <tr>
        <td colspan="2">
          <xsl:text> </xsl:text>
        </td>
      </tr>

    </table>
    <xsl:choose>
      <xsl:when test="OriginalDataVerified='true' and $LoadOriginalVersion!='true'">
        <p style="text-align:center; font-weight:bold;color: red;">
          This waiver has been edited.
        </p>
      </xsl:when>
    </xsl:choose>

    <table width="100%" border="0" cellspacing="0" cellpadding="5">

      <tr>
        <td>
          <h3>

            <xsl:value-of select="WaiverForm/Name"/>
            <xsl:if test="WaiverEvent/Name!=''">
              <xsl:text> | </xsl:text>
              <xsl:value-of select="WaiverEvent/Name"/>
              <xsl:text> | </xsl:text>
              <xsl:value-of select="WaiverEvent/TimeLabel"/>

            </xsl:if>
          </h3>

        </td>
        <td>
          <!--
          <p style="font-size:16px; font-weight:bold;">
              Participants
          </p>
          -->
        </td>
      </tr>

      <xsl:for-each select="/Waiver">


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



            <!-- custom questions -->


            <xsl:choose>
              <xsl:when test="count(/Waiver/ValuesXml/data/field[@cid!=''])!=0">
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

                  <xsl:if test="count(/Waiver/FieldsXml/data/fields[label=$currlbl])&gt;1">

                    <xsl:for-each select="/Waiver/FieldsXml/data/fields[label=$currlbl]">
                      <xsl:variable name="pos1">
                        <xsl:value-of select="position()"/>
                      </xsl:variable>

                      <item>
                        <label>
                          <xsl:value-of select="label"/>
                        </label>
                        <value>
                          <xsl:value-of select="/Waiver/ValuesXml/data/field[label=$currlbl][position()=$pos1]/value"/>
                        </value>
                        <xsl:if test="/Waiver/ValuesXml/data/field[label=$currlbl][position()=$pos1]/field_options/description!=''">
                          <desc>
                            <xsl:value-of select="/Waiver/ValuesXml/data/field[label=$currlbl][position()=$pos1]/field_options/description"/>
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

        <xsl:variable name="dataMainCount" select="count(msxsl:node-set($dataMain)/data/item)"/>

        <tr>
          <td colspan="2">
            <h4>
              <xsl:value-of select="$PARENT_GUARDIAN_INFO"/>
            </h4>
          </td>
        </tr>
        <tr>



          <xsl:for-each select="msxsl:node-set($dataMain)/data/item">
            <xsl:variable name="pos">
              <xsl:value-of select="position()"/>
            </xsl:variable>
            <xsl:variable name="currlbl">
              <xsl:value-of select="label"/>
            </xsl:variable>

            <td width="50%" style="width:50%" valign="top">
              <table width="100%" cellspacing="0" cellpadding="4" class="datatable" border="0">
                <tr>
                  <td width="50%" style="width:50%">
                    <strong>
                      <xsl:value-of select="label"/>
                    </strong>
                  </td>
                  <td width="50%" style="width:50%">
                    <xsl:value-of select="value"/>
                  </td>
                </tr>


                <xsl:if test="desc!=''">
                  <tr>
                    <td colspan="2" class="no-top-border">
                      <small>
                        <xsl:value-of select="desc"/>
                      </small>
                    </td>
                  </tr>
                </xsl:if>
              </table>
            </td>

            <xsl:if test="position() mod 2 = 0">
              <xsl:text disable-output-escaping="yes">&lt;/tr&gt;&lt;tr&gt;</xsl:text>
            </xsl:if>

          </xsl:for-each>

          <!-- if odd number, add a blank td to fill in-->
          <xsl:if test="count(msxsl:node-set($dataMain)/data/item) mod 2 = 1">
            <td>
              <xsl:text> </xsl:text>
            </td>
          </xsl:if>
        </tr>


        <xsl:if test="count(Particpants/WaiverParticipant[IsSignee!='true'])!=0">

          <tr>
            <td colspan="2">
              <hr/>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <h4>
                <xsl:value-of select="$ENTER_PARTICIPANTS_NAMES"/>
              </h4>
            </td>
          </tr>

          <tr>
            <xsl:for-each select="Particpants/WaiverParticipant[IsSignee!='true']">
              <td>


                <table width="100%" cellspacing="0" cellpadding="4" class="datatable">

                  <tbody>

                    <tr>
                      <td width="50%" style="width:50%">
                        <strong>Name</strong>
                      </td>
                      <td width="50%" style="width:50%">
                        <xsl:value-of select="ParticipantNameFirst"/>
                        <xsl:if test="ParticipantNameFirst!=''">
                          <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="ParticipantName"/>
                      </td>
                    </tr>

                    <xsl:if test="DOB!='' and DOB!='1/1/1753'">
                      <tr>
                        <td width="50%" style="width:50%">
                          <strong>Date of Birth</strong>
                        </td>
                        <td width="50%" style="width:50%">
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
                        <td width="50%" style="width:50%">
                          <strong>
                            <xsl:value-of select="@label"/>
                          </strong>
                        </td>
                        <td width="50%" style="width:50%">
                          <xsl:value-of select="."/>
                        </td>
                      </tr>

                    </xsl:for-each>
                  </tbody>
                </table>
              </td>
              <xsl:if test="position() mod 2 = 0">
                <xsl:text disable-output-escaping="yes">&lt;/tr&gt;&lt;tr&gt;</xsl:text>
              </xsl:if>

            </xsl:for-each>


          </tr>


        </xsl:if>


        <tr>
          <td colspan="2" class="agreementcell">
            <xsl:value-of select="WaiverText/AgreementText" disable-output-escaping="yes"/>
          </td>
        </tr>


        <tr>

          <td  class="signaturecell">
            <xsl:if test="HasSignature='true'">


              <!-- test-->


              <xsl:choose>
                <xsl:when test="count(/Waiver/Signatures/WFSignature2[EntryType='Typed' and LocationIndexes/int[.=-1]])!=0">
                  <span class="sigtyped">
                    <xsl:value-of select="str:replace(/Waiver/Signatures/WFSignature2[EntryType='Typed' and LocationIndexes/int[.=-1]]/SigData,'__TYPED__','')"></xsl:value-of>
                  </span>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:choose>
                    <xsl:when test="$ConvertSVG='true'">
                      <img src="{$SchemeAndDomain}/Controls/GetSignature.ashx?id={WaiverID}&amp;convert=true&amp;INTERNAL_REQUEST_KEY=jgGBxJWGuAgRgKvkhrGb" class="img-responsive" alt="Signature"  style="max-width:100%; max-height: 100px;"></img>
                    </xsl:when>
                    <xsl:otherwise>
                      <img src="{$SchemeAndDomain}/Controls/GetSignature.ashx?id={WaiverID}&amp;INTERNAL_REQUEST_KEY=jgGBxJWGuAgRgKvkhrGb" class="wfsignature" alt="Signature"></img>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
          </td>
          <td>
            <strong>
              <xsl:value-of select="SignedNameFirst"/>
              <xsl:if test="SignedNameFirst!=''">
                <xsl:text> </xsl:text>
              </xsl:if>
              <xsl:value-of select="SignedName"/>
            </strong>
            <br />
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
          </td>

        </tr>






        <xsl:if test="$ExcludeImages!='true' and  count(/Waiver/Images/WaiverImage)!=0">
          <tr>
            <td colspan="2" >


              <h3>Images</h3>

              <div class="clear">
                <xsl:text> </xsl:text>
              </div>

              <div class="row">
                <!-- images - just put them first for now-->
                <xsl:for-each select="/Waiver/Images/WaiverImage">


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





                      <img src="{$SchemeAndDomain}/Controls/GetWaiverImage.ashx?id={ID}&amp;INTERNAL_REQUEST_KEY=jgGBxJWGuAgRgKvkhrGb" class="">

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

                    </div>

                    <p class="help-block">
                      <xsl:text>Taken </xsl:text>
                      <xsl:value-of select="dt:format-date(DateTaken,$DateFormatWithTime)"/>
                      <xsl:if test="/Waiver/Device/DeviceName!=''">
                        <xsl:text> on </xsl:text>
                        <xsl:value-of select="/Waiver/Device/DeviceName"/>
                      </xsl:if>
                    </p>
                  </div>



                </xsl:for-each>
              </div>

            </td>
          </tr>
        </xsl:if>



      </xsl:for-each>



      <tr>
        <td style="padding-top: 50px; text-align:center; font-size: 10px; color: #999999;" colspan="2">
          Powered by<br/>
          <a href="https://www.waiverfile.com/?wcs=ppb">
            <img src="https://www.waiverfile.com/sharedmedia/waiverfile-logo-lg.png" alt="WaiverFile" width="120"/>
          </a>
        </td>
      </tr>

    </table>


    <xsl:if test="$last!='true'">
      <p class="breakhere">
        <xsl:text> </xsl:text>
      </p>
    </xsl:if>

  </xsl:template>


</xsl:stylesheet>
