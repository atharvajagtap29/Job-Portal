<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Navbar</title>
<style>
.btn {
	margin-right: 10px;
}

.btn-outline-warning.btn-light {
	color: black;
	border-color: #ffc107; /* Yellow color, change to your desired color */
	font-size: 16px;
}

.btn-outline-warning.btn-light:hover {
	background-color: #ffc107;
	/* Yellow color, change to your desired hover background color */
	color: black;
}
</style>
<!-- Add necessary CSS and JavaScript dependencies -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">JobsHunt</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<c:if test="${userobj.role ne 'Admin' && userobj.role ne 'User'}">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="index.jsp"><i
								class="fa-solid fa-house"></i> LAUNCH</a></li>
					</c:if>
					<c:if test="${userobj.role eq 'Admin'}">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="Admin.jsp"><i
								class="fa-solid fa-house"></i> HOME</a></li>
						<li class="nav-item"><a class="nav-link" href="Addjob.jsp"><i
								class="fa-sharp fa-solid fa-plus"></i> POST JOB</a></li>
						<li class="nav-item"><a class="nav-link" href="Viewjob.jsp"><i
								class="fa-solid fa-eye"></i> VIEW JOB</a></li>
					</c:if>
					<c:if test="${userobj.role eq 'User'}">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="User.jsp"><i
								class="fa-solid fa-house"></i> HOME</a></li>
						<li class="nav-item"><a class="nav-link" href="Home.jsp"><i
								class="fa-solid fa-magnifying-glass"></i> SEARCH JOBS</a></li>
					</c:if>
				</ul>
				<form class="d-flex">
					<c:if test="${userobj.role eq 'Admin'}">
						<a href="#" class='btn btn-outline-warning btn-light'><i
							class="fa-solid fa-user"></i> ADMIN</a>
						<a href="logout" class='btn btn-outline-warning btn-light'><i
							class="fas fa-sign-in-alt"></i> SIGN OUT</a>
					</c:if>

					<c:if test="${userobj.role eq 'User'}">
						<a href="#" class="btn btn-outline-warning btn-light"
							data-toggle="modal" data-target="#exampleModal"> <i
							class="fa-solid fa-user"></i> ${userobj.name}
						</a>
						<a href="logout" class="btn btn-outline-warning btn-light"> <i
							class="fas fa-sign-in-alt"></i> SIGN OUT
						</a>
					</c:if>
					<c:if test="${empty userobj}">
						<a href="Login.jsp" class='btn btn-outline-warning btn-light'
							style="color: black;"><i class="fas fa-sign-in-alt"></i> LOG
							IN</a>
						<a href="SignUp.jsp" class='btn btn-outline-warning btn-light'
							style="color: black;"><i class="fa-solid fa-user-plus"></i>
							SIGN UP</a>
					</c:if>

				</form>
			</div>
		</div>
	</nav>


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">User
						Information</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<i class="fa-solid fa-user-pen" style="font-size: 40px;"></i>
							</div>
							<table class="table mt-4">
								<tbody>
									<tr>
										<th scope="row">Name</th>
										<td>${userobj.name}</td>
									</tr>
									<tr>
										<th scope="row">Qualification</th>
										<td>${userobj.qualification}</td>
									</tr>
									<tr>
										<th scope="row">Email</th>
										<td>${userobj.email}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>


				<div class="modal-footer text-center">
					<a href="useredit.jsp" class="btn btn-sm btn-outline-success mr-2">EDIT</a>
					<a href="#" class="btn btn-sm btn-outline-danger"
						data-dismiss="modal">CLOSE</a>
				</div>


			</div>
		</div>
	</div>
















	<%-- <div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<div class="text-center text-primary">
								<i class="fa-regular fa-user-cowboy"></i>
							</div>
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">Name</th>
										<td>${userobj.name}</td>
									</tr>
									<tr>
										<th scope="row">Qualification</th>
										<td>${userobj.qualification}</td>
									</tr>
									<tr>
										<th scope="row">Email</th>
										<td>${userobj.email}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>

	</div>
</body>
</html> --%>