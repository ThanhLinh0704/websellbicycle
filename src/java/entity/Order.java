package entity;

import java.util.Date;
import java.util.List;

public class Order {

    private String orderID;
    private int accountID;
    private String code;
    private double totalPrice;
    private Date orderDate;
    private Date completedDate;
    private String methodName;
    private int statusId;
    private String statusName;
    private List<OrderDetail> orderDetails;
    private String note;

    public Order() {
    }

    public Order(String orderID, int accountID, String code, double totalPrice, Date orderDate, Date completedDate, String methodName, int statusId, String statusName) {
        this.orderID = orderID;
        this.accountID = accountID;
        this.code = code;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.completedDate = completedDate;
        this.methodName = methodName;
        this.statusId = statusId;
        this.statusName = statusName;
    }

    public Order(String orderID, int accountID, String code, double totalPrice, Date orderDate, Date completedDate, String methodName, int statusId, String statusName, String note) {
        this.orderID = orderID;
        this.accountID = accountID;
        this.code = code;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.completedDate = completedDate;
        this.methodName = methodName;
        this.statusId = statusId;
        this.statusName = statusName;
        this.note = note;
    }

    public Order(String orderID, int accountID, String code, double totalPrice, Date orderDate, Date completedDate, String methodName, int statusId, String statusName, List<OrderDetail> orderDetails, String note) {
        this.orderID = orderID;
        this.accountID = accountID;
        this.code = code;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.completedDate = completedDate;
        this.methodName = methodName;
        this.statusId = statusId;
        this.statusName = statusName;
        this.orderDetails = orderDetails;
        this.note = note;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getCompletedDate() {
        return completedDate;
    }

    public void setCompletedDate(Date completedDate) {
        this.completedDate = completedDate;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", accountID=" + accountID + ", code=" + code + ", totalPrice=" + totalPrice + ", orderDate=" + orderDate + ", completedDate=" + completedDate + ", methodName=" + methodName + ", statusId=" + statusId + ", statusName=" + statusName + '}';
    }

}
