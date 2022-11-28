<%-- 
    Document   : signin
    Created on : 4 Sep, 2022, 8:19:31 PM
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
            
        try
	{
            String username=request.getParameter("txtuid");
        	String pass=request.getParameter("txtpwd");
			Class.forName("org.apache.derby.jdbc.ClientDriver");
       	Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
		 Statement stmt=con.createStatement();
		PreparedStatement ps=con.prepareStatement("select * from reg where usrid=? and pwd=? ");
        	ps.setString(1,username);
        	ps.setString(2,pass);
        	ResultSet rs=ps.executeQuery();
        	if(rs.next())
        	{
          	RequestDispatcher rd=request.getRequestDispatcher("menu.html");
          	rd.forward(request, response);
        	}
        	else{
            	out.println("invalid user");
        	}
                }
		/*if(check==1)
                                  {*/
//                                 qry="update reg set reges.flag='y' where userid="+usrid;
//		  out.println(qry);
//		int r=stmt.executeUpdate(qry);
		//out.println(qry);
		//}

catch(ClassNotFoundException e)
{
    System.out.println("In catch1");

}
catch(SQLException e)
{
    System.out.println("In catch2");
}

/*finally
{
	try
	{ if (con!=null)
	 con.close();
	}catch(SQLException e){}}*/

        %>
    </body>
</html>
