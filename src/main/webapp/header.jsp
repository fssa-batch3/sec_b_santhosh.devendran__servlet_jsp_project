<%@page import="in.fssa.aviease.model.User"%>
<%@page import="in.fssa.aviease.service.UserService"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>header</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #007bff; /* Header background color */
            color: #fff;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .container {
            max-width: 90vw;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
      
        .profile-name {
    font-size: 20px;
    float: right; 
    margin-left: 40rem; 
    text-align: right; 
    
}
        .home-link {
            color: #fff;
            text-decoration: none;
            font-size: 18px;
        }
    </style>
</head>
<body>

<% int userId=(Integer) request.getSession().getAttribute("userId");

UserService us=new UserService();

User user=us.findUserById(userId);
%>
    <div class="header">
        <div class="container">
            <a href="#" class="home-link">Home</a>
            <span class="profile-name"><%=user.getFirstname()+" "+user.getLastname() %></span>
        </div>
    </div>

  

</body>
</html>
