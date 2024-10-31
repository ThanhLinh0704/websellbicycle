package dao;

import entity.*;
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DiscountCodeDAO extends DBContext {

    PreparedStatement connect = null;
    ResultSet result = null;

    public List<DiscountCode> getAllDiscountCode() {
        List<DiscountCode> discountCodes = new ArrayList<>();
        String query = "SELECT * FROM [DiscountCode]";
        try {
            connect = connection.prepareStatement(query);
            result = connect.executeQuery();
            while (result.next()) {
                discountCodes.add(new DiscountCode(
                        result.getInt(1),
                        result.getString(2),
                        result.getInt(3),
                        result.getDate(4),
                        result.getInt(5),
                        result.getBoolean(6))
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

        return discountCodes;
    }

    public DiscountCode getDiscountCodeByCode(String code) {
        String query = "SELECT * FROM [DiscountCode] WHERE [code] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, code);
            result = connect.executeQuery();
            if (result.next()) {
                return new DiscountCode(
                        result.getInt(1),
                        result.getString(2),
                        result.getInt(3),
                        result.getDate(4),
                        result.getInt(5),
                        result.getBoolean(6));
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

    public boolean checkDiscountCodeByCode(String code) {
        String query = "SELECT * FROM [DiscountCode]\n"
                + "	WHERE [code]  = ? AND [expiryDate] >= CAST(GETDATE() AS DATE) AND [amount] > 0 AND [isActive] = 1";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, code);
            result = connect.executeQuery();
            if (result.next() && result.getInt(1) > 0) {
                return true;
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
        return false;
    }

    public Integer getDiscountPercentage(String code) {
        String query = "SELECT [discountPercentage] FROM [DiscountCode]\n"
                + "	WHERE [code] = ?";

        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, code);
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

    public Integer getCodeID(String code) {
        String query = "SELECT [codeID] FROM [DiscountCode]\n"
                + "	WHERE [code] = ?";

        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, code);
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

    public boolean useDiscountCode(String code) {
        String query = "UPDATE [DiscountCode] SET [amount] = [amount] - 1 WHERE [code] = ? AND [amount] > 0";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, code);
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

    public boolean addDiscountCode(DiscountCode discountCode) {
        String query = "INSERT INTO [DiscountCode] ([code], [discountPercentage], [expiryDate], [amount], [isActive]) VALUES (?, ?, ?, ?, ?)";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, discountCode.getCode());
            connect.setInt(2, discountCode.getDiscountPercentage());
            connect.setDate(3, new java.sql.Date(discountCode.getExpiryDate().getTime()));
            connect.setInt(4, discountCode.getAmount());
            connect.setBoolean(5, discountCode.isIsActive());
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

    public boolean updateDiscountCode(DiscountCode discountCode) {
        String query = "UPDATE [DiscountCode] SET [discountPercentage] = ?, [expiryDate] = ?, [amount] = ?, [isActive] = ? WHERE [code] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, discountCode.getDiscountPercentage());
            connect.setDate(2, new java.sql.Date(discountCode.getExpiryDate().getTime()));
            connect.setInt(3, discountCode.getAmount());
            connect.setBoolean(4, discountCode.isIsActive());
            connect.setString(5, discountCode.getCode());
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

    public boolean deleteDiscountCode(String code) {
        String query = "DELETE FROM [DiscountCode] WHERE [code] = ?";
        try {
            connect = connection.prepareStatement(query);
            connect.setString(1, code);
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
