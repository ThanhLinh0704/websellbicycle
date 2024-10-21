package dao;

import dal.DBContext;
import entity.*;
import java.util.*;
import java.sql.*;

public class LoginDAO extends DBContext {

    PreparedStatement connect = null;
    ResultSet result = null;

    public Account login(String user, String pass) {
        String query = "SELECT * FROM account WHERE user = ? AND pass = ?";
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
        String query = "SELECT * FROM account WHERE user = ?";
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

    public void singup(String user, String pass) {
        String query = "INSERT INTO account VALUES(?,?,0,0)";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, user);
            connect.setString(2, pass);
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
