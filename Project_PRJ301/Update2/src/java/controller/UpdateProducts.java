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
@WebServlet(name = "UpdateProducts", urlPatterns = {"/updateP"})
public class UpdateProducts extends HttpServlet {

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
            out.println("<title>Servlet UpdateProducts</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProducts at " + request.getContextPath() + "</h1>");
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
        String idP = request.getParameter("pidUpdate");
        DAO d = new DAO();
        Product p = d.getProductByPid(idP);
        request.setAttribute("pUp", p);
        List<Category> c = d.getAll();
        request.setAttribute("listC", c);
        request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
   
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
        request.setCharacterEncoding("UTF-8");
        String idP = request.getParameter("idPu");
        String name = request.getParameter("namePu");
        String quantity_r = request.getParameter("quantityPu");
        String price_r = request.getParameter("pricePu");
        String date = request.getParameter("datePu");
        String describe = request.getParameter("describePu");
        String image = request.getParameter("imagePu");
        String cid_r = request.getParameter("cidUpdate");

        int cid, quantity;
        double price;
        try {
            quantity = Integer.parseInt(quantity_r);
            cid = Integer.parseInt(cid_r);
            DAO d = new DAO();
            d.updateProduct(idP, name, quantity, price_r, date, describe, image, cid);
            response.sendRedirect("products");
        } catch (NumberFormatException e) {
        }
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
