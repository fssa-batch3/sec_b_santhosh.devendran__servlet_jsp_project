<%@page import="in.fssa.aviease.service.FlightService"%>
<%@page import="in.fssa.aviease.model.Flight"%>
<%@page import="in.fssa.aviease.model.AirLine"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.aviease.service.AirLineService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Flight</title>
    <style>
        .container {
            max-width: 40%;
            margin: 50px auto;
            font-family: Arial, sans-serif;
        }

        form {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            font-weight: bold;
        }

        input[type="text"], input[type="number"], input[type="time"], input[type="radio"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .update-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .update-button:hover {
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

        .flight-status {
            display: flex;
            align-items: center;
        }

        .radio-group {
            margin-right: 20px;
            margin-left: 20px;
        }

        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
            font-size: 16px;
            color: #333;
            outline: none;
        }

        select::after {
            content: '\25BC';
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            font-size: 16px;
            pointer-events: none;
        }

        select option {
            background-color: #fff;
            color: #333;
        }

        select:hover, select:focus {
            border-color: #007bff;
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
Flight flight =new FlightService().findByFlightId(Integer.parseInt(id));
%>
    <a href="/aviease-web/admin/flight/list" class="back-button">Back</a>

    <div class="container">
        <h1>Edit Flight</h1>

        <form action="update" method="post">
        
        <input type="hidden" name="id" value="<%=flight.getId() %>">
            <label for="src">Source:</label>
            <select id="src" name="src" required>
            <option value="<%=flight.getSrc() %>"  selected><%=flight.getSrc() %></option>
              <option value="Coimbatore">Coimbatore</option>
        <option value="Hyderabad">Hyderabad</option>
        <option value="Vijayawada">Vijayawada</option>
        <option value="Jaipur">Jaipur</option>
        <option value="Udaipur">Udaipur</option>
        <option value="Kolkata">Kolkata</option>
        <option value="Patna">Patna</option>
        <option value="Lucknow">Lucknow</option>
        <option value="Varanasi">Varanasi</option>
        <option value="Mumbai">Mumbai</option>
        <option value="Pune">Pune</option>
        <option value="Delhi">Delhi</option>
        <option value="Amritsar">Amritsar</option>
        <option value="Bengaluru">Bengaluru</option>
        <option value="Guwahati">Guwahati</option>
        <option value="Imphal">Imphal</option>
        <option value="Ahmedabad">Ahmedabad</option>
        <option value="Vadodara">Vadodara</option>
        <option value="Bhopal">Bhopal</option>
        <option value="Indore">Indore</option>
        <option value="Ranchi">Ranchi</option>
        <option value="Bhubaneswar">Bhubaneswar</option>
        <option value="Nagpur">Nagpur</option>
        <option value="Raipur">Raipur</option>
        <option value="Jodhpur">Jodhpur</option>
        <option value="Kochi">Kochi</option>
        <option value="Tiruchirappalli">Tiruchirappalli</option>
        <option value="Tirupati">Tirupati</option>
        <option value="Shillong">Shillong</option>
        <option value="Silchar">Silchar</option>
        <option value="Srinagar">Srinagar</option>
        <option value="Surat">Surat</option>
        <option value="Tuticorin">Tuticorin</option>
        <option value="Port-Blair">Port-Blair</option>
        <option value="Prayagraj">Prayagraj</option>
        <option value="Vishakhapatnam">Vishakhapatnam</option>
        <option value="North Goa">North Goa</option>
        <option value="Pantnagar">Pantnagar</option>
        <option value="Kadapa">Kadapa</option>
        <option value="Kannur">Kannur</option>
        <option value="Visakhapatnam">Visakhapatnam</option>
        <option value="Itanagar">Itanagar</option>
        <option value="Kolhapur">Kolhapur</option>
        <option value="Ludhiana">Ludhiana</option>
        <option value="Mangaluru">Mangaluru</option>
        <option value="Madurai">Madurai</option>
        <option value="Nanded">Nanded</option>
        <option value="Shirdi">Shirdi</option>
        <option value="Thiruvananthapuram">Thiruvananthapuram</option>
            </select>

            <label for="destination">Destination:</label>
            <select id="destination" name="destination" required>
            <option value="<%=flight.getDestination() %>"selected><%=flight.getDestination() %></option>
               <option value="Coimbatore">Coimbatore</option>
        <option value="Hyderabad">Hyderabad</option>
        <option value="Vijayawada">Vijayawada</option>
        <option value="Jaipur">Jaipur</option>
        <option value="Udaipur">Udaipur</option>
        <option value="Kolkata">Kolkata</option>
        <option value="Patna">Patna</option>
        <option value="Lucknow">Lucknow</option>
        <option value="Varanasi">Varanasi</option>
        <option value="Mumbai">Mumbai</option>
        <option value="Pune">Pune</option>
        <option value="Delhi">Delhi</option>
        <option value="Amritsar">Amritsar</option>
        <option value="Bengaluru">Bengaluru</option>
        <option value="Guwahati">Guwahati</option>
        <option value="Imphal">Imphal</option>
        <option value="Ahmedabad">Ahmedabad</option>
        <option value="Vadodara">Vadodara</option>
        <option value="Bhopal">Bhopal</option>
        <option value="Indore">Indore</option>
        <option value="Ranchi">Ranchi</option>
        <option value="Bhubaneswar">Bhubaneswar</option>
        <option value="Nagpur">Nagpur</option>
        <option value="Raipur">Raipur</option>
        <option value="Jodhpur">Jodhpur</option>
        <option value="Kochi">Kochi</option>
        <option value="Tiruchirappalli">Tiruchirappalli</option>
        <option value="Tirupati">Tirupati</option>
        <option value="Shillong">Shillong</option>
        <option value="Silchar">Silchar</option>
        <option value="Srinagar">Srinagar</option>
        <option value="Surat">Surat</option>
        <option value="Tuticorin">Tuticorin</option>
        <option value="Port-Blair">Port-Blair</option>
        <option value="Prayagraj">Prayagraj</option>
        <option value="Vishakhapatnam">Vishakhapatnam</option>
        <option value="North Goa">North Goa</option>
        <option value="Pantnagar">Pantnagar</option>
        <option value="Kadapa">Kadapa</option>
        <option value="Kannur">Kannur</option>
        <option value="Visakhapatnam">Visakhapatnam</option>
        <option value="Itanagar">Itanagar</option>
        <option value="Kolhapur">Kolhapur</option>
        <option value="Ludhiana">Ludhiana</option>
        <option value="Mangaluru">Mangaluru</option>
        <option value="Madurai">Madurai</option>
        <option value="Nanded">Nanded</option>
        <option value="Shirdi">Shirdi</option>
        <option value="Thiruvananthapuram">Thiruvananthapuram</option>
            </select>

            <label for="airlineCode">Airline Code:</label>
            <select id="airlineCode" name="airlineCode" required>
            <option value="<%=flight.getAirlineCode() %>" selected><%=flight.getAirlineCode() %></option>
                 <%
            AirLineService airlineService = new AirLineService();
            List<AirLine> airlineList = airlineService.findAll();
            for (AirLine airline : airlineList) {
            %>
            <option value="<%= airline.getAirLineCode() %>"><%= airline.getAirLineCode() %></option>
            <%
            }
            %>
            </select>

            <label for="flightNo">Flight Number:</label>
            <input type="text" id="flightNo" value="<%=flight.getFlightNo() %>" name="flightNo" required>

            <div class="flight-status">
                <label>Flight Status:</label>
                <div class="radio-group">
                    <input type="radio" id="statusTrue" name="flightStatus" value="true">
                    <label for="statusTrue">Active</label>
                </div>
                <div class="radio-group">
                    <input type="radio" id="statusFalse" name="flightStatus" value="false">
                    <label for="statusFalse">Inactive</label>
                </div>
            </div>

            <label for="flightTime">Flight Time:</label>
            <input type="time" id="flightTime" value="<%=flight.getFlightTime() %>" name="flightTime" required>

            <label for="noOfSeats">Number of Seats:</label>
            <input type="number" id="noOfSeats" value="<%=flight.getNoOfSeats() %>" name="noOfSeats" required>

            <label for="price">Price:</label>
            <input type="number" id="price" value="<%=flight.getPrice() %>" name="price" required>

            <div class="button-container">
                <button class="update-button" type="submit">Update Flight</button>
            </div>
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
