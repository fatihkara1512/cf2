   <cfset canli = url.canli />
   <cfset tur = url.tur />
    <cfset kilo = url.kilo />
<cftry>
    <cfquery name="y"  datasource="alibaba">
 INSERT INTO hayvan (numara,kilo,tur)
 OUTPUT INSERTED.*
VALUES ('#canli#','#kilo#','#tur#');

    </cfquery>
    <cfset sonuc="Başarılı "&y.numara&" "&y.tur&" "&y.kilo&" "&y.id >
    <cfcatch type="any">
        <cfset sonuc="Başarısız" >
    </cfcatch>
</cftry>

<cfoutput>#sonuc#</cfoutput>
