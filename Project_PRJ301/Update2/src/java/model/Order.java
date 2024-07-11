/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author chien
 */
public class Order {
    /*   ID INT IDENTITY(1,1) PRIMARY KEY,
    OrderDate DATE NOT NULL,
    TotalMoney MONEY,
    CustomerID INT REFERENCES Customer(ID)*/
     private int id;
     private String date;
     private int cusid;
     private double totalmoney;

    public Order() {
    }

    public Order(int id, String date, int cusid, double totalmoney) {
        this.id = id;
        this.date = date;
        this.cusid = cusid;
        this.totalmoney = totalmoney;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCusid() {
        return cusid;
    }

    public void setCusid(int cusid) {
        this.cusid = cusid;
    }

    public double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(double totalmoney) {
        this.totalmoney = totalmoney;
    }
     
}
