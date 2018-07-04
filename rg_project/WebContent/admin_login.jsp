<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
   <style>
      .box{
         display: block;
         width: 500px;
         height: auto;
         position: absolute;
         left: 50%;
         
         top: 50%;
         transform: translate(-50%,-50%);
      }
      .center{
         text-align: center;
      }
   </style>
   <title>Admin Login</title>
</head>
<body>
   <div class="container">
      <br>
      <h2 class="center">Admin Login</h2>
      <form action="AdminLogin" class="box" method = "POST">
         <div class="form-row">
            <div class="form-group center col-md-12">
               <label for="error" >${err}</label>
            </div>
            <div class="form-group col-md-12">
               <label for="username">User Name</label>
               <input type="text" name="username" class="form-control" id="name" placeholder="User Name">
            </div>
            <div class="form-group col-md-12">
               <label for="password">Password</label>
               <input type="password" name="password" class="form-control" id="name" placeholder="Password">
            </div>
            <button type="submit" class="btn btn-primary col-2 offset-md-5">Login</button>
         </div>
      </form>
   </div>


   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>