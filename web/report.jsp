<%-- 
    Document   : report
    Created on : Jun 17, 2022, 10:05:43 AM
    Author     : 84348
--%>

<%@page import="reportAccountant.UserReport"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="css/styles.css">
        <script src="js/mycode.js"></script>
        <title>Report Page</title>
    </head>
    <body>
        <a href="MainController?action=SeacrhReceipt&search=">Receipt</a>
        <a href="MainController?action=SeacrhOrder&OrderI=&CustomerNam=&Addres=&PhoneNumbe=">Issue</a>
        <a href="report.jsp">Report</a>
        <a href="MainController?action=SearchInventoryAlpha&productID=&name=">Inventory Report</a>

        <form action="MainController">
            <input type="text" name="productID" placeholder="productID">
            <input type="text" name="name" placeholder="Name">
            To<input type="date" name="date" required="">
            From<input type="date" name="date2"required="">
            <input type="submit" name="action" value="ShowReport" >
        </form>
        
        <div>
            <i class="fa-solid fa-sort" onclick="ShowSort()"></i>
            
        </div>
        
        <div id="sortLabel" class="show_date_receipt">
            <form action="MainController">
                <label>Sort by: </label>
                <select name="search">
                    <option value="1">Brand reduce</option>
                    <option value="2">Brand increase</option>
                </select>
                <input type="submit" name="action" value="SortReport">
            </form>
        </div>
        

        <%
            List<UserReport> tp = (List<UserReport>)session.getAttribute("LIST_REPORT");
            if (tp != null) {
                if (tp.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ProductID</th>
                    <th>Name</th>
                    <th>Brand</th>
                    <th>Quantity Begin</th>
                    <th>Quantity End</th>
                    <th>Import</th>
                    <th>Export</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserReport tm : tp) {
                %>
            <form action="MainController">
                <tr>
                    <td>
                        <input type="text" name="orderID" value="<%= count++ %>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="orderID" value="<%= tm.getProductID()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="orderID" value="<%= tm.getName()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="orderID" value="<%= tm.getBrand()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="orderID" value="<%= tm.getQuantityBegin()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="orderID" value="<%= tm.getQuantityEnd()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="orderID" value="<%= tm.getImport()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="orderID" value="<%= tm.getExport()%>" required=""/>
                    </td>
                </tr>
            </form>
            <%
                }
            %>
            </tbody>
        </table>
            
            <form action="MainController">
                <input type="submit" name="action" value="ExportReport">
            </form>
<%
            }
        }
    %>
    
    <%
            String error = (String) request.getAttribute("ERROR_REPORT");
            if (error == null) {
                error = "";
            }
        %>
        <h2><%=error%></h2>
    </body>
</html>
