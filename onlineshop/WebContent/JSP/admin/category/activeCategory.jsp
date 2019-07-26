<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
      <title>SELECT Operation</title>
   </head>

   <body>
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/onlineshop"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from categories WHERE cat_status='Active';
      </sql:query>
 
      <table border = "1" width = "100%">
         <tr>
            <th>Cat ID</th>
            <th>Cat Name</th>
            <th>Status</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.cat_id}"/></td>
               <td><c:out value = "${row.cat_name}"/></td>
               <td><c:out value = "${row.cat_status}"/></td>
            </tr>
         </c:forEach>
      </table>
 
   </body>
</html>