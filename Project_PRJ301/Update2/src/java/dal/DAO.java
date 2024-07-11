/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Customer;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author chien
 */
public class DAO extends DBContext {

    //----------Category----------//
    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Category c = new Category(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("describe"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
//-----------------Order------------------
    public List<OrderDetail> getAllOrder() {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT SUM(quantity) AS total_quantity, Price, ProductID\n" +
"FROM Orderline\n" +
"GROUP BY ProductID, Price;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail ord = new OrderDetail(rs.getInt(1),
                        rs.getDouble(2),
                        rs.getString(3),
                        0);
                list.add(ord);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public String getTopOrder() {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select top 1 * from Orderline order by quantity desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                OrderDetail c = new OrderDetail(rs.getInt(1),
                        rs.getDouble(2),
                        rs.getString(3),
                        rs.getInt(4));
                return c.getPid();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public Category getCategoriById(int id) {
        String sql = "select * from Categories where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"), rs.getString("describe"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    //update Category
    public void update(Category c) {
        String sql = "update categories set name=?,describe=? where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getDescribe());
            st.setInt(3, c.getId());
            st.executeUpdate();
           
        } catch (SQLException e) {

        }
    }
//-----------------------PRODUCTS----------------------//

    /*    private String id,name;
    private int quantity;
    private double price;
    private String releaseDate,describe,image;
    private Category category;*/
    public void addProduct(String id, String name, int quantity, double price, String date, String describe, String image, int cid) {

        String sql = "INSERT INTO [dbo].[Products] "
                + "([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.setString(2, name);
            st.setInt(3, quantity);
            st.setDouble(4, price);
            st.setString(5, date);
            st.setString(6, describe);
            st.setString(7, image);
            st.setInt(8, cid);
            st.executeUpdate();
        } catch (SQLException e) {
            // Xử lý ngoại lệ SQL ở đây
        }
    }

    public void updateProduct(String id, String name, int quantity, String price, String date, String describe, String image, int cid) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [name] =?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[releaseDate] = ?\n"
                + "      ,[describe] =?\n"
                + "      ,[image] =?\n"
                + "      ,[cid] =?\n"
                + " WHERE id=?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(8, id);
            st.setInt(2, quantity);
            st.setString(3, price);
            st.setString(1, name);
            st.setString(4, date);
            st.setString(5, describe);
            st.setString(6, image);
            st.setInt(7, cid);
//            ResultSet rs= st.executeQuery(); do không trả về nên dùng là sai
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteProduct(String id) {
        String sql = "DELETE FROM [dbo].[Products]\n"
                + " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }

    }

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.id\n"
                + "      ,p.name\n"
                + "      ,p.quantity\n"
                + "      ,p.price\n"
                + "      ,p.releaseDate\n"
                + "      ,p.describe\n"
                + "      ,p.image\n"
                + "      ,c.id as cid, c.name as cname\n"
                + "  FROM Products p inner join categories c on(c.id=p.cid) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("releaseDate"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        new Category(rs.getInt("cid"),
                                rs.getString("cname"), ""));
                list.add(p);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.id\n"
                + "      ,p.name\n"
                + "      ,p.quantity\n"
                + "      ,p.price\n"
                + "      ,p.releaseDate\n"
                + "      ,p.describe\n"
                + "      ,p.image\n"
                + "      ,c.id as cid, c.name as cname\n"
                + "  FROM Products p inner join categories c on(c.id=p.cid) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("releaseDate"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        new Category(rs.getInt("cid"),
                                rs.getString("cname"), ""));
                list.add(p);
            }
        } catch (SQLException e) {

        }

        return list;
    }

    public Product getProductByPid(String pid) {
        Product p = null; // Initialize the Product object

        String sql = "SELECT * FROM products p WHERE p.id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Initialize the Product object if there are results
                p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoriById(rs.getInt("cid"));
                p.setCategory(c);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }

        return p;
    }

    //doc tu bang products theo cid
    public List<Product> getProductsByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from products where cid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getInt("price"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoriById(rs.getInt("cis"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> search(int cid, String key) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.id\n"
                + "      ,p.name\n"
                + "      ,p.quantity\n"
                + "      ,p.price\n"
                + "      ,p.releaseDate\n"
                + "      ,p.describe\n"
                + "      ,p.image\n"
                + "      ,c.id as cid, c.name as cname\n"
                + "  FROM Products p inner join categories c on(c.id=p.cid)"
                + " where cid=? and p.name like '%" + key + "%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("releaseDate"),
                        rs.getString("describe"),
                        rs.getString("image"),
                        new Category(rs.getInt("cid"),
                                rs.getString("cname"), "describe"));
                list.add(p);
            }
        } catch (SQLException e) {

        }

        return list;
    }

    public List<Product> search(int cid, Double price1, Double price2, String mieuta, String date1, String date2) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.id\n"
                + "      ,p.name\n"
                + "      ,p.quantity\n"
                + "      ,p.price\n"
                + "      ,p.releaseDate\n"
                + "      ,p.describe\n"
                + "      ,p.image\n"
                + "      ,c.id as cid, c.name as cname\n"
                + "  FROM Products p inner join categories c on(c.id=p.cid)"
                + " where 1=1";
        if (cid != 0) {
            sql += " and p.cid=" + cid;
        }
        if (mieuta != null && !mieuta.equals("")) {
            sql += " and (p.name like '%" + mieuta + "%' or p.describe like '%" + mieuta + "%' or p.image like '%" + mieuta + "%')";
        }
        if (date1 != null && !date1.equals("")) {
            sql += " and p.releaseDate >= '" + date1 + "'";
        }
        if (date2 != null && !date2.equals("")) {
            sql += " and p.releaseDate <= '" + date2 + "'";
        }
        if (price1 != null && price1 != 0.0) {
            sql += " and p.price>=" + price1;
        }
        if (price2 != null && price2 != 0.0) {
            sql += " and p.price<=" + price2;
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoriById(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public int getNumPage() {
        String sql = "select count (*) from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 6;
                if (total % 6 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> getPaging(int index) {
        String sql = "select * from Products order by price offset ? rows fetch 5 rows only";
        List<Product> arr = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoriById(rs.getInt("cid"));
                p.setCategory(c);
                arr.add(p);
            }
        } catch (SQLException e) {
        }
        return null;
    }

    //------------------Account---------------
    public Customer check(String user, String pass) {
        String sql = "SELECT [ID], [Amount], [Username], [Password], [role] FROM [dbo].[Customer] WHERE Username = ? AND Password = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer a = new Customer(rs.getInt("id"),
                        rs.getDouble("amount"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role")
                );
                return a;
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }

        return null;
    }

    public void change(String user, String pass) {
        String sql = "UPDATE customer SET password=? WHERE username=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, user);
            ps.executeUpdate();
        } catch (SQLException e) {
            // Log or handle the exception appropriately
            e.printStackTrace();
        }
    }

    public boolean checkToSign(String user) {
        String sql = "SELECT [Username]\n"
                + "      ,[Password]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[Customer]\n"
                + "    where Username =?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }

        return false;
    }

    public boolean checkToSign(String user, String pass) {
        String sql = "SELECT [Username]\n"
                + "      ,[Password]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[Customer]\n"
                + "    where Username =? and password=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }

        return false;
    }

    public void create(String user, String pass) {
        String sql = "INSERT INTO [dbo].[customer]\n"
                + "           ([Username]\n"
                + "           ,[Password]\n"
                + "           ,[role])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.setInt(3, 0);
//            ResultSet rs= st.executeQuery(); do không trả về nên dùng là sai
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //----------------Giỏ hàng ----------------
    public Customer getAccount(String user, String pass) {
        String sql = "select * from customer where username =? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Customer(rs.getInt("id"),
                        rs.getDouble("amout"),
                        user, pass,
                        rs.getInt("role"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
public Customer getAccount(String user) {
    String sql = "SELECT * FROM customer WHERE username = ?";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setString(1, user);
        try (ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                return new Customer(
                    rs.getInt("id"),
                    rs.getDouble("amount"), // Sửa thành "amount"
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getInt("role")
                );
            }
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ: ghi log hoặc ném ngoại lệ để bên gọi xử lý
        e.printStackTrace();
    }
    return null;
}



    public static void main(String[] args) {
        DAO d = new DAO();
        Customer c = d.getAccount("admin");
     System.out.println(c.getPassword());
        
    }
}
