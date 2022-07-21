<%-- 
    Document   : createReceiptDetail
    Created on : Jun 18, 2022, 5:12:32 PM
    Author     : 84348
--%>

<%@page import="user.UserAccount"%>
<%@page import="receiptAccountant.UserReceiptDetail"%>
<%@page import="virtual.ListReceiptM"%>
<%@page import="user.UserProduct"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <script src="js/mycode.js"></script>
        <title>Create Receipt Detail Page</title>
    </head>
    <body>
        <form action="MainController" name="RDSearch" onsubmit="RDSearchForm();">
            <input type="text" name="ProductID" placeholder="ProductID">
            <input type="text" name="Name" placeholder="Name">
            <input type="hidden" name="Brand" placeholder="Brand">
            <input type="hidden" name="Model" placeholder="Model">
            <input type="hidden" name="action" value="ShowProductCreate">
            <input type="submit" value="Search"/>
        </form>
        <%
            String errorSearch = (String) request.getAttribute("ERROR_SEARCH");
            if (errorSearch == null) {
                errorSearch = "";
            }
        %>
        <h2><%=errorSearch%></h2>
        <%
            List<UserProduct> product = (List<UserProduct>) request.getAttribute("LIST_PRODUCT");
            if (product != null) {
                if (product.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>ProductID</th>
                    <th>Name</th>
                    <th>quantityInBill</th>
                    <th>quantityInShipping</th>
                    <th>Solution</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (UserProduct rc : product) {
                %>
            <form action="MainController" name="RDPSearch" onsubmit="RDPSearchForm();">
                <tr>
                    <td>
                        <%=rc.getProductID()%>
                    </td>
                    <td>
                        <%=rc.getName()%>
                    </td>
                    <td>
                        <input type="number" name="quantityInBill" required="" min="1"/>
                    </td>
                    <td>
                        <input type="number" name="quantityInShipping" required="" min="1"/>
                    </td>
                    <td>
                        <input type="text" name="solution" required=""/>
                    </td>
                    <td>
                        <input type="hidden" name="action" value="AddVirtualReceiDetail"/>
                        <input type="submit" value="Add"/>
                    </td>
                </tr>
                <input type="hidden" name="productID" value="<%=rc.getProductID()%>"/>
                <input type="hidden" name="name" value="<%=rc.getName()%>"/>
                <input type="hidden" name="brand" value="<%=rc.getBrand()%>"/>
                <input type="hidden" name="model" value="<%=rc.getModel()%>"/>
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
        String errorCheck = (String) request.getAttribute("ERROR_CHECK");
        if (errorCheck == null) {
            errorCheck = "";
        }
    %>
    <h2><%=errorCheck%></h2>

    <h3>Product Will Add Detail</h3>

    <%
        ListReceiptM rd = (ListReceiptM) session.getAttribute("VIRTUAL_RECEI");
        if (rd != null) {
            if (rd.getListReceipt().size() > 0) {
    %>
    <table border="1">
        <thead>
            <tr>
                <th>No</th>
                <th>productID</th>
                <th>quantityInBill</th>
                <th>quantityInShipping</th>
                <th>solution</th>
            </tr>
        </thead>
        <tbody>
            <%
                int count = 1;
                for (UserReceiptDetail tm : rd.getListReceipt().values()) {
            %>
        <form action="MainController" name="studentForm" onsubmit="submitForm();">
            <tr>
                <td>
                    <input type="text" name="" value="<%= count++%>" readonly=""/>
                </td>
                <td>
                    <input type="text" name="productID" value="<%= tm.getProductID()%>" readonly=""/>
                </td>
                <td>
                    <input type="text" name="quantityInBill" value="<%= tm.getQuantityInBill()%>" required="" min="1"/>
                </td>
                <td>
                    <input type="text" name="quantityInShipping" value="<%= tm.getQuantityInShipping()%>" required="" min="1"/>
                </td>
                <td>
                    <input type="text" name="solution" value="<%= tm.getSolution()%>" required=""/>
                </td>
                <td>
                    <input type="hidden" name="action" value="UpdateReceiptDetailVirtual" readonly=""/>
                    <input type="submit" value="Update"/>
                </td>
                <td>
                        <a href="MainController?action=RemoveReceiptDetailVirtual&productID=<%= tm.getProductID() %>">Delete</a>
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

<%
    String error = (String) request.getAttribute("ERROR");
    if (error == null) {
        error = "";
    }
%>
<h2><%=error%></h2>


<form action="MainController">
    <!--    <input type="text" name="stockKeeperID" placeholder="stockKeeperID" required="">-->
    <label for="">StockKeeperID:</label>
    <%
        List<UserAccount> account = (List<UserAccount>) session.getAttribute("LIST_ACCOUNT");
        if (account != null) {
            if (account.size() > 0) {
    %>
    <select name="stockKeeperID">
        <%
            for (UserAccount rc : account) {
        %>
        <option value="<%= rc.getAccountID()%>"><%= rc.getName()%></option>
        <%
            }
        %>
    </select>
    <%
            }
        }
    %> 
    <input type="submit" name="action" value="Finish">
</form>

<%
    String errorSK = (String) request.getAttribute("VIRTUAL_RECEI_ERROR");
    if (errorSK == null) {
        errorSK = "";
    }
%>
<h2><%=errorSK%></h2>


<%
    String errorFinish = (String) request.getAttribute("ERROR_FINISH");
    if (errorFinish == null) {
        errorFinish = "";
    }
%>
<h2><%=errorFinish%></h2>



</body>
</html>
