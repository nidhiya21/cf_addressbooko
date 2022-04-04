<script src="./js/jquery-3.5.1.min.js"></script>
<script src="./js/print.js"></script>	
<cfobject component="components.contact" name="contactPdf">
<cfinvoke component="#contactPdf#" method="getPdf"   userID="#Session.userID#"  returnvariable="result">
<cfoutput>
<table width="100%" border="1"  id="employee"> 
               <tr class="txtcolr">
                    <th >PHOTO</th>
                    <th >NAME</th>
                    <th >GENDER</th>
                    <th >DOB</th>
                    <th >EMAIL ID</th>
                    <th >PHONE NUMBER</th>
                    <th >ADDRESS</th>                  
               </tr>
               <cfloop query="result"> 
                    <tr>
                         <td>
                            <cfif #result.attachment# NEQ ''>
                                <img src="./contactimages/#result.attachment#" class="user-img" width="100" height="100"/>
                            <cfelse> 
                                <cfif #result.gender# EQ 'Female'>
                                    <img src="./images/no-female.jpg" class="user-img" width="100" height="100">
                                <cfelse>
                                    <img src="./images/no-man.png" class="user-img" width="100" height="100">
                                </cfif>	
                            </cfif>
                         </td>
                         <td>#result.title&'.'&result.firstName&' '&result.lastName#</td>
                         <td>#result.gender#</td>
                         <td>#result.dob#</td>
                         <td>#result.email#</td>
                         <td>#result.phoneNumber#</td>
                         <td>#result.address&',<br>'&result.street&',<br>'&result.pincode#</td>                        
                    </tr>
               </cfloop>
</cfoutput>

