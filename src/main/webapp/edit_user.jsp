<%@page import="in.fssa.aviease.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User</title>
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
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    h2 {
        margin-top: 0;
        color: #333;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        font-weight: bold;
        margin-bottom: 5px;
    }

    input {
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    button {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>

<% 
User user = (User) request.getAttribute("user");
%>

<div>
    <h2>User ID: <%= user.getId() %></h2>
    
</div>

<div class="container">
    <h2>Update User</h2>
    	<form action="update" method="post">
    	
    		<input type="hidden" name="id" value="<%= user.getId()%>">
			<label for="firstName">First Name:</label> 
			<input type="text" name="firstName" value="<%=user.getFirstname() %>" required>
				 
			<label for="lastName">Last Name:</label>
			<input type="text" name="lastName" value="<%=user.getLastname() %>" required> 
				
			<label for="mobileNumber">Mobile Number:</label> 
			<input type="tel" name="mobileNumber" value="<%=user.getMobileNo() %>" readonly>
				
				
			 <label for="email">Email:</label>
			<input type="email" name="email" value="<%=user.getEmail() %>" readonly> 
			
			<label for="password">password:</label> 
			<input type="password" name="password" value="<%=user.getPassword() %>" readonly>

			<button type="submit">update</button>
		</form>
</div>

</body>
</html>
