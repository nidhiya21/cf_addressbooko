<cfset contactObj=CreateObject("component","components.contactscript")/>
<cfset result=contactObj.getPdf(Session.userID)/>
    <cfdocument format="PDF" filename="contact-list.pdf" overwrite="Yes"> 
        <cfdocumentsection> 
            <cfdocumentitem type="header"> 
                <font size="-3"><i>Contact  Details</i></font> 
            </cfdocumentitem> 
            <cfdocumentitem type="footer"> 
                <font size="-3">Page #cfdocument.currentpagenumber#</font> 
            </cfdocumentitem>         
            <table width="95%" border="2" cellspacing="2" cellpadding="2" > 
                <tr> 
                    <th>Name</th> 
                    <th>Gender</th> 
                    <th>DOB</th> 
                    <th>Address</th> 
                    <th>Pincode</th> 
                    <th>Email ID</th> 
                    <th>Phone</th> 
                    <th>Image</th> 
                </tr> 
                    <cfloop query="result"> 
                        <cfoutput>
                            <tr> 
                                <td><font size="-1"> 
                                    #result.title#  #result.firstName# #result.lastName#</font> 
                                </td> 
                                <td align="right"><font size="-1"> 
                                    #result.gender#</font> 
                                </td> 
                                <td align="right"><font size="-1"> 
                                    #result.dob#</font> 
                                </td>
                                <td align="right"><font size="-1"> 
                                    #result.address#, #result.street#</font> 
                                </td>
                                <td align="right"><font size="-1"> 
                                    #result.pincode#</font> 
                                </td>
                                <td align="right"><font size="-1"> 
                                    #result.email#</font> 
                                </td>
                                <td align="right"><font size="-1"> 
                                    #result.phoneNumber#</font> 
                                </td>
                                <td align="right"><font size="-1"> 
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
                            </tr>  
                        </cfoutput>          
                    </cfloop> 
                </table> 
            </cfdocumentsection> 
    </cfdocument> 
<cfheader name="Content-Disposition" value="attachment; filename=contact-list.pdf">
<cfcontent type="application/pdf"  file="#expandPath('.')#\contact-list.pdf"><cfdocument format="PDF">Some text.</cfdocument>

