 <cfcomponent>
    <cffunction name = "uploadfile" returnType = "any"  access = "public">
        <cfset variables.validMimeTypes =  {
                                        'image/jpeg': {extension: 'jpg'}
                                        ,'image/png': {extension: 'png'},'image/jpg': {extension: 'jpg'}
                                          } />
        <cfset variables.thisPath=expandPath('.') & '/contactimages/'>
        <cfset variables.f_dir=GetDirectoryFromPath(variables.thisPath)>
        <cftry>
            <cffile action="upload" filefield="attachment" destination="#variables.f_dir#" mode="777"
                accept="#StructKeyList(variables.validMimeTypes)#" strict="true" result="uploadResult"
                nameconflict="makeunique">
            <cfcatch type="any">
                <cfif FindNoCase( "No data was received in the uploaded" , cfcatch.message )>
                    <cfabort showerror="Zero length file">
                <cfelseif FindNoCase( "The MIME type or the Extension of the uploaded file", cfcatch.message )>
                    <cfabort showerror="Invalid file type">
                <cfelseif FindNoCase( "did not contain a file." , cfcatch.message )>
                    <cfabort showerror="Empty form field">
                <cfelse>
                    <cfabort showerror="Unhandled File Upload Error">
                </cfif>
            </cfcatch>
        </cftry>
        <cfreturn uploadResult>
    </cffunction> 
    <cffunction name="insertContact" access="remote"  hint="add new contact page"  output="false"  returntype="any" returnformat="JSON">
        <cfargument name="userID" ype="numeric">
        <cfargument name="title" type="string">
        <cfargument name="firstName" type="string">
        <cfargument name="lastName" type="string">
        <cfargument name="gender" type="string">
        <cfargument name="dob" type="string">
        <cfargument name="attachment" type="string">
        <cfargument name="address" type="string">
        <cfargument name="street" type="string">
        <cfargument name="email" type="string">
        <cfargument name="phoneNumber" type="string">
        <cfargument name="pincode" ype="numeric">
        <cfargument name="contactID" ype="numeric">
        <cfset variables.errorMessage= arrayNew(1) />
        <cfif arguments.title EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Title')>
		</cfif>		
		<cfif arguments.firstName EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter FirstName')>
		</cfif>
		<cfif arguments.lastName EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter LastName')>
		</cfif>
		<cfif arguments.gender EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Gender')>
		</cfif>
		<cfif arguments.dob EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Date of Birth')>
		</cfif>
		<cfif arguments.address EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Address')>
		</cfif>
		<cfif arguments.street EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Street')>
		</cfif>
        <cfif arguments.email EQ '' OR NOT isValid("eMail", arguments.email)>
			<cfset arrayAppend(errorMessage, 'Please Enter valid Email')>
		</cfif>	
		<cfif arguments.phoneNumber EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Phone')>
		</cfif>
        <cfif arguments.pincode EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Pin')>
		</cfif>
		<cfif arrayIsEmpty(errorMessage)>	
            <cfif arguments.contactID NEQ ''>
                <cfquery name = "updateContact"  result="res">
                    update contacts
                    set    userID= <cfqueryparam value = "#arguments.userID#" cfsqltype = "cf_sql_varchar">,
                    title= <cfqueryparam value = "#arguments.title#" cfsqltype = "cf_sql_varchar">,
                    firstName=    <cfqueryparam value = "#arguments.firstName#" cfsqltype ="cf_sql_varchar">,
                    lastName= <cfqueryparam value = "#arguments.lastName#" cfsqltype = "cf_sql_varchar">,
                    gender=<cfqueryparam value = "#arguments.gender#" cfsqltype = "cf_sql_varchar"/>,
                    dob= <cfqueryparam value = "#arguments.dob#" cfsqltype = "cf_sql_date"/>,
                    attachment=<cfqueryparam value ="#arguments.attachment#" cfsqltype = "cf_sql_varchar"/>,
                    address=<cfqueryparam value = "#arguments.address#" cfsqltype = "cf_sql_varchar">,
                    street=<cfqueryparam value ="#arguments.street#" cfsqltype = "cf_sql_varchar"/>,
                    email=<cfqueryparam value = "#arguments.email#" cfsqltype = "cf_sql_varchar">,
                    phoneNumber=<cfqueryparam value = "#arguments.phoneNumber#" cfsqltype = "cf_sql_varchar"/>,
                    pincode=<cfqueryparam value = "#arguments.pincode#" cfsqltype = "cf_sql_integer"/>
                    where contactID= <cfqueryparam value = "#arguments.contactID#" cfsqltype = "cf_sql_integer"/>
                </cfquery>      	  
            <cfelse>
                <cfquery name = "insertContactDetails" result="res">  
                    insert into contacts(userID,title,firstName,lastName,gender,dob,attachment,address,street,email,phoneNumber,pincode)
                    values(
                    <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#" />
                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.title#" />
                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.firstName#" />
                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.lastName#" />
                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.gender#" />
                    ,<cfqueryparam cfsqltype="cf_sql_date" value="#arguments.dob#" />
                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.attachment#" />
                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address#" />
                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.street#" />
                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#" />
                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.phoneNumber#"/>
                    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.pincode#"/>
                    )
                </cfquery>       
            </cfif> 
        </cfif> 
            <cfreturn variables.errorMessage />	
    </cffunction> 
    <cffunction name="getContacts" hint="get contacts"  access="public" output="false" >	 
    <cfargument name="userID" type="numeric" required="yes" >
        <cfquery name = "contactList"> 
            SELECT *
            FROM contacts
            where userID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#"   >
        </cfquery>
        <cfreturn variables.contactList/>  
    </cffunction>  
    <cffunction name="getContactsCnt" hint="get contacts count"  access="public" output="false" >	 
    <cfargument name="userID" type="numeric" required="yes" >
        <cfquery name = "contactList"> 
            SELECT count(*) as count
            FROM contacts
            where userID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#"   >
        </cfquery>
        <cfreturn variables.contactList/>  
    </cffunction> 
    <cffunction name="getContactsList" hint="get contacts ORM" access="public" output="false" returnType="any">	 
    <cfargument name="userID" type="numeric" required="yes" > 
       <cfset variables.contactArr = ORMExecuteQuery("from contacts where userID=#arguments.userID# ORDER BY contactID DESC")> 
       <cfreturn variables.contactArr/>  
    </cffunction>  
    <cffunction name="deleteContact" access="remote" returntype="struct" hint="delete contacts" returnformat="json"  output="false">
        <cfargument name="contactID" type="any" required="true">		     
            <cfquery name="deleteuserDet" result="deleteResult">
                delete from contacts  where contactID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.contactID#">
            </cfquery>
            <cfset variables.cfcResults = deleteResult.recordcount>
            <cfif  variables.cfcResults NEQ 0>
                <cfset variables.Response.Success = true />   
            <cfelse> 
                <cfset variables.Response.Success = false />            
            </cfif>
                <cfreturn variables.Response>
    </cffunction>  
    <cffunction name="getContactsByID" access="remote"  output="false" hint="get contacts by id" returntype="any" returnformat="JSON" >   	 
        <cfargument name="contactID" type="numeric" required="yes" > 
            <cfset variables.retVal = ArrayNew(1)>
            <cfquery name = "contactDetails">  
                SELECT *
                FROM contacts
                where contactID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.contactID#">
            </cfquery>
            <cfloop query="contactDetails"> 
                <cfset variables.temp = {} />
                <cfset variables.temp['title']=contactDetails.title />
                <cfset variables.temp['firstName']=contactDetails.firstName />
                <cfset variables.temp['lastName']=contactDetails.lastName />
                <cfset variables.temp['gender']=contactDetails.gender />
                <cfset variables.temp['contactID']=contactDetails.contactID />
                <cfset variables.temp['address']=contactDetails.address />
                <cfset variables.temp['street']=contactDetails.street />
                <cfset variables.temp['pincode']=contactDetails.pincode />
                <cfset variables.temp['phoneNumber']=contactDetails.phoneNumber />
                <cfset variables.temp['email']=contactDetails.email />
                <cfset variables.temp['attachment']=contactDetails.attachment />
                <cfset variables.temp['dob']=contactDetails.dob />
                <cfset ArrayAppend(retval, temp)>
            </cfloop>
            <cfset variables.result = {} />
            <cfset variables.result['items'] = retVal />
        <cfreturn variables.result> 
    </cffunction>  
    <cffunction name="getExcel" access="remote" hint="get excel" output="false"  >   	 
        <cfargument name="userID" type="numeric" required="yes" > 
            <cfquery name="getExcel"  >
                SELECT *
                FROM contacts
                where userID =<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#"   >
            </cfquery>
            <cfset variables.thisPath = expandPath('.') & '/images/'> 
            <cfset variables.f_dir = GetDirectoryFromPath(variables.thisPath)>
            <cfset variables.f_name = "#dateformat(now(), 'mmddyy')##timeformat(now(), 'hhmm')#.csv">
            <cffile action="WRITE"  file="#variables.f_dir##variables.f_name#"
            output="Title, Name,Phone, Contact Email,Gender,DOB,Address,Street,Pincode,Image" addnewline="Yes">  
            <cfloop query="getExcel">
                <cfif attachment NEQ ''>
                    <cfset  variables.imagesrc="#f_dir#/contactimages/#attachment#"/>
                <cfelse> 
                    <cfif gender EQ 'Female'>
                        <cfset variables.imagesrc="#f_dir#/images/no-female.jpg"/>
                    <cfelse>
                        <cfset variables.imagesrc="#f_dir#/images/no-man.png"/> 
                    </cfif>	
                </cfif>
                <cffile action="APPEND" file="#variables.f_dir##variables.f_name#"
                output="#title#, #firstName# #lastName#, #phoneNumber#, #email#, #gender#,#dob#,#address#,#street#,#pincode#,#variables.imagesrc#"
                addnewline="Yes">
            </cfloop>
            <br> 
            <cfset variables.theLink = "/cf_addressbooko/images/" & variables.f_name>
            <cfreturn variables.theLink/>   
    </cffunction>  
    <cffunction name="updateProfile" access="remote" hint="update profile image" output="false" >	
        <cfset variables.thisPath=expandPath('..') & '/userimage/' />
        <cfset variables.f_dir=GetDirectoryFromPath(variables.thisPath) />
		<cffile action="upload" filefield="userImg"  destination="#variables.f_dir#" mode="777" nameconflict="makeunique" result="uploadResult">	
		<cfif uploadResult.fileWasSaved>
			<cfset variables.user_imge = #uploadResult.serverFile#>
            <cfquery name = "updateContact" result="res">  
                update addressbook 
                set 
                userImage= <cfqueryparam value = "#variables.user_imge#" cfsqltype = "cf_sql_varchar">
                where userID= <cfqueryparam value = "#session.userID#" cfsqltype = "cf_sql_integer">
            </cfquery> 
		</cfif>					
	</cffunction>
    <cffunction name="getUserImage" access="public" hint="get user image" output="false"  >   	 
        <cfargument name="userID" type="numeric" required="yes" >    
        <cfquery name = "userImage"> 
            SELECT userImage
            FROM addressbook
            where userID =<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#">
        </cfquery>
        <cfreturn variables.userImage/>       
    </cffunction>  
    <cffunction name="searchUser" access="remote" hint="email alredy exist or not" returnFormat="JSON">
        <cfargument name="emailID" type="any" required="true">
        <cfquery name="searchUserMail">
                SELECT emailID
                        FROM addressbook 
                WHERE emailID = <cfqueryparam cfsqltype="cf_sql_varchar"  value="#arguments.emailID#">             
        </cfquery> 
        <cfset variables.cfcResults = searchUserMail.recordcount>
        <cfif cfcResults NEQ 0>
            <cfset variables.cfcResults1 = "Error">    
        <cfelse>
            <cfset variables.cfcResults1 = "Success">             
        </cfif>
        <cfif variables.cfcResults1 == "Error">
            <cfreturn false>
        <cfelse>
            <cfreturn  true>
        </cfif>
    </cffunction>
    <cffunction name="searchUserName" access="remote" hint="user name alredy exist or not" returnFormat="JSON">
        <cfargument name="userName" type="any" required="true">
        <cfquery name="searchUserName">
                SELECT emailID
                        FROM addressbook 
                WHERE userName = <cfqueryparam cfsqltype="cf_sql_varchar"  value="#arguments.userName#">             
        </cfquery> 
        <cfset cfcResults = searchUserName.recordcount>
        <cfif cfcResults NEQ 0>
            <cfset variables.cfcResults1 = "Error">    
        <cfelse>
            <cfset variables.cfcResults1 = "Success">             
        </cfif>
        <cfif variables.cfcResults1 == "Error">
            <cfreturn false>
        <cfelse>
            <cfreturn  true>
        </cfif>
    </cffunction>
</cfcomponent> 
