
<style>
.btn {
	margin-right: 10px;
}

.btn {
	color: black; /* sets the text color to black */
	border-color: #ffc107; /* sets the border color to warning color */
}

.btn.btn-outline-warning:hover {
	color: #ffc107; /* sets the text color to warning color on hover */
	background-color: white;
	/* sets the background color to white on hover */
}
</style>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">

			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i
						class="fa-solid fa-house"></i> HOME</a></li>

				<c:if test="${userobj.role eq 'Admin'}">
					<li class="nav-item"><a class="nav-link" href="Addjob.jsp"><i
							class="fa-sharp fa-solid fa-plus"></i> POST JOB</a></li>
					<li class="nav-item"><a class="nav-link" href="Viewjob.jsp"><i
							class="fa-solid fa-eye"></i> VIEW JOB</a></li>
				</c:if>




			</ul>
			<form class="d-flex">

				<c:if test="${userobj.role eq 'Admin'}">
					<a href="Login.jsp" class='btn btn-outline-warning btn-light'><i
						class="fa-solid fa-user"></i> ADMIN</a>
					<a href="logout" class='btn btn-outline-warning btn-light'><i
						class="fas fa-sign-in-alt"></i> SIGN OUT</a>
				</c:if>

				<c:if test="${userobj.role eq 'User'}">
					<a href="Login.jsp" class='btn btn-outline-warning btn-light'><i
						class="fa-solid fa-user"></i> ${userobj.name}</a>
					<a href="logout" class='btn btn-outline-warning btn-light'><i
						class="fas fa-sign-in-alt"></i> SIGN OUT</a>
				</c:if>




				<c:if test="${empty userobj}">
					<a href="Login.jsp" class='btn btn-outline-warning btn-light'><i
						class="fas fa-sign-in-alt"></i> LOG IN</a>
					<a href="SignUp.jsp" class='btn btn-outline-warning btn-light'><i
						class="fa-solid fa-user-plus"></i> SIGN UP</a>
				</c:if>



			</form>
		</div>
	</div>
</nav>