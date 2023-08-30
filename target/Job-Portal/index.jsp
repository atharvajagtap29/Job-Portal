<%@page import="com.DB.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Landing Page</title>
<%@include file="Components/CSS.jsp"%>

<style type="text/css">
/*Home screen image code*/
.back-img {
	background: url("Img/j1.jpg");
	width: 100%;
	height: 90vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>

<body>
	<!-- including component navigation bar -->
	<%@include file="Components/NavBar.jsp"%>

	<%
	Connection conn = DBconnect.getConn();
	//out.println(conn);
	%>

	<!-- Background image logic -->
	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-white p-4"
				style="text-decoration: underline; font-weight: bold;">
				<i class="fa-solid fa-laptop-file"></i> JOBS HUNT PORTAL
			</h1>
		</div>
	</div>

	<!-- including component footer-->
	<%@include file="Components/Footer.jsp"%>
</body>

</html>