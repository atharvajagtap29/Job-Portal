<%@page import="java.util.ArrayList"%>
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
<title>User: View Jobs</title>
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
				<h5 class="text-center text-primary">All Jobs</h5>

				<%
				String loc = request.getParameter("job_location");
				String cat = request.getParameter("domain");
				String msg = "";

				JobDAO dao = new JobDAO(DBconnect.getConn());

				List<Job> list = null;

				if ("lo".equals(loc) && "do".equals(cat)) {
					list = new ArrayList<Job>();
					msg = "Job Not Available";
				} else if ("lo".equals(loc) || "do".equals(cat)) {
					list = dao.getJobLocOrDom(cat, loc);
				} else {
					list = dao.getJobLocAndDom(cat, loc);
				}

				if (list.isEmpty()) {
				%>
				<h4 class="text-center text-danger">Jobs Unavailable</h4>
				<%
				}

				if (list != null) {

				for (Job j : list) {
				%>

				<div class="card mt-2">
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
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">View More</a>
						</div>

					</div>
				</div>
				<%
				}
				} else {
				%>
				<h4 class="text-center text-danger"><%=msg%></h4>
				<%
				}
				%>
			</div>

		</div>

	</div>


</body>

</html>