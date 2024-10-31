package dao;

import dal.DBContext;
import entity.PaymentMethod;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentMethodDAO extends DBContext {

    PreparedStatement connect = null;
    ResultSet result = null;

    public List<PaymentMethod> getAllPaymentMethod() {
        List<PaymentMethod> paymentMethods = new ArrayList<>();
        String query = "SELECT * FROM [PaymentMethod]";

        try {
            connect = connection.prepareStatement(query);
            result = connect.executeQuery();
            while (result.next()) {

                paymentMethods.add(
                        new PaymentMethod(
                                result.getInt(1),
                                result.getString(2)
                        )
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
        return paymentMethods;
    }
}
