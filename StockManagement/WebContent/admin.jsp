<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="com.stock.util.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script> 
$(document).ready(function(){
    $("#flip").click(function(){
        $("#panel").slideToggle("slow");
    });
    $("#flip2").click(function(){
        $("#panel2").slideToggle("slow");
    });

});
</script>
<style> 
@import url(http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100);

div.table-title {
   display: block;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
}

.table-title h3 {
   color: #fafafa;
   font-size: 30px;
   font-weight: 400;
   font-style:normal;
   font-family: "Roboto", helvetica, arial, sans-serif;
   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
   text-transform:uppercase;
}


/*** Table Styles **/

.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  height: 30px;
  margin: auto;
  max-width: 150px;
  padding:5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}
 
th {
  color:#D5DDE5;;
  background:#1b1e24;
  border-bottom:4px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size:23px;
  font-weight: 100;
  padding:24px;
  text-align:left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
}

th:first-child {
  border-top-left-radius:3px;
}
 
th:last-child {
  border-top-right-radius:3px;
  border-right:none;
}
  
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color:#666B85;
  font-size:16px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 
tr:hover td {
  background:#4E5066;
  color:#FFFFFF;
  border-top: 1px solid #22262e;
  border-bottom: 1px solid #22262e;
}
 
tr:first-child {
  border-top:none;
}

tr:last-child {
  border-bottom:none;
}
 
tr:nth-child(odd) td {
  background:#EBEBEB;
}
 
tr:nth-child(odd):hover td {
  background:#4E5066;
}

tr:last-child td:first-child {
  border-bottom-left-radius:3px;
}
 
tr:last-child td:last-child {
  border-bottom-right-radius:3px;
}
 
td {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:18px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}

th.text-left {
  text-align: left;
}

th.text-center {
  text-align: center;
}

th.text-right {
  text-align: right;
}

td.text-left {
  text-align: left;
}

td.text-center {
  text-align: center;
}

td.text-right {
  text-align: right;
}


#panel, #flip {
    padding: 5px;
    text-align: center;
    background-color: #f4c56c;
    border: solid 1px #c3c3c3;
}

#panel {
    padding: 50px;
    display: none;
}

#panel2, #flip2 {
    padding: 5px;
    text-align: center;
    background-color: #f4c56c;
    border: solid 1px #c3c3c3;
}

#panel2 {
    padding: 50px;
    display: none;
}
</style>
</head>
<body>
	<h1>Admin Mode</h1>
	<div id="flip">Customer Details</div>
	<div id="panel">
	
	<%
		Connection c = DBUtil.getDBConnection();
		Statement s = c.createStatement();
		ResultSet rs = s.executeQuery("select userid,name from users where userid!=1");
	%>
		<table border="2" bordercolor="#2494b7" class="table-fill">
		<tr>
		<th class="text-left">ID</th>
		<th class="text-left">UserName</th>
		</tr>
	<%
		while(rs.next())
		{	
	%>	
		<tbody class="table-hover">
		<tr>
		<td class="text-left"><%=rs.getInt(1)%></td>
		<td class="text-left"><%=rs.getString(2)%></td>
		</tr>
		</tbody>
		
	<%
		}
	%>
		</table>
	</div>
	<br>
	
	<!-- Add Products -->
	
	<div id="flip2">Add New Product</div>
	<div id="panel2">
		<form action="Admin" method="post">
			<input type="text" placeholder="Enter Product Name">
			<input type="text" placeholder="Enter Price">
			<input type="text" placeholder="Eneter Description(optional)">
			<input type="submit" value="Add Product" >
		</form>
	<%
		
	%>
	
	</div>
</body>
</html>