<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dao.JobDAO"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.Job"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Job Application Form</title>
<%@ include file="Components/CSS.jsp"%>
<style>
body {
	background-image: url('Img/back.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}

.card {
	max-width: 500px;
	margin: 2rem auto;
	padding: 2rem;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.card-title {
	font-size: 1.5rem;
	font-weight: bold;
	margin-bottom: 1.5rem;
	color: #333;
}

/* Rest of your CSS styles */
</style>
</head>

<body>
	<c:if test="${empty status}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	<%@ include file="Components/NavBar.jsp"%>

	<div class="container">
		<%
		int id = Integer.parseInt(request.getParameter("id"));
		JobDAO dao = new JobDAO(DBconnect.getConn());
		Job j = dao.getJobsById(id);
		%>

		<!-- Rest of your HTML code -->

		<div class="card">
			<div class="text-center">
				<i class="fa-solid fa-briefcase fa-2x text-darkblue"></i>
			</div>
			<h1 class="text-center text-darkblue">
				<%=j.getTitle()%>
				Role
			</h1>
		</div>

		<div class="card">
			<h1 class="card-title text-center">Job Application Form</h1>

			<form action="apply" method="post">
				<input type="hidden" name="id" value="<%=j.getId()%>"> <input
					type="hidden" name="jobprofile" value="<%=j.getTitle()%>">

				<!-- Your form fields here -->
				<div class="form-group mb-3">
					<label for="fullName" class="form-label">Full Name:</label> <input
						type="text" class="form-control" id="fullName" name="fullName"
						required>
				</div>
				<div class="form-group mb-3">
					<label for="email" class="form-label">Email:</label> <input
						type="email" class="form-control" id="email" name="email" required>
				</div>
				<div class="form-group mb-3">
					<label for="phone" class="form-label">Phone:</label> <input
						type="tel" class="form-control" id="phone" name="phone" required>
				</div>
				<div class="form-group mb-3">
					<label for="resume" class="form-label">Upload Resume:</label> <input
						type="file" class="form-control-file" id="resume" name="resume"
						required>
				</div>
				<div class="form-group mb-3">
					<label for="availability" class="form-label">Availability:</label>
					<select class="form-control" id="availability" name="availability"
						required>
						<option value="">Select Availability</option>
						<option value="Full-time">Full-time</option>
						<option value="Part-time">Part-time</option>
						<option value="Contract">Contract</option>
					</select>
				</div>

				<button type="submit" class="btn btn-outline-success">Submit
					Application</button>

			</form>
		</div>



	</div>

	<input type='hidden' id='message'
		value='${session.getAttribute("messege")}'>

	<script src="vendor/jquery/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.all.min.js"></script>
	<script type="text/javascript">
  window.onload = function() {
    const message = document.getElementById("message").value;
    if (message) {
      Swal.fire({
        title: "Done!",
        text: "Applied Successfully",
        icon: "success",
        confirmButtonText: "OK"
      }).then(() => {
        location.href = "User.jsp";
      });
    }
  };
</script>
</body>
</html>































































<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Job Application Form</title>

<%@include file="Components/CSS.jsp"%>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/cerulean/bootstrap.min.css"
	rel="stylesheet">
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>



</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${empty status}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	<%@include file="Components/NavBar.jsp"%>

</body>

</html>























<!-- 
	<div class="container">
		<div class="card mt-5">
			<div class="card-body text-center">
				<h1 class="card-title mb-4"
					style="font-size: 2rem; font-weight: bold;">APPLY HERE</h1>
				<form action="submitApplication.jsp" method="post"
					class="needs-validation">

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="fullName">Full Name:</label> <input type="text"
								class="form-control" id="fullName" name="fullName" required>
						</div>
						<div class="form-group col-md-6">
							<label for="email">Email:</label> <input type="email"
								class="form-control" id="email" name="email" required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="phone">Phone:</label> <input type="tel"
								class="form-control" id="phone" name="phone" required>
						</div>
						<div class="form-group col-md-6">
							<label for="resume">Upload Resume:</label> <input type="file"
								class="form-control-file" id="resume" name="resume" required>
						</div>
					</div>
					<div class="form-group">
						<label for="coverLetter">Cover Letter:</label>
						<textarea class="form-control" id="coverLetter" name="coverLetter"
							rows="5" cols="30"></textarea>
					</div>
					<div class="form-group">
						<label for="availability">Availability:</label> <select
							class="form-control" id="availability" name="availability"
							required>
							<option value="">Select Availability</option>
							<option value="Full-time">Full-time</option>
							<option value="Part-time">Part-time</option>
							<option value="Contract">Contract</option>
						</select>
					</div>
					<div class="form-group">
						<label for="salaryExpectation">Salary Expectation:</label> <input
							type="text" class="form-control" id="salaryExpectation"
							name="salaryExpectation">
					</div>
					<button type="submit" class="btn btn-outline-success mr-2">Submit
						Application</button>

				</form>
			</div>
		</div>
	</div> --> --%>