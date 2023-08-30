<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Edit</title>
<%@include file="Components/CSS.jsp"%>
<style>
/* Style for form labels */
label {
	font-weight: bold;
	margin-bottom: 5px;
	display: block;
}

/* Style for form inputs */
input[type="text"] {
	width: 100%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	margin-bottom: 20px;
}

body {
	background-image: url('Img/signup.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}

/* Style for form submit button */
#update {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	cursor: pointer;
}

#update:hover {
	background-color: #0069d9;
}
</style>

<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">
</head>

<body>
	<c:if test="${empty userobj}">
		<c:redirect url="index.jsp"></c:redirect>
	</c:if>
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
								<h5 class="mt-3">EDIT PROFILE</h5>
							</div>

							<form action="update_user" method="post">
								<input type="hidden" name="id" value="${userobj.id}">
								<div class="form-group">
									<label>Edit Name</label> <input type="text" required="required"
										class="form-control" id="exampleInputEmail"
										aria-describedby="emailHelp" name="name"
										value="${userobj.name}">
								</div>
								<div class="form-group">
									<label>Edit Username</label> <input type="text"
										required="required" class="form-control"
										id="exampleInputEmail" aria-describedby="emailHelp"
										name="uname" value="${userobj.username}">
								</div>
								<div class="form-group">
									<label>Edit Email</label> <input type="text"
										required="required" class="form-control"
										id="exampleInputEmail" aria-describedby="emailHelp"
										name="email" value="${userobj.email}">
								</div>
								<div class="form-group">
									<label>Edit Qualification</label> <input type="text"
										required="required" class="form-control"
										id="exampleInputEmail" aria-describedby="emailHelp"
										name="qual" value="${userobj.qualification}">
								</div>
								<div class="text-center mt-4">
									<button class="btn btn-primary btn-lg px-5" id="update">Update
										Changes</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%
	String edit = (String) session.getAttribute("success");
	if (edit != null) {
	%>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>

	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			swal({
				title : "Done!",
				text : "Profile Updated Successfully",
				type : "success"
			});
		});
	</script>
	<%
	session.removeAttribute("success");
	}
	%>
</body>
</html>
