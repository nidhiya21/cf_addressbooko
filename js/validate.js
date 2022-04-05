$("#signup").validate({
    errorClass: "fail-alert",
    rules: {
        fullName: "required",
        emailID: {
            required: true,
            email: true
        },
        userName: {
            required: true,
            minlength: 5
        },
        password: {
            required: true,
            minlength: 5,
            equalTo: "#confirmpassword"
        },
        confirmpassword: {
            required: true
            
        }
    },
    messages: { 
        fullName: "Please enter your fullName ",
 
        userName: {
            required: "Please enter a userName ",
            minlength: "Your userName must consist of at least 5 characters "
        },
        password: {
            required: "Please provide a password ",
            minlength: "Your password must be at least 5 characters long "
        },
        confirm_password: {
            required: "Please provide a confirm password ",
            minlength: "Your password must be at least 5 characters long ",
            equalTo: "Please enter the same password as above "
        },
        emailID: "Please enter a valid emailID ",
   } 
});


