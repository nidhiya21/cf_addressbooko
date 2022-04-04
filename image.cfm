
<html>
<head>
      <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <!-- <link rel="stylesheet" type="text/css" href="profile.css"> -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
             <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
  <!-- <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet"> -->
  <!-- <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script> -->
<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
</head>
<body>

    <style type="text/css">
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
    reader.readAsDataURL(file);
  }
    var fd = new FormData(document.getElementById("userImgUpload"));
    console.log(fd);     
    if (file) {
     // console.log(file['name']);
    // reader.readAsDataURL(file);   
	$.ajax({
  
            url: "components/contact.cfc?method=updateProfile",
            type: "POST",
            data: fd,
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false
        }).done(function(data) {
           $('#profile-image1').attr('src', 'userimage/' + file['name']);
        })  
    }

}
                      $(function() {
            $('#profile-image1').on('click', function() {
                $('#userImg').click();
            });
        });
		</script>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-xs-12 profile-badge">
                <!-- <img src="https://dummyimage.com/600x400/000/"> -->
                	<form  method="post" name="userImgUpload" id="userImgUpload">
                <div class="profile-pic">
                 
                        <img alt="User Pic" src="https://d30y9cdsu7xlg0.cloudfront.net/png/138926-200.png" id="profile-image1" height="200">
                        <input id="userImg" class="hidden"  name="userImg"  type="file" onchange="previewFile()" >
                        <div style="color:#999;" >  </div>
                        
                </div>
				</form>
                                                         
 </div>
 
 </div></div></div>
                   
    
</body>
</html>
