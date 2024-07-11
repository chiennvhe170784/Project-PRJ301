/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author chien
 */
@WebServlet(name = "AddProducts", urlPatterns = {"/addP"})
public class AddProducts extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProducts</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProducts at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String idP = request.getParameter("idP");
    String name = request.getParameter("nameP");
    String quantity_r = request.getParameter("quantityP");
    String price_r = request.getParameter("priceP");
    String date = request.getParameter("dateP");
    String describe = request.getParameter("describeP");
    String image = request.getParameter("imageP");
    String cid_r = request.getParameter("cidAdd");
    DAO d = new DAO();
    int cid, quantity;
    double price;
    List<Category> c = d.getAll();
    request.setAttribute("listC", c);
     // Initialize to null
    try {
        quantity = Integer.parseInt(quantity_r);
        cid = Integer.parseInt(cid_r);
        price = Double.parseDouble(price_r);
        Product p = d.getProductByPid(idP);
        if (p != null) {
            request.setAttribute("err", "Product ID already exists!");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        } else {
            d.addProduct(idP, name, quantity, price, date, describe, image, cid);
            response.sendRedirect("products");
        }
    } catch (NumberFormatException e) {
       
        request.getRequestDispatcher("addProduct.jsp").forward(request, response);
    }
}




    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
