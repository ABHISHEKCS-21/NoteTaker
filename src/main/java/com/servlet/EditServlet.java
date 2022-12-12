package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;
import com.mypack.Note;

/**
 * Servlet implementation class EditServlet
 */
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int nId=Integer.parseInt(request.getParameter("noteId"));
		String title1=request.getParameter("title");
		String content1=request.getParameter("content");
		
		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		
		Note note=(Note)s.get(Note.class, nId);
		
		note.setTitle(title1);
		note.setContent(content1);
		note.setAddedDate( new Date());
		
		tx.commit();
		s.close();
		response.sendRedirect("all_notes.jsp");
	}

}
