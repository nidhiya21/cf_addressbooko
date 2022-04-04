<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
	<a href="##" class="navbar-brand"><img src="./images/logoblock.png" class="">ADDRESS BOOK</a>  		
	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">		
		<div class="navbar-nav ml-auto">
			<cfif NOT StructKeyExists(session,"emailID")>
				<a href="./register.cfm" class="nav-item nav-link"><i class="fa fa-solid fa-user"></i></a><span class="nav-text"><a href="./register.cfm" class="nav-links">Sign Up</a></span>	 
				<a href="./login.cfm" class="nav-item nav-link"><i class="fa fa-solid fa-arrow-right-to-bracket"></i></a><span class="nav-text"><a href="./login.cfm" class="nav-links">Login</a></span> 
			<cfelse>
				<span class="nav-item nav-link nav-links-usr"><cfoutput>Welcome #Session.userName#</cfoutput></span>
				<a href="./logout.cfm" class="nav-item nav-link"><i class="fa fa-solid fa-arrow-right-to-bracket"></i></a><span class="nav-text"><a href="./logout.cfm" class="nav-links">Logout</a></span> 
			</cfif>
		</div>
	</div>
</nav>
