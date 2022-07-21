<%-- 
    Document   : productAccount
    Created on : Jul 20, 2022, 11:14:54 AM
    Author     : 84348
--%>

<%@page import="user.UserProduct"%>
<%@page import="java.util.List"%>
<%@page import="user.UserProductNotFull"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
    </head>
    <body>
        <form action="MainController">
            <input type="text" name="name" placeholder="Name">.
            <input type="submit" name="action" value="SearchProductAccount">

        </form>
        <%
            List<UserProductNotFull> product = (List<UserProductNotFull>) session.getAttribute("LIST_PRODUCT_NOT_FULL");
            if (product != null) {
                if (product.size() > 0) {
        %>
        <form action="MainController">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (UserProductNotFull rc : product) {

                    %>
                <form action="MainController">
                    <tr>
                        <td>
                            <%= count++%>
                        </td>
                        <td>
                            <input type="hidden" name="productID" value="<%= rc.getProductID()%>">
                            <%= rc.getProductID()%>
                        </td>
                        <td>
                            <input type="hidden" name="name" value="<%= rc.getName()%>">
                            <%= rc.getName()%>
                        </td>
                        <td>
                            <input type="hidden" name="quantity" value="<%= rc.getQuantity()%>">
                            <%= rc.getQuantity()%>
                        </td>
                        <td>
                            <input type="submit" name="action" value="View">
                        </td>

                    </tr>

                </form>
                <%
                    }
                %>
                </tbody>
            </table>
            <%
                    }
                }
            %>
        </form>
        
        
        <%
            List<UserProduct> productF = (List<UserProduct>) session.getAttribute("LIST_PRODUCT_FULL");
            if (productF != null) {
                if (productF.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Brand</th>
                    <th>Model</th>
                    <th>Type</th>
                    <th>Made in</th>
                    <th>Voice remote</th>
                    <th>Bluetooth</th>
                    <th>Screen size</th>
                    <th>Manufacturing Year</th>
                    <th>Width</th>
                    <th>Depth</th>
                    <th>Height</th>
                </tr>
            </thead>
            <tbody>
                <%
                        int count = 1;
                        for (UserProduct rc : productF) {

                    %>
            <form action="MainController">
                <tr>
                    <td>
                        <%= rc.getProductID() %>
                    </td>
                    <td>
                        <%= rc.getName()%>
                    </td>
                    <td>
                        <%= rc.getBrand()%>
                    </td>
                    <td>
                        <%= rc.getModel()%>
                    </td>
                    <td>
                        <%= rc.getType()%>
                    </td>
                    <td>
                        <%= rc.getMadeIn()%>
                    </td>
                    <td>
                        <%= rc.getVoiceRemote()%>
                    </td>
                    <td>
                        <%= rc.getBluetooth()%>
                    </td>
                    <td>
                        <%= rc.getScreenSize()%>
                    </td>
                    <td>
                        <%= rc.getManufacturingDate()%>
                    </td>
                    <td>
                        <%= rc.getWidth()%>
                    </td>
                    <td>
                        <%= rc.getDepth()%>
                    </td>
                    <td>
                        <%= rc.getHeight()%>
                    </td>
                </tr>
            </form>
            <%
                    }
                %>
            </tbody>
        </table>
            <%
                    }
                }
            %>

    </body>
</html>
