package dao;

import dal.DBContext;
import entity.ProductManager;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductManagerDAO extends DBContext {

    PreparedStatement connect = null;
    ResultSet result = null;

    public List<ProductManager> getAllProductManager() {
        List<ProductManager> productManagers = new ArrayList<>();
        String query = "SELECT p.[pid], p.[name], p.[image], p.[amount], p.[price], p.[title], p.[description],p.[cateID], c.[cname], p.[sell_ID] FROM [Product] p\n"
                + "	JOIN [Category] c ON c.cid = p.cateID";

        try {
            connect = connection.prepareStatement(query);
            result = connect.executeQuery();
            while (result.next()) {
                productManagers.add(
                        new ProductManager(
                                result.getInt(1),
                                result.getString(2),
                                result.getString(3),
                                result.getInt(4),
                                result.getDouble(5),
                                result.getString(6),
                                result.getString(7),
                                result.getInt(8),
                                result.getString(9),
                                result.getInt(10)
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
        return productManagers;
    }

    public ProductManager getProductManagerByPid(int pid) {
        String query = "SELECT p.[pid], p.[name], p.[image], p.[amount], p.[price], p.[title], p.[description],p.[cateID], c.[cname], p.[sell_ID] FROM [Product] p\n"
                + "	JOIN [Category] c ON c.cid = p.cateID\n"
                + "	WHERE p.[pid] = ?";

        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, pid);
            result = connect.executeQuery();
            while (result.next()) {
                return new ProductManager(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getInt(4),
                        result.getDouble(5),
                        result.getString(6),
                        result.getString(7),
                        result.getInt(8),
                        result.getString(9),
                        result.getInt(10)
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

    public void insertProduct(String name, String image, int amount, double price, String title, String description, int category, int sid) {
        String query = "INSERT product \n"
                + "([name], [image], [amount], [price], [title], [description], [cateID], [sell_ID])\n"
                + "VALUES(?,?,?,?,?,?,?,?)";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, name);
            connect.setString(2, image);
            connect.setInt(3, amount);
            connect.setDouble(4, price);
            connect.setString(5, title);
            connect.setString(6, description);
            connect.setInt(7, category);
            connect.setInt(8, sid);
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

    public void editProduct(String name, String image, int amount, double price, String title, String description, int category, int sid, int pid) {
        String query = "UPDATE [dbo].[Product] "
                + "SET [name] = ?, "
                + "[image] = ?, "
                + "[amount] = ?, "
                + "[price] = ?, "
                + "[title] = ?, "
                + "[description] = ?, "
                + "[cateID] = ?, "
                + "[sell_ID] = ? "
                + "WHERE Product.[pid] = ?";

        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, name);
            connect.setString(2, image);
            connect.setInt(3, amount);
            connect.setDouble(4, price);
            connect.setString(5, title);
            connect.setString(6, description);
            connect.setInt(7, category);
            connect.setInt(8, sid);
            connect.setInt(9, pid);
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

    public String getCurrentImageByPid(int pid) {
        String query = "SELECT [image] FROM [Product] WHERE [pid] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, pid);
            result = connect.executeQuery();
            while (result.next()) {
                return result.getString(1);
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

    public void deleteProduct(int pid) {
        String query = "DELETE FROM [product] WHERE [pid] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, pid);
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
