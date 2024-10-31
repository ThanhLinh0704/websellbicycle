package entity;

import java.util.Date;

public class DiscountCode {

    private int codeID;
    private String code;
    private int discountPercentage;
    private Date expiryDate;
    private int amount;
    private boolean isActive;

    public DiscountCode() {
    }

    public DiscountCode(int codeID, String code, int discountPercentage, Date expiryDate, int amount, boolean isActive) {
        this.codeID = codeID;
        this.code = code;
        this.discountPercentage = discountPercentage;
        this.expiryDate = expiryDate;
        this.amount = amount;
        this.isActive = isActive;
    }

    public int getCodeID() {
        return codeID;
    }

    public void setCodeID(int codeID) {
        this.codeID = codeID;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(int discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "DiscountCode{" + "codeID=" + codeID + ", code=" + code + ", discountPercentage=" + discountPercentage + ", expiryDate=" + expiryDate + ", amount=" + amount + ", isActive=" + isActive + '}';
    }

}
