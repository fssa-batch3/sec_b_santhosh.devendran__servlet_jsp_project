<%@page import="in.fssa.aviease.model.Flight"%>
<%@page import="in.fssa.aviease.service.FlightService"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight List</title>
    
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
    <a href="new" class="create-button">Create New Flight</a>
    <h1>Flight List</h1>
    <table id="myTable" class="display">
      <thead>
        <tr>
            <th>ID</th>
            <th>Source</th>
            <th>Destination</th>
            <th>Airline Code</th>
            <th>Flight Number</th>
            <th>Flight Status</th>
            <th>Flight Time</th>
            <th>Number of Seats</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
          </thead>
        <%
        FlightService flightService = new FlightService();
        List<Flight> flightList = flightService.findAllFlight();
        for (Flight flight : flightList) {
        %>
        <tr>
            <td><%= flight.getId() %></td>
            <td><%= flight.getSrc() %></td>
            <td><%= flight.getDestination() %></td>
            <td><%= flight.getAirlineCode() %></td>
            <td><%= flight.getFlightNo() %></td>
            <td><%= flight.isFlightStatus()==true?"active":"in active" %></td>
            <td><%= flight.getFlightTime() %></td>
            <td><%= flight.getNoOfSeats() %></td>
            <td><%= flight.getPrice() %></td>
            <td>
                <a href="edit?id=<%= flight.getId() %>">Edit</a>
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
