<cfcomponent output="false"> 
    <cffunction name="getUsers" access="public" hint="get user list" output="false" returntype="query">	
        <cfargument name="userName" type="string" required="true" />
        <cfargument name="password" type="string" required="true" /> 
        <cfquery name="getUsersDet">
            SELECT *
            FROM addressbook
            WHERE (userName = '#arguments.userName#' or emailID='#arguments.userName#' ) 
            AND password = '#hash(arguments.password)#'
        </cfquery>
        <cfset Session.LoggedIn = "1">
        <cfset Session.userName = getUsersDet.userName>
        <cfset Session.emailID = getUsersDet.emailID>  
        <cfset Session.userID = getUsersDet.userID>    
        <cfreturn getUsersDet />
    </cffunction>
</cfcomponent>    