package dao;

import dal.DBContext;
import entity.*;
import java.util.*;
import java.sql.*;

public class ProductDAO extends DBContext {

    PreparedStatement connect = null;
    ResultSet result = null;

    public List<Product> getAllProduct() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM [product]";
        try {
            connect = connection.prepareStatement(query);
            result = connect.executeQuery();
            while (result.next()) {
                products.add(new Product(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getInt(4),
                        result.getDouble(5),
                        result.getString(6),
                        result.getString(7)));
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
        return products;
    }

    public List<Product> getTop3() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT TOP 3 * FROM [product] ORDER BY [pid] DESC";
        try {
            connect = connection.prepareStatement(query);
            result = connect.executeQuery();
            while (result.next()) {
                products.add(new Product(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getInt(4),
                        result.getDouble(5),
                        result.getString(6),
                        result.getString(7)));
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
        return products;
    }

    public List<Product> getProductByCID(int cid) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM [product] WHERE [cateID] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, cid);
            result = connect.executeQuery();
            while (result.next()) {
                products.add(new Product(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getInt(4),
                        result.getDouble(5),
                        result.getString(6),
                        result.getString(7)));
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
        return products;
    }

    public List<Product> getProductBySellID(int sid) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM [product] WHERE [sell_ID] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, sid);
            result = connect.executeQuery();
            while (result.next()) {
                list.add(new Product(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getInt(4),
                        result.getDouble(5),
                        result.getString(6),
                        result.getString(7)));
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
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM [product] WHERE [name] LIKE ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, "%" + txtSearch + "%");
            result = connect.executeQuery();
            while (result.next()) {
                list.add(new Product(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getInt(4),
                        result.getDouble(5),
                        result.getString(6),
                        result.getString(7)));
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
        return list;
    }

    public Product getProductByID(int id) {
        String query = "SELECT * FROM [product] WHERE [pid] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, id);
            result = connect.executeQuery();
            while (result.next()) {
                return new Product(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getInt(4),
                        result.getDouble(5),
                        result.getString(6),
                        result.getString(7));
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

    public List<Product> get5ProductRecommend(int cid, int curentId) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM [Product] \n"
                + "	WHERE [cateID] = ? AND [pid] <> ? \n"
                + "	ORDER BY NEWID() OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY";

        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, cid);
            connect.setInt(2, curentId);
            result = connect.executeQuery();

            while (result.next()) {
                products.add(new Product(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getInt(4),
                        result.getDouble(5),
                        result.getString(6),
                        result.getString(7)));
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
        return products;
    }

    public Integer getAmountOfProduct(int pid) {
        String query = "SELECT [amount] FROM [Product] \n"
                + "	WHERE [pid] = ?";

        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, pid);
            result = connect.executeQuery();

            if (result.next()) {
                return result.getInt(1);
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

    public boolean updateAmountOfProduct(int pid, int amount) {
        String query = "UPDATE [Product] SET [amount] = [amount] - ? WHERE [pid] = ? AND [amount] > 0";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, amount);
            connect.setInt(2, pid);
            return connect.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                if (connect != null) {
                    connect.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return false;
    }
}
