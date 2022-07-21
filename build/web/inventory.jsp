<%-- 
    Document   : inventory
    Created on : Jun 17, 2022, 4:57:06 PM
    Author     : 84348
--%>

<%@page import="inventoryAccountant.UserInventory"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="css/styles.css">
        <script src="js/mycode.js"></script>
        <title>Inventory Page</title>
    </head>
    <body>
        <a href="MainController?action=SeacrhReceipt&search=">Receipt</a>
        <a href="MainController?action=SeacrhOrder&OrderI=&CustomerNam=&Addres=&PhoneNumbe=">Issue</a>
        <a href="report.jsp">Report</a>
        <a href="MainController?action=SearchInventoryAlpha&productID=&name=">Inventory Report</a>
        <a href="createInventory.jsp">Create Inventory</a>

        <form action="MainController" name="SRISearch" onsubmit="SRISearchForm();">
            <input type="text" name="productID" placeholder="ProductID"/>
            <input type="text" name="name" placeholder="Product Name" />
            <input type="hidden" name="action" value="SearchInventoryAlpha"/>
            <input type="submit" value="Search"/>
        </form>


        <form action="">

            <i class="fa-solid fa-filter" onclick="ShowDateReceipt()"></i>

        </form>
        <div class="show_date_receipt" id="showDateReceipt">
            <form action="MainController" name="SRIdSearch" onsubmit="SRIdSearchForm();">
                Search<input type="date" name="searchInventory"/>
                To<input type="date" name="searchInventoryM" />
                <input type="hidden" name="action" value="SearchInventory"/>
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
                <input type="submit" name="action" value="SortInventory">
            </form>
        </div>

        <%
            List<UserInventory> inventory = (List<UserInventory>) session.getAttribute("LIST_INVENTORY");
            if (inventory != null) {
                if (inventory.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>productID</th>
                    <th>Name</th>
                    <th>checkingDate</th>
                    <th>quantityInChecking</th>
                    <th>Quantity</th>
                    <th>quality</th>
                    <th>Deviant</th>
                    <th>note</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (UserInventory rc : inventory) {
                %>
                <tr>
                    <td>
                        <%= rc.getProductID()%>
                    </td>
                    <td>
                        <%= rc.getName()%>
                    </td>
                    <td>
                        <%= rc.getCheckingDate()%>
                    </td>
                    <td>
                        <%= rc.getQuantityInChecking()%>
                    </td>
                    <td>
                        <%= rc.getQuantity()%>
                    </td>
                    <td>
                        <%= rc.getQuality()%>
                    </td>
                    <%
                        float a = (float) (rc.getQuantity() - rc.getQuantityInChecking()) / rc.getQuantity();
                        float b = (a * 100);                      
                        String source =String.valueOf(b);  
                        char firstChar = source.charAt(0);
                        String first =String.valueOf(firstChar);  
                        char secondChar = source.charAt(1);
                        String second =String.valueOf(secondChar);  
                        char thirdChar = source.charAt(2);
                        String third =String.valueOf(thirdChar);  
                        char lastChar = source.charAt(3);
                        String last =String.valueOf(lastChar);  
                        String isMax = first+second+third+last;
                        
                    %>
                    <td>
                        <%= isMax %>%
                    </td>
                    <td>
                        <%= rc.getNote()%>
                    </td>
            <input type="hidden" name="productID" value="<%= rc.getProductID()%>" readonly=""/>
                    <input type="hidden" name="name" value="<%= rc.getName()%>" readonly=""/>
                    <input type="hidden" name="checkingDate" value="<%= rc.getCheckingDate()%>" readonly=""/>
                    <input type="hidden" name="quantityInChecking" value="<%= rc.getQuantityInChecking()%>" readonly=""/>
                    <input type="hidden" name="quantity" value="<%= rc.getQuantity()%>" readonly=""/>
                    <input type="hidden" name="quality" value="<%= rc.getQuality()%>" readonly=""/>
                    <input type="hidden" name="deviant" value="<%= isMax %>%" readonly=""/>
                    <input type="hidden" name="note" value="<%= rc.getNote()%>" readonly=""/>
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

        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <h2><%=error%></h2>
    </body>
</html>
