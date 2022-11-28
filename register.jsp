<%-- 
    Document   : register
    Created on : 4 Sep, 2022, 7:57:45 PM
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
    

          String u=request.getParameter("uid");
       	String pass=request.getParameter("pwd");
       
       	String f=request.getParameter("fname");
       	String l=request.getParameter("lname");
        	
                
       	String a=request.getParameter("addr");
        	String c=request.getParameter("city");
       	int p=Integer.parseInt(request.getParameter("pin"));
        	String st=request.getParameter("state");
       	String coun=request.getParameter("country");
        	String ccdn=request.getParameter("ccdnm");
       	int cc=Integer.parseInt(request.getParameter("ccdno"));
        String e=request.getParameter("email");
        
        
        
       	Class.forName("org.apache.derby.jdbc.ClientDriver");
       	Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
       	
        
                    PreparedStatement ps=con.prepareStatement("insert into reg values(?,?,?,?,?,?,?,?,?,?,?,?)");
       	ps.setString(1,u); 	 
       	ps.setString(2,pass);
       
       	ps.setString(3,f);
       	ps.setString(4,l);
       
        
        ps.setString(5,a);
       	ps.setString(6,c);
       	ps.setInt(7,p);
        ps.setString(8,st);
       	ps.setString(9,coun);
       	ps.setString(10,ccdn);
        ps.setInt(11,cc);
        ps.setString(12,e);
       	
       
        	int i=ps.executeUpdate();
       	if(i>0)
               	{
                   	out.println("DATA SAVED");
                        response.sendRedirect("menu.html");
               	}
       	else
       	{
           	out.println("NOTHING TO SAVE");
       	}
         	ps.close();
        	}
catch(Exception e)
        {
    out.println(e);
}
       %>
    </body>
</html>
