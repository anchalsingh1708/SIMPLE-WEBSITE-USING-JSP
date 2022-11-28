<%-- 
    Document   : adminlogin
    Created on : 6 Sep, 2022, 7:54:08 PM
    Author     : ancha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
    	try{
           	 
        	String username=request.getParameter("t1");
        	String pass=request.getParameter("t2");
        	Class.forName("org.apache.derby.jdbc.ClientDriver");
        	Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
        	PreparedStatement ps=c.prepareStatement("select * from adminlogin where username=? and password=? ");
        	ps.setString(1,username);
        	ps.setString(2,pass);
        	ResultSet rs=ps.executeQuery();
        	if(rs.next())
        	{
          	RequestDispatcher rd=request.getRequestDispatcher("Admincart.html");
          	rd.forward(request, response);
        	}
        	else{
            	out.println("invalid user");
        	}
    	}
    	catch(Exception e)
    	{
        	out.println(e);
    	}
        	%>
    </body>
</html>
