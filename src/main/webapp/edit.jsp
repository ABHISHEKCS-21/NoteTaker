<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.hibernate.*"%>
<%@ page import="com.helper.*"%>
<%@ page import="com.mypack.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container">
		<%@include file="navbar.jsp"%>
		<h2>This is Edit Page</h2>
		<%
		int noteId=Integer.parseInt(request.getParameter("note_id"));
		Session s=FactoryProvider.getFactory().openSession();
		Note note=(Note)s.get(Note.class, noteId);
	
		%>
		<form action="EditServlet" method="post" >
<input value="<%= note.getId() %>" name="noteId" type="hidden" />
		
  <div class="form-group">
    <label for="title">Note Title</label> <input
     name="title" required type="text" 
     class="form-control" 
     id="title" 
     aria-describedby="emailHelp" 
     
     placeholder="Title"
     value=<%=note.getTitle() %>
     />
    
  </div>
  <div class="form-group">
    <label for="content">Content</label>
    <textarea 
    name="content"
    required id="content" 
    placeholder="Enter your content here"
    class=form-control
    style="height:300px;">
    <%=note.getContent() %>
    </textarea>
  </div>
  
  <div class ="container text-center" >
  <button type="submit" class="btn btn-success">Save</button>
  </div>
</form>
		
	</div>
</body>
</html>