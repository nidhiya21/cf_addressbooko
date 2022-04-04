<cfcomponent output="false"> 
    <cffunction name="saveUser" access="remote"  output="false" returntype="any" returnformat="JSON">  
        <cfargument name="fullName" type="string" required="yes" >
        <cfargument name="emailID"  type="string" required="yes" >
        <cfargument name="userName" type="string" required="yes" >
        <cfargument name="password" type="string" required="yes" >  
        <cfargument name="confirmpassword" type="string" required="yes" >  
        <cfset variables.errorMessage= arrayNew(1) />	
		<cfif arguments.fullName EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter FullName')>
		</cfif>
		<cfif arguments.emailID EQ '' OR NOT isValid("eMail", arguments.emailID)>
			<cfset arrayAppend(errorMessage, 'Please Enter valid Email')>
		</cfif>
		<cfif arguments.userName EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter UserName')>
		</cfif>
		<cfif arguments.password EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Password')>
		</cfif>
		<cfif arguments.confirmpassword EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Confirm Password')>
		</cfif>
		<cfif  arguments.confirmpassword NOT EQUAL arguments.password>
			<cfset arrayAppend(errorMessage, 'Confirm Password Mismatch')>
		</cfif>
        <cfquery name="checkEmail">
            SELECT emailID
                        FROM addressbook 
                WHERE emailID = <cfqueryparam cfsqltype="cf_sql_varchar"  value="#arguments.emailID#">  
        </cfquery>
        <cfif checkEmail.recordcount EQ 1>
			<cfset arrayAppend(errorMessage, 'emailID Already exists')>
		</cfif>
        <cfquery name="checkUsername">
            SELECT emailID
                        FROM addressbook 
                WHERE emailID = <cfqueryparam cfsqltype="cf_sql_varchar"  value="#arguments.userName#">  
        </cfquery>
        <cfif checkUsername.recordcount EQ 1>
			<cfset arrayAppend(errorMessage, 'userName Already exists')>
		</cfif>
		<cfif arrayIsEmpty(errorMessage)>    
            <cfquery name="saveToaddressbook" result="userResult">
                INSERT INTO addressbook
                ( 
                fullName,emailID,userName,password,userImage
                )
                VALUES 
                ( 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fullName#" />
                ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.emailID#" />
                ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.userName#" />
                ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#hash(arguments.password)#" />
                ,<cfqueryparam cfsqltype="cf_sql_varchar" value="" />
                )
            </cfquery>
            <cfset variables.getID = userResult.generated_key> 
            <cfset variables.getNumberOfRecords = listLen(userResult.generated_key)> 
            <cfif getNumberOfRecords GT 0>
                <cfset Session.LoggedIn = "1">
                <cfset Session.userName = "#arguments.userName#">
                <cfset Session.emailID = "#arguments.emailID#">    
                <cfset Session.userID = getID>    
            </cfif>
        </cfif>
		<cfreturn variables.errorMessage/>            
    </cffunction>
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
    <cffunction name="validateLogin"  access="remote"  hint="Validate Login Form" output="false"> 
        <cfset variables.errorMessage= arrayNew(1) />
        <cfset variables.userName = form.userName/>
		<cfset variables.password = form.password/>  
        <cfif  variables.userName EQ  "">
            <cfset arrayAppend(errorMessage, 'Please Enter UserName')>
        </cfif> 
        <cfif  variables.password EQ "">
            <cfset arrayAppend(errorMessage, 'Please Enter Password')>
        </cfif>
        <cfif arrayIsEmpty(errorMessage)>
            <cfquery name="getUsersDet">
                SELECT *
                FROM addressbook
                WHERE (userName = <cfqueryparam value="#variables.userName#" cfsqltype="cf_sql_varchar" /> 
                AND password = <cfqueryparam value="#hash(variables.password)#" cfsqltype="cf_sql_varchar" />
                 ) 
            </cfquery>
            <cfif getUsersDet.recordcount EQ 1>
                <cfset Session.LoggedIn = "1">
                <cfset Session.userName = getUsersDet.userName>
                <cfset Session.emailID = getUsersDet.emailID>  
                <cfset Session.userID = getUsersDet.userID>    
                <cflocation url = "./account.cfm">      
            <cfelse> 
				<cfset arrayAppend(errorMessage, 'Incorrect Username/Password')>
			</cfif>
        </cfif>
		<cfreturn variables.errorMessage />
    </cffunction>  
</cfcomponent>    