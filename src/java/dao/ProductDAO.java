package dao;

import dal.DBContext;
import entity.*;
import java.util.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

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
                        result.getDouble(4),
                        result.getString(5),
                        result.getString(6)));
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
                        result.getDouble(4),
                        result.getString(5),
                        result.getString(6)));
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
                        result.getDouble(4),
                        result.getString(5),
                        result.getString(6)));
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
                        result.getDouble(4),
                        result.getString(5),
                        result.getString(6)));
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
                        result.getDouble(4),
                        result.getString(5),
                        result.getString(6)));
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
                        result.getDouble(4),
                        result.getString(5),
                        result.getString(6));
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

    
    public void deleteProduct(String pid) {
        String query = "DELETE FROM [product] WHERE [pid] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, pid);
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

    
    public void insertProduct(String name, String image, String price, String title, String description, String category, int sid) {
        String query = "INSERT product \n"
                + "([name], [image], [price], [title], [description], [cateID], [sell_ID])\n"
                + "VALUES(?,?,?,?,?,?,?)";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, name);
            connect.setString(2, image);
            connect.setString(3, price);
            connect.setString(4, title);
            connect.setString(5, description);
            connect.setString(6, category);
            connect.setInt(7, sid);
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
    
  public void editProduct2(String name, String image, double price, String title, String description, int category, int pid) {
    String sql = "UPDATE [dbo].[Product] " +
                 "SET [name] = ?, " +
                 "[image] = ?, " +
                 "[price] = ?, " +
                 "[title] = ?, " +
                 "[description] = ?, " +
                 "[cateID] = ? " +
                 "WHERE Product.pid = ?";

    try {
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, name);
        stm.setString(2, image);
        stm.setDouble(3, price);
        stm.setString(4, title);
        stm.setString(5, description);
        stm.setInt(6, category);
        stm.setInt(7, pid);
        stm.executeUpdate();

    } catch (SQLException ex) {
        Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
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
                        result.getDouble(4),
                        result.getString(5),
                        result.getString(6)));
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
    
  
}
