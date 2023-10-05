<%@page import="in.fssa.aviease.model.User"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.aviease.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>USER LIST</title>

 <style>
 body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 80%;
    margin: 50px auto;
}

.table-container {
    border: 1px solid #ccc;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 15px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
}

tr:hover {
    background-color: #f2f2f2;
    transition: background-color 0.3s ease;
}

.button-container {
    text-align: center;
    margin-top: 20px;
}

.button {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.button:hover {
    background-color: #0056b3;
}

.create {
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

.create:hover {
    background-color: #0056b3;
}

.update {
    padding: 10px 20px;
    background-color: #28a745; 
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.update:hover {
    background-color: #218838;
}

.create_div{
padding: 40px;

}
    
     .back-button {
            padding: 10px 20px;
            background-color: #ccc;
            color: #000;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .back-button:hover {
            background-color: #999;
        }   
    </style>
</head>
<body>

<a href="/aviease-web/user_login.jsp" class="back-button">Back</a>

<div class="create_div">
<a href="/aviease-web/admin/airline/list">
    <button class="create" type="button">list all airliner</button>
</a>

<a href="/aviease-web/admin/flight/list">
    <button class="create" type="button">list all flight</button>
</a>
</div>



<table >

	<%
	UserService userService=new UserService();
	%>
	<%
	List<User> userList=userService.getAllUser();
	
	
	%>
	
	

        <tr>
            <th>id</th>
            <th>first name</th>
            <th>last name</th>
            <th>mobile no</th>
            <th>email</th>
            <th>options</th>
        </tr>
        
        <%for(User user:userList){ %>
        
        <tr>
            <td><%=user.getId() %></td>
            <td><%=user.getFirstname() %></td>
            <td><%=user.getLastname() %></td>
            <td><%=user.getMobileNo() %></td>
            <td><%=user.getEmail() %></td>
            <td><a href="/aviease-web/admin/user/edit?id=<%= user.getId()%>">
   			 <button class="update" type="button">update User</button>
			</a></td>
        </tr>
        
        <%} %>
        
    </table>

</body>
</html>