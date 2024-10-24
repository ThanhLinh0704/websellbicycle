package dao;

import dal.DBContext;
import entity.*;
import java.util.*;
import java.sql.*;

public class ProductDAO extends DBContext {

    PreparedStatement connect = null;
    ResultSet result = null;

    // Lấy tất cả sản phẩm có trong Database
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

    // Lấy ra 3 sản phẩm mới nhất được thêm vào trong Database
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

    // Lấy tất cả sản phẩm trong database có cùng chỉ số cateID
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

    // Lấy tất cả sản phẩm trong database có cùng chỉ số sell_ID
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

    //Tìm kiếm sản phẩm trong Database theo tên
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

    // Lấy sản phẩm trong database có cùng chỉ số id
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

    // Thực thi việc xoá sản phẩm trong hệ thống database
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

    // Thêm 1 sản phẩm vào hệ thống database
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

    // Chỉnh sửa 1 sản phẩm đã có trong database
    public void editProduct(String name, String image, String price, String title, String description, String category, String pid) {
        String query = "UPDATE [product]\n"
                + "SET [name] = ?,\n"
                + "[image] = ?,\n"
                + "[price] = ?,\n"
                + "[title] = ?,\n"
                + "[description] = ?,\n"
                + "[cateID] = ?\n"
                + "WHERE [id] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, name);
            connect.setString(2, image);
            connect.setString(3, price);
            connect.setString(4, title);
            connect.setString(5, description);
            connect.setString(6, category);
            connect.setString(7, pid);
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

    // Đề xuất ra 5 sản phẩm cùng nhóm hàng với sản phẩm hiện tại <không bao gồm sản phẩm hiện tại>
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
