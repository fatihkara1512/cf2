   <cfset canli = url.canli />
   <cfset muayene = url.muayene />
<cfquery name="x"  datasource="alibaba">
     SELECT *
    FROM hayvan
     where numara=#canli#
    </cfquery>
     <cfset sonuc="Başarılı" >
<cftry>
    <cfquery name="y"  datasource="alibaba">
 INSERT INTO muayene (tarih,hay_id)
 OUTPUT INSERTED.*
VALUES ('#muayene#','#x.id#');
    </cfquery>
    <cfset sonuc="Başarılı "&x.numara&" "&x.tur&" "&x.kilo&" "&y.tarih&" "&y.id >
    <cfcatch type="any">
        <cfset sonuc="Başarısız" >
    </cfcatch>
</cftry>
<cfoutput>#sonuc#</cfoutput>
