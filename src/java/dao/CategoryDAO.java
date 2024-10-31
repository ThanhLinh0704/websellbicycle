package dao;

import dal.DBContext;
import entity.*;
import java.util.*;
import java.sql.*;

public class CategoryDAO extends DBContext {

    PreparedStatement connect = null;
    ResultSet result = null;

    //Lấy tất cả các nhóm hàng có trong Database
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM [Category]";
        try {
            connect = connection.prepareStatement(query);
            result = connect.executeQuery();
            while (result.next()) {
                list.add(new Category(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3)));
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

    // Lấy ra mã của nhóm hàng dựa trên mã sản phẩm
    public int getCategoryIDByProductID(int id) {
        String query = "SELECT [cateID] FROM [Product] WHERE [pid] = ?";
        int cateID = 0;
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, id);
            result = connect.executeQuery();
            while (result.next()) {
                cateID = result.getInt(1);
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
        return cateID;
    }

    //Lấy ra đường dẫn url dựa trên mã nhóm hàng
    public String getUrlByCategoryId(int cid) {
        String query = "SELECT [url] FROM [Category] WHERE [cid] = ?";
        String url = "";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, cid);
            result = connect.executeQuery();
            while (result.next()) {
                url = result.getString(1);
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
        return url;
    }
}
