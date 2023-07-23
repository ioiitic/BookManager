<%-- 
    Document   : index
    Created on : Jan 10, 2023, 9:41:59 AM
    Author     : Dell
--%>
<!--
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            User ID: <input type="text" name="userID"/><br/>
            Password: <input type="password" name="password"/><br/>
            <input type="submit" name="action" value="Login"/>
            <input type="reset" value="Reset"/>
        </form>
        <a href="createUser.jsp">Create User</a>
    </body>
</html>-->

<!doctype html>
<html lang="en">
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">

	</head>
	<body class="img js-fullheight" style="background-image: url(images/bg.jpg);">
            <section class="ftco-section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6 text-center mb-5">
                            <h2 class="heading-section">Login</h2>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-6 col-lg-4">
                            <div class="login-wrap p-0">
                                <h3 class="mb-4 text-center">Have an account?</h3>
                                <form action="MainController" method="POST" class="signin-form">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Username" name="userID" autocomplete="off" required>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" type="password" class="form-control" placeholder="Password" name="password" required>
                                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" class="form-control btn btn-primary submit px-3" name="action" value="Sign In"></input>
                                    </div>
                                    <div class="form-group d-md-flex">
                                        <div class="w-50">
                                            <a href="createUser.jsp" style="color: #fbceb5">Sign up</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

	</body>
</html>

