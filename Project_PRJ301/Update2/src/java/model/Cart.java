/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author chien
 */
public class Cart {
    
    private List<Item> items;
    
    public Cart() {
        items = new ArrayList<>();
    }
    
    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    public int getQuantityById(String id) {
        return getItemById(id).getQuantity();
    }
    
    private Item getItemById(String id) {
        for (Item i : items) {
            if (i.getProduct().getId().equals(id)) {
                return i;
            }
        }
        return null;
    }
    
    public void addItem(Item t) {
        if (getItemById(t.getProduct().getId()) != null) {
            Item m = getItemById(t.getProduct().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }
    
    public void removeItem(String id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }
    
    public double getTotalMoney() {
        double t = 0;
        for (Item i : items) {
            t += i.getQuantity() * i.getPrice();
            return t;
        }
        return t;
    }

    private Product getProductsById(String id, List<Product> list) {
        for (Product product : list) {
            if (product.getId().equals(id)) {
                return product;
            }
        }
        return null;
    }

    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {
            
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split(",");
                for (String i : s) {
                    String[] n = i.split(":");
                    String id = n[0];
                    int quantity = Integer.parseInt(n[1]);
                    Product p = getProductsById(id, list);
                    Item t = new Item(p, quantity, p.getPrice() * 1.25);
                    addItem(t);
                }
            }
        } catch (NumberFormatException e) {
        }
    }
}
