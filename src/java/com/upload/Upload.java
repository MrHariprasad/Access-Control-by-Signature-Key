/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upload;

import com.database.Queries;
import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author GKV
 */
@MultipartConfig(maxFileSize=16*1024*1024)
public class Upload extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
        String email=(String)session.getAttribute("email");
        try{
            String filepath="C:/Sample/";
            MultipartRequest mr=new MultipartRequest(request,filepath);
           File p=mr.getFile("file");
           String fname=p.getName();
            
    
           KeyGenerator keygen=KeyGenerator.getInstance("AES");
           keygen.init(128);
           SecretKey s=keygen.generateKey();
           //converting secret keyto string
           byte[] b=s.getEncoded();//encoding secret key
           String skey=Base64.encode(b);
        
           
           BufferedReader br=new BufferedReader(new FileReader(p));
           StringBuffer sb=new StringBuffer();
           String temp=null;
           while((temp=br.readLine())!=null){
               sb.append(temp);
           }
           String data=sb.toString();
           
           String cipher=Encryption.encrypt(data, s);
           
         int i=Queries.getExecuteUpdate("insert into file values(null,'"+email+"','"+fname+"','"+data+"','"+cipher+"','"+skey+"',now())");
           if(i>0){
           
                                /*Cloud Start*/
                                File f1 = new File("C://Sample//"+fname);
                                FileWriter fw = new FileWriter(f1);
                                fw.write(cipher);
                                fw.close();
                                Ftpcon ftpcon = new Ftpcon();
                                ftpcon.upload(f1, fname);
                              /*Cloud End*/
           response.sendRedirect("AFileUpload.jsp?msg=Success");
           }else{
             response.sendRedirect("AFileUpload.jsp?msg=Failed");  
           }
            
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
