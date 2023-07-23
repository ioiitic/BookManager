<%-- 
    Document   : createUser
    Created on : Jan 13, 2023, 7:38:40 AM
    Author     : Dell
--%>

<%@page import="com.users.UserDTO"%>
<%@page import="com.users.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="css/style.css">

    </head>
    <body class="img js-fullheight" style="background-image: url(images/bg.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Update user</h2>
                    </div>
                </div>
                <%
                    UserError userError = (UserError) request.getAttribute("USER_ERROR");
                    if (userError == null){
                        userError = new UserError();
                    }
                    String search = (String) request.getParameter("search");
                    if (search == null){
                        search = "";
                    }
                    UserDTO user = (UserDTO) request.getAttribute("UPDATE_USER");
                    
                %>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <form action="MainController" method="POST" class="signin-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" value="<%= user.getUserID() %>" name="userID" autocomplete="off" required>
                                </div>
                                <div class="form-group" style="color: red; font-weight: bold">
                                    <%= userError.getUserIDError() %>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" value="<%= user.getFullName()%>" name="fullName" autocomplete="off" required>
                                </div>
                                <div class="form-group" style="color: red">
                                    <%= userError.getFullNameError() %>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" value="<%= user.getRoleID() %>" name="roleID" autocomplete="off" required>
                                </div>
                                <div class="form-group" style="color: red">
                                    <%= userError.getRoleIDDError() %>
                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="password" class="form-control" value="<%= user.getPassword()%>" name="password"  required>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group" style="color: red">
                                    <%= userError.getConfirmError() %>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="form-control btn btn-primary submit px-3" name="action" value="Update"></input>
                                </div>
                                <div>
                                    <%= userError.getMessageError() %>
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
