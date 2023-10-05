<%@page import="in.fssa.aviease.model.User"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.aviease.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>USER LIST</title>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
            font-family: Arial, sans-serif;
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
    margin-top:30px;
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

  .create_div {
    padding: 40px;
  }

  .create, .update {
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-decoration: none;
    display: inline-block;
    color: #fff;
  }

  .create {
    background-color: #007bff;
  }

  .create:hover {
    background-color: #0056b3;
  }

  .update {
    background-color: #28a745;
  }

  .update:hover {
    background-color: #218838;
  }
  
    /* Header styles */


</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand navti">Aviease Admin</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
    <a class="nav-item nav-link" href="/aviease-web/admin/list_all_user">List All user</a>
      <a class="nav-item nav-link" href="/aviease-web/admin/airline/list">List All Airlines</a>
      <a class="nav-item nav-link" href="/aviease-web/admin/flight/list">List All Flights</a>
    </div>
  </div>
</nav>

<div class="container">

<table id="myTable" class="display">
  <thead>
    <tr>
      <th>ID</th>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Mobile No</th>
      <th>Email</th>
      <th>Options</th>
    </tr>
  </thead>
  <tbody>
    <%
      UserService userService = new UserService();
      List<User> userList = userService.getAllUser();
    %>

    <%
      for (User user : userList) {
    %>
    <tr>
      <td><%= user.getId() %></td>
      <td><%= user.getFirstname() %></td>
      <td><%= user.getLastname() %></td>
      <td><%= user.getMobileNo() %></td>
      <td><%= user.getEmail() %></td>
      <td>
        <a href="/aviease-web/admin/user/edit?id=<%= user.getId() %>">
          <button class="update" type="button">Update User</button>
        </a>
      </td>
    </tr>
    <%
      }
    %>
  </tbody>
</table>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
  $(document).ready(function () {
    $('#myTable').DataTable();
  });
</script>

</body>
</html>
