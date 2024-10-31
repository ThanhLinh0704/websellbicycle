package entity;

public class ProductManager {

    private int id;
    private String name;
    private String image;
    private int amount;
    private double price;
    private String title;
    private String description;
    private int cid;
    private String category;
    private int sellID;

    public ProductManager() {
    }

    public ProductManager(int id, String name, String image, int amount, double price, String title, String description, int cid, String category, int sellID) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.amount = amount;
        this.price = price;
        this.title = title;
        this.description = description;
        this.cid = cid;
        this.category = category;
        this.sellID = sellID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getSellID() {
        return sellID;
    }

    public void setSellID(int sellID) {
        this.sellID = sellID;
    }

    @Override
    public String toString() {
        return "ProductManager{" + "id=" + id + ", name=" + name + ", image=" + image + ", amount=" + amount + ", price=" + price + ", title=" + title + ", description=" + description + ", cid=" + cid + ", category=" + category + ", sellID=" + sellID + '}';
    }

}
