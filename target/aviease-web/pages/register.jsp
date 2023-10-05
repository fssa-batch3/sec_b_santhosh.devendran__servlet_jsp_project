<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aviease Register</title>
    <link rel="stylesheet" href="../assets/register.css">
    <link rel="stylesheet" href="../assets/error.css">
    <script src="../assets/error.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>


    <section class="vh-100 bg-image"
        style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
        <div class="mask d-flex align-items-center h-100 gradient-custom-3">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body p-5">
                                <h2 class="text-uppercase text-center mb-5">Create an account</h2>

                                <form action="create" method="post">

                                    <div class="row">
                                        <div class="col-md-6 mb-2">
                                            <div class="form-outline">
                                                <input type="text" id="firstName" name="firstName" pattern="[A-Za-z]{3,20}" class="form-control form-control-lg" required/>
                                                <label class="form-label" for="form3Example1cg">First Name</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-2">
                                            <div class="form-outline">
                                                <input type="text" id="lastName" name="lastName" pattern="[A-Za-z]{1,20}" class="form-control form-control-lg" required/>
                                                <label class="form-label" for="form3Example1cg2">Last Name</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-outline mb-2">
                                        <input type="tel" id="mobileNumber" name="mobileNumber" pattern="[7-9]{1}[0-9]{9}"  class="form-control form-control-lg" required/>
                                        <label class="form-label" for="form3Example3cg">Mobile number</label>
                                    </div>
                                    <div class="form-outline mb-2">
                                        <input type="email" id="email" name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" class="form-control form-control-lg" required/>
                                        <label class="form-label" for="form3Example3cg">Your Email</label>
                                    </div>

                                    <div class="form-outline mb-2">
                                        <input type="password" name="password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" id="password"
                                            class="form-control form-control-lg" required />
                                        <label class="form-label"  for="form3Example4cg">Password</label>
                                    </div>

                  <!--                    <div class="form-outline mb-2">
                                        <input type="password" id="repeatPassword"
                                            class="form-control form-control-lg" required/>
                                        <label class="form-label" for="form3Example4cdg">Repeat your password</label>
                                    </div>  -->

                                    <div class="form-check d-flex justify-content-center mb-5">
                                        <input class="form-check-input me-2" type="checkbox" value=""
                                            id="form2Example3cg"  required/>
                                        <label class="form-check-label" for="form2Example3g">
                                            I agree all statements in <a href="#!" class="text-body"><u>Terms of
                                                    service</u></a>
                                        </label>
                                    </div>

                                    <div class="d-flex justify-content-center">
                                        <button type="submit"
                                            class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                                    </div>

                                    <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="login"
                                            class="fw-bold text-body"><u>Login here</u></a></p>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
     <div class="error-message" id="error-message">
  
   </div>

</body>
</html>