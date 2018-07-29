<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <%@ include file="header.html" %> 
   <title>Home page</title>
   <style>
      .box{
      	
      	text-align:center;
         display: block;
         height: auto;
         position: absolute;
         left:50%;
         top: 50%;
         transform: translate(-50%,-50%);
      }
      ul{
      	font-size:30px;
      	list-style-type:none;
      }
      a{
      color:white;
      }
      a:link {
    text-decoration: none;
}

a:visited {
    text-decoration: none;
}

a:hover {
	color:white;
    text-decoration: none;
}

a:active {
    text-decoration: none;
}
      .center{
         text-align: center;
      }
      .btn{
      	display:block;
      	font-size:30px;
      	color:white !important;
      }
      .btn-dark{
      	background-color:black !important;
      	color:white !important;
      }
      .bg-dark{
      	background-color:black !important;
      	color:white !important;
      }
   </style>
</head>
<body>

	<div class="banner">
      <nav class="navbar navbar-expand-lg navbar-light bg-dark">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            
            <ul class="navbar-nav center">
              <li class="nav-item"><img src="img/logo.png" alt="logo"></li>
            </ul>
          </div>
        </nav>
  </div>
  <br>
  <br>
   <h1 style="text-align: center">Rajiv Gandhi Inventory Management System</h1>
   <div class="box">
      <ul>
         <li class="btn btn-dark"><a href="user_login.jsp">User</a></li>
         <br>
         <li class="btn btn-dark"><a href="admin_login.jsp">Admin</a></li>
      </ul>
   </div>
   <%@ include file="footer.html" %> 
</body>
</html>