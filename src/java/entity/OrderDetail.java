package entity;

public class OrderDetail {

    private int detailId;
    private String orderId;
    private String image;
    private int productId;
    private String productName;
    private int categoryID;
    private String categoryName;
    private int quantity;
    private double price;
    private double priceChange;

    public OrderDetail() {
    }

    public OrderDetail(String orderId, int productId, int quantity, double price, double priceChange) {
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.priceChange = priceChange;
    }

    public OrderDetail(int detailId, String orderId, String image, int productId, String productName, int categoryID, String categoryName, int quantity, double price, double priceChange) {
        this.detailId = detailId;
        this.orderId = orderId;
        this.image = image;
        this.productId = productId;
        this.productName = productName;
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.quantity = quantity;
        this.price = price;
        this.priceChange = priceChange;
    }
    
    

    public int getDetailId() {
        return detailId;
    }

    public void setDetailId(int detailId) {
        this.detailId = detailId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPriceChange() {
        return priceChange;
    }

    public void setPriceChange(double priceChange) {
        this.priceChange = priceChange;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "detailId=" + detailId + ", orderId=" + orderId + ", image=" + image + ", productId=" + productId + ", productName=" + productName + ", categoryID=" + categoryID + ", categoryName=" + categoryName + ", quantity=" + quantity + ", price=" + price + ", priceChange=" + priceChange + '}';
    }

}
