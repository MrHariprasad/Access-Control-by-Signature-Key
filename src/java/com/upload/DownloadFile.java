/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upload;

import com.database.Queries;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GKV
 */
public class DownloadFile extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String id=request.getParameter("id");
            String fname = null;
            String data=null;
          String skey=null;
            ResultSet rt = Queries.getExecuteQuery("select * from file where id='" +id + "'");
            if (rt.next()) {
                fname = rt.getString("fname");
                skey = rt.getString("skey");
      data=rt.getString("cipher");
            } else {
                out.println("error while retreiving data");
            }
           
            response.setHeader("Content-Disposition", "attachment;filename=\"" + fname + "\"");
            Decryption d=new Decryption();
            String plaindata=d.decrypt(data, skey);
            out.write(plaindata);
        }catch(Exception e){
            System.out.println(e);
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
        processRequest(request, response);
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
