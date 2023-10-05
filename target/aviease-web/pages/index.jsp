<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aviease</title>
<link rel="stylesheet" href="../assets/error.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style type="text/css">
.avil {
	font-size: 60px;
	font-weight: 900;
	color: #007bff;
}
</style>
</head>
<body>


	<section class="vh-100" style="background-color: #2fa3d7;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-xl-10">
					<div class="card" style="border-radius: 1rem;">
						<div class="row g-0">
							<div class="col-md-6 col-lg-5 d-none d-md-block">
								<img
									src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img1.webp"
									alt="login form" class="img-fluid"
									style="border-radius: 1rem 0 0 1rem;" />
							</div>
							<div class="col-md-6 col-lg-7 d-flex align-items-center">
								<div class="card-body p-4 p-lg-5 text-black">

									<form action="/aviease-web/user/login" method="post">

										<div class="d-flex align-items-center mb-3 pb-1">
											<i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
											<span class="h1 fw-bold mb-0"><span class="avil">Avi</span>ease</span>
										</div>

										<h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign
											into your account</h5>

										<div class="form-outline mb-4">
											<input type="tel" id="form2Example17" pattern="[0-9]{10}" name="phone_number"
												class="form-control form-control-lg" required/> <label
												class="form-label" for="form2Example17">Mobile
												Number</label>
										</div>

										<div class="form-outline mb-4">
											<input type="password" id="form2Example27" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" name="password"
												class="form-control form-control-lg" required/> <label
												class="form-label" for="form2Example27">Password</label>
										</div>

										<div class="pt-1 mb-4">
											<button class="btn btn-lg " type="submit"
												style="background-color: #2fa3d7; color: #fff; font-weight: 500;"
												type="button">Login</button>

										</div>

										<a class="small text-muted" href="#!">Forgot password?</a>
										<p class="mb-5 pb-lg-2" style="color: #393f81;">
											Don't have an account? <a href="new" style="color: #393f81;">Register
												here</a>
										</p>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<script type="text/javascript">

function showError(message, duration) {
    const errorMessage = document.getElementById('error-message');
    errorMessage.innerHTML = message;
    errorMessage.classList.add('show');

    setTimeout(() => {
        errorMessage.classList.remove('show');
        errorMessage.classList.add('hide');

        setTimeout(() => {
            errorMessage.style.display = 'none';
            errorMessage.classList.remove('hide');
        }, 500); 
    }, duration);
}


</script>
	<div class="error-message" id="error-message"></div>

	<%
	String message = (String) request.getAttribute("errorMessage");
	if (message != null) {
	%>
	<script>
	console.log("message called");
        showError("<%=message%>", 2000);
	</script>
	<%
	}
	%>



</body>
</html>