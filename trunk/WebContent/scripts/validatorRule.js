var rulesForCleintSaveForm = {
rules : {
clientName :{ 
required : true
},
description :{ 
required:true
}
},
errorClass: "errorClass",
    errorElement: "span",
}
var rulesForUserSaveForm = {
rules : {
firstName :{ 
required : true
},
lastName :{ 
required : true
},
emailId :{ 
required : true,
email: true
},
"client.clientId" :{ 
required : true
},
username :{ 
required:true,
maxlength:15,
minlength:6,
alphanumeric:true,
      remote: {
        url: "validateUser.html",
        type: "post",
        data: {
          username: function() {
            return $("#add_new_user_form #username").val();
          }
        }
      }
}
},
      messages : {
      username : {
      remote : "This username is not available."
      }
      },
errorClass: "errorClass",
    errorElement: "span",
}