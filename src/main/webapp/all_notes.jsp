<%@page import="org.hibernate.*"%>
<%@ page import="com.helper.*"%>
<%@ page import="com.mypack.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h2 class="text-uppercase">All Notes</h2>

		<div class="row">
			<div class="col-12">
				<%
					Session s = FactoryProvider.getFactory().openSession();
					Query q = s.createQuery("from Note");
					List<Note> list = q.list();
					for (Note note : list) {
					%>
<div class="card mt-3" >
  <img src="img/pic.png" style="max-width:50px;" class="card-img-top p-1" alt="...">
  <div class="card-body">
    <h5 class="card-title"><%=note.getTitle() %></h5>
    <p class="card-text"><%=note.getContent() %></p>
    
    <div class="container text-right">
    <a href="DeleteServlets?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
    <a href="edit.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Update</a>
    
    </div>
  </div>
</div>
					<% 
						//out.println(note.getId() + " :" + note.getTitle() + ": " + note.getContent() + "<br>");
					}
					s.close();
				%>


			</div>
		</div>


	</div>
</body>
</html>