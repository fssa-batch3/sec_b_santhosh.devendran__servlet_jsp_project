<%@page import="com.google.gson.Gson"%>
<%@page import="in.fssa.aviease.service.TicketsService"%>
<%@page import="in.fssa.aviease.model.Tickets"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.aviease.service.FlightService"%>
<%@page import="in.fssa.aviease.model.Flight"%>
<%@page import="in.fssa.aviease.model.User"%>
<%@page import="in.fssa.aviease.service.UserService"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/confirm_booking.css">
    <title>confirm booking</title>
    
     <link rel="stylesheet" href="../assets/error.css">

	<link rel="stylesheet" href="../assets/header.css">
	
	<script src="../assets/error.js"></script>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

 <div class="backdiv">
 <img id="backbutton" alt="" src="https://iili.io/JJHvG19.md.png" width="30px" heigth="30px">
 
 </div>

<%

User user=(User) request.getAttribute("user");
Flight flight=(Flight) request.getAttribute("flight");
LocalDate date=(LocalDate) request.getAttribute("date");
%>

    

    <div class="flex">

    <section class="section over seatsec">
     

        <div class="flightbody" id="flightBody">

            <div>
                <button class="seat ex" id="1">1A</button><span>Available</span><button class="seat booked ex" id="1">1A</button><span>Booked</span><button class="seat selected ex" id="1">1A</button><span>selected</span>
            </div>

            <!-- <div class="row" id="r1">

                <div class="seatdiv">

                    <button class="seat " id="1">1A</button>
                    <button class="seat" id="2">1B</button>
                    <button class="seat booked" id="3">1C</button>
                    <button class="seat" id="4">1D</button>
                </div>
                <div class="seatdiv">
                    <button class="seat" id="5">1E</button>
                    <button class="seat" id="6">1F</button>
                    <button class="seat" id="7">1G</button>
                    <button class="seat" id="8">1H</button>

                </div>
                <div class="seatdiv">
                    <button class="seat" id="9">1I</button>
                    <button class="seat" id="10">1J</button>
                    <button class="seat" id="11">1K</button>
                    <button class="seat" id="12">1L</button>

                </div>
            </div> -->


        </div>

    </section>

    <section class="section details">


        <div id="myPopup" class="popup">
            <div class="popup-content">
                <div class="container  d-flex justify-content-center align-items-center d-none">
           
                    <div class="card p-2 text-center">
                        <h6>Please enter the one time password <br> to verify your account</h6>
                        <div> <span>A code has been sent to</span> <small>*******9897</small> </div>
                        <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2"> <input class="m-2 text-center form-control rounded" type="text" id="first" maxlength="1" /> <input class="m-2 text-center form-control rounded" type="text" id="second" maxlength="1" /> <input class="m-2 text-center form-control rounded" type="text" id="third" maxlength="1" /> <input class="m-2 text-center form-control rounded" type="text" id="fourth" maxlength="1" /> <input class="m-2 text-center form-control rounded" type="text" id="fifth" maxlength="1" /> <input class="m-2 text-center form-control rounded" type="text" id="sixth" maxlength="1" /> </div>
                        <div class="mt-4"> <button class="btn btn-primary px-4 validate" id="paymentsucbn">Validate</button> </div>
                    </div>
               
            </div>
         
                <button id="closePopup">
                      Close
                  </button>
            </div>
        </div>


          
          
        
       


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
                    <div>date: <%=" "+date %></div>
                    <div>Price: <%="RS : "+flight.getPrice() %></div>
                    
                </div>
            </div>


            <div class="paymentdiv">

                <div class="payment">
                    <form action="" class="paymentform">
                        <label for="">card number</label>
                        <input type="number" class="card-number" pattern="[0-9]{12}" required>
                        <label for="">CVV</label>
                        <input type="number" pattern="[0-9]{3}" required>

                      
                    </form>
                    <button  id="myButton" class="paymentbn" >
                        pay
                      </button>
                   
                </div>

                <div class="paysucess " >
                    <img class="d-none" id="paysucess" src="https://iili.io/JHDAuOF.gif" alt="">
                </div>

                <div class="confirmdiv">

                    <form action="create" method="post">
						
						<input type="hidden" value="<%=user.getId() %>"  name="userId">
						<input type="hidden" value="<%= flight.getId()%>" name="flightId" >
						<input type="hidden" value="<%= date%>" name="date" >
						<input type="hidden" id="seatInput" value="" name="seatNo">


                        <button class="confirm diablebn" id="confirm">confirm</button>
                    </form>
                    <span style="color: red;" class="d-none" id="seaterr">select available seat</span><br>
                    <span style="color: red;" class="d-none" id="payerr">complete payment</span>
                </div>

            </div>

    </section>
   
