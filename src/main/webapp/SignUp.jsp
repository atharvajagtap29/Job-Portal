
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>SIGN UP PAGE</title>

<%@include file="Components/CSS.jsp"%>

<style type="text/css">
body, html {
	height: 100%;
}

body {
	background-image: url('Img/signup.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}

.card {
	background-color: rgba(255, 255, 255, 0.8);
}
</style>

</head>

<body>
	<%-- including component navigation bar --%>

	<input type="hidden" id="msg"
		value="<%=session.getAttribute("status")%>">

	<%@include file="Components/NavBar.jsp"%>

	<div class="content-wrapper">
		<div class="container-fluid h-100">
			<div class="row p-5 h-100">
				<div class="col-md-4 offset-md-4">
					<div class="card h-100">
						<div class="card-body">
							<div class="text-center">
								<i class="fa-solid fa-user-plus text-primary"
									style="font-size: 4rem;"></i>
								<h5 class="mt-3">SIGN UP PAGE</h5>
							</div>
							<form action="signup" method="post">
								<div class="form-group mt-4">
									<label for="username" class="form-label">Enter Full
										Name</label> <input type="text" class="form-control" id="name"
										name="name" required>
								</div>
								<div class="form-group mt-4">
									<label for="username" class="form-label">Enter Username</label>
									<input type="text" class="form-control" id="username"
										name="username" required>
								</div>
								<div class="form-group mt-3">
									<label for="email" class="form-label">Enter Email</label> <input
										type="email" class="form-control" id="email" name="email"
										required>
								</div>
								<div class="form-group mt-3">
									<label for="password" class="form-label">Enter Password</label>
									<input type="password" class="form-control" id="password"
										name="password" required>
								</div>
								<div class="form-group mt-3">
									<label for="qualification" class="form-label">Enter
										Qualification</label> <input type="text" class="form-control"
										id="qualification" name="qualification" required>
								</div>
								<div class="text-center mt-4">
									<button class="btn btn-primary btn-lg px-5" id="signup">Sign
										Up</button>
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
								if (status === "Successful") {
									swal({
										title : "Congrats",
										text : "Registered Successfully",
										type : "success"
									});
								} else if (status === "Error occurred") {
									swal("Couldn't Insert",
											"Something went wrong", "error");
								}
							</script>


							<%-- <%
							String msg = (String) session.getAttribute("status");
							%>
							<input type="hidden" id="msg" value="<%=msg%>">

							<!-- JavaScript -->
							<script src="vendor/jquery/jquery.min.js"></script>
							<script src="js/main.js"></script>
							<script
								src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>

							<script type="text/javascript">
								// define a function to show the SweetAlert pop-up
								function showSweetAlert(status) {
									if (status === "Successful") {
										swal({
											title : "Congrats",
											text : "Registered Successfully",
											type : "success"
										});
									} else if (status === "Error occurred") {
										swal("Couldn't Insert",
												"Something went wrong", "error");
									}
								}

								// add a click event listener to the button
								var button = document.getElementById("signup");
								button
										.addEventListener(
												"click",
												function() {
													var status = document
															.getElementById("msg").value;
													showSweetAlert(status);
												});
							</script> --%>




						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- including component footer--%>
	<%-- <%@include file="Components/Footer.jsp"%> --%>
</body>

</html>