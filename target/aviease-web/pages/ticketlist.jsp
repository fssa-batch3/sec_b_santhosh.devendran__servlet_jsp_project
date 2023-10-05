<%@page import="java.util.Collections"%>
<%@page import="java.time.LocalDate"%>
<%@page import="in.fssa.aviease.model.Tickets"%>
<%@page import="in.fssa.aviease.model.Flight"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>my bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<script src="../assets/error.js"></script>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
    
<link rel="stylesheet" href="../assets/mybooking.css">
 <link rel="stylesheet" href="../assets/error.css">
</head>
<body>

<%

List<Flight> flights=(List<Flight>)request.getAttribute("flights");

List<Tickets> tickets=(List<Tickets>) request.getAttribute("tickets");
Collections.reverse(tickets);
%>

<nav class="navbar navbar-expand-lg navbar-light   header">
        <div class="container h1 tw">
            <a class="navbar-brand " href="#"><span class="avil">Avi</span>ease</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item active m-3">
                        <a class="nav-link  h4" href="<%=request.getContextPath() %>/flight/search">Home</a>
                    </li>
                    <li class="nav-item h4 m-3">
                        <a class="nav-link" href="<%=request.getContextPath()%>/flight/search#about">About</a>
                    </li>
                    <li class="nav-item h4 m-3">
                        <a class="nav-link" href="<%=request.getContextPath()%>/flight/search#deals">Deals</a>
                    </li>
                    <li class="nav-item h4 m-3">
                        <a class="nav-link" href="<%=request.getContextPath() %>/profile/view">Profile</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<h2 style="text-align:center;">Booking List</h2>

    <section class="wrapper secflex">
 
 <%for(Tickets ticket:tickets){ 
	 
	 int temp=Flight.binarySearch(flights, ticket.getFlightId());
	 Flight flight=new Flight();
	 if(temp>=0){
	 	 flight=flights.get(temp);
	 }
	 String className ="";
	 if(! ticket.isActive()){
		 className="cancelDiv";
	 } 
 %>
 
 
       <div class="content mt-5 ">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 ">
                        <div class="card <%= className %>">
                           
                            <div class="card-content">
                                <div class="route">
                                    <h4><%=flight.getSrc() %></h4>
                                    <svg class="plane-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 510 510">
                                       <path fill="#3f32e5" d="M497.25 357v-51l-204-127.5V38.25C293.25 17.85 275.4 0 255 0s-38.25 17.85-38.25 38.25V178.5L12.75 306v51l204-63.75V433.5l-51 38.25V510L255 484.5l89.25 25.5v-38.25l-51-38.25V293.25l204 63.75z"/>
                                    </svg>
                                    <h4><%=flight.getDestination() %></h4>
                                 </div>

                                 <div class="item">
                                    <span>Departure</span>
                                    <h3><%=ticket.getTravelDate()+" "+flight.getFlightTime() %></h3>
                                 </div>

                                 <div >
                                 <%  LocalDate today = LocalDate.now();
                                 	if(ticket.getTravelDate().isBefore(today) && ticket.isActive()){
                                 %>
                                    <span class="badge statusbadge sprimary">Expired</span>
                                    <%}else if(ticket.isActive()){ %>
                                    <span class="badge statusbadge ssuccess">Booked</span>
                                    <%}else{ %>
                                    <span class="badge statusbadge ssecondary">Canceled</span>
                                    <%} %>
                                 </div>

                               
                            </div>
                            <div class="card-read-more ticketBn">
                                <a href="<%=request.getContextPath()%>/ticket/details?id=<%=ticket.getId() %>" class="btn btn-link btn-block">
                                    view Ticket
                                </a>
                                <% if(ticket.getTravelDate().isEqual(today)&&ticket.isActive() || ticket.isActive()&&ticket.getTravelDate().isAfter(today)){%>
                                <a id="<%=ticket.getId()%>"  class="btn btn-link btn-block cancelbn" style="color:red;">
                                Cancel</a>
                                <%} %>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    
    <%} %>
</section>


 <div class="error-message" id="error-message">
  
   </div>

<script>

document.querySelectorAll(".cancelbn").forEach(function (seat) {
	  seat.addEventListener("click", async function () {
	    console.log(this);
	    const id = this.id;

	    const requestData = {
	      id: id
	    };

	    const url = "<%= request.getContextPath()%>/ticket/cancel";
	    const options = {
	      method: "POST",
	      headers: {
	        "Content-Type": "application/json"
	      },
	      body: JSON.stringify(requestData)
	    };

	    try {
	      const response = await fetch(url, options);

	      if (response.ok) {
	        const data = await response.json();
	        const message = data.message;
	        alert(message); 
	        window.location.href = "<%=request.getContextPath()%>/ticket/list";
	      } else {
	        console.error("Update request failed with status: " + response.status);
	      }
	    } catch (error) {
	      console.error("Error while sending update request:", error);
	    }
	  });
	});



</script>
</body>
</html>