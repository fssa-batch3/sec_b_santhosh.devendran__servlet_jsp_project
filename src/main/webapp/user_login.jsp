<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('https://res.cloudinary.com/dvb2bkrx9/image/upload/v1694057317/udnt4kzykpl8ehnx3vxa.jpg');
   			background-position: center;
    		background-repeat: no-repeat;
    		background-size: cover;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.5); 
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 300px;
        }
        h2 {
            text-align: center;
        }
        form{
         padding:20px;
        }
        
        .form-group {
            margin-bottom: 20px;
           
        }
        label {
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn-login {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin:10px;
        }
        .btn-login:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="/aviease-web/user/login" method="post">
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" value="8765432877" pattern="[7-9]{1}[0-9]{9}"  name="phone_number" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" value="Mathi@1234" name="password" required>
            </div>
            <button type="submit" class="btn-login">Login</button>
        </form>
        
        <a href="new"><p style="text-align: center;">Create new account</p></a>
        
        <a href="/aviease-web/admin/list_all_user" ><button class="btn-login">admin</button></a>
    </div>
</body>
</html>
