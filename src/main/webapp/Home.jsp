
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.JobDAO"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.Job"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>User: Home</title>
<%@include file="Components/CSS.jsp"%>
<style type="text/css">
body {
	background-image: url('Img/back.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}

.card {
	margin-top: 20px;
	border: none;
	box-shadow: 0px 1px 4px 0px rgba(0, 0, 0, 0.2);
}

.card-body {
	padding: 20px;
}

label {
	font-weight: bold;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
	border-radius: 5px;
}

.btn-primary:hover {
	background-color: #0069d9;
	border-color: #0062cc;
}

.form-inline label {
	margin-right: 1rem;
	margin-bottom: 0;
	vertical-align: middle;
}

.form-inline select {
	margin-right: 1rem;
	vertical-align: middle;
}
</style>
</head>

<body style="background-color: #f0f1f2;">
	<c:if test="${empty status}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	<%@include file="Components/NavBar.jsp"%>



	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3 class="text-center text-black">AVAILABLE JOBS</h3>

				<div class="card">
					<div class="card-body">
						<form class="form-inline" action="more_view.jsp" method="get">
							<div class="form-row align-items-center mx-auto">
								<div class="col-md-6 my-1">
									<div class="form-row">
										<div class="row">
											<div class="col-md-6 my-1">
												<label class="mr-sm-2" for="inlineFormCustomSelectPref">Location</label>
												<select class="custom-select mr-sm-2"
													id="inlineFormCustomSelectPref" name="job_location"
													required>
													<option value="lo">Choose Location</option>
													<option value="Pune">Pune</option>
													<option value="Bangalore">Bangalore</option>
													<option value="Gurgaon">Gurgaon</option>
													<option value="Mumbai">Mumbai</option>
													<option value="Chennai">Chennai</option>
													<option value="Hyderabad">Hyderabad</option>
												</select>
											</div>
											<div class="col-md-6 my-1">
												<label class="mr-sm-2" for="inlineFormCustomSelectPref">Category</label>
												<select class="custom-select mr-sm-2"
													id="inlineFormCustomSelectPref" name="domain" required>
													<option value="do">Choose Work Domain</option>
													<option value="IT">IT</option>
													<option value="Development">Development</option>
													<option value="Banking">Banking</option>
													<option value="Finance">Finance</option>
													<option value="Management">Management</option>
													<option value="Security">Security</option>
												</select>
											</div>
										</div>

									</div>
								</div>
								<div class="col-md-2 my-1">
									<button type="submit" class="btn btn-outline-success">Search
										Jobs</button>
								</div>
							</div>
						</form>
					</div>
				</div>




				<br>






				<!-- card-2 -->
				<%-- <%
				JobDAO dao = new JobDAO(DBconnect.getConn());
				List<Job> list = dao.getJobsForUser();
				for (Job j : list) {
				%> --%>

				<div class="row">
					<%
					JobDAO dao = new JobDAO(DBconnect.getConn());
					List<Job> list = dao.getJobsForUser();
					for (Job j : list) {
					%>
					<div class="col-md-4">
						<div class="card mb-2">
							<div class="card-body">
								<div class="row mb-3">
									<div class="col-auto">
										<i class="fa-solid fa-briefcase fa-2x text-primary"></i>
									</div>
									<div class="col mb-3">
										<h5 class="card-title mb-0"><%=j.getTitle()%></h5>
										<%
										if (j.getDescription() != null && j.getDescription().length() > 0) {
										%>
										<p class="card-text"><%=j.getDescription().length() > 120 ? j.getDescription().substring(0, 120) + "..." : j.getDescription()%></p>
										<%
										}
										%>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-md-4">
										<input type="text" class="form-control form-control-sm"
											value="Location: <%=j.getLocation()%>" readonly>
									</div>
									<div class="col-md-4">
										<input type="text" class="form-control form-control-sm"
											value="Category: <%=j.getCategory()%>" readonly>
									</div>
									<div class="col-md-4 col text-md-right">
										<small>Publish Date: <%=j.getPdate().toString()%></small>
									</div>
								</div>
								<div class="text-center">
									<a href="one_view.jsp?id=<%=j.getId()%>"
										class="btn btn-sm btn-success">View More</a>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>








			</div>

		</div>
	</div>

</body>
</html>