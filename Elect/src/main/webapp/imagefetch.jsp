<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String connectionURL = "jdbc:mysql://localhost:3306/elect";

ResultSet rs = null;

PreparedStatement psmnt = null;
// declare InputStream object to store binary stream of given image.
InputStream sImage;
try {

Class.forName("com.mysql.jdbc.Driver").newInstance();

Connection connection = DriverManager.getConnection(connectionURL, "root", "123456789");
/* prepareStatement() is used for create statement object that is 
used for sending sql statements to the specified database. */
psmnt = connection.prepareStatement("SELECT product_image FROM products WHERE id = ?");
psmnt.setString(1, "11"); // here integer number '11' is image id from the table
rs = psmnt.executeQuery();
if(rs.next()) {
byte[] bytearray = new byte[1048576];
int size=0;
sImage = rs.getBinaryStream(1);
response.reset();
response.setContentType("image/jpeg");
while((size=sImage.read(bytearray))!= -1 ){
response.getOutputStream().write(bytearray,0,size);
}
}
}
catch(Exception ex){
out.println("error :"+ex);
}
finally {
// close all the connections.
rs.close();
psmnt.close();
connection.close();
}
%>
</body>
</html>