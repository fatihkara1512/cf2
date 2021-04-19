<cfspreadsheet action="read" src="#ExpandPath( 's.xlsx' )#" query="importdata" headerrow="1" />
<cfloop query="importdata" startrow="2">
    <cftry>
      <cfquery datasource="alibaba">
        INSERT INTO hayvan
        (
          numara
          , kilo
          , tur
        )
        VALUES
        (
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#numara#" />
          , <cfqueryparam cfsqltype="cf_sql_varchar" value="#kilo#" />
          , <cfqueryparam cfsqltype="cf_sql_varchar" value="#tur#" />
        )
      </cfquery>
 
      <cfcatch type="any">
      <cfoutput>Veritabanına Eklenemedi!</cfoutput>
      </cfcatch>
    </cftry>
</cfloop>