package dao;

import dal.DBContext;
import entity.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDAO extends DBContext {

    PreparedStatement connect = null;
    ResultSet result = null;

    public List<OrderDetail> getOrderDetailByOrderId(String orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String query = "SELECT od.[detailID], od.[orderID], p.[image], od.[productID], p.[name], c.[cid], c.[cname], od.[quantity], od.[price], od.[priceChange]  FROM [Order] o\n"
                + "	JOIN [OrderDetail] od ON od.[orderID] = o.[orderID]\n"
                + "	JOIN [Product] p ON p.[pid] = od.[productID]\n"
                + "	JOIN [Category] c ON c.[cid] = p.[cateID]\n"
                + "	WHERE o.[orderID] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, orderId);
            result = connect.executeQuery();
            while (result.next()) {
                orderDetails.add(
                        new OrderDetail(
                                result.getInt(1),
                                result.getString(2),
                                result.getString(3),
                                result.getInt(4),
                                result.getString(5),
                                result.getInt(6),
                                result.getString(7),
                                result.getInt(8),
                                result.getDouble(9),
                                result.getDouble(10)
                        )
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                if (result != null) {
                    result.close();
                }
                if (connect != null) {
                    connect.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return orderDetails;
    }

    public List<Order> getAllOrderUser(int uid) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT o.[orderID], o.[accountID], d.[code], o.[totalPrice],o.[orderDate], o.[completedDate], p.[methodName], o.[statusID], os.[statusName] FROM [Order] o\n"
                + "	JOIN [PaymentMethod] p ON p.[paymentMethodID] = o.[paymentMethodID]\n"
                + "	JOIN [OrderStatus] os ON os.[statusID] = o.[statusID]\n"
                + "	FULL JOIN [DiscountCode] d ON d.[codeID] = o.[discountCodeID]"
                + "	WHERE o.[accountID] = ?"
                + "	ORDER BY o.[orderDate] DESC";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, uid);
            result = connect.executeQuery();
            while (result.next()) {
                orders.add(
                        new Order(
                                result.getString(1),
                                result.getInt(2),
                                result.getString(3),
                                result.getDouble(4),
                                result.getDate(5),
                                result.getDate(6),
                                result.getString(7),
                                result.getInt(8),
                                result.getString(9)
                        )
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                if (result != null) {
                    result.close();
                }
                if (connect != null) {
                    connect.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return orders;
    }

    public List<Order> getOrderUserByStatusId(int uid, int statusId) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT o.[orderID], o.[accountID], d.[code], o.[totalPrice],o.[orderDate], o.[completedDate], p.[methodName], o.[statusID], os.[statusName] FROM [Order] o\n"
                + "	JOIN [PaymentMethod] p ON p.[paymentMethodID] = o.[paymentMethodID]\n"
                + "	JOIN [OrderStatus] os ON os.[statusID] = o.[statusID]\n"
                + "	FULL JOIN [DiscountCode] d ON d.[codeID] = o.[discountCodeID]\n"
                + "	WHERE o.[accountID] = ? AND o.[statusID] = ?"
                + "	ORDER BY o.[orderDate] DESC";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, uid);
            connect.setInt(2, statusId);
            result = connect.executeQuery();
            while (result.next()) {
                orders.add(
                        new Order(
                                result.getString(1),
                                result.getInt(2),
                                result.getString(3),
                                result.getDouble(4),
                                result.getDate(5),
                                result.getDate(6),
                                result.getString(7),
                                result.getInt(8),
                                result.getString(9)
                        )
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                if (result != null) {
                    result.close();
                }
                if (connect != null) {
                    connect.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return orders;
    }

    public Order getOrderUserByOrderId(int uid, String orderId) {
        String query = "SELECT o.orderID, o.accountID, d.[code], o.[totalPrice],o.[orderDate], o.[completedDate], p.[methodName],o.[statusID], os.[statusName],o.[note]  FROM [Order] o\n"
                + "	JOIN [PaymentMethod] p ON p.[paymentMethodID] = o.[paymentMethodID]\n"
                + "	JOIN [OrderStatus] os ON os.[statusID] = o.[statusID]\n"
                + "	FULL JOIN [DiscountCode] d ON d.[codeID] = o.[discountCodeID]\n"
                + "	WHERE o.[accountID] = ? AND o.[orderID] = ?";

        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, uid);
            connect.setString(2, orderId);
            result = connect.executeQuery();
            while (result.next()) {
                return new Order(
                        result.getString(1),
                        result.getInt(2),
                        result.getString(3),
                        result.getDouble(4),
                        result.getDate(5),
                        result.getDate(6),
                        result.getString(7),
                        result.getInt(8),
                        result.getString(9)
                );

            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                if (result != null) {
                    result.close();
                }
                if (connect != null) {
                    connect.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return null;
    }
}
