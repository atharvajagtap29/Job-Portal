<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.JobDAO"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.Job"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Single Job</title>
<%@include file="Components/CSS.jsp"%>
</head>

<body style="background-color: #f0f1f2;">

	<c:if test="${empty status}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	<%@include file="Components/NavBar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<%
				int id = Integer.parseInt(request.getParameter("id"));
				JobDAO dao = new JobDAO(DBconnect.getConn());
				Job j = dao.getJobsById(id);
				%>
				<div class="card mt-5">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fa-solid fa-briefcase fa-2x text-primary"></i>
						</div>

						<h4 class="card-title"><%=j.getTitle()%></h4>
						<p class="card-text"><%=j.getDescription()%></p>

						<div class="row">
							<div class="col-md-6">
								<div class="card-subtitle mb-2 text-muted">
									<strong>Location:</strong>
									<%=j.getLocation()%>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card-subtitle mb-2 text-muted">
									<strong>Category:</strong>
									<%=j.getCategory()%>
								</div>
							</div>
						</div>

						<div class="card-subtitle mb-2 text-muted">
							<strong>Publish Date:</strong>
							<%=j.getPdate().toString()%>
						</div>

						<div class="text-center">
							<!-- Button container with centering styles -->
							<a href="Apply.jsp?id=<%=j.getId()%>"
								class="btn btn-outline-success mr-2">APPLY JOB</a> <a
								href="Home.jsp" class="btn btn-outline-primary mr-2">BACK</a>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>


</body>

</html>