<%-- 
    Document   : cartlist.jsp
    Created on : 6 Sep, 2022, 7:17:41 PM
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
           	 
        	String ino=request.getParameter("t1");
        	String iname=request.getParameter("t2");
        	String rate=request.getParameter("t3");
         	
        	
           	 
       	 
        	Class.forName("org.apache.derby.jdbc.ClientDriver");
        	Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
                if(request.getParameter("b1")!=null)
                {
        	PreparedStatement ps=c.prepareStatement("insert into cart values(?,?,?)");
        	ps.setString(1,ino);
        	ps.setString(2,iname);
        	ps.setString(3,rate);
        	int i=ps.executeUpdate();
        	if(i>0)
        	{
            	out.println("data saved");
        	}
        	else
        	{
            	out.println("data not saved");
        	}
                }
                if(request.getParameter("b2")!=null)
                {
        	PreparedStatement ps=c.prepareStatement("update cart set rate=? where ino=?");
        	ps.setString(1,rate);
        	ps.setString(2,ino);
        	int i=ps.executeUpdate();
        	if(i>0)
        	{
            	out.println("data update");
        	}
        	else
        	{
            	out.println("data not updated");
        	}
                }
                if(request.getParameter("b3")!=null)
                {
        	PreparedStatement ps=c.prepareStatement("delete from cart where ino=?");
        	ps.setString(1,ino);
        	
        	int i=ps.executeUpdate();
        	if(i>0)
        	{
            	out.println("data deleted");
        	}
        	else
        	{
            	out.println("data not deleted");
        	}
                }
                if(request.getParameter("b4")!=null)
                {
        	PreparedStatement ps=c.prepareStatement("select * from cart");
        	ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    int n=rs.getInt(1);
                    String name=rs.getString(2);
                    String r=rs.getString(3);
                    out.println("Item No="+n+"<br>Item Name="+name+"<br>Rate="+r);
                   
                }
        	
        	
                }
                
                
                
       }
                catch(Exception e)
                        {
            	out.println("error="+e);
        	}
       	 
        	
                
                %>
    </body>
</html>
