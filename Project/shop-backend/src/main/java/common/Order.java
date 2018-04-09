package common;

import java.util.Date;

public class Order {
    private int id;
    private int price;
    private int customerId;
    private Date dateCreated;
    private String status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Order(int id, int price, int customerId, Date dateCreated, String status) {
        this.id = id;
        this.price = price;
        this.customerId = customerId;
        this.dateCreated = dateCreated;
        this.status = status;
    }
}
