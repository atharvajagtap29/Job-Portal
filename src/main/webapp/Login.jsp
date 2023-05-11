<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>LOGIN PAGE</title>

<%@include file="Components/CSS.jsp"%>

<!-- <style type="text/css">
/*Home screen image code*/
.back-img {
	background: url("Img/j1.jpg");
	width: 100%;
	height: 90vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>-->

<style type="text/css">
body {
	background-image: url('Img/login.jpg');
	width: 100%;
	height: 90vh;
	background-repeat: no-repeat;
	background-size: cover;
	height: 90vh;
	background-repeat: no-repeat;
	background-repeat: no-repeat;
}

.card {
	background-color: rgba(255, 255, 255, 0.8);
}
</style>

</head>


<body>
	<!-- including component navigation bar -->
	<%@include file="Components/NavBar.jsp"%>

	<input type="hidden" id="msg"
		value="<%=session.getAttribute("status")%>">

	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row p-5">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<i class="fa-solid fa-user-lock text-primary"
									style="font-size: 4rem;"></i>
								<h5 class="mt-3">LOGIN PAGE</h5>
							</div>
							<%-- <c:if test="${not empty succMsg}">
							<h4 class="text-center text-danger">${succMsg}</h4>
							<c:remove var="succMsg" />
							</c:if> --%>

							<form action="login" method="post">
								<div class="form-group mt-4">
									<label for="username" class="form-label">Username</label> <input
										type="text" class="form-control" id="username" name="uname"
										required>
								</div>
								<div class="form-group mt-3">
									<label for="password" class="form-label">Password</label> <input
										type="password" class="form-control" id="password" name="pass"
										required>
								</div>
								<div class="text-center mt-4">
									<button class="btn btn-primary btn-lg px-5">Login</button>
								</div>
							</form>

							<%-- JSP code --%>
							<%
							String msg = (String) session.getAttribute("status");
							%>
							<input type="hidden" id="msg" value="<%=msg%>">


							<!-- JavaScript -->
							<script src="vendor/jquery/jquery.min.js"></script>
							<script src="js/main.js"></script>
							<script
								src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
							<script type="text/javascript">
								var status = document.getElementById("msg").value;
								if (status === "failed") {
									swal({
										title : "Sorry",
										text : "Invalid username or password",
										type : "error"
									});
								} /* else if (status === "Error occurred") {
																swal("Couldn't Insert",
																		"Something went wrong", "error");
															} */
							</script>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- including component footer-->
	<%-- <%@include file="Components/Footer.jsp"%> --%>
</body>

</html>