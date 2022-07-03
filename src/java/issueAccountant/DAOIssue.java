/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package issueAccountant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author 84348
 */
public class DAOIssue {
    private static final String SEARCH_ORDER = "SELECT orderID,customerName,address,phoneNumber,status,note,deliveryDate,sellerID FROM Orders WHERE orderID NOT IN ( SELECT orderID FROM Issue) AND orderID like ? AND customerName like ? AND address like ? AND phoneNumber like ?";
    private static final String INSERT_ISSUE = "INSERT INTO Issue(note, accountantID, sellerID, orderID, DateP) VALUES(?,?,?,?,?)";
    private static final String SEARCH_ISSUE = "SELECT i.issueID,i.note,i.accountantID,i.sellerID,i.orderID,i.DateP FROM Issue as i, Orders as o WHERE i.orderID=o.orderID AND o.orderID like ? AND o.customerName like ? ";
    private static final String UPDATE_ISSUE = "UPDATE Issue SET note=? WHERE issueID=?";
    private static final String SEARCH_ORDER_DATE = "SELECT orderID,customerName,address,phoneNumber,status,note,deliveryDate,sellerID FROM Orders WHERE orderID NOT IN ( SELECT orderID FROM Issue) AND deliveryDate BETWEEN ? AND ?";
    
    public List<UserOrder> getListSearchOrder(String search,String search1,String search2,String search3) throws SQLException {
        List<UserOrder> listOrder = new ArrayList<>();
        Connection con = null;
       PreparedStatement ptm = null;
       ResultSet rs = null;
      try {
          con = DBUtils.getConnection();
         if (con != null) {
               ptm = con.prepareStatement(SEARCH_ORDER);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search1 + "%");
                ptm.setString(3, "%" + search2 + "%");
                ptm.setString(4, "%" + search3 + "%");
                rs = ptm.executeQuery();
               while (rs.next()) {
                    int orderID = Integer.parseInt(rs.getString("orderID"));
                    String customerName = rs.getString("customerName");
                    String address = rs.getString("address");
                    int phoneNumber = Integer.parseInt(rs.getString("phoneNumber"));
                    String status = rs.getString("status");
                    String note = rs.getString("note");
                    String deliveryDate = rs.getString("deliveryDate");
                    String sellerID = rs.getString("sellerID");
                    listOrder.add(new UserOrder(orderID, customerName, address, phoneNumber, status, note, deliveryDate, sellerID));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listOrder;
   }
    
    public boolean createIssue(UserIssue issue) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ISSUE);
                ptm.setString(1, issue.getNote());
                ptm.setString(2, issue.getAccountantID());
                ptm.setString(3, issue.getSellerID());
                ptm.setInt(4, issue.getOrderID());
                ptm.setString(5, issue.getDateP());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            
        }
        return check;
    }
    
    public List<UserIssueS> getListSearchIssue(String search,String search1) throws SQLException {
        List<UserIssueS> listIssue = new ArrayList<>();
        Connection con = null;
       PreparedStatement ptm = null;
       ResultSet rs = null;
      try {
          con = DBUtils.getConnection();
         if (con != null) {
               ptm = con.prepareStatement(SEARCH_ISSUE);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search1 + "%");
                rs = ptm.executeQuery();
               while (rs.next()) {
                    int issueID = Integer.parseInt(rs.getString("issueID"));
                    String note = rs.getString("note");
                    String accountantID = rs.getString("accountantID");
                    int orderID = Integer.parseInt(rs.getString("orderID"));
                    String sellerID = rs.getString("sellerID");
                    String DateP = rs.getString("DateP");
                    listIssue.add(new UserIssueS(issueID, note, accountantID, sellerID, orderID, DateP));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listIssue;
   }
    
    public boolean updateIssue(UserIssueU issue) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_ISSUE);
                ptm.setString(1, issue.getNote());
                ptm.setInt(2, issue.getIssueID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }
    
    public List<UserOrder> getListSearchOrderDate(String search, String search1) throws SQLException {
        List<UserOrder> listOrder = new ArrayList<>();
        Connection con = null;
       PreparedStatement ptm = null;
       ResultSet rs = null;
      try {
          con = DBUtils.getConnection();
         if (con != null) {
               ptm = con.prepareStatement(SEARCH_ORDER_DATE);
                ptm.setString(1,search);
                ptm.setString(2,search1);
                rs = ptm.executeQuery();
               while (rs.next()) {
                    int orderID = Integer.parseInt(rs.getString("orderID"));
                    String customerName = rs.getString("customerName");
                    String address = rs.getString("address");
                    int phoneNumber = Integer.parseInt(rs.getString("phoneNumber"));
                    String status = rs.getString("status");
                    String note = rs.getString("note");
                    String deliveryDate = rs.getString("deliveryDate");
                    String sellerID = rs.getString("sellerID");
                    listOrder.add(new UserOrder(orderID, customerName, address, phoneNumber, status, note, deliveryDate, sellerID));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listOrder;
   }
}
