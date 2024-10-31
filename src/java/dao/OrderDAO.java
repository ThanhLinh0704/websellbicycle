package dao;

import dal.DBContext;
import entity.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DBContext {

    PreparedStatement connect = null;
    PreparedStatement connect1 = null;
    ResultSet result = null;

    public List<Order> getAllOrder() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT o.[orderID], o.[accountID], d.[code], o.[totalPrice],o.[orderDate], o.[completedDate], p.[methodName], o.[statusID], os.[statusName], o.[note] FROM [Order] o\n"
                + "	JOIN [PaymentMethod] p ON p.[paymentMethodID] = o.[paymentMethodID]\n"
                + "	JOIN [OrderStatus] os ON os.[statusID] = o.[statusID]\n"
                + "	JOIN [DiscountCode] d ON d.[codeID] = o.[discountCodeID]"
                + "	ORDER BY o.[orderDate] DESC";
        try {
            connect = connection.prepareStatement(query);
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

    public List<Order> getTop5OrderRelease() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT TOP 5 o.[orderID], o.[accountID], d.[code], o.[totalPrice],o.[orderDate], o.[completedDate], p.[methodName], o.[statusID], os.[statusName], o.[note] FROM [Order] o\n"
                + "	JOIN [PaymentMethod] p ON p.[paymentMethodID] = o.[paymentMethodID]\n"
                + "	JOIN [OrderStatus] os ON os.[statusID] = o.[statusID]\n"
                + "	JOIN [DiscountCode] d ON d.[codeID] = o.[discountCodeID]\n"
                + "	ORDER BY o.[orderDate] DESC";
        try {
            connect = connection.prepareStatement(query);
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

    public List<Order> getOrderByStatusId(int statusId) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT o.[orderID], o.[accountID], d.[code], o.[totalPrice],o.[orderDate], o.[completedDate], p.[methodName], o.[statusID], os.[statusName], o.[note] FROM [Order] o\n"
                + "	JOIN [PaymentMethod] p ON p.[paymentMethodID] = o.[paymentMethodID]\n"
                + "	JOIN [OrderStatus] os ON os.[statusID] = o.[statusID]\n"
                + "	JOIN [DiscountCode] d ON d.[codeID] = o.[discountCodeID]\n"
                + "	WHERE o.[statusID] = ?"
                + "	ORDER BY o.[orderDate] DESC";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, statusId);
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
                                result.getString(9),
                                result.getString(10)
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

    public List<Order> getAllOrderUser(int uid) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT o.[orderID], o.[accountID], d.[code], o.[totalPrice],o.[orderDate], o.[completedDate], p.[methodName], o.[statusID], os.[statusName], o.[note] FROM [Order] o\n"
                + "	JOIN [PaymentMethod] p ON p.[paymentMethodID] = o.[paymentMethodID]\n"
                + "	JOIN [OrderStatus] os ON os.[statusID] = o.[statusID]\n"
                + "	JOIN [DiscountCode] d ON d.[codeID] = o.[discountCodeID]"
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
                                result.getString(9),
                                result.getString(10)
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
        String query = "SELECT o.[orderID], o.[accountID], d.[code], o.[totalPrice],o.[orderDate], o.[completedDate], p.[methodName], o.[statusID], os.[statusName], o.[note] FROM [Order] o\n"
                + "	JOIN [PaymentMethod] p ON p.[paymentMethodID] = o.[paymentMethodID]\n"
                + "	JOIN [OrderStatus] os ON os.[statusID] = o.[statusID]\n"
                + "	JOIN [DiscountCode] d ON d.[codeID] = o.[discountCodeID]\n"
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
                                result.getString(9),
                                result.getString(10)
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
        String query = "SELECT o.orderID, o.accountID, d.[code], o.[totalPrice],o.[orderDate], o.[completedDate], p.[methodName],o.[statusID], os.[statusName],o.[note], o.[note]  FROM [Order] o\n"
                + "	JOIN [PaymentMethod] p ON p.[paymentMethodID] = o.[paymentMethodID]\n"
                + "	JOIN [OrderStatus] os ON os.[statusID] = o.[statusID]\n"
                + "	JOIN [DiscountCode] d ON d.[codeID] = o.[discountCodeID]\n"
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
                        result.getString(9),
                        result.getString(10)
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
    
    public Order getOrderDetailByOrderId(String orderId) {
        String query = "SELECT o.orderID, o.accountID, d.[code], o.[totalPrice],o.[orderDate], o.[completedDate], p.[methodName],o.[statusID], os.[statusName],o.[note], o.[note]  FROM [Order] o\n"
                + "	JOIN [PaymentMethod] p ON p.[paymentMethodID] = o.[paymentMethodID]\n"
                + "	JOIN [OrderStatus] os ON os.[statusID] = o.[statusID]\n"
                + "	JOIN [DiscountCode] d ON d.[codeID] = o.[discountCodeID]\n"
                + "	WHERE o.[orderID] = ?";

        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, orderId);
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
                        result.getString(9),
                        result.getString(10)
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

    public void addNewOrder(String orderID, int accountID, int statusID, double totalPrice, Date orderDate, int paymentMethodID, int discountCodeID, String note, List<OrderDetail> orderDetails) {
        String query1 = "INSERT INTO [Order] ([orderID], [accountID], [statusID], [totalPrice], [orderDate], [paymentMethodID], [discountCodeID], [note])\n"
                + "	VALUES\n"
                + "		(?, ?, ?, ?, ?, ?, ?, ?)";
        String query2 = "INSERT INTO [OrderDetail] ([orderID], [productID], [quantity], [price], [priceChange])\n"
                + "	VALUES\n"
                + "		(?, ?, ?, ?, ?)";

        try {
            connect = connection.prepareStatement(query1);

            connect.setString(1, orderID);
            connect.setInt(2, accountID);
            connect.setInt(3, statusID);
            connect.setDouble(4, totalPrice);
            connect.setDate(5, new java.sql.Date(orderDate.getTime()));
            connect.setInt(6, paymentMethodID);
            connect.setInt(7, discountCodeID);
            connect.setString(8, note);
            connect.executeUpdate();

            connect1 = connection.prepareStatement(query2);
            for (OrderDetail detail : orderDetails) {
                connect1.setString(1, orderID);
                connect1.setInt(2, detail.getProductId());
                connect1.setInt(3, detail.getQuantity());
                connect1.setDouble(4, detail.getPrice());
                connect1.setDouble(5, detail.getPriceChange());
                connect1.executeUpdate();
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
                if (connect1 != null) {
                    connect1.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    public boolean orderIDExists(String orderID) {
        String query = "SELECT COUNT(*) FROM [Order] WHERE [orderID] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, orderID);
            result = connect.executeQuery();
            if (result.next()) {
                return result.getInt(1) > 0;
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
                if (connect1 != null) {
                    connect1.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return false;
    }

    public void updateOrderStatus(String orderID, int newStatus) {
        String query = "UPDATE [Order] SET [statusID] = ?, [completedDate] = ? WHERE [orderID] = ?;";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, newStatus);
            if (newStatus == 5 || newStatus == 4) {
                long currentTimeMillis = System.currentTimeMillis();
                connect.setTimestamp(2, new Timestamp(currentTimeMillis));
            } else {
                connect.setNull(2, Types.TIMESTAMP);
            }
            connect.setString(3, orderID);
            connect.executeQuery();
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
                if (connect1 != null) {
                    connect1.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

}
