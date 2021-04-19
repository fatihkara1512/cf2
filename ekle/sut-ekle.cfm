   <cfset canli = url.canli />
   <cfset sut = url.sut />
<cfquery name="x"  datasource="alibaba">
     SELECT *
    FROM hayvan
     where numara=#canli#
    </cfquery>
     <cfset sonuc="Başarılı" >
<cftry>
    <cfquery name="y"  datasource="alibaba">
 INSERT INTO sut (mililitre,tarih,hay_id)
 OUTPUT INSERTED.*
VALUES ('#sut#','<cfscript>writeOutput(dateformat(now(), "yyyy-mm-dd") & "")</cfscript>','#x.id#');
    </cfquery>
    <cfset sonuc="Başarılı "&x.numara&" "&x.tur&" "&x.kilo&" "&y.mililitre&" "&y.id&" "&y.tarih >   
    <cfcatch type="any">
        <cfset sonuc="Başarısız" >
    </cfcatch>
</cftry>
<cfoutput>#sonuc#</cfoutput>
