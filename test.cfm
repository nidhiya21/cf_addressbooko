
<html>
<head>


      <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
             <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
             <cfinclude template="common.cfm">	



    <style type="text/css">
        body{
    background-color: #5F9EA0;
}

    
} 
.profile-badge{
    border:1px solid #c1c1c1;
    padding:5px;
    position: relative;
}


.profile-pic{
    position: absolute;
    height:120px;
    width:120px;
    left: 50%;
    transform: translateX(-50%);
    top: 0px;
    z-index: 1001;
    padding: 10px;
}
.profile-pic img{
   
    border-radius: 50%;
    box-shadow: 0px 0px 5px 0px #c1c1c1;
    cursor: pointer;
    width: 100px;
    height: 100px;
}   

 
</style>
<script>
 function previewFile() {
  var preview = document.querySelector('img');
  var file    = document.querySelector('input[type=file]').files[0];
  var reader  = new FileReader();

  reader.addEventListener("load", function () {
    preview.src = reader.result;
  }, false);

  if (file) {
   // console.log(file['name']);
   var userID = 12;
    var userImg = file['name'];
    reader.readAsDataURL(file);
    $.ajax({
    url: 'components/contact.cfc', 
    async: false,
      type: 'POST',
      processData: false,
        contentType: false,
    data: 
        { 
            method: "updateProfile",
            userID:userID, userImg:userImg},
            success: function(objResponse ) {
                if (objResponse.SUCCESS){ 
                    alert('Contact deleted successfully');           
                } 
                else {                  
                    alert('Error in deletion,Please try again!');    
                }                    
        }
    }); 
   
  }
}
              $(function() {
    $('#profile-image1').on('click', function() {
        $('#profile-image-upload').click();
    });
});
        
</script>
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-xs-12 profile-badge">
                <!-- <img src="https://dummyimage.com/600x400/000/"> -->
                
                <div class="profile-pic">
                 
                        <img alt="User Pic" src="https://d30y9cdsu7xlg0.cloudfront.net/png/138926-200.png" id="profile-image1" height="200">
                        <input id="profile-image-upload" class="hidden" type="file" onchange="previewFile()" >
                        
                        
                </div>
        </div></div></div>
                   
    
</body>
</html>
