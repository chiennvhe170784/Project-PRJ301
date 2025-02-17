/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import model.Cart;
import model.Customer;
import model.Item;

/**
 *
 * @author chien
 */
public class OrderDAO extends DBContext {

 public void addOrder(Customer u, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            String sql = "insert into orders values(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(3, u.getId());
            st.setDouble(2, cart.getTotalMoney());
            st.executeUpdate();
            String sql1="select top 1 id from orders order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if(rs.next()){
                int oid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into orderline values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(4, oid);
                    st2.setString(3, i.getProduct().getId());
                    st2.setInt(1, i.getQuantity());
                    st2.setDouble(2, i.getPrice());
                    st2.executeUpdate();
                }
            }
            String sql3= "update products set quantity=quantity-? where id=?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i: cart.getItems()) {
                st3.setInt(1,i.getQuantity());
                st3.setString(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
        }
 }

}
