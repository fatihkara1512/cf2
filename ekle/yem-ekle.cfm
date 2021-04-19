   <cfset canli = url.canli />
   <cfset yem = url.yem />
<cfquery name="x"  datasource="alibaba">
     SELECT *
    FROM hayvan
     where numara=#canli#
    </cfquery>
     <cfset sonuc="Başarılı" >
<cftry>
    <cfquery name="y"  datasource="alibaba">
 INSERT INTO yemler (miligram,tarih,hay_id)
 OUTPUT INSERTED.*
VALUES ('#yem#','<cfscript>writeOutput(dateformat(now(), "yyyy-mm-dd") & "")</cfscript>','#x.id#');
    </cfquery>
    <cfset sonuc="Başarılı "&x.numara&" "&x.tur&" "&x.kilo&" "&y.miligram&" "&y.id&" "&y.tarih > 
    <cfcatch type="any">
        <cfset sonuc="Başarısız" >
    </cfcatch>
</cftry>
<cfoutput>#sonuc#</cfoutput>
