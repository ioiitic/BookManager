<%-- 
    Document   : admin
    Created on : Jan 10, 2023, 6:20:16 PM
    Author     : Dell
--%>

<%@page import="java.util.List"%>
<%@page import="com.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <
    </body>
</html>-->

<!doctype html>
<html lang="en">
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
                    <%
                        UserDTO loginUser = (UserDTO)session.getAttribute("LOGIN_USER");
                        if(loginUser != null){
                            if (!"AD".equals(loginUser.getRoleID())){
                                response.sendRedirect("login.jsp");
                                return;
                            }

                            String search = (String) request.getParameter("search");
                            if (search == null){
                                search = "";
                            }
                    %>
                    <div class="row justify-content-center">
                        <h1 class="heading-section">Hello Admin: <%= loginUser.getFullName()%></h1>  
                    </div>
                    <div class="row justify-content-center" >
                        <form action="MainController" method="POST" class="signin-form">
                            <input class="form-control" type="submit" name="action" value="Logout"/>
                        </form>
                    </div>
                    <br/>
                    <div class="row justify-content-center">
                        <form action="MainController" method="POST" class="signin-form">
                            <div class="form-group">
                                <input class="form-control " type="text" name="search" value="<%= search%>" autocomplete="off"/>
                            </div>
                            <div class="form-group">
                                <input class="form-control w-50" type="submit" name="action" value="Search"/>
                            </div>
                        </form>
                    </div>
                    <div class="row justify-content-center table-responsive">
                        <%
                            List<UserDTO> list = (List<UserDTO>) request.getAttribute("LIST_USER");

                            if (list != null){
                                if(!list.isEmpty()){
                        %>
                        <h3 class="mb-4 text-center" style="color: white">Account</h3>
                        <table class="table align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th class="text-center" scope="col">No</th>
                                    <th class="text-center" scope="col">User ID</th>
                                    <th class="text-center" scope="col">Full Name</th>
                                    <th class="text-center" scope="col">Role ID</th>
                                    <th class="text-center" scope="col">Password</th>
                                    <th class="text-center" scope="col">Delete</th>
                                    <th class="text-center" scope="col">Update</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int cnt = 1;
                                    for (UserDTO user: list){  
                                %>
                                    <tr>
                                        <th class="align-middle text-center" scope="row">
                                            <div class="login-wrap p-0"> <%= cnt++%> </h4> </div>
                                        </th>
                                        <td class="align-middle text-center">
                                            <div class="login-wrap p-0"> <%= user.getUserID()%> </div>
                                        </td>
                                        <td class="align-middle text-center">
                                            <div class="login-wrap p-0"> <%= user.getFullName()%> </div>
                                        </td>
                                        <td class="align-middle text-center">
                                            <div class="login-wrap p-0"> <%= user.getRoleID()%> </div>
                                        </td>
                                        <td class="align-middle text-center">
                                             <div class="login-wrap p-0"> <%= user.getPassword()%> </div>
                                        </td>
                                        <td class="align-middle text-center">
                                            <a href="MainController?action=Delete&userID=<%= user.getUserID()%>&search=<%= search %>">Delete</a>
                                        </td>
                                        <td class="align-middle text-center">
                                            <a href="MainController?action=Update&userID=<%= user.getUserID()%>&search=<%= search %>">Update</a>
                                        </td>
                                    </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>

                        <%

                                }
                            }
                        %>    
                    </div>
<!--                    <div class="row justify-content-center table-responsive">
                        <h3 class="mb-4 text-center" style="color: white">Book</h3>
                        <table class="table align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th class="text-center" scope="col">No</th>
                                    <th class="text-center" scope="col">Book ID</th>
                                    <th class="text-center" scope="col">Book Name</th>
                                    <th class="text-center" scope="col">Book Price</th>=
                                    <th class="text-center" scope="col">Delete</th>
                                    <th class="text-center" scope="col">Update</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                    </div>-->
                        <%
                                }
                        %>    
                </div>
            </section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

	</body>
</html>

