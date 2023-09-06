<%@page import="in.fssa.aviease.model.AirLine"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Airline Details</title>
    <style>
        /* Style for the container */
        .container {
            max-width: 20%;
            margin: 50px auto;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Style for the form */
        form {
            margin-top: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Style for buttons */
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

        /* Style for the back button */
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

<% 
AirLine airline = (AirLine) request.getAttribute("airline");
%>

  <a href="list" class="back-button">Back</a>
    <div class="container">
        <h1>Edit Airline Details</h1>
        <form action="update" method="post">
        
        <h3>airline id:<%=airline.getId() %></h3>
        
        <input type="hidden" name="id" value="<%=airline.getId() %>">
        
            <label for="airlineName">Airline Name:</label>
            <input type="text" id="airlineName" name="airlineName" placeholder="Enter Airline Name" value="<%=airline.getAirLineName() %>" required>

            <label for="airlineCode">Airline Code:</label>
            <input type="text" id="airlineCode" name="airlineCode" placeholder="Enter Airline Code" value="<%=airline.getAirLineCode() %>" required>

        
            <div class="button-container">
            <a >
                <button class="button" type="submit">Update Airline</button>
               </a>
              
            </div>
        </form>
    </div>
</body>
</html>
