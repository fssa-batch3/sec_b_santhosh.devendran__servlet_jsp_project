<%@page import="in.fssa.aviease.model.AirLine"%>
<%@page import="in.fssa.aviease.service.AirLineService"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Airline List</title>
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
<a href="/aviease-web/admin/list_all_user" class="back-button">Back</a>

    <div class="container">
     <a href="new" class="create-button">Create New Airline</a>
        <h1>Airline List</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Airline Name</th>
                <th>Airline Code</th>
                <th>Actions</th>
            </tr>
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
</body>
</html>
