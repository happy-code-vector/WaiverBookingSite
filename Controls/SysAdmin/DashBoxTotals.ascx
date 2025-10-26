<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DashBoxTotals.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.DashBoxTotals" %>

<div class="row">



<div class="col-sm-3">
<div class="small-box bg-aqua">
                <div class="inner">
                  <h3><%=_leadFollowupsDue %></h3>
                  <p>Leads With Followups Due</p>
                </div>
                <div class="icon">
                  <i class="fa fa-filter"></i>
                </div>
                <a class="small-box-footer" href="/wp-admin/default.aspx?sc=WFCRM_LEAD_TRACKER&c=1">Lead Tracker <i class="fa fa-arrow-circle-right"></i></a>
              </div>
    </div>


    <div class="col-sm-3">
<div class="small-box bg-yellow">
                <div class="inner">
                  <h3><%=_pastDue %></h3>
                  <p>Past Due</p>
                </div>
                <div class="icon">
                  <i class="fa fa-table"></i>
                </div>
                <a class="small-box-footer" href="/wp-admin/default.aspx?sc=WF_PAST_DUE&c=1">View Report <i class="fa fa-arrow-circle-right"></i></a>
                
              </div>
    </div>

    
<div class="col-sm-3">
<div class="small-box bg-red">
                <div class="inner">
                  <h3><%=_cancelledLast30 %></h3>
                  <p>Cancelled Last 30 Days</p>
                </div>
                <div class="icon">
                  <i class="fa fa-exclamation-triangle"></i>
                </div>
                <a class="small-box-footer" href="/wp-admin/default.aspx?sc=WF_SUBS_CANCELLATION_REPORT&c=1">View Report <i class="fa fa-arrow-circle-right"></i></a>
              </div>
    </div>

<div class="col-sm-3">
<div class="small-box bg-green">
                <div class="inner">
                  <h3><%=_startedPayingLast30 %> / <%=_totalPayingCustomers %></h3>
                  <p>Customers: Last 30 days / Total</p>
                </div>
                <div class="icon">
                  <i class="fa fa-check-circle-o"></i>
                </div>
                <a class="small-box-footer" href="/wp-admin/default.aspx?sc=WF_TRIAL_REPORT&c=1">Trial Report <i class="fa fa-arrow-circle-right"></i></a>
              </div>
    </div>
    </div>