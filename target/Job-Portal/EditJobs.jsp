

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.JobDAO"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.Job"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Job</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/cerulean/bootstrap.min.css"
	rel="stylesheet">


<%@include file="Components/CSS.jsp"%>
<style>
body {
	background-image: url('Img/back.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	background-color: #f8f9fa;
	font-family: 'Helvetica Neue', sans-serif;
}

h1 {
	font-size: 36px;
	text-align: center;
	margin-top: 50px;
	color: #007bff;
}

form {
	margin-top: 50px;
}

label {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
	color: #555;
}

input[type="text"], textarea, select {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	border-radius: 5px;
	border: 1px solid #ccc;
	margin-bottom: 20px;
	box-sizing: border-box;
}

button[type="submit"] {
	background-color: #007bff;
	border: none;
	color: #fff;
	padding: 10px 20px;
	font-size: 18px;
	border-radius: 5px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #0069d9;
}
</style>

</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${userobj.role ne 'Admin'}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	<input type="hidden" id="message"
		value="<%=session.getAttribute("message")%>">

	<%@include file="Components/NavBar.jsp"%>
	<div class="container mt-4">
		<%
		int id = Integer.parseInt(request.getParameter("id"));
		JobDAO dao = new JobDAO(DBconnect.getConn());
		Job j = dao.getJobsById(id);
		%>
		<div class="card mb-4">
			<div class="card-header">
				<h1 class="text-center text-black display-6 mb-0">
					<i class="fa-solid fa-upload"></i> EDIT JOB
				</h1>
			</div>
			<div class="card-body" style="background-color: #F5F5F5;">

				<!-- form starts here -->
				<form action="updatejob" method="post">

					<input type="hidden" value="<%=j.getId()%>" name="id">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="job_title">Job Title:</label> <input type="text"
								class="form-control" id="1" name="job_title" required
								value="<%=j.getTitle()%>">
						</div>
						<div class="form-group col-md-6">
							<label for="job_category">Job Category:</label> <select
								class="form-control" id="2" name="job_category" required>
								<option value="">Select a work domain</option>
								<option value="IT">IT</option>
								<option value="Development">Development</option>
								<option value="Banking">Banking</option>
								<option value="Finance">Finance</option>
								<option value="Management">Management</option>
								<option value="Security">Security</option>
								<!-- add more options as needed -->
							</select>
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-4">
							<label for="job_location">Job Location:</label> <select
								class="form-control" id="3" name="job_location" required
								value="<%=j.getLocation()%>">
								<option value=""><%=j.getLocation()%></option>
								<option value="Pune">Pune</option>
								<option value="Bangalore">Bangalore</option>
								<option value="Gurgaon">Gurgaon</option>
								<option value="Mumbai">Mumbai</option>
								<option value="Chennai">Chennai</option>
								<option value="Hyderabad">Hyderabad</option>
							</select>
						</div>

						<div class="form-group col-md-4">
							<label for="job_qualification">Job Qualification:</label> <select
								class="form-control" id="4" name="job_qualification" required
								value="<%=j.getQualification()%>">
								<option value=""><%=j.getQualification()%></option>
								<option value="Bachelor's Degree">Bachelor's Degree</option>
								<option value="Master's Degree">Master's Degree</option>
								<option value="PhD">PhD</option>
								<option value="Professional Certification">Professional
									Certification</option>
								<option value="Diploma">Diploma</option>
							</select>
						</div>

						<div class="form-group col-md-4">
							<label for="status">Job Status:</label> <select
								class="form-control" id="5" name="status" required>
								<option value="">Select Status</option>
								<option value="active">Active</option>
								<option value="inactive">Inactive</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="job_description">Job Description:</label>
						<textarea class="form-control" id="6" name="job_description"
							rows="4" required value="<%=j.getDescription()%>"><%=j.getDescription()%></textarea>
					</div>


					<button type="submit" class="btn btn-outline-success">SAVE
						CHANGES</button>
				</form>

				<%-- <c:if test="${not empty sessionScope.message}">
					<script>
						// Get the message from the session
						var message = "${sessionScope.message}";

						// Get the script from the session
						var script = "${sessionScope.script}";

						// Display the SweetAlert message
						Swal.fire({
							icon : 'success',
							title : message,
							showConfirmButton : false,
							timer : 1500
						}).then(function() {
							// Remove the message and script from the session
							sessionStorage.removeItem("message");
							sessionStorage.removeItem("script");
						});

						// If there is a script, execute it
						if (script) {
							$(document).ready(function() {
								$('body').append(script);
							});
						}
					</script>
				</c:if> --%>






			</div>
		</div>
	</div>
</body>
</html>



































