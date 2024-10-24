package dao;

import dal.DBContext;
import entity.ProductOrder;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductOrderDAO extends DBContext {

    PreparedStatement connect = null;
    ResultSet result = null;

    public void addProductOrder(int accountID, int productID, int quality) {
        String query = "INSERT INTO Cart ([AccountID], [ProductID], [Amount], [created_at]) VALUES (?, ?, ?, ?)";

        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, accountID);
            connect.setInt(2, productID);
            connect.setInt(3, quality);
            connect.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            connect.executeUpdate();
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
    }

    public List<ProductOrder> getAllProductOrder(int accountID) {
        List<ProductOrder> productOrders = new ArrayList<>();
        String query = "SELECT p.[pid],  p.[name], p.[title], p.[image], p.[price], SUM(c.[amount]) FROM Cart c\n"
                + "	JOIN [Product] p ON p.[pid] = c.ProductID\n"
                + "	WHERE\n"
                + "		c.[accountID] = ?\n"
                + "	GROUP BY  p.[pid],  p.[name], p.[title], p.[image], p.[price] ORDER BY MAX(c.[created_at]) DESC";

        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, accountID);
            result = connect.executeQuery();
            while (result.next()) {
                productOrders.add(
                        new ProductOrder(
                                result.getInt(1),
                                result.getString(2),
                                result.getString(3),
                                result.getString(4),
                                result.getDouble(5),
                                result.getInt(6)
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
        return productOrders;
    }

    public void deleteProduct(int accountID, int productID) {
        String query = "DELETE FROM [Cart] WHERE [accountID] = ? AND [productID] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, accountID);
            connect.setInt(2, productID);
            connect.executeUpdate();
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
    }
}
