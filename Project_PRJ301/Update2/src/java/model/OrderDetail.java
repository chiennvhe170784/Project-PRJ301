/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author chien
 */
public class OrderDetail {
    /*   Quantity INT NOT NULL,
    Price DECIMAL NOT NULL,
    ProductID VARCHAR(20) REFERENCES Products(ID),
    OrderID INT REFERENCES Orders(ID)*/
    private int quantity;
    private double price;
    private String pid;
    private int oid;

    public OrderDetail() {
    }

    public OrderDetail(int quantity, double price, String pid, int oid) {
        this.quantity = quantity;
        this.price = price;
        this.pid = pid;
        this.oid = oid;
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

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

 

  

}
