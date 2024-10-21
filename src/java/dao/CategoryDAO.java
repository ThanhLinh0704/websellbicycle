package dao;

import dal.DBContext;
import entity.*;
import java.util.*;
import java.sql.*;

public class CategoryDAO extends DBContext {

    PreparedStatement connect = null;
    ResultSet result = null;

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            connect = connection.prepareStatement(query);
            result = connect.executeQuery();
            while (result.next()) {
                list.add(new Category(
                        result.getInt(1),
                        result.getString(2)));
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
}
