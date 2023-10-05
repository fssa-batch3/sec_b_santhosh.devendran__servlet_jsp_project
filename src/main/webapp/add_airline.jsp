<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Create Airline</title>
    
    <style>
        
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        
        label, input {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        
        .create-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .create-button:hover {
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
    <div class="container">
        <h1>Create Airline</h1>
        <form action="create" method="post">
            <label for="airlineName">Airline Name:</label>
            <input type="text" id="airlineName" name="airlineName" required>
            
            <label for="airlineCode">Airline Code:</label>
            <input type="text" id="airlineCode" name="airlineCode" required>

         

            <button type="submit" class="create-button">Create Airline</button>
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
