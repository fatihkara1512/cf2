   <cfset tablo = url.tablo />
   <cfset id = url.id />
     <cfset sonuc="Başarılı" >
<cftry>
    <cfquery name="y"  datasource="alibaba">
 DELETE FROM #tablo# WHERE id=#id#;
    </cfquery>
    <cfcatch type="any">
        <cfset sonuc="Başarısız" >
    </cfcatch>
</cftry>
<cfoutput>#sonuc#</cfoutput>
