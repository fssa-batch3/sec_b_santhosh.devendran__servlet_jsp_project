<%@page import="in.fssa.aviease.model.User"%>
<%@page import="in.fssa.aviease.model.Flight"%>
<%@page import="in.fssa.aviease.service.UserService"%>
<%@page import="in.fssa.aviease.service.FlightService"%>
<%@page import="java.time.LocalDate"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Confirm Ticket Booking</title>
    <style> 
    
    body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image: url('https://res.cloudinary.com/dvb2bkrx9/image/upload/v1694030361/sclpaeoxcjxmvjygnuqk.jpg');
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .container1 {
            background-color: rgba(255, 255, 255, 0.3);
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 400px;
            margin: auto;
            margin-top: 13%;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 0; /* Remove margin from the top of the heading */
        }

        .user-info,
        .flight-info {
            margin-bottom: 20px;
        }

        .label {
            font-weight: bold;
            color: #333;
        }

        .info {
            margin-top: 5px;
        }

        .status {
            color: orange;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            display: block; 
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        
        .container1 {
            text-align: center; 
        }

        .user-info, .flight-info {
            border-top: 1px solid #ccc; 
            padding-top: 15px; 
        }

        .flight-info .info {
            margin-top: 10px; 
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />
<% 

int userId = (Integer) request.getSession().getAttribute("userId");

//String userId = request.getParameter("userId");
String flightId=request.getParameter("flightId");


String dateString = request.getParameter("date");
LocalDate localDate = LocalDate.parse(dateString);
	
	
	int flightIdInt=Integer.parseInt(flightId);
	
	
	FlightService fs=new FlightService();
	UserService us=new UserService();
	
	Flight flight=fs.findByFlightId(flightIdInt);
	User   user=us.findUserById(userId);
	%>

    <div class="container1">
        <h2>Confirm Ticket Booking</h2>
        <div class="user-info">
            <div class="label">passenger details:</div>
            <div class="info">
                <div>Name : <%=" "+user.getFirstname()+" "+user.getLastname() %></div>
                <div>Email: <%=" "+user.getEmail() %></div>
                <div>Phone Number: <%="+91 "+user.getMobileNo()%></div>
            </div>
        </div>
        <div class="flight-info">
            <div class="label">Flight details:</div>
            <div class="info">
                <div>Source: <%=" "+flight.getSrc() %></div>
                <div>Destination: <%=" "+flight.getDestination() %></div>
                <div>Airline: <%=" "+flight.getAirlineCode() %></div>
                <div>Flight Number: <%=" "+flight.getFlightNo() %></div>
                <div>date: <%=" "+localDate %></div>
                <div>Price: <%="RS : "+flight.getPrice() %></div>
                <div class="statusp">Status: pending</div>
            </div>
        </div>
        
        <form action="create" method="post">
    <input type="hidden" name="flightId" value="<%=flight.getId()%>">
    <input type="hidden" name="userId" value="<%=user.getId() %>">
    <input type="hidden" name="date" value="<%=localDate%>">
    <input type="submit" value="confirm">
	</form>
    </div>
    
    
    
    
    
</body>
</html>
