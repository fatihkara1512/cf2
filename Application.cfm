<cfapplication 
name="AppName"
sessionmanagement="Yes" 
 sessiontimeout="#CreateTimeSpan(0, 0, 30, 0)# "
 >

  <cfif not IsDefined("Session.Durum")>
<cflock timeout = "60" scope = "SESSION"> 
 <cfset Session.Durum = "false">
</cflock> 
</cfif>