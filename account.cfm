<cfif NOT structKeyExists(session,'userName')>
    <cflocation url = "login.cfm">
</cfif>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Account</title>	
        <link href="./css/welcomeuser.css" rel="stylesheet" type="text/css"/>
		<cfinclude template="common.cfm">
		<script src="./js/account.js"></script>				
	</head> 
	<body>
		<cfoutput>			
			<cfinclude template="header.cfm">
			<cfset variables.userID=Session.userID />  
			<cfobject component="components.contact" name="contactList">
			<cfinvoke component="#contactList#" method="getContacts"   userID="#variables.userID#"  returnvariable="result">
			<cfinvoke component="#contactList#" method="getContactsList"   userID="#variables.userID#"  returnvariable="contactList">
			<div class="container-xl">
				<div class="table-responsives">
						<div class="table-title">
						    <cfobject component="components.contact" name="contactListCnt">
							<cfinvoke component="#contactListCnt#" method="getContactsCnt"  userID="#variables.userID#"  returnvariable="resultCnt"> 
							<cfif result.contactID eq 0>	
								<div class="contact-list-cnt"> <span class="txt-title">No records has been added yet! <span class=".smily">&##128577;</span></span></div>
							<cfelse>
								<div class="contact-list-cnt"> <span class="txt-title">You have added #resultCnt.count# records!  <span class=".smily">&##128578;</span></span></div>
							</cfif>
							<cfif result.contactID gt 0>
							<div class="row svg-icons"> 
								<div class="col-sm-6">				
									<a href="./pdf.cfm"><svg version="1.1" id="Layer_1" class="svg-pdf" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 102.55 122.88" style="enable-background:new 0 0 102.55 122.88" xml:space="preserve"><style type="text/css">.st0{fill-rule:evenodd;clip-rule:evenodd;}</style><g><path class="st0" d="M102.55,122.88H0V0h77.66l24.89,26.43V122.88L102.55,122.88z M87.01,69.83c-1.48-1.46-4.75-2.22-9.74-2.29 c-3.37-0.03-7.43,0.27-11.7,0.86c-1.91-1.1-3.88-2.31-5.43-3.75c-4.16-3.89-7.64-9.28-9.8-15.22c0.14-0.56,0.26-1.04,0.37-1.54 c0,0,2.35-13.32,1.73-17.82c-0.08-0.61-0.14-0.8-0.3-1.27l-0.2-0.53c-0.64-1.47-1.89-3.03-3.85-2.94l-1.18-0.03 c-2.19,0-3.97,1.12-4.43,2.79c-1.42,5.24,0.05,13.08,2.7,23.24l-0.68,1.65c-1.9,4.64-4.29,9.32-6.39,13.44l-0.28,0.53 c-2.22,4.34-4.23,8.01-6.05,11.13l-1.88,1c-0.14,0.07-3.36,1.78-4.12,2.24c-6.41,3.83-10.66,8.17-11.37,11.62 c-0.22,1.1-0.05,2.51,1.08,3.16L17.32,97c0.79,0.4,1.62,0.6,2.47,0.6c4.56,0,9.87-5.69,17.18-18.44 c8.44-2.74,18.04-5.03,26.45-6.29c6.42,3.61,14.3,6.12,19.28,6.12c0.89,0,1.65-0.08,2.27-0.25c0.95-0.26,1.76-0.8,2.25-1.54 c0.96-1.46,1.16-3.46,0.9-5.51c-0.08-0.61-0.56-1.36-1.09-1.88L87.01,69.83L87.01,69.83z M18.79,94.13 c0.83-2.28,4.13-6.78,9.01-10.78c0.3-0.25,1.06-0.95,1.75-1.61C24.46,89.87,21.04,93.11,18.79,94.13L18.79,94.13L18.79,94.13z M47.67,27.64c1.47,0,2.31,3.7,2.38,7.17c0.07,3.47-0.74,5.91-1.75,7.71c-0.83-2.67-1.24-6.87-1.24-9.62 C47.06,32.89,47,27.64,47.67,27.64L47.67,27.64L47.67,27.64z M39.05,75.02c1.03-1.83,2.08-3.76,3.17-5.81 c2.65-5.02,4.32-8.93,5.57-12.15c2.48,4.51,5.57,8.35,9.2,11.42c0.45,0.38,0.93,0.77,1.44,1.15 C51.05,71.09,44.67,72.86,39.05,75.02L39.05,75.02L39.05,75.02L39.05,75.02z M85.6,74.61c-0.45,0.28-1.74,0.44-2.56,0.44 c-2.67,0-5.98-1.22-10.62-3.22c1.78-0.13,3.41-0.2,4.88-0.2c2.68,0,3.48-0.01,6.09,0.66C86.01,72.96,86.05,74.32,85.6,74.61 L85.6,74.61L85.6,74.61L85.6,74.61z M96.12,115.98V30.45H73.44V5.91H6.51v110.07H96.12L96.12,115.98z"/></g>
									</svg></a>	
									<cfobject component="components.contact" name="contactCSV">
									<cfinvoke component="#contactCSV#" method="getExcel"   userID="#variables.userID#"  returnvariable="theLink">						
									<a href="#theLink#"><svg version="1.1" id="Layer_1"  class="svg-excel" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 102.55 122.88" style="enable-background:new 0 0 102.55 122.88" xml:space="preserve"><style type="text/css">.st0{fill-rule:evenodd;clip-rule:evenodd;}</style><g><path class="st0" d="M75.59,48.8H61.35L51.28,63.65L41.2,48.8H26.96l17.07,25.52L24.77,102.7l26.51,0v-9.64h-5.28l5.28-7.9 L63,102.7h14.78L58.52,74.32L75.59,48.8L75.59,48.8L75.59,48.8z M102.55,122.88H0V0h77.66l24.89,26.43V122.88L102.55,122.88z M94.21,114.06v-81.7H71.53V7.83H8.43v106.23H94.21L94.21,114.06z"/></g>
									</svg></a>							
									<a href="./print.cfm" ><svg version="1.1" id="Layer_1"  class="svg-print" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 114.13" style="enable-background:new 0 0 122.88 114.13" xml:space="preserve"><g><path d="M23.2,29.44V3.35V0.53C23.2,0.24,23.44,0,23.73,0h2.82h54.99c0.09,0,0.17,0.02,0.24,0.06l1.93,0.8l-0.2,0.49l0.2-0.49 c0.08,0.03,0.14,0.08,0.2,0.14l12.93,12.76l0.84,0.83l-0.37,0.38l0.37-0.38c0.1,0.1,0.16,0.24,0.16,0.38v1.18v13.31 c0,0.29-0.24,0.53-0.53,0.53h-5.61c-0.29,0-0.53-0.24-0.53-0.53v-6.88H79.12H76.3c-0.29,0-0.53-0.24-0.53-0.53 c0-0.02,0-0.03,0-0.05v-2.77h0V6.69H29.89v22.75c0,0.29-0.24,0.53-0.53,0.53h-5.64C23.44,29.97,23.2,29.73,23.2,29.44L23.2,29.44z M30.96,67.85h60.97h0c0.04,0,0.08,0,0.12,0.01c0.83,0.02,1.63,0.19,2.36,0.49c0.79,0.33,1.51,0.81,2.11,1.41 c0.59,0.59,1.07,1.31,1.4,2.1c0.3,0.73,0.47,1.52,0.49,2.35c0.01,0.04,0.01,0.08,0.01,0.12v0v9.24h13.16h0c0.04,0,0.07,0,0.11,0.01 c0.57-0.01,1.13-0.14,1.64-0.35c0.57-0.24,1.08-0.59,1.51-1.02c0.43-0.43,0.78-0.94,1.02-1.51c0.21-0.51,0.34-1.07,0.35-1.65 c-0.01-0.03-0.01-0.07-0.01-0.1v0V43.55v0c0-0.04,0-0.07,0.01-0.11c-0.01-0.57-0.14-1.13-0.35-1.64c-0.24-0.56-0.59-1.08-1.02-1.51 c-0.43-0.43-0.94-0.78-1.51-1.02c-0.51-0.22-1.07-0.34-1.65-0.35c-0.03,0.01-0.07,0.01-0.1,0.01h0H11.31h0 c-0.04,0-0.08,0-0.11-0.01c-0.57,0.01-1.13,0.14-1.64,0.35C9,39.51,8.48,39.86,8.05,40.29c-0.43,0.43-0.78,0.94-1.02,1.51 c-0.21,0.51-0.34,1.07-0.35,1.65c0.01,0.03,0.01,0.07,0.01,0.1v0v35.41v0c0,0.04,0,0.08-0.01,0.11c0.01,0.57,0.14,1.13,0.35,1.64 c0.24,0.57,0.59,1.08,1.02,1.51C8.48,82.65,9,83,9.56,83.24c0.51,0.22,1.07,0.34,1.65,0.35c0.03-0.01,0.07-0.01,0.1-0.01h0h13.16 v-9.24v0c0-0.04,0-0.08,0.01-0.12c0.02-0.83,0.19-1.63,0.49-2.35c0.31-0.76,0.77-1.45,1.33-2.03c0.02-0.03,0.04-0.06,0.07-0.08 c0.59-0.59,1.31-1.07,2.1-1.4c0.73-0.3,1.52-0.47,2.36-0.49C30.87,67.85,30.91,67.85,30.96,67.85L30.96,67.85L30.96,67.85z M98.41,90.27v17.37v0c0,0.04,0,0.08-0.01,0.12c-0.02,0.83-0.19,1.63-0.49,2.36c-0.33,0.79-0.81,1.51-1.41,2.11 c-0.59,0.59-1.31,1.07-2.1,1.4c-0.73,0.3-1.52,0.47-2.35,0.49c-0.04,0.01-0.08,0.01-0.12,0.01h0H30.96h0 c-0.04,0-0.08-0.01-0.12-0.01c-0.83-0.02-1.62-0.19-2.35-0.49c-0.79-0.33-1.5-0.81-2.1-1.4c-0.6-0.6-1.08-1.31-1.41-2.11 c-0.3-0.73-0.47-1.52-0.49-2.35c-0.01-0.04-0.01-0.08-0.01-0.12v0V90.27H11.31h0c-0.04,0-0.08,0-0.12-0.01 c-1.49-0.02-2.91-0.32-4.2-0.85c-1.39-0.57-2.63-1.41-3.67-2.45c-1.04-1.04-1.88-2.28-2.45-3.67c-0.54-1.3-0.84-2.71-0.85-4.2 C0,79.04,0,79,0,78.96v0V43.55v0c0-0.04,0-0.08,0.01-0.12c0.02-1.49,0.32-2.9,0.85-4.2c0.57-1.39,1.41-2.63,2.45-3.67 c1.04-1.04,2.28-1.88,3.67-2.45c1.3-0.54,2.71-0.84,4.2-0.85c0.04-0.01,0.08-0.01,0.12-0.01h0h100.25h0c0.04,0,0.08,0,0.12,0.01 c1.49,0.02,2.91,0.32,4.2,0.85c1.39,0.57,2.63,1.41,3.67,2.45c1.04,1.04,1.88,2.28,2.45,3.67c0.54,1.3,0.84,2.71,0.85,4.2 c0.01,0.04,0.01,0.08,0.01,0.12v0v35.41v0c0,0.04,0,0.08-0.01,0.12c-0.02,1.49-0.32,2.9-0.85,4.2c-0.57,1.39-1.41,2.63-2.45,3.67 c-1.04,1.04-2.28,1.88-3.67,2.45c-1.3,0.54-2.71,0.84-4.2,0.85c-0.04,0.01-0.08,0.01-0.12,0.01h0H98.41L98.41,90.27z M89.47,15.86 l-7-6.91v6.91H89.47L89.47,15.86z M91.72,74.54H31.16v32.89h60.56V74.54L91.72,74.54z"/></g>
									</svg></a>
								</div>							
							</div>
							</cfif>
						</div>	
						<div class="pfl-block profile-badge">
							<div class="avatar profile-pic">
								<cfobject component="components.contact" name="contactImage">
								<cfinvoke component="#contactImage#" method="getUserImage"   userID="#variables.userID#"  returnvariable="getUsrImage">
								<div class="profile-badge">
									<form  method="post" name="userImgUpload" id="userImgUpload">
										<div class="profile-pic">
										<cfif getUsrImage.userImage EQ ''>
										<img  src="https://d30y9cdsu7xlg0.cloudfront.net/png/138926-200.png" id="profile-image1"  class="pfl-images" height="200">
										
										<cfelse> 
										<img  src="userimage/#getUsrImage.userImage#" id="profile-image1" class="pfl-images" height="200">  
										</cfif>
										<input id="userImg" class="hidden"  name="userImg"  type="file" onchange="previewFile()" >
										<div style="color:##999;" >  </div>
										</div>
									</form>                            
								</div>
						</div>
					<cfif  StructKeyExists(session,"userName")>					
						<div class="username">
							#Session.userName#
						</div>  
					</cfif>								
					<div class="add-contactlink">
						<a href="##addEmployeeModal" class="myform-btnVal"  data-toggle="modal"><span class="modal-txt1">CREATE CONTACT</span></a> 					
					</div>
				</div>
					<cfif result.contactID gt 0>
						<div class="table-wrapper printableArea">					
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th></th>
										<th>NAME</th>
										<th>EMAIL ID</th>
										<th>PHONE NUMBER</th>
										<th></th>
										<th></th>
										<th></th>								
									</tr>
								</thead>
								<tbody>
									<cfloop array="#contactList#"  item="contactList"> 							
										<tr>
											<td>
												<cfif contactList.getAttachment() NEQ ''>
													<img src="./contactimages/#contactList.getAttachment()#" class="user-img"/>
												<cfelse> 
													<cfif contactList.getgender() EQ 'Female'>
														<img src="./images/no-female.jpg" class="user-img">
													<cfelse>
														<img src="./images/no-man.png" class="user-img">
													</cfif>	
												</cfif>
											</td>
											<td>#contactList.getfirstName()# #contactList.getlastName()#</td>
											<td>#contactList.getemail()#</td>
											<td>#contactList.getphoneNumber()#</td>
											<td>
												<!--<a href="" class="edit modal-trigger-edit"   data-toggle="modal" data-id=#result.contactID#  data-target=".editEmployeeModal_#result.contactID#">-->
												<a href="##addEmployeeModal" class="edit modal-trigger-edit"  data-id=#contactList.getcontactID()#  data-toggle="modal">
												<span class="modal-txt">EDIT</span></a>
											</td>
											<td>
												<a href="" class="delete modal-trigger"   data-toggle="modal" data-id=#contactList.getcontactID()# data-target=".deleteEmployeeModal"><span class="modal-txt">DELETE</span></a>
											</td>
											<td>
												<a href="" class="view modal-trigger-view"   data-toggle="modal" data-id=#contactList.getcontactID()#  data-target=".viewEmployeeModal_#contactList.getcontactID()#"><span class="modal-txt">VIEW</span></a>
											</td>
										</tr>
									</cfloop>	
								</tbody>
							</table>					
						</div>
					</cfif>
				</div>        
			</div>
			<!-- Add Modal HTML -->
			<div id="addEmployeeModal" class="modal fade addContactModal">
				<div class="modal-dialog">
					<div class="modal-content">	
						<cfparam name="form.title" default=""> 
						<cfparam name="form.firstName" default="">   
						<cfparam name="form.lastName" default=""> 
						<cfparam name="form.gender" default=""> 
						<cfparam name="form.dob" default=""> 
						<cfparam name="form.attachment" default=""> 
						<cfparam name="form.address" default=""> 
						<cfparam name="form.street" default=""> 
						<cfparam name="form.email" default=""> 
						<cfparam name="form.phoneNumber" default=""> 
						<cfparam name="form.pincode" default=""> 						
						<form action="" method="post" name="contact" id="contact" enctype="multipart/form-data">
							<div class="modal-header">						
								<div id="contact-head"><h4 class="modal-title mod-title"></h4></div>	
							</div>
							<div class="modal-body"> 
								<input type="hidden" id="userID" name="userID" value= "#variables.userID#"/>
								<input type="hidden" id="contactID" name="contactID" value="" />
								<div class="main-head">Personal Contact</div>
								<p id="fail-alerts"></p>
								<hr class="new1">					
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label for="title">Title<span class="required"></span></label>
											<hr class="label-txt">
											<select class="form-control" name= "title" id="title">
												<option value="Mr">Mr</option>
												<option value="Ms">Ms</option>
												<option value="Mrs">Mrs</option>
											</select>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group ">
											<label for="firstName">First Name<span class="required"></span></label>
											<hr class="label-txt">
											<input type="text" class="form-control" name="firstName" id="firstName" placeholder="Your First Name" >
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label for="lastName">Last Name<span class="required"></span></label>
											<hr>
											<input type="text" class="form-control" name="lastName" id="lastName" placeholder="Your Last Name"  >
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group ">
											<label for="gender">Gender<span class="required"></span></label>
											<select class="form-control" id="gender" name="gender">
												<option value="Male">Male</option>
												<option value="Female">Female</option>
											</select>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="dob">Date of Birth<span class="required"></span></label>
											<input type="date" name="dob" id="dob" class="form-control" />
										</div>
									</div>
								</div> 
								<div class="row">
									<div class="col-sm-8">
										<div class="form-group">
											<label for="dob">Upload Photo</label>
											<input type="file" name="attachment" accept=".jpg,.jpeg,.png" id="attachment" onchange="preview()">
											<input type="hidden" id="old_img" name="old_img" value="" />
										</div>
									</div>
								</div>   
								<div class="main-head">Contact Details</div>
								<hr class="new1">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group ">
											<label for="address">Address<span class="required"></span></label>
											<hr>
											<input type="text" class="form-control" name="address" id="address" placeholder="Your Address" >
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="street">Street<span class="required"></span></label>
											<hr>
											<input type="text" class="form-control" name="street" id="street" placeholder="Your Street"  >
										</div>
									</div>
								</div> 
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group ">
											<label for="email">Email<span class="required"></span></label>
											<hr>
											<input type="email" class="form-control" name="email" id="email" placeholder="Your Email" >
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="street">Phone Number<span class="required"></span></label>
											<hr>
											<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Your Phone"  >
										</div>
									</div>
								</div> 
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group ">
											<label for="text">Pincode</label>
											<hr>
											<input type="pincode" class="form-control" id="pincode"  name="pincode" placeholder="Your Pincode">
										</div>
									</div>
								</div>         				
							</div>						
							<div class="modal-footer">
								<input type="button" class="btn btn-default cancel" data-dismiss="modal" value="Cancel">
								<input type="submit" name="formContactSubmit" id ="formContactSubmit" class=" btn-add-contact formContactSubmit" value="Add">
							</div>
						</form>
						<div class="modal-right-img">
							<div class="img-popup">
								<img src="./images/no-man.png" class="user-imgpopup" id="editimgsrc"/> 	 
							</div>	
						</div>
					</div>
				</div>		
			</div>
			<!-- View Modal HTML -->
		    <cfobject component="components.contact" name="contactList">
			<cfinvoke component="#contactList#" method="getContacts"   userID="#variables.userID#"  returnvariable="result">
			<cfloop query="result">	
				<div id="viewEmployeeModal_#result.contactID#" class="modal fade viewEmployeeModal_#result.contactID#">
					<div class="modal-dialog">
						<form method="post" action="" enctype="multipart/form-data" >
							<div class="modal-content viewcontent">
								<div class="modal-header">
									<div id="contact-head"><h4 class="modal-title">CONTACT DETAILS</h4></div>
								</div>
								<div class="modal-body viewbody"> 
									<div class="row  mt-4 desc">
										<div class="col-md-3 view-title">
											Name 
										</div>
										<div class="col-md-9">
											: #result.title#  #result.firstName# #result.lastName#
										</div>
									</div>
									<div class="row mt-4 desc">
										<div class="col-md-3 view-title">
											Gender 
										</div>
										<div class="col-md-9">
											: #result.gender#
										</div>
									</div>
									<div class="row mt-4 desc">
										<div class="col-md-3 view-title">
											DOB 
										</div>
										<div class="col-md-9">
											: #result.dob#
										</div>
									</div>
									<div class="row mt-4 desc">
										<div class="col-md-3 view-title">
											Address 
										</div>
										<div class="col-md-9">
											: #result.address#, #result.street#
										</div>
									</div>
									<div class="row mt-4 desc">
										<div class="col-md-3 view-title">
											Pincode 
										</div>
										<div class="col-md-9">
											: #result.pincode#
										</div>
									</div>
									<div class="row mt-4 desc">
										<div class="col-md-3 view-title">
											Email ID
										</div>
										<div class="col-md-9">
											: #result.email#
										</div>
									</div>
									<div class="row mt-4 desc">
										<div class="col-md-3 view-title">
											Phone 
										</div>
										<div class="col-md-9">
											: #result.phoneNumber#
										</div>
									</div>							
								</div>						
								<div class="modal-footer viewfooter">
									<input type="button" class="btn btn-default cancel" data-dismiss="modal" value="Cancel">
								</div>
								<div class="modal-right-view">
									<div class="img-popup">
										<cfif result.attachment NEQ ''>
											<img src="./contactimages/#result.attachment#" class="user-imgpopup-view"/>
										<cfelse> 
											<cfif result.gender EQ 'Female'>
												<img src="./images/no-female.jpg" class="user-imgpopup-view">
											<cfelse>
												<img src="./images/no-man.png" class="user-imgpopup-view">
											</cfif>	
										</cfif>
									</div>	
								</div>
							</div>					
						</form>				
					</div>			
				</div>
			</cfloop>
			<!-- Delete Modal HTML -->
			<div id="deleteEmployeeModal" class="modal fade deleteEmployeeModal">
				<div class="modal-dialog">
					<div class="modal-content dltcontent">
						<form action="" method="post">
							<div class="modal-contentVal">
								<input type="hidden" id="contactIDVal" name="contactIDVal" value="" />
								<div class="modal-header">						
									<h4 class="modal-title">Delete Contact</h4>
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">					
									<p>Are you sure you want to delete these Records?</p> 
								</div>
								<div class="modal-footer">
									<input type="button" class="btn btn-default cancel" data-dismiss="modal" value="Cancel">
									<input type="submit" name="deleteSubmit" data-id=#result.contactID#  class="btn btn-danger deleteSubmit" value="Delete">
								</div>
							</div>	
						</form>
					</div>
				</div>
			</div>
			<cfif form.attachment NEQ "">
				<cfobject component="components.contact" name="contactfile">
				<cfinvoke component="#contactfile#" method="uploadfile"    returnvariable="result">
				<cfinvoke component="components.contact" method="uploadfile" returnvariable="result">      
				<cfif result.serverFile NEQ "">
					<cfset variables.filefield=result.serverFile/>
				</cfif>
			</cfif> 
		</cfoutput>		  		 
    </body>
</html>    	