<cfscript>
    component {
        remote function validateLogin (){
            var errorMessage= arrayNew(1);
            var userName = trim(form.userName);
            var password = trim(form.password);
                if(userName EQ  ""){ 
                    ArrayAppend(errorMessage,"Please Enter UserName","true");
                }
                if(password EQ  ""){
                    ArrayAppend(errorMessage,"Please Enter Password","true");
                }
                if(arrayIsEmpty(errorMessage)){ 
                    getUsersDet = queryExecute(sql:"select * from addressbook where userName=:userName AND password=:password"
                            ,params={userName:{type:'varchar',value:'#userName#'},password:{type:'varchar',value:'#hash(password)#'}}
                            );
                    var prefix = getUsersDet.userID;
                    if (prefix GT 0){
                        Session.LoggedIn = "1"
                        Session.userName = getUsersDet.userName;
                        Session.emailID = getUsersDet.emailID ;
                        Session.userID = getUsersDet.userID ;  
                        location("../account.cfm", "no");     
                    }else{
                        arrayAppend(errorMessage, 'Incorrect Username/Password',"true");
                        Session.errormsg = errorMessage;
                        location("../login.cfm", "no");     
                    }
                }else{
                    Session.errormsg = errorMessage;
                    location("../login.cfm", "no");     
                }
            return Session.errormsg ;
        }
        remote function saveUser (){
            var fullName = trim(form.fullName);
            var emailID = trim(form.emailID); 
            var userName = trim(form.userName);
            var password = trim(form.password);
            var confirmpassword = trim(form.confirmpassword); 
            var errorMessage= arrayNew(1);
            if(fullName EQ ''){			
                ArrayAppend(errorMessage,"Please Enter FullName","true");
            }
            if(emailID EQ '' OR NOT isValid("eMail", emailID)){			
                ArrayAppend(errorMessage,"Please Enter valid Email","true");
            }
            if(userName EQ ''){			
                ArrayAppend(errorMessage,"Please Enter UserName","true");
            }
            if(password EQ ''){			
                ArrayAppend(errorMessage,"Please Enter password","true");
            }
            if(confirmpassword EQ ''){			
                ArrayAppend(errorMessage,"Please Enter confirmpassword","true");
            }
            if(confirmpassword NOT EQUAL password){			
                ArrayAppend(errorMessage,"Confirm Password Mismatch","true");
            }
            checkEmail = queryExecute(sql:"select * from addressbook where emailID=:emailID"
                            ,params={emailID:{type:'varchar',value:'#emailID#'}}
                                );
            var prefix = checkEmail.userID
            if (prefix EQ 1){
                ArrayAppend(errorMessage,"emailID Already exists","true");
        
            }
            checkUsername = queryExecute(sql:"select * from addressbook where userName=:userName"
                            ,params={userName:{type:'varchar',value:'#userName#'}}
                                );
            var prefixUsr = checkUsername.userID
            if (prefixUsr EQ 1){
                ArrayAppend(errorMessage,"userName Already exists","true");
            }
            if  (arrayIsEmpty(errorMessage)){

                qService = new query();
                qService.setName("qInsert");
                qService.addParam(name="fullName", value="#trim(form.fullName)#", cfsqltype="cf_sql_varchar");
                qService.addParam(name="emailID", value="#trim(form.emailID)#", cfsqltype="cf_sql_varchar");
                qService.addParam(name="userName", value="#trim(form.userName)#", cfsqltype="cf_sql_varchar");
                qService.addParam(name="password", value="#hash(form.password)#", cfsqltype="cf_sql_varchar");
                qService.addParam(name="userImage", value="", cfsqltype="cf_sql_varchar");
                qService.setSql("
                    INSERT INTO addressbook
                    (fullName, emailID, userName, password,userImage)
                    VALUES
                    (:fullName, :emailID, :userName, :password, :userImage)
                ");
                var result = qService.execute();
                var getID  = result.getPrefix().generatedkey;
                if(getID GT 0){
                    Session.LoggedIn = "1" ;
                    Session.userName = form.userName;
                    Session.emailID = form.emailID;  
                    Session.userID = getID;
                }
                    location("../account.cfm", "no");      
            } 
            return Session.errorMessage ;  
        }
        remote function getPdf (){
            var userID = session.userID;
            var getUsersDet = queryExecute(sql:"select * from contacts where userID=:userID"
                            ,params={userID:{type:'integer',value:'#session.userID#'}}
                            );
            var pdfData = getUsersDet;  
            return  pdfData;  
        }
    }
</cfscript>