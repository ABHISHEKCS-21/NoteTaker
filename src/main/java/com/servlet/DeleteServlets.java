package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;
import com.mypack.Note;

/**
 * Servlet implementation class DeleteServlets
 */
public class DeleteServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteServlets() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try{
			int id=Integer.parseInt(request.getParameter("note_id").trim());
			
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
				Note note=(Note)s.get(Note.class,id);
				s.delete(note);
				tx.commit(); 
				
				s.close();
				response.sendRedirect("all_notes.jsp");
			}catch(Exception e) 
			{
			System.out.println(e);	
			}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
