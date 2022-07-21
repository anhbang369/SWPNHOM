<%-- 
    Document   : issueVirtual
    Created on : Jun 17, 2022, 10:20:13 PM
    Author     : 84348
--%>

<%@page import="issueAccountant.UserOrderDetail"%>
<%@page import="issueAccountant.UserIssueS"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <script src="js/backNoWork.js" type="text/javascript" ></script>
        <link rel="stylesheet" href="css/styles.css">
        <script src="js/mycode.js"></script>
        <title>Issue Page</title>
    </head>
    <body>
        <a href="MainController?action=SeacrhReceipt&search=">Receipt</a>
        <a href="MainController?action=SeacrhOrder&OrderI=&CustomerNam=&Addres=&PhoneNumbe=">Issue</a>
        <a href="report.jsp">Report</a>
        <a href="MainController?action=SearchInventoryAlpha&productID=&name=">Inventory Report</a>

        <form action="MainController" name="OSearch" onsubmit="OSearchForm();">
            <input type="text" name="searchIssue" placeholder="Enter OrderID">
            <input type="text" name="searchCustomer" placeholder="Enter Customer Name">
            <input type="hidden" name="action" value="SearchIssue">
            <input type="submit" value="Search"/>
        </form>
        
        <form action="">

            <i class="fa-solid fa-filter" onclick="ShowDateReceipt()"></i>

        </form>
        <div class="show_date_receipt" id="showDateReceipt">
            <form action="MainController" name="SIdSearch" onsubmit="SIdSearchForm();">
                Search<input type="date" name="search"/>
                To<input type="date" name="searchR" />
                <input type="hidden" name="action" value="SearchIssueDate"/>
                <input type="submit" value="Search"/>
            </form>
        </div>
        
        <div>
            <i class="fa-solid fa-sort" onclick="ShowSort()"></i>
            
        </div>
        
        <div id="sortLabel" class="show_date_receipt">
            <form action="MainController">
                <label>Sort by: </label>
                <select name="search">
                    <option value="1">Date old</option>
                    <option value="2">Date new</option>
                </select>
                <input type="submit" name="action" value="SortIssue">
            </form>
        </div>

        <%
            List<UserIssueS> issue = (List<UserIssueS>) session.getAttribute("LIST_ISSUE");
            if (issue != null) {
                if (issue.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>issueID</th>                   
                    <th>orderID</th>
                    <th>DateP</th>
                    <th>Note</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (UserIssueS tm : issue) {
                %>
            <form action="MainController" name="SIDSearch" onsubmit="SIDSearchForm();">
                <tr>
                    <td>
                        <%= tm.getIssueID()%>
                    </td>
                    <td>
                        <%= tm.getOrderID()%>
                    </td>
                    <td>
                        <%= tm.getDateP()%>
                    </td>
                    <td>
                        <%= tm.getNote()%>
                    </td>
                    <td>
                        <input type="hidden" name="action" value="ShowDetailOrder"/>
                        <input type="submit" value="Search"/>
                    </td>
                <input type="hidden" name="issueID" value="<%= tm.getIssueID()%>" readonly=""/>
<input type="hidden" name="note" value="<%= tm.getNote()%>" readonly=""/>
<input type="hidden" name="accountantID" value="<%= tm.getAccountantID()%>" readonly=""/>
<input type="hidden" name="sellerID" value="<%= tm.getSellerID()%>" readonly=""/>
<input type="hidden" name="orderID" value="<%= tm.getOrderID()%>" readonly=""/>
<input type="hidden" name="DateP" value="<%= tm.getDateP()%>" readonly=""/>
<input type="hidden" name="action" value="ShowDetailOrder"/>
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

    <%
        List<UserOrderDetail> issueDetail = (List<UserOrderDetail>) request.getAttribute("LIST_ORDER_DETAIL");
        if (issueDetail != null) {
            if (issueDetail.size() > 0) {
    %>
    <div id="orderDetail">
        <form action="MainController">
        
        <table  border="1" >
            <thead>
                <tr>
                    <th>orderDetailID</th>
                    <th>quantity</th>
                    <th>productID</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (UserOrderDetail tm : issueDetail) {
                %>
                <tr>
                    <td>
                        <%= tm.getOrderDetailID()%>
                    </td>
                    <td>
                        <%= tm.getQuantity()%>
                    </td>
                    <td>
                        <%= tm.getProductID()%>
                    </td>

            <input type="hidden" name="orderDetailID" value="<%= tm.getOrderDetailID()%>" readonly=""/>
                    <input type="hidden" name="quantity" value="<%= tm.getQuantity()%>" readonly=""/>
                    <input type="hidden" name="orderID" value="<%= tm.getOrderID()%>" readonly=""/>
                    <input type="hidden" name="productID" value="<%= tm.getProductID()%>" readonly=""/>
                </tr>
                <%
                    }
                %>
            <input type="button" value="Close" onclick="ShowDetailOrder()">
            </tbody>          
        </table>
           </form> 
    </div>
    <%
            }
        }
    %>







    <%
        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    %>
    <h2><%=error%></h2>
</body>
</html>


