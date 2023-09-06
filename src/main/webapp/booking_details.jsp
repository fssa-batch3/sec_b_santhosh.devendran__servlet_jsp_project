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
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
           
            height: 100vh;
        }

        .container1 {
        
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 400px;
            margin: 0 auto;
            margin-top: 10rem;
        }

        h2 {
            text-align: center;
            color: #333;
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

        .flight-info .statusp {
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
}

input[type="submit"]:hover {
    background-color: #0056b3;
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
                <div>name: <%=user.getFirstname()+" "+user.getLastname() %></div>
                <div>Email: <%=user.getEmail() %></div>
                <div>Phone Number: <%="+91 "+user.getMobileNo()%></div>
            </div>
        </div>
        <div class="flight-info">
            <div class="label">Flight details:</div>
            <div class="info">
                <div>Source: <%=flight.getSrc() %></div>
                <div>Destination: <%=flight.getDestination() %></div>
                <div>Airline: <%=flight.getAirlineCode() %></div>
                <div>Flight Number: <%=flight.getFlightNo() %></div>
                <div>date: <%=localDate %></div>
                <div>Price: <%="RS :"+flight.getPrice() %></div>
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
