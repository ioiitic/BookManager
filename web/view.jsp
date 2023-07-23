<%-- 
    Document   : View
    Created on : Feb 7, 2023, 6:34:04 AM
    Author     : Dell
--%>

<%@page import="com.shopping.BookDTO"%>
<%@page import="com.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>View Cart</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

            <link rel="stylesheet" href="css/style.css">
    </head>
    <body class="img js-fullheight" style="background-image: url(images/bg.jpg);">
        <%
            Cart cart = (Cart)session.getAttribute("CART");
            if (cart == null){
                %>
                <h1>You choose:</h1>
        <%
            } else {
        %>
        
        <section class="ftco-section">
                <div class="container">
                    <div class="row justify-content-center table-responsive">
                        <table class="table align-middle">                            
                            <thead class="table-dark">
                                <tr>
                                    <th>No</th>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody class="table-dark">
                                <%
                                    int cnt = 1;
                                    for (BookDTO book: cart.getCart().values()){
                                %>
                                <tr>
                                    <td><%= cnt++%></td>
                                    <td><%= book.getBookID()%></td>
                                    <td><%= book.getBookName()%></td>
                                    <td><%= book.getQuantity()%></td>
                                    <td><%= book.getBookPrice() %></td>
                                    <td><%= book.getBookPrice()*book.getQuantity() %></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
        </section>
        
                        

        

        <%
            }
        %>
    </body>
</html>