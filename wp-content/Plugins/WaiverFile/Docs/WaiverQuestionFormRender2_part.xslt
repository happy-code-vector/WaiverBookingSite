<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:str="http://exslt.org/strings" xmlns:math="http://exslt.org/math" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt math msxsl">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="siteid"></xsl:param>
  <xsl:param name="partidx">0</xsl:param>

  <xsl:template match="/">

    
   
    
      <xsl:for-each select="/data/fields">

        <xsl:if test="position()=1">
          <!--<hr/>-->
        </xsl:if>
        
      <xsl:variable name="lbl">
        <xsl:value-of select="label"/>
      </xsl:variable>
        <xsl:variable name="lbl_other">
          <xsl:value-of select="label"/>
          <xsl:text> - Other</xsl:text>
        </xsl:variable>
       

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




            <div class="col-sm-4">

              <xsl:choose>




                <xsl:when test="field_type='number'">
                  <div class="form-group">
                    <label for="txt_part_{$partidx}_{cid}_{position()}">
                        <xsl:value-of select="label"/>
                        <xsl:if test="required='true'">
                          <span class="text-danger">*</span>
                        </xsl:if>
                    </label>
                    <asp:TextBox ID="txt_part_{$partidx}_{cid}_{position()}" ClientIDMode="Static" data-codename="PART_CUSTOM_{$partidx + 1}:{label}" runat="server" CssClass="form-control" data-labelname="{label}" data-required="{required}" pattern="[0-9]*" data-fieldcid="{cid}">
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

                    
                    </asp:TextBox>

                    <xsl:if test="field_options/description!=''">
                      <p class="help-block">
                        <xsl:value-of select="field_options/description"/>
                      </p>
                    </xsl:if>
                  </div>
                </xsl:when>

                <xsl:when test="field_type='text'">
                  <div class="">

                    <label for="txt_part_{$partidx}_{cid}_{position()}">
                      
                      <xsl:value-of select="label"/>
                      <xsl:if test="required='true'">
                        <span class="text-danger">*</span>
                      </xsl:if>
                     
                    </label>
                    <asp:TextBox ID="txt_part_{$partidx}_{cid}_{position()}" ClientIDMode="Static" runat="server" data-codename="PART_CUSTOM_{$partidx + 1}:{label}" CssClass="form-control" data-labelname="{label}" data-required="{required}" data-fieldcid="{cid}">
                      <xsl:choose>
                        <xsl:when test="field_options/minlength!=''and field_options/maxlength!='' and field_options/min_max_length_units='characters'">
                          <xsl:attribute name="data-fv-stringlength-message">
                            <xsl:value-of select="label"></xsl:value-of>
                            <xsl:text> must be between </xsl:text>
                            <xsl:value-of select="field_options/minlength"/>
                            <xsl:text> and </xsl:text>
                            <xsl:value-of select="field_options/maxlength"/>
                            <xsl:text> characters </xsl:text>
                          </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="field_options/maxlength!='' and field_options/min_max_length_units='characters'">
                          <xsl:attribute name="data-fv-stringlength-message">
                            <xsl:value-of select="label"></xsl:value-of>
                            <xsl:text> must be no more than </xsl:text>
                            <xsl:value-of select="field_options/maxlength"/>
                            <xsl:text> characters </xsl:text>
                          </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="field_options/minlength!='' and field_options/min_max_length_units='characters'">
                          <xsl:attribute name="data-fv-stringlength-message">
                            <xsl:value-of select="label"></xsl:value-of>
                            <xsl:text> must be at least </xsl:text>
                            <xsl:value-of select="field_options/minlength"/>
                            <xsl:text> characters </xsl:text>
                          </xsl:attribute>
                        </xsl:when>

                      </xsl:choose>

                      <xsl:if test="field_options/minlength!='' and field_options/min_max_length_units='characters'">
                        <xsl:attribute name="minlength">
                          <xsl:value-of select="field_options/minlength"/>
                        </xsl:attribute>
                      </xsl:if>
                      <xsl:if test="field_options/maxlength!='' and field_options/min_max_length_units='characters'">
                        <xsl:attribute name="maxlength">
                          <xsl:value-of select="field_options/maxlength"/>
                        </xsl:attribute>
                      </xsl:if>
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
                    <xsl:value-of select="position()"/>
                  </xsl:variable>

                  <div class="">
                    <asp:Panel runat="server"  data-fieldlabel="{label}" data-fieldcid="{cid}" CssClass="cblarea">
                      <label>
                        
                        <xsl:value-of select="label"/>
                        <xsl:if test="required='true'">
                          <span class="text-danger">*</span>
                        </xsl:if>
                       
                      </label>
                      <br/>


                      <xsl:for-each select="field_options/options">

                        
                        <asp:CheckBox runat="server"  data-ensuretrigger="true" class="" Value=" {label}" Text="{label}">
                        
                          
                          <xsl:if test="position()=1">
                            <xsl:attribute name="data-isfirstitem">true</xsl:attribute>
                          </xsl:if>
                          <xsl:if test="../../required='true'">
                            <xsl:if test="position()=1">
                              

                              <xsl:attribute name="data-required">
                                <xsl:value-of select="required"/>
                              </xsl:attribute>
                              <xsl:attribute name="data-fieldcidmaster">
                                <xsl:value-of select="../../cid"/>
                              </xsl:attribute>
                              <xsl:attribute name="data-fieldcid">
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
                        <asp:CheckBox runat="server" data-ensuretrigger="true" class="" Value="Other" Text="Other">
                         
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
                  <div class="">
                    <label>
                      
                      <xsl:value-of select="label"/>
                      <xsl:if test="required='true'">
                        <span class="text-danger">*</span>
                      </xsl:if>
                     
                    </label>
                    <br/>
                    <asp:CheckBoxList runat="server" data-labelname="{label}" data-required="{required}"  RepeatLayout="Flow"  data-fieldcid="{cid}">
                    
                      <xsl:for-each select="field_options/options">
                        <asp:ListItem value="{label}">
                       
                         


                          <xsl:value-of select="label"/>
                        </asp:ListItem>
                      </xsl:for-each>
                      <xsl:if test="field_options/include_other_option='true'">
                        <asp:ListItem value="Other">
                        
                          Other
                        </asp:ListItem>
                      </xsl:if>
                    </asp:CheckBoxList>
                    <xsl:if test="field_options/include_other_option='true'">
                      <asp:TextBox runat="server" CssClass="form-control" data-labelname="{label} - Other" data-fieldcid="{cid}_other">
                       
                      
                        
                      </asp:TextBox>
                    </xsl:if>
                    <xsl:if test="field_options/description!=''">
                      <p class="help-block">
                        <xsl:value-of select="field_options/description"/>
                      </p>
                    </xsl:if>
                  </div>
                </xsl:when>

                <xsl:when test="field_type='radio' and false">
                  <xsl:variable name="parentPosition">
                    <xsl:value-of select="position()"/>
                  </xsl:variable>

                  <div class="">
                    <asp:Panel runat="server"  data-fieldlabel="{label}" data-fieldcid="{cid}" CssClass="cblarea">
                      <label>
                        
                        <xsl:value-of select="label"/>
                        <xsl:if test="required='true'">
                          <span class="text-danger">*</span>
                        </xsl:if>
                       
                      </label>
                      

                      <div class="row">


                        <xsl:for-each select="field_options/options">
                          <div class="col-sm-4">

                          <asp:RadioButton runat="server"  GroupName="part_{cid}_{$partidx}_{$parentPosition}" data-ensuretrigger="true" class="" Value="{label}" Text="{label}">

                            <xsl:if test="position()=1">
                              <xsl:attribute name="data-isfirstitem">true</xsl:attribute>
                            </xsl:if>
                            <xsl:if test="../../required='true'">
                              <xsl:if test="position()=1">

                                <xsl:attribute name="data-required">
                                  <xsl:value-of select="required"/>
                                </xsl:attribute>

                                <xsl:attribute name="data-fieldcidmaster">
                                  <xsl:value-of select="../../cid"/>
                                </xsl:attribute>
                                <xsl:attribute name="data-fieldcid">
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
                        <asp:RadioButton runat="server"  GroupName="part_{cid}_{$partidx}_{$parentPosition}" data-ensuretrigger="true" class="" Value="Other" Text="Other">
                          
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

                        <asp:TextBox runat="server" CssClass="form-control" data-labelname="{label} - Other">
                         
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

                <xsl:when test="field_type='radio'">
                  <!-- old radio button method. adding support for new validation. -->
                  <div class="">
                    <label>
                      
                      <xsl:value-of select="label"/>
                      <xsl:if test="required='true'">
                        <span class="text-danger">*</span>
                      </xsl:if>
                     
                    </label>
                    <br/>
                    <asp:RadioButtonList runat="server" data-labelname="{label}" data-required="{required}" RepeatLayout="Flow" data-fieldcid="{cid}">
                     
                      <xsl:for-each select="field_options/options">
                        <asp:ListItem value="{label}">
                         
                          <xsl:value-of select="label"/>
                        </asp:ListItem>
                      </xsl:for-each>
                      <xsl:if test="field_options/include_other_option='true'">
                        <asp:ListItem value="Other">
                        Other
                        </asp:ListItem>
                      </xsl:if>
                    </asp:RadioButtonList>
                    <xsl:if test="field_options/include_other_option='true'">
                      <asp:TextBox runat="server" CssClass="form-control" data-labelname="{label} - Other" data-fieldcid="{cid}_other">
                       
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
                  <div class="">
                    <label for="cbo_part_{$partidx}_{cid}_{position()}">
                      
                      <xsl:value-of select="label"/>
                      <xsl:if test="required='true'">
                        <span class="text-danger">*</span>
                      </xsl:if>
                     
                    </label>
                    <asp:DropDownList ID="cbo_part_{$partidx}_{cid}_{position()}" data-codename="PART_CUSTOM_{$partidx + 1}:{label}" ClientIDMode="Static" runat="server" CssClass="form-control" data-labelname="{label}" data-required="{required}" data-fieldcid="{cid}">
                     
                      <xsl:if test="field_options/include_blank_option='true'">
                        <asp:ListItem value=""></asp:ListItem>
                      </xsl:if>
                      <xsl:for-each select="field_options/options">
                        <asp:ListItem value="{label}">
                         
                          <xsl:value-of select="label"/>
                        </asp:ListItem>
                      </xsl:for-each>
                      <xsl:if test="field_options/include_other_option='true'">
                        <asp:ListItem value="Other">
                        Other
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
                  <div class="">
                    <label for="txt_part_{$partidx}_{cid}_{position()}">
                      
                        <xsl:value-of select="label"/>
                        <xsl:if test="required='true'">
                          <span class="text-danger">*</span>
                        </xsl:if>
                     
                    </label>
                    <asp:TextBox ID="txt_part_{$partidx}_{cid}_{position()}" ClientIDMode="Static" data-codename="PART_CUSTOM_{$partidx + 1}:{label}" runat="server" CssClass="form-control" data-labelname="{label}" TextMode="MultiLine" data-required="{required}" data-fieldcid="{cid}">
                     

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
      
    </xsl:for-each>

  
    
  </xsl:template>
</xsl:stylesheet>