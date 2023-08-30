<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<%@include file="Components/CSS.jsp"%>

<style type="text/css">
.back-img {
	background: url("Img/admin.png");
	width: 100%;
	height: 90vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>
<body>
	<c:if test="${userobj.role ne 'Admin'}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	<%@include file="Components/NavBar.jsp"%>
	<div class="container-fluid back-img">
		<div class="text-center">
			<marquee>
				<h1 class="text-white p-4"
					style="text-decoration: underline; font-weight: bold;">
					<i class="fa-solid fa-laptop-file"></i> WELCOME ADMIN
				</h1>
			</marquee>
		</div>
	</div>
	<!-- including component footer-->
	<%@include file="Components/Footer.jsp"%>
</body>
</html>