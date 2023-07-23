<%-- 
    Document   : createUser
    Created on : Jan 13, 2023, 7:38:40 AM
    Author     : Dell
--%>

<%@page import="com.users.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Login 10</title>
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
                            <h2 class="heading-section">Create new user</h2>
                        </div>
                    </div>
                    <%
                        UserError userError = (UserError) request.getAttribute("USER_ERROR");
                        if (userError == null){
                            userError = new UserError();
                        }
                    %>
                    <div class="row justify-content-center">
                        <div class="col-md-6 col-lg-4">
                            <div class="login-wrap p-0">
                                <form action="MainController" method="POST" class="signin-form">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="User ID" name="userID" autocomplete="off" required>
                                    </div>
                                    <div class="form-group" style="color: red; font-weight: bold">
                                        <%= userError.getUserIDError() %>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Full Name" name="fullName" autocomplete="off" required>
                                    </div>
                                    <div class="form-group" style="color: red">
                                        <%= userError.getFullNameError() %>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Role ID" name="roleID" autocomplete="off" required>
                                    </div>
                                    <div class="form-group" style="color: red">
                                        <%= userError.getRoleIDDError() %>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" type="password" class="form-control" placeholder="Password" name="password" required>
                                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" type="password" class="form-control" placeholder="Confirm" name="confirm" required>
                                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                    </div>
                                    <div class="form-group" style="color: red">
                                        <%= userError.getConfirmError() %>
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" class="form-control btn btn-primary submit px-3" name="action" value="Create"></input>
                                    </div>
                                    <div>
                                        <%= userError.getMessageError() %>
                                    </div>
                                    <div class="form-group">
                                        <a href="login.jsp">Back</a>
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
</html>
