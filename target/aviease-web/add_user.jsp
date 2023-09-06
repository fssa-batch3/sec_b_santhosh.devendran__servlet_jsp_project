<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create user</title>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 400px;
	margin: 50px auto;
	padding: 20px;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h2 {
	margin-top: 0;
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	font-weight: bold;
	margin-bottom: 8px;
}

input {
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	transition: border-color 0.3s ease;
}

input:focus {
	outline: none;
	border-color: #007bff;
}

button {
	padding: 12px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	font-weight: bold;
}

button:hover {
	background-color: #0056b3;
}

.container::before, .container::after {
	content: "";
	display: table;
	clear: both;
}
</style>
</head>
<body>
	<div class="container">
		<h2>User Registration</h2>
		<form action="create" method="post">
			<label for="firstName">First Name:</label> 
			<input type="text"
				name="firstName" required>
				 
			<label for="lastName">Last
				Name:</label> <input type="text" name="lastName" required> 
				
			<label
				for="mobileNumber">Mobile Number:</label> <input type="tel"
				name="mobileNumber" required>
				
				
			 <label for="email">Email:</label>
			<input type="email" name="email" required> 
			
			<label
				for="password">password:</label> <input type="password"
				name="password" required>

			<button type="submit">Register</button>
		</form>
	</div>
</body>
</html>