package dao;

import dal.DBContext;
import entity.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderStatusDAO extends DBContext {

    PreparedStatement connect = null;
    ResultSet result = null;

    public List<OrderStatus> getAllOrderStatus() {
        List<OrderStatus> orderStatus = new ArrayList<>();
        String query = "SELECT * FROM [OrderStatus]";

        try {
            connect = connection.prepareStatement(query);
            result = connect.executeQuery();
            while (result.next()) {

                orderStatus.add(
                        new OrderStatus(
                                result.getInt(1),
                                result.getString(2)
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
        return orderStatus;
    }
}
