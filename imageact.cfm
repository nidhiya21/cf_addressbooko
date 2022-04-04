
 <cfset variables.thisPath=expandPath('.') & '/userimage/'>
        <cfset variables.protectedPath=GetDirectoryFromPath(variables.thisPath)>
<!--- Upload new file --->
<cffile action="upload" 
  fileField ="selectedFile"
  destination="#protectedPath#"
  nameconflict="makeUnique"
  mode="664" />

<cfif FileExists("#protectedPath##File.ServerFile#")> 
	<cfset ajaxFlag="true">
    <cfelse>
	<cfset ajaxFlag="false">
    </cfif>
    
    <cfoutput>
	<script language="javascript" type="text/javascript">window.top.window.stopUpload('#ajaxFlag#');</script>
    </cfoutput>

