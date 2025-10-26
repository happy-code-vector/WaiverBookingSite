<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:cc1="remove" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:str="http://exslt.org/strings" xmlns:math="http://exslt.org/math" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt math msxsl">
  
  <xsl:output method="html" omit-xml-declaration="yes"/>

 
  
  <xsl:param name="siteid"></xsl:param>
  <xsl:param name="partHeading"></xsl:param>
  <xsl:param name="includeFirstNameFields"></xsl:param>

  <xsl:template match="/">

    
    <xsl:text disable-output-escaping="yes">
    &lt;%@ Register Assembly="WaiverFile" Namespace="WaiverFile.Core" TagPrefix="cc1" %&gt;
    </xsl:text>
 
    <!-- default fields can go in c#/ascx -->

  

    <!-- then custom fields -->
    <div class="row">

      <xsl:for-each select="/alldata/FieldsOriginal/data/fields">
    <xsl:apply-templates mode="RenderField" select=".">
      <xsl:with-param name="questionIdx">
        <xsl:value-of select="position()"/>
      </xsl:with-param>
      <xsl:with-param name="prefix">OG</xsl:with-param>
    </xsl:apply-templates>
      </xsl:for-each>

      <!-- any new fields that weren't in the old one -->
      <xsl:for-each select="/alldata/FieldsNew/data/fields">
        <xsl:variable name="currlabel">
          <xsl:value-of select="label"/>
        </xsl:variable>
        <xsl:variable name="currcid">
          <xsl:value-of select="cid"/>
        </xsl:variable>
        <xsl:if test="count(/alldata/FieldsOriginal/data/fields[cid=$currcid])=0">
        <xsl:apply-templates mode="RenderField" select=".">
          <xsl:with-param name="questionIdx">
            <xsl:value-of select="position()"/>
          </xsl:with-param>
          <xsl:with-param name="prefix">NEW</xsl:with-param>
        </xsl:apply-templates>
        </xsl:if>
      </xsl:for-each>
      

    </div>

    <h3>
      <xsl:value-of select="$partHeading"/> 
    </h3>
    <!-- partocipants -->
    <asp:Panel runat="server" id="pnlParts">

      <xsl:for-each select="/alldata/ValuesCurrent/Waiver/Particpants/WaiverParticipant">
        <xsl:variable name="partNum">
          <xsl:value-of select="position()"/>
        </xsl:variable>
        <!-- check with an if so the position matches with xpath used later -->
        <xsl:if test="IsSignee!='true'">
        <asp:Panel runat="server" id="pnlPart_{translate(WaiverParticipantID,'-','_')}">

          <div class="row">
            
            <xsl:if test="$includeFirstNameFields='true'">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="txtPartNameFirst{position()}">First</label>
                  <asp:TextBox runat="server" CssClass="form-control" ClientIDMode="Static" ID="txtPartNameFirst{position()}" Text="{ParticipantNameFirst}"></asp:TextBox>
                </div>
              </div>
            </xsl:if>

            <div class="col-sm-6">
              <div class="form-group">
                <label for="txtPartName{position()}">
                  <xsl:choose>
                    <xsl:when test="$includeFirstNameFields='true'">Last</xsl:when>
                    <xsl:otherwise>Name</xsl:otherwise>
                  </xsl:choose>
                </label>
                <asp:TextBox runat="server" CssClass="form-control" ClientIDMode="Static" ID="txtPartName{position()}" Text="{ParticipantName}"></asp:TextBox>
              </div>
            </div>
          
            <xsl:if test="../../WaiverForm/FieldInclude_DOB_Participant='true'">
              <!-- DOB!='' or  -->
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="dtPartDOB{position()}">
                    Date of Birth
                  </label>
                  <cc1:WFDatePicker runat="server" EnableClientSideValidation="false" ClientIDMode="Static" ID="dtPartDOB{position()}" Value="{DOB}"></cc1:WFDatePicker>
                  
                </div>
              </div>
            </xsl:if>

            <!-- custom form fields for participants here -->

            <!-- then custom fields -->
         

              <xsl:for-each select="/alldata/PartFieldsOriginal/data/fields">
                <xsl:apply-templates mode="RenderFieldPart" select=".">
                  <xsl:with-param name="partNum">
                    <xsl:value-of select="$partNum"/>
                  </xsl:with-param>
                  <xsl:with-param name="questionIdx">
                    <xsl:value-of select="position()"/>
                  </xsl:with-param>
                </xsl:apply-templates>
              </xsl:for-each>

              <!-- any new fields that weren't in the old one -->
              <xsl:for-each select="/alldata/PartFieldsNew/data/fields">
                <xsl:variable name="currlabel">
                  <xsl:value-of select="label"/>
                </xsl:variable>
                <xsl:variable name="currcid">
                  <xsl:value-of select="cid"/>
                </xsl:variable>
                <xsl:if test="count(/alldata/PartFieldsOriginal/data/fields[cid=$currcid])=0">
                  <xsl:apply-templates mode="RenderFieldPart" select=".">
                    <xsl:with-param name="partNum">
                      <xsl:value-of select="$partNum"/>
                    </xsl:with-param>
                    <xsl:with-param name="questionIdx">
                      <xsl:value-of select="position()"/>
                    </xsl:with-param>
                  </xsl:apply-templates>
                </xsl:if>
              </xsl:for-each>


           


          </div>
          
          
        </asp:Panel>
        <hr/>
        </xsl:if>
      </xsl:for-each>
      
    </asp:Panel>
    
  </xsl:template>

  <xsl:template mode="RenderFieldPart" match="*">
    <xsl:param name="partNum"></xsl:param>
    <xsl:param name="questionIdx"></xsl:param>

    <xsl:variable name="lbl">
      <xsl:value-of select="label"/>
    </xsl:variable>
    <xsl:variable name="lbl_other">
      <xsl:value-of select="label"/>
      <xsl:text> - Other</xsl:text>
    </xsl:variable>
    <xsl:call-template name="RenderFieldIndividual">
      <xsl:with-param name="questionIdx">
        <xsl:value-of select="$questionIdx"/>
      </xsl:with-param>
      <xsl:with-param name="partNum">
        <xsl:value-of select="$partNum"/>
      </xsl:with-param>
      <xsl:with-param name="lbl">
        <xsl:value-of select="$lbl"/>
      </xsl:with-param>
      <xsl:with-param name="lbl_other">
        <xsl:value-of select="$lbl_other"/>
      </xsl:with-param>
      <xsl:with-param name="val">
        <xsl:value-of select="/alldata/ValuesCurrent/Waiver/Particpants/WaiverParticipant[position()=$partNum]/ValuesXml/Values/Value[@label=$lbl]"/>
      </xsl:with-param>
      <xsl:with-param name="val_other">
        <xsl:value-of select="/alldata/ValuesCurrent/Waiver/Particpants/WaiverParticipant[position()=$partNum]/ValuesXml/Values/Value[@label=$lbl_other]"/>
      </xsl:with-param>
    </xsl:call-template>

  </xsl:template>
  

  <xsl:template mode="RenderField" match="*">
    <xsl:param name="questionIdx"></xsl:param>
    <xsl:param name="prefix"></xsl:param>

    <xsl:variable name="lbl">
      <xsl:value-of select="label"/>
    </xsl:variable>
    <xsl:variable name="lbl_other">
      <xsl:value-of select="label"/>
      <xsl:text> - Other</xsl:text>
    </xsl:variable>
    <xsl:call-template name="RenderFieldIndividual">
      <xsl:with-param name="questionIdx">
        <xsl:value-of select="$questionIdx"/>
      </xsl:with-param>
      <xsl:with-param name="prefix">
        <xsl:value-of select="$prefix"/>
      </xsl:with-param>
      <xsl:with-param name="lbl">
        <xsl:value-of select="$lbl"/>
      </xsl:with-param>
      <xsl:with-param name="lbl_other">
        <xsl:value-of select="$lbl_other"/>
      </xsl:with-param>
      <xsl:with-param name="val">
        <xsl:value-of select="/alldata/ValuesCurrent/Waiver/ValuesXml/data/field[label=$lbl]/value"/>
      </xsl:with-param>
      <xsl:with-param name="val_other">
        <xsl:value-of select="/alldata/ValuesCurrent/Waiver/ValuesXml/data/field[label=$lbl_other]/value"/>
      </xsl:with-param>
    </xsl:call-template>
    
  </xsl:template>

  <xsl:template name="RenderFieldIndividual">
    <xsl:param name="partNum">main</xsl:param>
    <xsl:param name="questionIdx">0</xsl:param>
    <xsl:param name="prefix"></xsl:param>
    
    <xsl:param name="lbl"></xsl:param>
    <xsl:param name="lbl_other"></xsl:param>
    <xsl:param name="val"></xsl:param>
    <xsl:param name="val_other"></xsl:param>

    <xsl:choose>
      <xsl:when test="field_type='section_break'">
        <div class="col-xs-12">
          <h3>
            <xsl:value-of select="label"/>
          </h3>
          <xsl:if test="field_options/description!=''">
            <p>
              <xsl:value-of select="field_options/description"/>
            </p>
          </xsl:if>

        </div>
      </xsl:when>
      <xsl:otherwise>




        <div class="col-sm-6">

          <xsl:choose>


            <xsl:when test="field_type='number'">
              <div class="form-group">
                <label for="txt_main_{cid}_{position()}">
                  <xsl:value-of select="label"/>
                  <xsl:if test="required='true'">
                    <span class="text-danger">*</span>
                  </xsl:if>
                </label>
                <asp:TextBox ID="txt_main_{$prefix}_{cid}_{$partNum}_{position()}" ClientIDMode="Static" runat="server" CssClass="form-control" data-codename="CUSTOM:{label}" data-labelname="{label}" data-required="{required}" pattern="[0-9]*" data-fieldcid="{cid}">
                  <xsl:choose>
                    <xsl:when test="field_options/integer_only='true'">
                      <xsl:attribute name="pattern">
                        <xsl:text>[0-9]*</xsl:text>
                      </xsl:attribute>
                      <xsl:attribute name="TextMode">Number</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                      <!--<xsl:attribute name="type">number</xsl:attribute>
                          <xsl:attribute name="step">0.01</xsl:attribute>-->
                      <xsl:attribute name="data-fv-numeric-message">Please enter only numbers</xsl:attribute>
                      <xsl:attribute name="data-fv-numeric">true</xsl:attribute>
                    </xsl:otherwise>
                  </xsl:choose>
                  <xsl:if test="required='true'">
                    <xsl:attribute name="data-fv-notempty">true</xsl:attribute>
                    <xsl:attribute name="data-fv-notempty-message">
                      <xsl:value-of select="label"></xsl:value-of>
                      <xsl:text> is required.</xsl:text>
                    </xsl:attribute>
                  </xsl:if>
                    <xsl:if test="field_options/min!=''">
                      <xsl:attribute name="data-fv-greaterthan">true</xsl:attribute>
                      <xsl:attribute name="data-fv-greaterthan-inclusive">true</xsl:attribute>
                      <xsl:attribute name="data-fv-greaterthan-value">
                        <xsl:value-of select="field_options/min"/>
                      </xsl:attribute>
                      <xsl:attribute name="data-fv-greaterthan-message">
                        <xsl:value-of select="label"></xsl:value-of>
                        <xsl:text> must be at least </xsl:text>
                        <xsl:value-of select="field_options/min"/>
                      </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="field_options/max!=''">
                      <xsl:attribute name="data-fv-lessthan">true</xsl:attribute>
                      <xsl:attribute name="data-fv-lessthan-inclusive">true</xsl:attribute>
                      <xsl:attribute name="data-fv-lessthan-value">
                        <xsl:value-of select="field_options/max"/>
                      </xsl:attribute>
                      <xsl:attribute name="data-fv-lessthan-message">
                        <xsl:value-of select="label"></xsl:value-of>
                        <xsl:text> must be no more than </xsl:text>
                        <xsl:value-of select="field_options/max"/>
                      </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="field_options/integer_only='true'">
                      <xsl:attribute name="data-fv-integer-message">
                        <xsl:text>Please enter only whole numbers</xsl:text>
                      </xsl:attribute>

                    </xsl:if>
                  

                  <xsl:choose>

                    <xsl:when test="$val!=''">
                      <xsl:attribute name="Text">
                        <xsl:value-of select="$val"/>
                      </xsl:attribute>
                    </xsl:when>
                  </xsl:choose>

                </asp:TextBox>

                <xsl:if test="field_options/description!=''">
                  <p class="help-block">
                    <xsl:value-of select="field_options/description"/>
                  </p>
                </xsl:if>
              </div>
            </xsl:when>

            <xsl:when test="field_type='text'">
              <div class="form-group">
                <label for="txt_main_{cid}_{position()}">
                  <xsl:value-of select="label"/>
                  <xsl:if test="required='true'">
                    <span class="text-danger">*</span>
                  </xsl:if>
                </label>
                <asp:TextBox ID="txt_main_{$prefix}_{cid}_{$partNum}_{position()}" ClientIDMode="Static" runat="server" CssClass="form-control" data-codename="CUSTOM:{label}" data-labelname="{label}" data-required="{required}" data-fieldcid="{cid}">
                  <xsl:if test="required='true'">
                    <xsl:attribute name="data-fv-notempty">true</xsl:attribute>
                    <xsl:attribute name="data-fv-notempty-message">
                      <xsl:value-of select="label"></xsl:value-of>
                      <xsl:text> is required.</xsl:text>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:choose>

                    <xsl:when test="$val!=''">
                      <xsl:attribute name="Text">
                        <xsl:value-of select="$val"/>
                      </xsl:attribute>
                    </xsl:when>
                  </xsl:choose>
                </asp:TextBox>

                <xsl:if test="field_options/description!=''">
                  <p class="help-block">
                    <xsl:value-of select="field_options/description"/>
                  </p>
                </xsl:if>
              </div>
            </xsl:when>

            <xsl:when test="field_type='checkboxes'">

              <xsl:variable name="parentPosition">
                <xsl:value-of select="$questionIdx"/>
              </xsl:variable>

              <div class="form-group">
                <asp:Panel runat="server" ID="cbl{$prefix}{$partNum}{$questionIdx}" data-fieldlabel="{label}" data-fieldcid="{cid}" CssClass="cblarea">
                  <label>
                    <xsl:value-of select="label"/>
                    <xsl:if test="required='true'">
                      <span class="text-danger">*</span>
                    </xsl:if>
                  </label>
                  <br/>


                  <xsl:for-each select="field_options/options">


                    <asp:CheckBox runat="server" ID="checkItem_{$prefix}{$partNum}{$parentPosition}_{position()}" data-ensuretrigger="true" class="" Value=" {label}" Text="{label}">
                      <xsl:if test="($val!='' and contains($val,label))">
                        <xsl:attribute name="Checked">true</xsl:attribute>
                      </xsl:if>


                      <xsl:if test="position()=1">
                        <xsl:attribute name="data-isfirstitem">true</xsl:attribute>
                      </xsl:if>
                      <xsl:if test="../../required='true'">
                        <xsl:if test="position()=1">
                          <xsl:attribute name="data-fv-choicenet">true</xsl:attribute>
                          <xsl:attribute name="data-fv-choicenet-min">1</xsl:attribute>
                          <xsl:attribute name="data-fv-choicenet-message">
                            <xsl:value-of select="../../label"></xsl:value-of>
                            <xsl:text> is required.</xsl:text>
                          </xsl:attribute>

                          <xsl:attribute name="data-required">
                            <xsl:value-of select="required"/>
                          </xsl:attribute>
                          <xsl:attribute name="data-fieldcidmaster">
                            <xsl:value-of select="../../cid"/>
                          </xsl:attribute>
                          <xsl:attribute name="data-fieldcid">
                            <xsl:value-of select="../../cid"/>
                          </xsl:attribute>
                          <xsl:attribute name="data-data-fv-field">
                            <xsl:value-of select="../../cid"/>
                          </xsl:attribute>
                        </xsl:if>

                        <xsl:attribute name="class">move_attribs_to_child_input</xsl:attribute>
                      </xsl:if>
                      <xsl:attribute name="data-fieldcidalt">
                        <xsl:value-of select="../../cid"/>
                      </xsl:attribute>
                      <xsl:attribute name="data-labelname">
                        <xsl:value-of select="label"/>
                      </xsl:attribute>
                    </asp:CheckBox>
                    <xsl:text> </xsl:text>

                    <br/>
                  </xsl:for-each>

                  <xsl:if test="field_options/include_other_option='true'">
                    <asp:CheckBox runat="server" ID="checkItem_other_{$prefix}{$partNum}{$parentPosition}_{position()+1}" data-ensuretrigger="true" class="" Value="Other" Text="Other">
                      <xsl:if test="($val!='' and contains($val,'Other'))">
                        <xsl:attribute name="Checked">true</xsl:attribute>
                      </xsl:if>
                      <xsl:if test="required='true'">
                        <xsl:attribute name="class">move_attribs_to_child_input</xsl:attribute>
                      </xsl:if>
                      <xsl:attribute name="data-fieldcidalt">
                        <xsl:value-of select="cid"/>
                      </xsl:attribute>
                      <xsl:attribute name="data-labelname">
                        <xsl:text>Other</xsl:text>
                      </xsl:attribute>

                    </asp:CheckBox>


                    <asp:TextBox runat="server" CssClass="form-control" data-labelname="{label} - Other" data-fieldcid="{cid}_other">

                      <xsl:choose>

                        <xsl:when test="$val_other!=''">
                          <xsl:attribute name="Text">
                            <xsl:value-of select="$val_other"/>
                          </xsl:attribute>
                        </xsl:when>
                      </xsl:choose>



                    </asp:TextBox>


                  </xsl:if>
                </asp:Panel>

                <xsl:if test="field_options/description!=''">
                  <p class="help-block">
                    <xsl:value-of select="field_options/description"/>
                  </p>
                </xsl:if>
              </div>
            </xsl:when>
            <xsl:when test="field_type='checkboxes' and false">
              <!-- previous checkboxlist mode. going forward we will use individual checkboxes. -->
              <div class="form-group">
                <label>
                  <xsl:value-of select="label"/>
                  <xsl:if test="required='true'">
                    <span class="text-danger">*</span>
                  </xsl:if>
                </label>
                <br/>
                <asp:CheckBoxList runat="server" data-labelname="{label}" data-required="{required}" data-fv-cblreq="true" RepeatLayout="Flow"  data-fieldcid="{cid}">
                  <xsl:if test="required='true'">
                    <!--<xsl:attribute name="CssClass">atLeastOneChk</xsl:attribute>-->
                    <xsl:attribute name="data-fv-cb_selectone">true</xsl:attribute>
                  </xsl:if>
                  <xsl:for-each select="field_options/options">
                    <asp:ListItem value="{label}">
                      <!--<xsl:if test="../../required='true' and position()=1">
                      <xsl:attribute name="data-fv-choice">true</xsl:attribute>
                      <xsl:attribute name="data-fv-choice-min">1</xsl:attribute>
                      <xsl:attribute name="data-fv-choice-message">
                        <xsl:value-of select="../../label"></xsl:value-of>
                        <xsl:text> is required.</xsl:text>
                      </xsl:attribute>
                    </xsl:if>-->

                      <xsl:if test="($val!='' and contains($val,label))">
                        <xsl:attribute name="Selected">
                          <xsl:text>true</xsl:text>
                        </xsl:attribute>
                      </xsl:if>


                      <xsl:value-of select="label"/>
                    </asp:ListItem>
                  </xsl:for-each>
                  <xsl:if test="field_options/include_other_option='true'">
                    <asp:ListItem value="Other">
                      <xsl:if test="($val='Other') and count(field_options/options[label=$val])=0">
                        <xsl:attribute name="Selected">true</xsl:attribute>
                      </xsl:if>
                      Other
                    </asp:ListItem>
                  </xsl:if>
                </asp:CheckBoxList>
                <xsl:if test="field_options/include_other_option='true'">
                  <asp:TextBox runat="server" CssClass="form-control" data-labelname="{label} - Other" data-fieldcid="{cid}_other">

                    <xsl:choose>

                      <xsl:when test="$val_other!=''">
                        <xsl:attribute name="Text">
                          <xsl:value-of select="$val_other"/>
                        </xsl:attribute>
                      </xsl:when>
                    </xsl:choose>

                  </asp:TextBox>
                </xsl:if>
                <xsl:if test="field_options/description!=''">
                  <p class="help-block">
                    <xsl:value-of select="field_options/description"/>
                  </p>
                </xsl:if>
              </div>
            </xsl:when>

            <xsl:when test="field_type='radio'">
              <xsl:variable name="parentPosition">
                <xsl:value-of select="$questionIdx"/>
              </xsl:variable>

              <div class="form-group">
               
                <asp:Panel runat="server" ID="pnl{$prefix}{$questionIdx}{$partNum}" data-fieldlabel="{label}" data-fieldcid="{cid}" CssClass="cblarea">
                  <label for="rbl_main_{cid}_{position()}">
                    <xsl:value-of select="label"/>
                    <xsl:if test="required='true'">
                      <span class="text-danger">*</span>
                    </xsl:if>
                  </label>
                  <div class="row">


                    <xsl:for-each select="field_options/options">
                      <div class="col-sm-4">

                        <asp:RadioButton runat="server" ID="checkItem_{$prefix}{$parentPosition}_{position()}{$partNum}" GroupName="{../../cid}{$partNum}" data-ensuretrigger="true" class="" Value="{label}" Text="{label}">
                          <xsl:if test="($val!='' and $val=label)">
                            <xsl:attribute name="Checked">true</xsl:attribute>
                          </xsl:if>
                          <xsl:if test="position()=1">
                            <xsl:attribute name="data-isfirstitem">true</xsl:attribute>
                          </xsl:if>
                          <xsl:if test="../../required='true'">
                            <xsl:if test="position()=1">

                              <xsl:attribute name="data-required">
                                <xsl:value-of select="required"/>
                              </xsl:attribute>
                              <xsl:attribute name="data-fv-choice">true</xsl:attribute>
                              <xsl:attribute name="data-fv-choice-min">1</xsl:attribute>
                              <xsl:attribute name="data-fv-choice-message">
                                <xsl:value-of select="../../label"></xsl:value-of>
                                <xsl:text> is required.</xsl:text>
                              </xsl:attribute>
                              <xsl:attribute name="data-fieldcidmaster">
                                <xsl:value-of select="../../cid"/>
                              </xsl:attribute>
                              <xsl:attribute name="data-fieldcid">
                                <xsl:value-of select="../../cid"/>
                              </xsl:attribute>
                              <xsl:attribute name="data-data-fv-field">
                                <xsl:value-of select="../../cid"/>
                              </xsl:attribute>
                            </xsl:if>

                            <xsl:attribute name="class">move_attribs_to_child_input</xsl:attribute>
                          </xsl:if>
                          <xsl:attribute name="data-labelname">
                            <xsl:value-of select="label"/>
                          </xsl:attribute>
                          <xsl:attribute name="data-fieldcidalt">
                            <xsl:value-of select="../../cid"/>
                          </xsl:attribute>

                        </asp:RadioButton>

                      </div>
                    </xsl:for-each>

                  </div>

                  <xsl:if test="field_options/include_other_option='true'">
                    <asp:RadioButton runat="server" ID="checkItem_other_{$prefix}{$parentPosition}_{position()}{$partNum}" GroupName="{cid}{$partNum}" data-ensuretrigger="true" class="" Value="Other" Text="Other">
                      <xsl:if test="($val!='' and contains($val,'Other'))">
                        <xsl:attribute name="Checked">true</xsl:attribute>
                      </xsl:if>
                      <xsl:if test="required='true'">
                        <xsl:attribute name="class">move_attribs_to_child_input</xsl:attribute>
                      </xsl:if>
                      <xsl:attribute name="data-fieldcidalt">
                        <xsl:value-of select="cid"/>
                      </xsl:attribute>
                      <xsl:attribute name="data-labelname">
                        <xsl:text>Other</xsl:text>
                      </xsl:attribute>

                    </asp:RadioButton>
                   

                    <asp:TextBox runat="server" CssClass="form-control" data-labelname="{label} - Other" data-fieldcid="{cid}_other">
                      <xsl:choose>

                        <xsl:when test="$val_other!=''">
                          <xsl:attribute name="Text">
                            <xsl:value-of select="$val_other"/>
                          </xsl:attribute>
                        </xsl:when>
                      </xsl:choose>
                    </asp:TextBox>


                  </xsl:if>

                </asp:Panel>

                <xsl:if test="field_options/description!=''">
                  <p class="help-block">
                    <xsl:value-of select="field_options/description"/>
                  </p>
                </xsl:if>
              </div>
            </xsl:when>

            <xsl:when test="field_type='radio' and false">
              <!-- old radio button method. adding support for new validation. -->
              <div class="form-group">
                <label>
                  <xsl:value-of select="label"/>
                  <xsl:if test="required='true'">
                    <span class="text-danger">*</span>
                  </xsl:if>
                </label>
                <br/>
                <asp:RadioButtonList runat="server" data-labelname="{label}" data-required="{required}" RepeatLayout="Flow" data-fieldcid="{cid}">
                  <xsl:if test="required='true'">
                    <xsl:attribute name="data-fv-notempty">true</xsl:attribute>
                    <xsl:attribute name="data-fv-notempty-message">
                      <xsl:value-of select="label"></xsl:value-of>
                      <xsl:text> is required.</xsl:text>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:for-each select="field_options/options">
                    <asp:ListItem value="{label}">

                      <xsl:value-of select="label"/>
                    </asp:ListItem>
                  </xsl:for-each>
                  <xsl:if test="field_options/include_other_option='true'">
                    <asp:ListItem value="Other">
                      <xsl:if test="($val='Other') and count(field_options/options[label=$val])=0">
                        <xsl:attribute name="Selected">true</xsl:attribute>
                      </xsl:if>Other
                    </asp:ListItem>
                  </xsl:if>
                </asp:RadioButtonList>
                <xsl:if test="field_options/include_other_option='true'">
                  <asp:TextBox runat="server" CssClass="form-control" data-labelname="{label} - Other" data-fieldcid="{cid}_other">
                    <xsl:choose>

                      <xsl:when test="$val_other!=''">
                        <xsl:attribute name="Text">
                          <xsl:value-of select="$val_other"/>
                        </xsl:attribute>
                      </xsl:when>
                    </xsl:choose>
                  </asp:TextBox>
                </xsl:if>

                <xsl:if test="field_options/description!=''">
                  <p class="help-block">
                    <xsl:value-of select="field_options/description"/>
                  </p>
                </xsl:if>
              </div>
            </xsl:when>

            <xsl:when test="field_type='dropdown'">
              <div class="form-group">
                <label for="cbo_main_{cid}_{position()}">
                  <xsl:value-of select="label"/>
                  <xsl:if test="required='true'">
                    <span class="text-danger">*</span>
                  </xsl:if>

                  
                </label>
                <xsl:variable name="SelIdxdata">
                  <data>
                    <xsl:for-each select="field_options/options">
                      <xsl:if test="$val=label and $val!=''">
                        <itm>
                          <xsl:value-of select="position()"/>
                        </itm>
                      </xsl:if>
                    </xsl:for-each>
                  </data>
                </xsl:variable>

                <xsl:variable name="SelIdx">
                  <xsl:value-of select="msxsl:node-set($SelIdxdata)/data/itm[1]"/>
                </xsl:variable>

                <asp:DropDownList ID="cbo_main_{$prefix}{cid}_{position()}{$partNum}" data-codename="CUSTOM:{label}" ClientIDMode="Static" runat="server" CssClass="form-control" data-labelname="{label}" data-required="{required}" data-fieldcid="{cid}">
                  
                  <xsl:if test="required='true'">
                    <xsl:attribute name="data-fv-notempty">true</xsl:attribute>
                    <xsl:attribute name="data-fv-notempty-message">
                      <xsl:value-of select="label"></xsl:value-of>
                      <xsl:text> is required.</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="data-fv-icon">false</xsl:attribute>
                  </xsl:if>
                  <xsl:if test="field_options/include_blank_option='true'">
                    <asp:ListItem value=""></asp:ListItem>
                  </xsl:if>

              
                  <xsl:for-each select="field_options/options">
                    <asp:ListItem value="{label}">
                      <xsl:if test="position()=$SelIdx">
                        <xsl:attribute name="Selected">
                          <xsl:text>true</xsl:text>
                        </xsl:attribute>
                      </xsl:if>
                      <!-- this can cause multiple items to be selected, find a better way to handle that! -->
                      <!--<xsl:if test="($val=label and $val!='') or ($valNew=label and $valNew!='')">
                            <xsl:attribute name="Selected">
                              <xsl:text>true</xsl:text>
                            </xsl:attribute>
                          </xsl:if>-->
                      <xsl:value-of select="label"/>
                    </asp:ListItem>
                  </xsl:for-each>
                  <xsl:if test="field_options/include_other_option='true'">
                    <asp:ListItem value="Other">
                      <xsl:if test="($val='Other') and count(field_options/options[label=$val])=0">
                        <xsl:attribute name="Selected">true</xsl:attribute>
                      </xsl:if>Other
                    </asp:ListItem>
                  </xsl:if>
                </asp:DropDownList>

                <xsl:if test="field_options/description!=''">
                  <p class="help-block">
                    <xsl:value-of select="field_options/description"/>
                  </p>
                </xsl:if>
              </div>
            </xsl:when>

            <xsl:when test="field_type='paragraph'">
              <div class="form-group">
                <label for="txt_main_{cid}_{position()}">
                  <xsl:value-of select="label"/>
                  <xsl:if test="required='true'">
                    <span class="text-danger">*</span>
                  </xsl:if>
                </label>
                <asp:TextBox ID="txt_main_{$prefix}_{cid}_{position()}{$partNum}" ClientIDMode="Static" data-codename="CUSTOM:{label}" runat="server" CssClass="form-control" data-labelname="{label}" TextMode="MultiLine" data-required="{required}" data-fieldcid="{cid}">
                  <xsl:if test="required='true'">
                    <xsl:attribute name="data-fv-notempty">true</xsl:attribute>
                    <xsl:attribute name="data-fv-notempty-message">
                      <xsl:value-of select="label"></xsl:value-of>
                      <xsl:text> is required.</xsl:text>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:choose>

                    <xsl:when test="$val!=''">
                      <xsl:attribute name="Text">
                        <xsl:value-of select="$val"/>
                      </xsl:attribute>
                    </xsl:when>
                  </xsl:choose>

                </asp:TextBox>

                <xsl:if test="field_options/description!=''">
                  <p class="help-block">
                    <xsl:value-of select="field_options/description"/>
                  </p>
                </xsl:if>
              </div>
            </xsl:when>
            <!--
          text
          checkboxes
          paragraph
          radio
          dropdown
          
          
          not doing now (disable in the formbuilder JS)
          date
          time
          website
          price
          number
          email
          address
          -->

          </xsl:choose>

        </div>







      </xsl:otherwise>
    </xsl:choose>


  </xsl:template>
</xsl:stylesheet>