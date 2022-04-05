<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Login</title>	
		<cfinclude template="common.cfm">	
		<script src="./js/account.js"></script> 
	</head> 
	<body>	
		<cfinclude template="header.cfm">
		<cfparam name="form.userName" default=""> 
		<cfparam name="form.password" default="">  
		<section class="myform-area">		
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="form-area login-form">
							<div class="form-content">
								<img src="./images/logoblock.png" class="left-img">
							</div>
							<div class="form-input">
								<h2>LOGIN</h2>
								<cfif isDefined("session.errormsg")> 
									<p class="fail-alert"><cfoutput>#session.errormsg[1]#</cfoutput></p>
								</cfif>
								<form name="loginForm" method="post" action="components/contactscript.cfc?method=validateLogin">
									<div class="form-group">
										<label for="userName">User Name <span class="required"></span></label></br>
										<input type="text"  id="userName" name="userName" placeholder="User Name">
									</div>
									<div class="form-group">
										<label for="password">Password<span class="required"></span></label></br>
										<input type="password" id="password" name="password"  placeholder="Password">
									</div>
									<div class="myform-button">
										<button class="myform-btn" name="login" id="login">LOGIN</button>										 
									</div>
								</form>
								<div class="signin-text">Or Sign in Using </div>
								<div class="social-icon">
									<svg id="Layer_1" data-name="Layer 1" width="40" height="40" 
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 506.86 506.86"><defs><style>.cls-1{fill:#1877f2;}.cls-2{fill:#fff;}</style></defs><title>facebook-round-color</title><path class="cls-1" d="M506.86,253.43C506.86,113.46,393.39,0,253.43,0S0,113.46,0,253.43C0,379.92,92.68,484.77,213.83,503.78V326.69H149.48V253.43h64.35V197.6c0-63.52,37.84-98.6,95.72-98.6,27.73,0,56.73,5,56.73,5v62.36H334.33c-31.49,0-41.3,19.54-41.3,39.58v47.54h70.28l-11.23,73.26H293V503.78C414.18,484.77,506.86,379.92,506.86,253.43Z"/>
									<path class="cls-2" d="M352.08,326.69l11.23-73.26H293V205.89c0-20,9.81-39.58,41.3-39.58h31.95V104s-29-5-56.73-5c-57.88,0-95.72,35.08-95.72,98.6v55.83H149.48v73.26h64.35V503.78a256.11,256.11,0,0,0,79.2,0V326.69Z"/></svg>
									<svg xmlns="http://www.w3.org/2000/svg" style="fill:red" width="40" height="40" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" image-rendering="optimizeQuality" fill-rule="evenodd" clip-rule="evenodd" viewBox="0 0 640 640"><path d="M320 0C143.234 0 0 143.234 0 320s143.234 320 320 320 320-143.234 320-320S496.766 0 320 0zm4.76 560.003C192.12 560.003 84.757 452.651 84.757 320c0-132.651 107.364-240.003 240.003-240.003 64.772 0 118.998 23.646 160.774 62.753l-65.115 62.764c-17.894-17.114-49.005-36.992-95.647-36.992C242.78 168.522 176.01 236.4 176.01 320c0 83.6 66.887 151.478 148.762 151.478 95.01 0 130.643-68.233 136.124-103.513l-136.136-.012v-82.241l226.633.012c1.996 12.012 3.768 24.012 3.768 39.768.118 137.116-91.761 234.523-230.353 234.523l-.047-.012z"/></svg>
								</div>
								<div class="signup-text">
									Don't have an account?<span class="reg-text"><a href="./register.cfm" class="register-link"> Register Here<a></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</body>
</html>