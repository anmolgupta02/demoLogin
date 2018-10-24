<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.Driver"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String uname = request.getParameter("uname");
String pass = request.getParameter("pass");

try{
Driver d = new com.mysql.jdbc.Driver();
DriverManager.registerDriver(d);
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servletpractice","root",""); 
PreparedStatement ps = con.prepareStatement("select * from login where username=? and password=?");
ps.setString(1, uname);
ps.setString(2, pass);
ResultSet rs = ps.executeQuery();
if(rs.next()){
	out.println("welcome user");	
	request.getRequestDispatcher("index.jsp").include(request, response);
}
else{
	out.print("Invalid username or pass");
	
}

//insert, update
//select for execute Quest
//create statement for predefined paramenter if known
//preparestatement for runtime parameter fetching 
} catch(Exception e){
	
}


%>

</body>
</html>