</div>

 <div class="error-message" id="error-message">
  
   </div>



<script>

    document.getElementById("confirm").classList.add("disablebn");


 let totalseatcount=<%=flight.getNoOfSeats()%>;
let rows= Math.floor(totalseatcount/12);

const container = document.getElementById('flightBody'); 
  // Function to create the seat row
  let seatCount=1;
  
  
function createSeatRow(rowNumber,end) {
    const rowDiv = document.createElement('div');
    rowDiv.className = 'row1';
    rowDiv.id = 'r' + rowNumber;

    for (let i = 1; i <= 3; i++) {
        const seatDiv = document.createElement('div');
        seatDiv.className = 'seatdiv';

        for(let j=1;j<=4;j++){

            if(j+((i-1)*4)>end){
                break;
            }
         
        const button = document.createElement('button');
        button.className = 'seat';
        button.id = seatCount; 
        seatCount++;
        button.textContent = rowNumber + String.fromCharCode(64 + j+((i-1)*4));

        seatDiv.appendChild(button);
        rowDiv.appendChild(seatDiv);
    }
    }

    return rowDiv;
}

// Create seat rows 
for (let rowNumber = 1; rowNumber <= rows; rowNumber++) {
    const seatRow = createSeatRow(rowNumber,12);
    container.appendChild(seatRow);
}

const seatRow = createSeatRow(rows+1,totalseatcount%12);
    container.appendChild(seatRow);

  seatCount=1;

    let selected=0;

    let previous = null; 

document.querySelectorAll(".seat").forEach(function (seat) {
    seat.addEventListener("click", function () {
        if (previous !== null) {
            document.getElementById(previous).classList.remove("selected");
        }

        let id = this.id;
        selected = id;
        document.getElementById(id).classList.add("selected");

        previous = id; 
        document.getElementById("seatInput").value=id;
        
        checkStatus();
        
    });

});

let payment =false;



//  otp pop up
document.addEventListener("DOMContentLoaded", function(event) {


function OTPInput() {
const inputs = document.querySelectorAll('#otp > *[id]');
for (let i = 0; i < inputs.length; i++) { inputs[i].addEventListener('keydown', function(event) { if (event.key==="Backspace" ) { inputs[i].value='' ; if (i !==0) inputs[i - 1].focus(); } else { if (i===inputs.length - 1 && inputs[i].value !=='' ) { return true; } else if (event.keyCode> 47 && event.keyCode < 58) { inputs[i].value=event.key; if (i !==inputs.length - 1) inputs[i + 1].focus(); event.preventDefault(); } else if (event.keyCode> 64 && event.keyCode < 91) { inputs[i].value=String.fromCharCode(event.keyCode); if (i !==inputs.length - 1) inputs[i + 1].focus(); event.preventDefault(); } } }); } } OTPInput(); });


// pop up
myButton.addEventListener("click", function () {
            myPopup.classList.add("show");
        });
        closePopup.addEventListener("click", function () {
            myPopup.classList.remove("show");
        });
        window.addEventListener("click", function (event) {
            if (event.target == myPopup) {
                myPopup.classList.remove("show");
            }
        });


// sucess
document.getElementById("paymentsucbn").addEventListener("click",function(){
payment=true;
    document.getElementById("paysucess").classList.remove("d-none");

    myPopup.classList.remove("show");

    document.getElementById("myButton").classList.add("diablebn");
    checkStatus();
});



function checkStatus(){
    if( payment === false && selected == 0){
        document.getElementById("seaterr").classList.remove("d-none");
        document.getElementById("payerr").classList.remove("d-none");

    }else if(payment === false){
        document.getElementById("payerr").classList.remove("d-none");
    }else if(selected == 0){
        document.getElementById("seaterr").classList.remove("d-none");
    }else{
        document.getElementById("seaterr").classList.add("d-none");
        document.getElementById("payerr").classList.add("d-none");
        document.getElementById("confirm").classList.remove("diablebn");
    }
    

}
 // booked seats 


 
 let booked=<%= request.getAttribute("bookedTickets")%>;
 
 
	 console.log(booked);

for(let i=0;i < booked.length ;i++){
    document.getElementById(booked[i]).classList.add("booked");
}


document.getElementById("backbutton").addEventListener("click",function(){
	 window.history.back();	
});


</script>
    
</body>
</html>