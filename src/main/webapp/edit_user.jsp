<%@page import="in.fssa.aviease.service.UserService"%>
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
    
      @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes fadeOut {
            0% {
                opacity: 1;
            }
            50%{
              opacity: 0.3;
            }
            100% {
                opacity: 0;
            }
        }

        .error-message {
            background-color: #ff0000;
            border-radius: 20px;
            color: #ffffff;
            padding: 10px;
            text-align: center;
            font-size: 16px;
            font-weight: 600;
            position: fixed;
            top: 10px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1000;
            display: none;
            animation-duration: 0.5s;
            animation-fill-mode: forwards;
        }

        .error-message.show {
            display: block;
            animation-name: fadeIn;
        }

        .error-message.hide {
            display: block;
            animation-name: fadeOut;
        }
    
</style>
</head>
<body>

<% 
String id = request.getParameter("id");		
User user =new UserService().findUserById(Integer.parseInt(id));

%>

<div>
    <h2>User ID: <%= user.getId() %></h2>
    
</div>

<div class="container">
    <h2>Update User</h2>
    	<form action="update" method="post">
    	
    		<input type="hidden" name="id" value="<%= user.getId()%>">
			<label for="firstName">First Name:</label> 
			<input type="text" name="firstName" pattern="[A-Za-z]{3,20}" value="<%=user.getFirstname() %>" required>
				 
			<label for="lastName">Last Name:</label>
			<input type="text" name="lastName" pattern="[A-Za-z]{1,10}" value="<%=user.getLastname() %>" required> 
				
			<label for="mobileNumber">Mobile Number:</label> 
			<input type="tel" name="mobileNumber" value="<%=user.getMobileNo() %>" readonly>
				
				
			 <label for="email">Email:</label>
			<input type="email" name="email" value="<%=user.getEmail() %>" readonly> 
			
			<label for="password">password:</label> 
			<input type="password" name="password" value="<%=user.getPassword() %>" readonly>

			<button type="submit">update</button>
		</form>
</div>
 <div class="error-message" id="error-message">
 
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
		request.removeAttribute("errorMessage");

	%>
	<script>
        showError("<%=message%>", 2000);
	</script>
	<%
	}
	%>

</body>
</html>
