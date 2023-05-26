<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Panel</title>
<%@include file="Components/CSS.jsp"%>

<style type="text/css">
.back-img {
	background: url("Img/user3.jpg");
	width: 100%;
	height: 90vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>
<body>
	<c:if test="${userobj.role ne 'User'}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	<c:if test="${userobj.role eq 'User'}">

		<%@include file="Components/NavBar.jsp"%>
		<div class="container-fluid back-img">
			<div class="text-center">
				<marquee>
					<h1 class="text-white p-4"
						style="text-decoration: underline; font-weight: bold;">
						<i class="fa-solid fa-laptop-file"></i> Welcome ${userobj.name}!
					</h1>
				</marquee>
			</div>
		</div>

	</c:if>

	<!-- including component footer-->
	<%@include file="Components/Footer.jsp"%>
</body>
</html>