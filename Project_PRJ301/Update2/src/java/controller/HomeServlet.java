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
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

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
            out.println("<title>Servlet HomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
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
        String cid_r = request.getParameter("cid");
        String mieuta = request.getParameter("mieuta");
        String from = request.getParameter("date1");
        String to = request.getParameter("date2");
        String price1_r = request.getParameter("price1");
        String price2_r = request.getParameter("price2");
        Double price1, price2;

        int cid;
        double pricefrom, priceto;

        // Số sản phẩm trên mỗi trang
        int recordsPerPage = 9;
        int currentPage = 1;

        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }

        List<Product> listP = null;
        DAO d = new DAO();

        try {
            cid = (cid_r == null || cid_r.equals("")) ? 0 : Integer.parseInt(cid_r);
            pricefrom = (price1_r == null || price1_r.equals("")) ? 0.0 : Double.parseDouble(price1_r);
            priceto = (price2_r == null || price1_r.equals("")) ? 0.0 : Double.parseDouble(price2_r);

            listP = d.search(cid, pricefrom, priceto, mieuta, from, to);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        List<Category> listC = d.getAll();
        request.setAttribute("dataC", listC);

        // Phân trang
        if (listP != null) {
            int totalRecords = listP.size();
            int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
                    String pid2 = d.getTopOrder();
        Product p2 = d.getProductByPid(pid2);
        request.setAttribute("noibat", p2);
            // Lấy sublist cho trang hiện tại
            int startIdx = (currentPage - 1) * recordsPerPage;
            int endIdx = Math.min(startIdx + recordsPerPage, totalRecords);
            List<Product> sublistP = listP.subList(startIdx, endIdx);
            
            request.setAttribute("dataP", sublistP);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", currentPage);
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
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
