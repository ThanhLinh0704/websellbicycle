package dao;

import dal.DBContext;
import entity.*;
import java.sql.*;

public class UserDAO extends DBContext {

    PreparedStatement connect = null;
    ResultSet result = null;

    public User getInfomationUser(int uID) {
        String query = "SELECT * FROM [User] WHERE [uID] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, uID);
            result = connect.executeQuery();
            while (result.next()) {
                return new User(
                        result.getInt(1),
                        result.getString(2),
                        result.getBoolean(3),
                        result.getDate(4),
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

    public void editUser(String name, boolean gender, Date dob, String phone, String address, int uID) {
        String query = "UPDATE [User]\n"
                + "	SET [name] = ?,\n"
                + "		[gender] = ?,\n"
                + "		[dob] = ?,\n"
                + "		[phone] = ?,\n"
                + "		[address] = ?\n"
                + "		WHERE [uID] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, name);
            connect.setBoolean(2, gender);
            connect.setDate(3, dob);
            connect.setString(4, phone);
            connect.setString(5, address);
            connect.setInt(6, uID);
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

    public void updatePassword(String newPass, int uid) {
        String query = "UPDATE [Account] SET [pass] = ? WHERE [uID] = ?";

        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, newPass);
            connect.setInt(2, uid);
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
