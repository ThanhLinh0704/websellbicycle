package entity;

import java.util.Date;

public class User {

    private int id;
    private String name;
    private boolean gender;
    private Date dob;
    private String phone;
    private String address;

    public User() {
    }

    public User(int id, String name, boolean gender, Date dob, String phone, String address) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.address = address;
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

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", gender=" + gender + ", dob=" + dob + ", phone=" + phone + ", address=" + address + '}';
    }

}
