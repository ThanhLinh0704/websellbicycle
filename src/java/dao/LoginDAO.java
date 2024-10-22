package dao;

import dal.DBContext;
import entity.*;
import java.sql.*;

public class LoginDAO extends DBContext {

    PreparedStatement connect = null;
    PreparedStatement connect1 = null;
    ResultSet result = null;

    public Account login(String user, String pass) {
        String query = "SELECT * FROM [account] WHERE [user] = ? AND [pass] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, user);
            connect.setString(2, pass);
            result = connect.executeQuery();
            while (result.next()) {
                return new Account(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getInt(4),
                        result.getInt(5));
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

    public Account checkAccountExist(String user) {
        String query = "SELECT * FROM [account] WHERE [user] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, user);
            result = connect.executeQuery();
            while (result.next()) {
                return new Account(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getInt(4),
                        result.getInt(5));
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

    public void signup(String user, String pass, String name, Boolean gender, Date dob, String phone) {
        String insertAccountSQL = "INSERT [Account] ([user], [pass], [isSell], [isAdmin]) VALUES (?, ?, ?, ?)";
        String insertUserSQL = "INSERT [User]([uID], [name], [gender], [dob], [phone]) VALUES (?, ?, ?, ?, ?)";

        try {
            connect = connection.prepareStatement(insertAccountSQL, Statement.RETURN_GENERATED_KEYS);
            connect.setString(1, user);
            connect.setString(2, pass);
            connect.setBoolean(3, false);
            connect.setBoolean(4, false);
            connect.executeUpdate();

            int uID = 0;
            result = connect.getGeneratedKeys();
            if (result.next()) {
                uID = result.getInt(1);
            }

            connect1 = connection.prepareStatement(insertUserSQL);
            connect1.setInt(1, uID);
            connect1.setString(2, name);
            connect1.setBoolean(3, gender);
            connect1.setDate(4, dob);
            connect1.setString(5, phone);
            connect1.executeUpdate();

            connection.commit();

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
