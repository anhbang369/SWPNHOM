<%-- 
    Document   : issue
    Created on : Jun 17, 2022, 8:57:17 PM
    Author     : 84348
--%>

<%@page import="virtual.ListNotify"%>
<%@page import="user.UserNotify"%>
<%@page import="issueAccountant.UserOrder"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="css/styles.css">
        <script src="js/mycode.js"></script>
        <title>Order Page</title>
    </head>
    <body>
        <a href="MainController?action=SeacrhReceipt&search=">Receipt</a>
        <a href="MainController?action=SeacrhOrder&OrderI=&CustomerNam=&Addres=&PhoneNumbe=">Issue</a>
        <a href="report.jsp">Report</a>
        <a href="MainController?action=SearchInventoryAlpha&productID=&name=">Inventory Report</a>
        <form action="MainController" name="OOSearch" onsubmit="OOSearchForm();">
            <input type="number" name="OrderI" placeholder="OrderID"/>
            <input type="hidden" name="CustomerNam" placeholder="CustomerName"/>
            <input type="hidden" name="Addres" placeholder="Address"/>
            <input type="hidden" name="PhoneNumbe" placeholder="PhoneNumber"/>
            <input type="hidden" name="action" value="SeacrhOrder"/>
            <input type="submit" value="Search"/>
        </form>

        <form action="">
        
        <i class="fa-solid fa-filter" onclick="ShowDateReceipt()"></i>
      
    </form>
    <div class="show_date_receipt" id="showDateReceipt">
        <form action="MainController" name="OdSearch" onsubmit="OdSearchForm();">
            Search<input type="date" name="search"/>
            To<input type="date" name="searchM" />
            <input type="hidden" name="action" value="SearchOrderDate"/>
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
                    <option value="1">Old date</option>
                    <option value="2">New date</option>
                </select>
                <input type="submit" name="action" value="SortOrder">
            </form>
        </div>


        <form action="#" method="post">
            <i class="fa-regular fa-bell" value="show" onclick="ShowNotify()"></i>
        </form>
        <%

            ListNotify rd = (ListNotify) session.getAttribute("LIST_NOTIFY");
            if (rd != null) {
                if (rd.getListNotify().size() > 0) {
        %>
        
        
        
        <div class="number" id="sa<%= rd.getListNotify().size()%>">
                <%= rd.getListNotify().size()%>
            </div>
        <div class="notification_head" id="showValue">
            <header class="head_notify">
                <h3>
                    Thông báo mới nhận
                </h3>
            </header>
            <%
                for (UserNotify tm : rd.getListNotify().values()) {
            %>
            <ul>
                <li class="notify_list">
                    <span> Mặc hàng <%= tm.getName()%> trong kho đang ở mức báo động. Cần xem xét nhập hàng </span>
                </li>

            </ul>
            <%
                }
            %>
        </div>
        <%
                }
            }
        %>








        <%
            List<UserOrder> order = (List<UserOrder>) session.getAttribute("LIST_ORDER");
            if (order != null) {
                if (order.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>OrderID</th>
                    <th>Status</th>
                    <th>deliveryDate</th>
                    <th>sellerID</th>
                    <th>note</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (UserOrder rc : order) {
                %>
            <form action="MainController" name="OISearch" onsubmit="OISearchForm();">
                <tr>
                    <td>
                        <%= rc.getOrderID()%>
                    </td>
                    <td>
                        <%= rc.getStatus()%>
                    </td>
                    <td>
                        <%= rc.getDeliveryDate()%>
                    </td>
                    <td>
                        <%= rc.getSellerID()%>
                    </td>
                    <td>
                        <%= rc.getNote()%>
                    </td>
                    <td>
                        <input type="hidden" name="action" value="InsertIssue" />
                        <input type="submit" value="Add"/>
                    </td>
                <input type="hidden" name="orderID" value="<%= rc.getOrderID()%>" readonly=""/>
                    <input type="hidden" name="customerName" value="<%= rc.getCustomerName()%>" readonly=""/>
                    <input type="hidden" name="address" value="<%= rc.getAddress()%>" readonly=""/>
                    <input type="hidden" name="phoneNumber" value="<%= rc.getPhoneNumber()%>" readonly=""/>
                    <input type="hidden" name="status" value="<%= rc.getStatus()%>" readonly=""/>
                    <input type="hidden" name="note" value="<%= rc.getNote()%>" readonly=""/>
                    <input type="hidden" name="deliveryDate" value="<%= rc.getDeliveryDate()%>" readonly=""/>
                    <input type="hidden" name="sellerID" value="<%= rc.getSellerID()%>" />
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
        String erro = (String) request.getAttribute("ERROR_ADD_ISSUE");
        if (erro == null) {
            erro = "";
        }
    %>
    <h2><%=erro%></h2>

    <%
        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    %>
    <h2><%=error%></h2>
    
    <a href="MainController?action=SearchIssue&searchIssue=&searchCustomer=">Issue</a>
</body>
</html>
