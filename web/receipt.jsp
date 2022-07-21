<%-- 
    Document   : receipt
    Created on : Jun 16, 2022, 4:27:44 PM
    Author     : 84348
--%>

<%@page import="virtual.ListNotify"%>
<%@page import="receiptAccountant.UserReceiptDetailS"%>
<%@page import="user.UserNotify"%>
<%@page import="user.UserProduct"%>
<%@page import="receiptAccountant.UserReceipt"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="css/styles.css">
        <script src="js/mycode.js"></script>
        <title>Receipt Page</title>
    </head>
    <body>
        <a href="MainController?action=SeacrhReceipt&search=&searchSeceond=">Receipt</a>
        <a href="MainController?action=SeacrhOrder&OrderI=&CustomerNam=&Addres=&PhoneNumbe=">Issue</a>
        <a href="report.jsp">Report</a>
        <a href="MainController?action=SearchInventoryAlpha&productID=&name=">Inventory Report</a>

        <a href="MainController?action=LoadAccount">Create</a>

        <form action="MainController" name="RSearch" onsubmit="RSearchForm();">
            <input type="text" name="search" placeholder="By Receipt ID"/>
            <input type="hidden" name="action" value="SeacrhReceipt"/>
            <input type="submit" value="Search"/>
        </form>

        <form action="">

            <i class="fa-solid fa-filter" onclick="ShowDateReceipt()"></i>

        </form>
        <div class="show_date_receipt" id="showDateReceipt">
            <form action="MainController" name="RdSearch" onsubmit="RdSearchForm();">
                Search<input type="date" name="search"/>
                To<input type="date" name="searchR" />
                <input type="hidden" name="action" value="SearchReceiptDate"/>
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
                <input type="submit" name="action" value="SortReceipt">
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
            List<UserReceipt> receipt = (List<UserReceipt>) session.getAttribute("LIST_RECEIPT");
            if (receipt != null) {
                if (receipt.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Receipt ID</th>
                    <th>Create date</th>
                    <th>Status</th>
                    <th>Total Quantity</th>
                    <th>Note</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (UserReceipt rc : receipt) {
                %>
            <form action="MainController" name="SRDSearch" onsubmit="SRDSearchForm();">
                <tr>
                    <td>
                        <%= rc.getReceiptID()%>
                    </td>
                    <td>
                        <%= rc.getInputDate()%>
                    </td>
                    <td>
                        <%= rc.getStatus()%>
                    </td>
                    <td>
                        <%= rc.getTotalQuantity()%>
                    </td>
                    <td>
                        <%= rc.getNote()%>
                    </td>
                    <td>
                        <input type="hidden" name="action" value="ShowDetailReceipt" readonly="" />
                        <input type="submit" value="Show"/>
                    </td>
                </tr>
                <input type="hidden" name="receiptID" value="<%= rc.getReceiptID()%>" readonly=""/>
                <input type="hidden" name="productID" value="<%= rc.getInputDate()%>" readonly=""/>
                <input type="hidden" name="productID" value="<%= rc.getStatus()%>" readonly=""/>
                <input type="hidden" name="productID" value="<%= rc.getTotalQuantity()%>" readonly=""/>
                <input type="hidden" name="productID" value="<%= rc.getNote()%>" readonly=""/>
                <input type="hidden" name="productID" value="<%= rc.getAccountantID()%>" readonly=""/>
                <input type="hidden" name="productID" value="<%= rc.getStockKeeperID()%>" readonly=""/>
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
        List<UserReceiptDetailS> receiptDetail = (List<UserReceiptDetailS>) request.getAttribute("LIST_DETAIL_RECEIPT");
        if (receiptDetail != null) {
            if (receiptDetail.size() > 0) {
    %>
    <div id="orderDetail">
        <table  border="1" >
            <thead>
                <tr>
                    <th>receiptDetailID</th>
                    <th>quantityInBill</th>
                    <th>quantityInShipping</th>
                    <th>productID</th>
                    <th>solution</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (UserReceiptDetailS tm : receiptDetail) {
                %>
                <tr>
                    <td>
                        <%= tm.getReceiptDetailID()%>
                    </td>
                    <td>
                        <%= tm.getQuantityInBill()%>
                    </td>
                    <td>
                        <%= tm.getQuantityInShipping()%>
                    </td>
                    <td>
                        <%= tm.getProductID()%>
                    </td>
                    <td>
                        <%= tm.getSolution()%>
                    </td>

            <input type="hidden" name="orderDetailID" value="<%= tm.getReceiptDetailID()%>" readonly=""/>
            <input type="hidden" name="quantity" value="<%= tm.getQuantityInBill()%>" readonly=""/>
            <input type="hidden" name="orderID" value="<%= tm.getQuantityInShipping()%>" readonly=""/>
            <input type="hidden" name="productID" value="<%= tm.getProductID()%>" readonly=""/>
            <input type="hidden" name="productID" value="<%= tm.getReceiptID()%>" readonly=""/>
            <input type="hidden" name="productID" value="<%= tm.getSolution()%>" readonly=""/>

            </tr>
            <%
                }
            %>
            <input type="button" value="Close" onclick="ShowDetailOrder()">
            </tbody>          
        </table>
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
