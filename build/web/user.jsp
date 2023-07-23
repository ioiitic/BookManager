<%-- 
    Document   : admin
    Created on : Jan 10, 2023, 6:20:16 PM
    Author     : Dell
--%>

<%@page import="com.shopping.BookDAO"%>
<%@page import="com.shopping.BookDTO"%>
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

                    %>
                    <div class="row justify-content-center">
                        <h1 class="heading-section">Hello User <%= loginUser.getFullName()%></h1>  
                    </div>
                    <div class="row justify-content-center" >
                        <form action="MainController" method="POST" class="signin-form">
                            <input class="form-control" type="submit" name="action" value="Logout"/>
                            <input class="form-control" type="submit" name="action" value="View"/>
                        </form>
                    </div>
                    <div class="row justify-content-center table-responsive">
                        <table class="table align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th class="text-center" scope="col">No</th>
                                    <th class="text-center" scope="col">User ID</th>
                                    <th class="text-center" scope="col">Full Name</th>
                                    <th class="text-center" scope="col">Role ID</th>
                                    <th class="text-center" scope="col">Add to Cart</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    BookDAO dao = new BookDAO();
                                    List<BookDTO> list = dao.getListBook();
                                    
                                    int cnt = 1;
                                    for (BookDTO book: list){  
                                %>
                                    <tr>
                                        <th class="align-middle text-center" scope="row">
                                            <div class="login-wrap p-0"> <%= cnt++%> </h4> </div>
                                        </th>
                                        <td class="align-middle text-center">
                                            <div class="login-wrap p-0"> <%= book.getBookID()%> </div>
                                        </td>
                                        <td class="align-middle text-center">
                                            <div class="login-wrap p-0"> <%= book.getBookName()%> </div>
                                        </td>
                                        <td class="align-middle text-center">
                                            <div class="login-wrap p-0"> <%= book.getBookPrice()%> </div>
                                        </td>
                                        <td class="align-middle text-center">
                                            <form action="MainController" method="POST" class="signin-form">
                                                <input class="form-control" type="submit" name="action" value="AddToCart"/>
                                                <input type="hidden" name="bookID" value="<%= book.getBookID()%>"/>
                                            </form>
                                        </td>
                                    </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>

                        <%

                                }
                            String msg = (String) request.getAttribute("MESSAGE");
                            if (msg != null) {
                        %>    
                        <h4 style="color: white"><%= msg%></h4>
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

