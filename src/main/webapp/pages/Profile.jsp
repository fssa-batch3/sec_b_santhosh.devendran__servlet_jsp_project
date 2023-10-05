<%@page import="in.fssa.aviease.model.AirLine"%>
<%@page import="in.fssa.aviease.service.AirLineService"%>
<%@page import="in.fssa.aviease.model.Flight"%>
<%@page import="in.fssa.aviease.service.FlightService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="in.fssa.aviease.model.Tickets"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.aviease.service.TicketsService"%>
<%@page import="in.fssa.aviease.model.User"%>
<%@page import="in.fssa.aviease.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile page</title>
<link rel="stylesheet" href="../assets/header.css">
<link rel="stylesheet" href="../assets/profile.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	
	 <link rel="stylesheet" href="../assets/error.css">
	 <script src="../assets/error.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light   header">
		<div class="container h1 tw">
			<a class="navbar-brand " href="#"><span class="avil">Avi</span>ease</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class=" navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto navulflex">
					<li class="nav-item m-3"><a class="nav-link  h4"
						href="<%=request.getContextPath()%>/flight/search">Home</a></li>
					<li class="nav-item h4 m-3"><a class="nav-link" href="<%=request.getContextPath()%>/flight/search#about">About</a>
					</li>
					<li class="nav-item h4 m-3"><a class="nav-link" href="<%=request.getContextPath()%>/flight/search#deals">Deals</a>
					</li>
					<li class="nav-item h4 m-3"><a class="nav-link"
						href="<%=request.getContextPath()%>/ticket/list">My Bookings</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<%
	int userId = (Integer) request.getSession().getAttribute("userId");

	User user = new UserService().findUserById(userId);
	%>
	
	<h2 style="text-align:center;">profile page</h2>
	<div class="page-content page-container" id="page-content">
		<div class="padding">
		<img src="https://iili.io/JJTpucX.md.png" id="editbutton"
										data-toggle="modal" data-target="#myModal" class="editicon" >
			<div class="row  d-flex justify-content-center mx-auto"
				style="width: 40%;">
				<div class="col-xl-6 col-md-12">
					<div class="card user-card-full">
						<div class="row m-l-0 m-r-0">
							<div class="col-sm-4 bg-c-lite-green user-profile">
								<div class="card-block text-center text-white">
									<div class="m-b-25">
										
										<img src="https://img.icons8.com/bubbles/100/000000/user.png"
											class="img-radius" alt="User-Profile-Image">
									</div>
									<h6 class="f-w-600 h4"><%=user.getFirstname() + " " + user.getLastname()%></h6>
									<p></p>
									<i
										class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="card-block ">
									<h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
									<div class="row ">
										<div class="col-sm-6">
											<p class="m-b-10 f-w-600">Email</p>
											<h6 class="text-muted f-w-400 h5"><%=user.getEmail()%></h6>
										</div>
										<div class="col-sm-6">
											<p class="m-b-10 f-w-600">Phone</p>
											<h6 class="text-muted f-w-400 h5"><%="+91 " + user.getMobileNo()%></h6>
										</div>
									</div>
									
										<a href="<%=request.getContextPath()%>/user/logout"><button class="btn btn-danger mt-3">Logout
										</button>
										</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit Name</h4>
				</div>
				<div class="modal-body">
					<div class="form-row">
					<input type="hidden" name="updateId" value="<%=userId %>" id="updateUserId">
						<div class="col">
							<input type="text" id="firstNamein" value="<%=user.getFirstname() %>" class="form-control mt-3" placeholder="First name">
						</div>
						<div class="col">
							<input type="text" id="lastNamein" value="<%=user.getLastname() %>" class="form-control mt-3" placeholder="Last name">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="close btn btn-light" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="updatebn">Update</button>
				</div>
			</div>

		</div>
	</div>
	
	 <div class="error-message" id="error-message">
  
   </div>

<script>
document.addEventListener("DOMContentLoaded", function() {
	  document.getElementById("updatebn").addEventListener("click", updateUser);
	});

	async function updateUser() {
	  let id = document.getElementById("updateUserId").value;
	  let firstName = document.getElementById("firstNamein").value;
	  let lastName = document.getElementById("lastNamein").value;

	  const requestData = {
	    "id": id,
	    "firstName": firstName,
	    "lastName": lastName
	  };

	  const url = "<%= request.getContextPath()%>/profile/update"; 
	  const options = {
	    method: "POST",
	    headers: {
	      "Content-Type": "application/json"
	    },
	    body: JSON.stringify(requestData)
	  };

	  try {
	    const response = await fetch(url, options);

	    if (response.ok) {
	      const data = await response.json();
	      const message = data.message;
	      console.log(message);
	      window.location.reload(); // Reload the page after successful update
	    } else {
	      console.error("Update request failed with status: " + response.status);
	    }
	  } catch (error) {
	    console.error("Error while sending update request:", error);
	  }
	  
	  
	}

</script>

</body>
</html>
