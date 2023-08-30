
<%@ page import="com.dao.JobDAO"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.Job"%>
<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: View Job</title>
<%@ include file="Components/CSS.jsp"%>
<style>
body {
	background-image: url('Img/back.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}

.container {
	max-width: 800px;
	margin: 0 auto;
}

.card {
	background-color: #ffffff;
	border: none;
	box-shadow: 0 0 10px rgba(0, 0, 0, .1);
}

.card-title {
	font-size: 1.2rem;
	font-weight: 600;
	margin-bottom: 1rem;
}

.card-text {
	color: #6c757d;
	font-size: 1rem;
	line-height: 1.5;
	margin-bottom: 1rem;
}

.form-control[readonly] {
	background-color: #f0f1f2;
	border-color: #f0f1f2;
}

.btn-outline-success, .btn-outline-danger {
	padding: .375rem .75rem;
	font-size: .9rem;
	line-height: 1.6;
	border-radius: .2rem;
	text-transform: uppercase;
}

.btn-outline-success {
	border-color: #28a745;
	color: #28a745;
}

.btn-outline-success:hover {
	background-color: #28a745;
	color: #ffffff;
}

.btn-outline-danger {
	border-color: #dc3545;
	color: #dc3545;
}

.btn-outline-danger:hover {
	background-color: #dc3545;
	color: #ffffff;
}
</style>
</head>
<body>
	<c:if test="${userobj.role ne 'Admin'}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	<%@ include file="Components/NavBar.jsp"%>

	<div class="container mt-4">
		<h5
			style="text-align: center; color:; font-size: 24px; font-weight: bold; text-transform: uppercase; margin-bottom: 20px;">ALL
			INSERTED JOBS</h5>

		<%
		// Retrieve the list of jobs from the database
		JobDAO dao = new JobDAO(DBconnect.getConn());
		List<Job> jobs = dao.getJobs();

		// Loop through the list of jobs and display them inside a card
		for (Job job : jobs) {
		%>

		<div class="card mb-4">
			<div class="card-body">
				<div class="row align-items-center">
					<div class="col-12 col-md-4 text-center">
						<i class="fa-solid fa-briefcase" style="font-size: 4rem;"></i>
					</div>
					<div class="col-12 col-md-8">
						<h5 class="card-title text-primary mb-4"><%=job.getTitle()%></h5>
						<p class="card-text mb-4"><%=job.getDescription()%></p>
						<div class="form-row mb-4">
							<div class="form-group col-md-4">
								<label for="job-location">Location</label> <input type="text"
									id="job-location" class="form-control form-control-sm"
									value="<%=job.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-4">
								<label for="job-category">Category</label> <input type="text"
									id="job-category" class="form-control form-control-sm"
									value="<%=job.getCategory()%>" readonly>
							</div>
							<div class="form-group col-md-4">
								<label for="job-status">Status</label> <input type="text"
									id="job-status" class="form-control form-control-sm"
									value="<%=job.getStatus()%>" readonly>
							</div>

						</div>
						<div class="row">
							<div class="col-md-6">
								<p class="mb-0">
									<strong>Publish Date:</strong>
									<%=job.getPdate()%>
								</p>
							</div>
							<div class="col-md-6 text-right">
								<a href="EditJobs.jsp?id=<%=job.getId()%>"
									class="btn btn-sm btn-outline-success mr-2">Edit</a> <a
									href="delete?id=<%=job.getId()%>"
									class="btn btn-sm btn-outline-danger">Delete</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		%>
	</div>
</body>













































































<%-- <%@ page import="com.dao.JobDAO"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.Job"%>
<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: View Job</title>
<%@ include file="Components/CSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%@ include file="Components/NavBar.jsp"%>

	<div class="container mt-4">
		<%
		// Retrieve the list of jobs from the database
		JobDAO dao = new JobDAO(DBconnect.getConn());
		List<Job> jobs = dao.getJobs();

		// Loop through the list of jobs and display them inside a card
		for (Job job : jobs) {
		%>
		<div class="card mb-4">
			<div class="card-body">
				<div class="row align-items-center">
					<div class="col-12 col-md-4 text-center">
						<i class="fa-solid fa-briefcase" style="font-size: 4rem;"></i>
					</div>
					<div class="col-12 col-md-8">
						<h5 class="card-title text-primary mb-4"><%=job.getTitle()%></h5>
						<p class="card-text mb-4"><%=job.getDescription()%></p>
						<div class="form-row mb-4">
							<div class="form-group col-md-4">
								<label for="job-location">Location</label> <input type="text"
									id="job-location" class="form-control form-control-sm"
									value="<%=job.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-4">
								<label for="job-category">Category</label> <input type="text"
									id="job-category" class="form-control form-control-sm"
									value="<%=job.getCategory()%>" readonly>
							</div>
							<div class="form-group col-md-4">
								<label for="job-status">Status</label> <input type="text"
									id="job-status" class="form-control form-control-sm"
									value="<%=job.getStatus()%>" readonly>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p class="mb-0">
									<strong>Publish Date:</strong>
									<%=job.getPdate()%>
								</p>
							</div>
							<div class="col-md-6 text-right">
								<a href="#" class="btn btn-sm btn-outline-success mr-2">Edit</a>
								<a href="#" class="btn btn-sm btn-outline-danger">Delete</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%> --%>