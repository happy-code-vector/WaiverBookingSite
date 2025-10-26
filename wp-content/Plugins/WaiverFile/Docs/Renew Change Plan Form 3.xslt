<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:set="http://exslt.org/sets" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt set"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  

  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:param name="_isExpired"></xsl:param>
  <xsl:param name="_newSubGranted"></xsl:param>
  <xsl:param name="daysExpired"></xsl:param>
  <xsl:param name="statusMessage"></xsl:param>
  <xsl:param name="freeTrialWFPlanID"></xsl:param>

  
  
  
  <xsl:template match="/">

    
    <script type="text/javascript">
      $(document).ready(function(){

      $('#div_planselect_info').hide();

      $('.rbplan').click(function(){
      if($(this).hasClass('rb_current_plan')){
      $('#div_planselect_info').hide();
      }
      else if($(this).hasClass('rb_different_bill_period')){
      $('#div_planselect_info').show();
      $('#div_planselect_info').html('This plan has a different billing period than you are currently using. The new billing period will begin at the end of your current subscription. ');
      }
      else if($(this).hasClass('rb_less_than')){
      $('#div_planselect_info').show();
      <xsl:choose>
        <xsl:when test="$_isExpired='True'">$('#div_planselect_info').html('You have selected a lower plan. Since your current plan is expired, your new plan will take over for the current billing period. ');</xsl:when>
        <xsl:otherwise>$('#div_planselect_info').html('You have selected a lower plan. Your plan will change automatically at the end of the current billing period.');</xsl:otherwise>
      </xsl:choose>

      }
      else if($(this).hasClass('rb_greater_than')){
      $('#div_planselect_info').show();
      <xsl:choose>
      <xsl:when test="$_isExpired='True'">$('#div_planselect_info').html('You have selected a larger plan. Since your current plan is expired, your new plan will take over for the current billing period. ');</xsl:when>
      <xsl:otherwise>$('#div_planselect_info').html('You have selected a larger plan. You will be charged the difference between your current plan and this plan and it will apply to the current billing period.');</xsl:otherwise>
    </xsl:choose>
      }

      });


      
      
      
      });
      
    </script>
    
    <xsl:if test="$statusMessage!=''">
      <div class="WPERR_Information">
        <xsl:value-of select="$statusMessage"/>
      </div>
    </xsl:if>

    
      <xsl:if test="$_isExpired!='True' and /Main/WFSubscription/SelectedPrice/WFPlanID=$freeTrialWFPlanID">
        <div class="WPERR_Information">
          <xsl:text>You are currently using our free trial. Select a plan today and your billing will be processed on  </xsl:text>
          <xsl:value-of select="dt:format-date(/Main/WFSubscription/ExpirationDate,'MMMM d, yyyy')"/>
          <xsl:text> or when you have reached 100 waivers.</xsl:text>
        </div>
      </xsl:if>

    <xsl:for-each select="set:distinct(/Main/ArrayOfWFPlan/WFPlan/GroupName)">
      <xsl:variable name="groupname">
        <xsl:value-of select="."/>
      </xsl:variable>

      <xsl:if test="count(set:distinct(/Main/ArrayOfWFPlan/WFPlan/GroupName))&gt;1">
        <h3>
          <xsl:choose>
            <xsl:when test="$groupname='Ungrouped'">Custom Plans</xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$groupname"/>
            </xsl:otherwise>
          </xsl:choose>
          
        </h3>
      </xsl:if>

      <div class="row">



        <xsl:for-each select="/Main/ArrayOfWFPlan/WFPlan[ID!=$freeTrialWFPlanID and GroupName=$groupname]">
          <xsl:sort select="CurrentPrice/Price" data-type="number"></xsl:sort>

          <xsl:variable name="idUnder">
            <xsl:value-of select="translate(CurrentPrice/ID,'-','_')"/>
          </xsl:variable>
          <xsl:variable name="id">
            <xsl:value-of select="ID"/>
          </xsl:variable>






          <div class="col-xs-6 col-sm-3 col-md-2">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h4 class="text-center">
                  <xsl:value-of select="Name"/>
                </h4>
              </div>
              <div class="panel-body text-center">
                <p>
                  <xsl:value-of select="Description" disable-output-escaping="yes"/>
                </p>




                <p class="">
                  <strong>

                    <input type="radio" name="purchasechoice" id="rbPlan{$idUnder}" value="rbPlan{$idUnder}">
                      <xsl:if test="$id=/Main/WFSubscription/Plan/ID">
                        <xsl:attribute name="checked">checked</xsl:attribute>
                      </xsl:if>
                      <xsl:attribute name="class">
                        <xsl:text>rbplan </xsl:text>
                        <xsl:choose>
                          <xsl:when test="/Main/WFSubscription/SelectedPrice/WFPlanID=$freeTrialWFPlanID"></xsl:when>
                          <xsl:when test="CurrentPrice/ID=/Main/WFSubscription/SelectedPrice/ID">rb_current_plan</xsl:when>
                          <xsl:when test="CurrentPrice/BillingInterval!=/Main/WFSubscription/SelectedPrice/BillingInterval">rb_different_bill_period</xsl:when>
                          <xsl:when test="CurrentPrice/Price&lt;/Main/WFSubscription/SelectedPrice/Price">rb_less_than</xsl:when>
                          <xsl:when test="CurrentPrice/Price&gt;/Main/WFSubscription/SelectedPrice/Price">rb_greater_than</xsl:when>
                          <xsl:otherwise>rb_same</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>
                    </input>

                    <xsl:text>$</xsl:text>
                    <xsl:value-of select="format-number(CurrentPrice/Price,'#,##0.00')"/>
                    <xsl:choose>
                      <xsl:when test="CurrentPrice/BillingInterval='Daily'">
                        <xsl:text> per day</xsl:text>
                      </xsl:when>
                      <xsl:when test="CurrentPrice/BillingInterval='Weekly'">
                        <xsl:text> per week</xsl:text>
                      </xsl:when>
                      <xsl:when test="CurrentPrice/BillingInterval='Monthly'">
                        <xsl:text> per month</xsl:text>
                      </xsl:when>
                      <xsl:when test="CurrentPrice/BillingInterval='Quarterly'">
                        <xsl:text> per quarter</xsl:text>
                      </xsl:when>
                      <xsl:when test="CurrentPrice/BillingInterval='Yearly'">
                        <xsl:text> per year</xsl:text>
                      </xsl:when>
                      <xsl:when test="CurrentPrice/BillingInterval='Half_Year'">
                        <xsl:text> every six months</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="CurrentPrice/BillingInterval"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </strong>
                  <br/>
                  <!-- <xsl:variable name="GroupIDCurr">
                    <xsl:value-of select="GroupID"/>
                  </xsl:variable>
                  <xsl:if test="/Main/WFOffer2/ID and count(/Main/WFOffer2/PlanGroups/WFPlanGroup[ID=$GroupIDCurr])!=0">
                  
                    <small>
                      <strong>
                        * before discount
                      </strong>
                    </small>
                    <br/>
                  </xsl:if>-->
                  
                  
                  <xsl:choose>
                    <xsl:when test="CurrentPrice/Quota=0">

                      <xsl:text>New waivers billed at $</xsl:text>
                      <xsl:value-of select="format-number(CurrentPrice/AdditionalWaiverPriceEach,'#,##0.00')"/>
                      <xsl:text> each</xsl:text>
                      <!--<br/>Unlimited total storage.-->
                    </xsl:when>
                    <xsl:when test="CurrentPrice/Quota&lt;0">
                      Unlimited waivers
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>Includes </xsl:text>
                      <xsl:value-of select="CurrentPrice/Quota"/>
                      <xsl:text> waivers </xsl:text>
                      <xsl:choose>
                        <xsl:when test="CurrentPrice/QuotaInterval='Daily'">
                          <xsl:text> per day</xsl:text>
                        </xsl:when>
                        <xsl:when test="CurrentPrice/QuotaInterval='Weekly'">
                          <xsl:text> per week</xsl:text>
                        </xsl:when>
                        <xsl:when test="CurrentPrice/QuotaInterval='Monthly'">
                          <xsl:text> per month</xsl:text>
                        </xsl:when>
                        <xsl:when test="CurrentPrice/QuotaInterval='Quarterly'">
                          <xsl:text> per quarter</xsl:text>
                        </xsl:when>
                        <xsl:when test="CurrentPrice/QuotaInterval='Yearly'">
                          <xsl:text> per year</xsl:text>
                        </xsl:when>
                        <xsl:when test="CurrentPrice/QuotaInterval='Half_Year'">
                          <xsl:text> every six months</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="CurrentPrice/QuotaInterval"/>
                        </xsl:otherwise>
                      </xsl:choose>
                      <p>
                        <small>
                        <xsl:text>$</xsl:text>
                        <xsl:value-of select="format-number(CurrentPrice/AdditionalWaiverPriceEach,'#,##0.00')"/>
                        <xsl:text> each additional</xsl:text>
                        </small>
                      </p>
                      
                    </xsl:otherwise>
                  </xsl:choose>


                </p>
                <xsl:if test="CurrentPrice/ID=/Main/WFSubscription/SelectedPrice/ID">
                  <strong>
                    <em>* Your Current Plan</em>
                  </strong>
                </xsl:if>

                <xsl:variable name="GroupIDCurr">
                  <xsl:value-of select="GroupID"/>
                </xsl:variable>
                <xsl:if test="/Main/WFOffer2/ID and count(/Main/WFOffer2/PlanGroups/WFPlanGroup[ID=$GroupIDCurr])=0">
                  <br/>
                  <small style="color:red;">
                    * Special offer does not apply to this plan
                  </small>
                </xsl:if>
              </div>
            </div>
          </div>

        </xsl:for-each>
        <xsl:variable name="WFPlanPriceID">
          <xsl:value-of select="/Main/WFSubscription/WFPlanPriceID"/>
        </xsl:variable>
        <xsl:if test="count(/Main/ArrayOfWFPlan/WFPlan/CurrentPrice[ID=$WFPlanPriceID])=0">

          <xsl:for-each select="/Main/WFSubscription/Plan[ID!=$freeTrialWFPlanID]">

            <xsl:variable name="idUnder">
              <xsl:value-of select="translate(CurrentPrice/ID,'-','_')"/>
            </xsl:variable>
            <xsl:variable name="id">
              <xsl:value-of select="ID"/>
            </xsl:variable>




            <!-- grandfathered plan. -->
            <div class="col-xs-6 col-sm-3 col-md-2">
              <div class="panel panel-primary">
                <div class="panel-heading">
                  <h4 class="text-center">
                    <xsl:value-of select="Name"/>

                  </h4>
                </div>
                <div class="panel-body text-center">

                 <!-- <xsl:choose>
                    <xsl:when test="Status='Private'">
                      <p>
                        <em>
                          (Custom Plan)
                        </em>
                      </p>
                    </xsl:when>
                    <xsl:when test="Status='Annual'">
                      <p>
                        <em>
                          (Annual Plan)
                        </em>
                      </p>
                    </xsl:when>
                    <xsl:otherwise>
                      <p>
                        <em>
                          (discontinued plan)
                        </em>
                      </p>
                    </xsl:otherwise>

                  </xsl:choose>-->

                  <p>
                    <xsl:value-of select="Description" disable-output-escaping="yes"/>
                  </p>




                  <p class="">
                    <strong>

                      <input type="radio" name="purchasechoice" id="rbPlan{$idUnder}" value="rbPlan{$idUnder}">
                        <xsl:if test="$id=/Main/WFSubscription/Plan/ID">
                          <xsl:attribute name="checked">checked</xsl:attribute>
                        </xsl:if>
                        <xsl:attribute name="class">
                          <xsl:text>rbplan </xsl:text>
                          <xsl:choose>
                            <xsl:when test="CurrentPrice/ID=/Main/WFSubscription/SelectedPrice/ID">rb_current_plan</xsl:when>
                            <xsl:when test="CurrentPrice/BillingInterval!=/Main/WFSubscription/SelectedPrice/BillingInterval">rb_different_bill_period</xsl:when>
                            <xsl:when test="CurrentPrice/Price&lt;/Main/WFSubscription/SelectedPrice/Price">rb_less_than</xsl:when>
                            <xsl:when test="CurrentPrice/Price&gt;/Main/WFSubscription/SelectedPrice/Price">rb_greater_than</xsl:when>
                            <xsl:otherwise>rb_same</xsl:otherwise>
                          </xsl:choose>
                        </xsl:attribute>
                      </input>
                      <xsl:value-of select="../SelectedPrice/BillingInterval"/>
                      <xsl:text> - $</xsl:text>
                      <xsl:value-of select="format-number(../SelectedPrice/Price,'#,##0.00')"/>
                      <br/>
                      <xsl:text>Includes </xsl:text>
                      <xsl:value-of select="../SelectedPrice/Quota"/>
                      <xsl:text> waivers </xsl:text>
                      <xsl:value-of select="../SelectedPrice/QuotaInterval"/>
                    </strong>
                  </p>
                  <xsl:if test="../SelectedPrice/ID=/Main/WFSubscription/Plan/SelectedPrice/ID">
                    <strong>
                      <em>* Your Current Plan</em>
                    </strong>
                  </xsl:if>
                </div>
              </div>
            </div>
          </xsl:for-each>

        </xsl:if>
        <!-- if the customer is using a grandfathered plan, may they keep it?
      leaving off here. look at that selected price and determine if it is still elligible. 
      
      -->

      </div>



    </xsl:for-each>
    
 
    <div class="WPERR_Information" id="div_planselect_info">
      <xsl:text> </xsl:text>
    </div>
  </xsl:template>

 
</xsl:stylesheet>