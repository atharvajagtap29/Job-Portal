<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dao.JobDAO"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.Job"%>
<%@ page isELIgnored="false1
<!DOCTYPE html>
<html>
<head>
<title>Job Application Confirmation</title>
<style type="text/css">
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
</head>
<body>
	<c:if test="${empty status}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	<%@include file="Components/NavBar.jsp"%>
	<div class="container">
		<div class="card">
			<div class="card-header">
				<h1 class="text-center">Job Application Confirmation</h1>
			</div>
			<div class="card-body">
				<p class="lead text-success">Thank you for applying for the job!</p>
				<p>We have received your application and will review it shortly.</p>
				<p>Please wait for further communication from our company.</p>
			</div>
		</div>
	</div>
</body>
</html>
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Job Application Confirmation</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-image: url('Img/confirm.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}

.card {
	max-width: 500px;
	margin: 0 auto;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #f8f9fa;
	padding: 20px;
}

.card-body {
	padding: 20px;
}

h1 {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
	text-align: center;
}

p {
	margin-bottom: 10px;
	line-height: 1.5;
}

.text-success {
	color: #28a745;
	font-weight: bold;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-primary:hover {
	background-color: #0069d9;
	border-color: #0062cc;
}
</style>
</head>
<body>
	<c:if test="${empty status}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	<%@include file="Components/NavBar.jsp"%>
	<div class="container mt-2">
		<div class="card mb-4">
			<div class="card-header">
				<h1>Job Application Confirmation</h1>
			</div>
			<div class="card-body">
				<p class="lead text-success">Thank you for applying for this job!</p>
				<p>We have received your application and will review it shortly.</p>
				<p>Please wait for further communication from our company and
					please keep checking your mail and spam box.</p>
				<p>In the meantime, you can explore our website to learn more
					about our company and the opportunities we offer.</p>
			</div>
			<div class="card-footer">
				<a href="User.jsp" class="btn btn-primary">Back to Home</a>
			</div>
		</div>
	</div>
</body>
</html>
