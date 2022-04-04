<cfset sessionInvalidate()/>>
<cfset  StructClear(Session) />
<cflocation url = "login.cfm" addtoken="no">