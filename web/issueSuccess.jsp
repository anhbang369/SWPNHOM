<%-- 
    Document   : issueSuccess
    Created on : Jul 8, 2022, 8:17:58 PM
    Author     : 84348
--%>

<%@page import="issueAccountant.UserIssueFull"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Issue Create Success Page</title>
    </head>
    <body>
        
        <form action="MainController">
            <%
                List<UserIssueFull> list = (List<UserIssueFull>) request.getAttribute("LIST_ISSUE_FULLL");
                if (list != null) {
                    if (list.size() > 0) {

            %>

            <table border="1">
                <thead>
                    <tr>
                        <th>orderDetailID</th>
                        <th>productID</th>
                        <th>quantity</th>
                        <th>orderID</th>                       
                    </tr>
                </thead>
                <tbody>
                    <%                    for (UserIssueFull elem : list) {


                    %>
                    AccountantID: <%=elem.getAccountantID()%></br>
                    SellerID: <%=elem.getSellerID()%></br>
                    Date: <%=elem.getDateP()%></br>
                    CustomerName: <%=elem.getCustomerName()%></br>
                    Address: <%=elem.getAddress()%></br>
                    PhoneNumber <%=elem.getPhoneNumber()%></br>
                    DeliveryDate: <%=elem.getDeliveryDate()%></br>
                    Note: <%=elem.getNote()%></br>
                    <%
                            break;
                        }
                    %>

                    <%
                        for (UserIssueFull rc : list) {

                    %>

                    <tr>
                        <td>
                            <input type="text" name="orderDetailID" value="<%= rc.getOrderDetailID()%>" readonly=""/>
                        </td>
                        <td>
                            <input type="text" name="productID" value="<%= rc.getProductID()%>" readonly=""/>
                        </td>
                        <td>
                            <input type="text" name="quantity" value="<%= rc.getQuantity()%>" readonly=""/>
                        </td>
                        <td>
                            <input type="text" name="orderID" value="<%= rc.getOrderID()%>" readonly=""/>
                        </td>
                        
                <input type="hidden" name="issueID" value="<%= rc.getIssueID()%>" readonly=""/>
                <input type="hidden" name="note" value="<%= rc.getNote()%>" readonly=""/>
                <input type="hidden" name="accountantID" value="<%= rc.getAccountantID()%>" readonly=""/>
                <input type="hidden" name="sellerID" value="<%= rc.getSellerID()%>" readonly=""/>
                <input type="hidden" name="DateP" value="<%= rc.getDateP()%>" readonly=""/>
                <input type="hidden" name="customerName" value="<%= rc.getCustomerName()%>" readonly=""/>
                <input type="hidden" name="address" value="<%= rc.getAddress()%>" readonly=""/>
                <input type="hidden" name="phoneNumber" value="<%= rc.getPhoneNumber()%>" readonly=""/>
                <input type="hidden" name="deliveryDate" value="<%= rc.getDeliveryDate()%>" readonly=""/>
                </tr>   

                </tbody>
                <%

                    }
                %>
            </table>



            <%
                    }
                }
            %>
            
           
                <input type="text" name="notee" placeholder="Enter Conclusion">
                <input type="submit" name="action" value="UpdateIssue"/>

            
            <input type="submit" name="action" value="ExportIssue">
        </form>

    </body>
</html>
