 $(document).ready(function(){
    	   console.log("hello");
    	   $('.butn').click(function(){
    		   //console.log("hello");
               //var parent = $(this).parent().parent();
               //console.log(parent);
               var iname=$($(this).parent().parent().children()[3]).text();
               var ibrand=$($(this).parent().parent().children()[4]).text();
               var quantity=$($(this).parent().parent().children()[8]).children().val();
               var data = {
               		custid:$("#uid").val(),
               		iname:iname,
               		ibrand:ibrand,
               		quantity:quantity,
               		};
               var d = JSON.stringify(data);
               console.log(d);
               $.ajax({
                   url: 'AddCartServlet',
                   method: 'POST',
                   data: {d},
                   success: function(res){
                 	  alert("added successfully");
                 	  $($(this).parent().parent().children()[8]).children().val("");
                   }
                   
                 });
              
           });
       });
       