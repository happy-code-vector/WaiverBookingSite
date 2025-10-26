<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove"
xmlns:cc1="remove" xmlns:set="http://exslt.org/sets" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="dt set"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">


  <xsl:output method="html" omit-xml-declaration="yes"/>
  
  <xsl:param name="_newSubGranted"></xsl:param>
  <xsl:param name="statusMessage"></xsl:param>
  <xsl:param name="freeTrialWFPlanID"></xsl:param>
  <xsl:param name="currentPlanPriceID"></xsl:param>
  <xsl:param name="currentPlanPriceIDSMS"></xsl:param>




  <xsl:template match="/">

    
    <xsl:if test="$statusMessage!=''">
      <div class="WPERR_Information">
        <xsl:value-of select="$statusMessage"/>
      </div>
    </xsl:if>


    <xsl:for-each select="set:distinct(/ArrayOfWFPlan/WFPlan/GroupName)">
      <xsl:variable name="groupname">
        <xsl:value-of select="."/>
      </xsl:variable>

      <xsl:if test="count(set:distinct(/ArrayOfWFPlan/WFPlan/GroupName))&gt;1">
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



        <xsl:for-each select="/ArrayOfWFPlan/WFPlan[ID!=$freeTrialWFPlanID and GroupName=$groupname]">
          <xsl:sort select="CurrentPrice/Price" data-type="number"></xsl:sort>

          <xsl:variable name="idUnder">
            <xsl:value-of select="translate(CurrentPrice/ID,'-','_')"/>
          </xsl:variable>
          <xsl:variable name="id">
            <xsl:value-of select="ID"/>
          </xsl:variable>


          <xsl:variable name="itemname">
            <xsl:choose>
              <xsl:when test="Service='SMS'">messages</xsl:when>
              <xsl:otherwise>waivers</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>




          <div class="col-xs-6 col-sm-3">
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

                      <xsl:text>New </xsl:text>
                      <xsl:value-of select="$itemname"/>
                      <xsl:text> billed at $</xsl:text>
                      <xsl:value-of select="format-number(CurrentPrice/AdditionalWaiverPriceEach,'#,##0.00')"/>
                      <xsl:text> each</xsl:text>
                      <!--<br/>Unlimited total storage.-->
                    </xsl:when>
                    <xsl:when test="CurrentPrice/Quota&lt;0">
                      Unlimited 
                      <xsl:text> </xsl:text>
                      <xsl:value-of select="$itemname"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>Includes </xsl:text>
                      <xsl:value-of select="CurrentPrice/Quota"/>
                      <xsl:text> </xsl:text>
                      <xsl:value-of select="$itemname"/>
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
               
                
                <xsl:if test="CurrentPrice/ID=$currentPlanPriceID or CurrentPrice/ID=$currentPlanPriceIDSMS">
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

                <p>
                  <asp:RadioButton runat="server" GroupName="SMSPLANSELECT" Text="Select" data-id="{ID}" data-currpriceid="{CurrentPrice/ID}"></asp:RadioButton>
                </p>
              </div>
            </div>
          </div>

          <xsl:if test="position() mod 4=0">
            <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;div class="row"&gt;</xsl:text>
          </xsl:if>
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

                      <asp:Button runat="server" Text="Select" CssClass="btn btn-primary" data-mode="{Service}" CommandArgument="{ID}">
                        
                      </asp:Button>
                      
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


  </xsl:template>


</xsl:stylesheet>