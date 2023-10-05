<%@page import="in.fssa.aviease.model.AirLine"%>
<%@page import="in.fssa.aviease.service.AirLineService"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Airline List</title>
    
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
       
        .container {
            max-width: 80%;
            margin: 50px auto;
            font-family: Arial, sans-serif;
        }

       
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
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

        
        a {
            text-decoration: none;
            color: #007bff;
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
     <a href="new" class="create-button">Create New Airline</a>
        <h1>Airline List</h1>
        <table id="myTable" class="display">
          <thead>
            <tr>
                <th>ID</th>
                <th>Airline Name</th>
                <th>Airline Code</th>
                <th>Actions</th>
            </tr>
              </thead>
            <%
            AirLineService airlineService = new AirLineService();
                List<AirLine> airlineList = airlineService.findAll();
                for (AirLine airline : airlineList) {
            %>
            <tr>
                <td><%= airline.getId() %></td>
                <td><%= airline.getAirLineName() %></td>
                <td><%= airline.getAirLineCode() %></td>
                <td>
                    <a href="edit?id=<%= airline.getId() %>">Edit</a>
                    
                </td>
            </tr>
            <%
                }
            %>
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
