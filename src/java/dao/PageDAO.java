package dao;

import dal.DBContext;
import entity.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author laptop lenovo
 */
public class PageDAO extends DBContext {

    public int getNumberPage() {
        String sql = "SELECT count(*) from Product";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = total / 8;
                if (total % 8 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Product> getPaging(int index, int accid) {
        PreparedStatement connect = null;
        ResultSet result = null;
        List<Product> products = new ArrayList<>();
        String query = "SELECT * \n"
                + "FROM Product p\n"
                + "WHERE p.sell_ID = ?\n"
                + "ORDER BY p.pid\n"
                + "OFFSET ? ROWS\n"
                + "FETCH FIRST 8 ROWS ONLY;";
        try {
            connect = connection.prepareStatement(query);
            connect.setInt(1, accid);
            connect.setInt(2, (index - 1) * 8);
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

}
