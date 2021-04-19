   <cfset kadi = url.kadi />
   <cfset sifre = url.sifre />
 <CFQUERY NAME="login" DATASOURCE="alibaba">
            SELECT  *
            FROM    kullanici
            WHERE        kadi = #kadi#
                        AND sifre = #sifre#
            </CFQUERY>
        <cfif login.RecordCount EQ '1'>
<cfset Session.Durum = "True">
  <cfoutput>1</cfoutput>
         <cfelse>
        
        </cfif>
