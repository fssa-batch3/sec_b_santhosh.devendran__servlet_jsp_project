<%@page import="in.fssa.aviease.model.Tickets"%>
<%@page import="java.time.LocalDate"%>
<%@page import="in.fssa.aviease.service.TicketsService"%>
<%@page import="in.fssa.aviease.service.FlightService"%>
<%@page import="in.fssa.aviease.model.Flight"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight Booking</title>
<style>
table {
	border-collapse: collapse;
	width: 80%;
	margin: 20px auto;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h2>Flight result</h2>

	<%
	String src = (String) request.getAttribute("src");
	String des = (String) request.getAttribute("des");
	String dateStr = (String) request.getAttribute("date");

	int userId = (Integer) request.getSession().getAttribute("userId");

	java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd");
	LocalDate date = LocalDate.parse(dateStr, formatter);

	FlightService fs = new FlightService();
	TicketsService ts = new TicketsService();

	List<Flight> flights = fs.findAllFlightBySourcAndDestination(src, des);
	%>
	<table>
		<tr>
			<th>Source</th>
			<th>Destination</th>
			<th>Airline</th>
			<th>Flight No</th>
			<th>Flight Time</th>
			<th>Seats available</th>
			<th>price</th>
			<th>Action</th>
		</tr>

		<%
		for (Flight flight : flights) {
		%>
		<tr>
			<td><%=flight.getSrc()%></td>
			<td><%=flight.getDestination()%></td>
			<td><%=flight.getAirlineCode()%></td>
			<td><%=flight.getFlightNo()%></td>
			<td><%=flight.getFlightTime()%></td>

			<%
			List<Tickets> ticketList = ts.findByFlightIdTravelDate(flight.getId(), date);
			boolean alreadyBooked = false;
			for (Tickets ticket : ticketList) {
				if (ticket.getUserId() == userId)
					alreadyBooked = true;
			}
			%>
			<td><%=(flight.getNoOfSeats() - ticketList.size())%></td>
			<td><%=flight.getPrice()%></td>
			<td>
				<%
				if (flight.getNoOfSeats() > ticketList.size() && !alreadyBooked) {
				%> <a
				href="booking/new?flightId=<%=flight.getId()%>&date=<%=date%>"><button
						style="background-color: #007bff; color: #fff;">Book now</button></a>
				<%
				} else if (alreadyBooked) {
				%>
				<button style="background-color: #ccc; color: #333;">
					already booked</button> <%
 } else {
 %>
				<button style="background-color: #ccc; color: #333;">
					closed</button> <%
 }
 %>

			</td>
		</tr>
		<%
		}
		%>>
	</table>
</body>
</html>
