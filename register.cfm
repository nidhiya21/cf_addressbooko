<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Register</title>	
		<cfinclude template="common.cfm">		
	</head> 
	<body>
		<cfinclude template="header.cfm">		
		<section class="myform-area">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="form-area login-form">
							<div class="form-content">
								<img src="./images/logoblock.png" class="left-img">
							</div>
							<div class="form-input">
								<h2>REGISTER</h2>
                                <cfparam name="form.fullName" default=""> 
                                <cfparam name="form.emailID" default=""> 
                                <cfparam name="form.userName" default=""> 
                                <cfparam name="form.password" default=""> 
                                <cfparam name="form.confirmpassword" default=""> 
								<cfif isDefined('errorMessage') AND NOT arrayIsEmpty(errorMessage)>            
									<cfloop array="#errorMessage#" index="message">
										<p><cfoutput>#variables.message#</cfoutput></p>
									</cfloop>
								<cfelseif isDefined('errorMessage') AND arrayIsEmpty(errorMessage)>									
								</cfif>                    
                                <form name="signup" method="post" id="signup"  action="components/contactscript.cfc?method=saveUser">
									<div class="form-group form-field">
										<label for="fullName">Full Name<span class="required"></span></label></br>
										<input type="text"  id="fullName" name="fullName" placeholder="Full Name">
									</div>
                                    <div class="form-group form-field">
										<label for="emailID">Email ID<span class="required"></span></label></br>
										<input type="email"  id="emailID" name="emailID"   placeholder="Email ID">
										<small class=" usrvalid"></small>
									</div>
                                    <div class="form-group form-field">
										<label for="userName">Username<span class="required"></span></label></br>
										<input type="text"  id="userName" name="userName"  placeholder="Username"> 
										<small class=" usrvalid"></small>
									</div>
									<div class="form-group form-field">
										<label for="password">Password<span class="required"></span></label></br>
										<input type="password" id="password" name="password"  placeholder="Password">									
									</div>
                                    <div class="form-group form-field">
										<label for="confirmpassword">Confirm Password<span class="required"></span></label></br>
										<input type="password" id="confirmpassword" name="confirmpassword"  placeholder="Confirm Password">
									</div>
									<div class="myform-button">
										<button class="myform-btn" id="saveForm" name="saveForm"  >REGISTER</button>
									</div>
								</form>								
							</div>
						</div>
					</div>
				</div>
			</div>
        </section>
		<cfinclude template="footer.cfm">
	</body>
</html>