<%@page import="in.fssa.aviease.model.Tickets"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aviease</title>

    <link rel="stylesheet" href="../assets/header.css">
    <link rel="stylesheet" href="../assets/home.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.2/css/sharp-solid.css">

 <link rel="stylesheet" href="../assets/error.css">

</head>
<body>


    <div class="fsearch">


        <nav class="navbar navbar-expand-lg navbar-light   header">
            <div class="container h1 tw">
                <a class="navbar-brand " href="search"><span class="avil">Avi</span>ease</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item active m-3">
                            <a class="nav-link  h4" href="search">Home</a>
                        </li>
                        <li class="nav-item h4 m-3">
                            <a class="nav-link" href="#about">About</a>
                        </li>
                        <li class="nav-item h4 m-3">
                            <a class="nav-link" href="#deals">Deals</a>
                        </li>
           
                         <li class="nav-item h4 m-3 dropdown">
                            <a class="nav-link" >My Account</a>
                            <div class="dropdown-content">
                                <a href="<%=request.getContextPath() %>/profile/view"> <p>Profile</p></a>
                                <a href="<%=request.getContextPath() %>/ticket/list"><p>My Bookings</p></a>
                                </div>
                        </li>
                        
                    </ul>
                </div>
            </div>
        </nav>


        <div class="heading">
            <h2> Book to fly</h2>
        </div>

        <div class="serd">
        
 

            <div class="indd">
                <div class="ind">

                    <label for="source">Source:</label>
                    <select id="source" name="source" required>
                        <option value="Chennai">Chennai</option>
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
                    
                    <span id="sourceError" class="error"></span>
                </div>
                
                <div class="swap">
                <img class="" src="https://iili.io/JJ1dOoQ.md.png" id="locationSwap" width="30px" heigth="30px">
                
                </div>
                <div class="ind">

                    <label for="source">destination:</label>
                    <select id="destination" name="destination" required>
                        
                        <option value="Coimbatore">Coimbatore</option>
                        <option value="Hyderabad">Hyderabad</option>
                        <option value="Vijayawada">Vijayawada</option>
                        <option value="Jaipur">Jaipur</option>
                        <option value="Chennai">Chennai</option>
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
                     <span id="destinationError" class="error"></span>

                </div>
                <div class="ind">
                    <label for="date">Date:</label>
                    <input type="date" id="date" value="<%=LocalDate.now() %>" min="<%=LocalDate.now() %>" name="date" required>
                     <span id="dateError" style="color:red;" class="error"></span>

                </div>
            </div>

            <div class="serbdd">
                
                    <button class="search-bn" id="search">search</button>
                
            </div>

        </div>

    </div>
    
      <div class="flightLoading" id="flightLoading">
        <div>
            <img src="https://iili.io/JHNr091.gif" alt="loading">

        </div>

    </div>
    
    <div class="flightLoading" id="noFlightFound">
        <div>
            <img id="noFlightFoundi" src="https://iili.io/JHNeT11.md.gif" alt="loading">

        </div>

    </div>


    <div  id="flightResult" class="" >
            <div>
                <h3 class="mt-4 text-center ">Flight Results</h3>

                <h4 class="text-center textcolo" > - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </h4>
            </div>

            <div class="ftg">

                <div class="ftgd"><p class="text-center" id="srcName"></p></div>
                <div class="ftgd"><img src="https://res.cloudinary.com/dvb2bkrx9/image/upload/v1694696643/grzigo0qnyuf70aatt7t.gif" style="height: 10vh;" alt=""></div>
                <div class="ftgd"><p class="text-center" id="desName"></p></div>

            </div>
            
            <div id="flightResultdiv">
            
            
            </div>


         
            <!-- div list card  -->

        <!--    <div class="rcard">

                <div class="cde">
                    <div class="ar"><p>AI</p> </div>
                </div>
                <div class="cde">
                    <div class="half"><p>AI190</p></div>
                    <div class="half"><p>12:03:00</p></div>
                </div>
                <div class="cde">
                    <div class="half"><p>Price</p></div>
                    <div class="half"><i class="fa fa-inr" style="font-size:20px;padding-right: 5px;margin-top: -10px;"></i><p> 849.0</p></div>
                </div>
                <div class="cde">
                    <div class="half"><img src="https://iili.io/JH5AIig.md.png" height="20px" style="padding-right: 5px; margin-top: -15px;" alt=""><p> 319</p></div>
                    <div class="half"> <button class="book-bn">Book now</button></div>
                </div>

            </div>   -->

    </div>

    
    <div id="deals" class="exd">

        <div class="">

            <h1 class="text-center mt-5 colo font-weight-bold txs">Famous places</h1>
            
        </div>

        <div class="mt-5 ccd">

            <h3 >Choose correct deal for you....</h3>

        </div>

        <div class="exdimg mt-5">
            <div class="row">
                <div> <img src="https://www.treebo.com/blog/wp-content/uploads/2018/07/Webp.net-compress-image-23-2.jpg" alt=""> <span>Chennai </span></div>
                <div><img src="https://static.toiimg.com/img/91247935/Master.jpg" alt=""> <span>Kerala</span></div>
                <div> <img src="https://bl-i.thgim.com/public/incoming/k1ogd6/article66507008.ece/alternates/FREE_1200/24hyngg_%20Secretariat%20building%2002.jpg" alt=""> <span>Hyderabad</span></div>
            </div>

            <div class="row">
                <div> <img src="https://i.pinimg.com/1200x/d2/18/7e/d2187e8fea3cd17a7d7d61aca3b16860.jpg" alt=""> <span>Trichy</span></div>
                <div> <img src="https://cdn.britannica.com/37/189837-050-F0AF383E/New-Delhi-India-War-Memorial-arch-Sir.jpg" alt=""> <span>Delhi</span></div>
                <div> <img src="https://res.cloudinary.com/dwzmsvp7f/image/fetch/q_75,f_auto,w_1316/https%3A%2F%2Fmedia.insider.in%2Fimage%2Fupload%2Fc_crop%2Cg_custom%2Fv1630506216%2Fse42qnanywtrrw5gmkwr.jpg" alt=""> <span>Agra</span></div>
            </div>
        </div>


    </div>



    <footer id="about" class="foot text-center text-lg-start">
    
        <div class="container p-4">
       
          <div class="row">
           
            <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
              <h5 class="text-uppercase">About</h5>
      
              <p>
                AviEase is your go-to web platform for effortless flight bookings. We've simplified the process, offering a
                 user-friendly interface for easy searching, comparing, and securing flights to your preferred destinations. 
                 With real-time updates, secure bookings, and a wealth of travel insights, AviEase ensures your journey is stress-free
                  and memorable. Say hello to a hassle-free way of booking flights with AviEase.
              </p>
            </div>
            <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
              <h5 class="text-uppercase">Why Choose AviEase:</h5>
      
              <p>
                Are you tired of the complexities and frustrations of booking flights online? Look
                 no further than AviEase Flight Booking Service, where we simplify the entire process,
                  ensuring a seamless and stress-free experience for travelers.
              </p>
            </div>
            
          </div>
          
        </div>
        
        <div class="text-center p-3" style="background-color:#007bff;">
          © 2023 Copyright :
          <a class="text-dark" href="https://santhosh-devendran.netlify.app/"> Santhosh</a>
        </div>
       
      </footer>
      
    	
    	 <div class="error-message" id="error-message">
  
   </div>
      
   
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
        s
	</script>
	<%
	}
	%>
      
      <script>  
      
      <!-- restrict go back -->
      
      window.history.pushState(null, null, document.URL);
      window.addEventListener('popstate', function () {
        window.history.pushState(null, null, document.URL);
      });

      document.getElementById("date").addEventListener("change",function (){
    	  
    	  document.getElementById("flightResult").classList.add("d-none");
    	  document.getElementById("flightLoading").classList.add("d-none");
          document.getElementById("noFlightFound").classList.add("d-none");
          
          getFlights();
      });
      
      
      document.getElementById("flightResult").classList.add("d-none");
      document.getElementById("flightLoading").classList.add("d-none");
      document.getElementById("noFlightFound").classList.add("d-none");

      async function getFlights() {
    	  
    	  document.getElementById("flightResult").classList.add("d-none");
    	  document.getElementById("noFlightFound").classList.add("d-none");
    	  document.getElementById("flightLoading").classList.remove("d-none");

          const src = document.getElementById("source").value;
          const des = document.getElementById("destination").value;
          const date = document.getElementById("date").value;

          const requestData = {
              "source": src,
              "destination": des,
              "date": date
          };

          const url = "<%=request.getContextPath() %>/flight/result";

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
            	  
            	 
                  const flightDetails = (await response.json()).data;
                  
                  console.log(flightDetails);
                  
                  if(flightDetails.length <= 0){
                	  
                	  document.getElementById("flightResult").classList.add("d-none");
                	  document.getElementById("flightLoading").classList.add("d-none");
                	  document.getElementById("noFlightFound").classList.remove("d-none");
                	                	  
                  }else{
                	  document.getElementById("noFlightFound").classList.add("d-none");
                	  document.getElementById("flightLoading").classList.add("d-none");
                	  document.getElementById("flightResult").classList.remove("d-none");
                	  
                		    let parentDiv = document.getElementById("flightResultdiv");

                		    while (parentDiv.firstChild) {
                		        parentDiv.removeChild(parentDiv.firstChild);
                		    }
        
                		    document.getElementById("srcName").innerHTML=src;
                		    document.getElementById("desName").innerHTML=des;
                  
                  for (const flight of flightDetails){
                	  createFlightList(flight);
                  }
              	}
                 
              } else {
                  console.log("Error in fetch:", response.statusText);
              }
          } catch (err) {
              console.error(err);
          }
      }
      
    
  //    validate form 
  
  document.getElementById("search").addEventListener("click", function () {
    // Get input field values
    const source = document.getElementById("source").value;
    const destination = document.getElementById("destination").value;
    const date = document.getElementById("date").value;

    // Reset previous error messages
    document.getElementById("sourceError").textContent = "";
    document.getElementById("destinationError").textContent = "";
    document.getElementById("dateError").textContent = "";

    // Validate the fields
    let isValid = true;

    if (source.trim() === "") {
        document.getElementById("sourceError").textContent = "Source is required.";
        isValid = false;
    }

    if (destination.trim() === "") {
        document.getElementById("destinationError").textContent = "Destination is required.";
        isValid = false;
    }

    if (date.trim() === "") {
        document.getElementById("dateError").textContent = "Date is required.";
        isValid = false;
    }

    
    if (isValid) {
    	getFlights();
    }
});


     // document.getElementById("search").addEventListener("click", getFlights);

      
      
    	function createFlightList(flight) {
    	    // Create the parent div with class "rcard"
    	    const rcardDiv = document.createElement("div");
    	    rcardDiv.className = "rcard";

    	    // Create the first 'cde' div
    	    const cdeDiv1 = document.createElement("div");
    	    cdeDiv1.className = "cde";

    	    // Create the 'ar' div and add the airline code
    	    const arDiv = document.createElement("div");
    	    arDiv.className = "ar";
    	    const airlineCodeP = document.createElement("p");
    	    airlineCodeP.textContent = flight.airlineCode;
    	    arDiv.appendChild(airlineCodeP);
    	    cdeDiv1.appendChild(arDiv);

    	    // Create the second 'cde' div
    	    const cdeDiv2 = document.createElement("div");
    	    cdeDiv2.className = "cde";
    	    
    	    const flightNoDiv = document.createElement("div");
    	    flightNoDiv.className = "half";
    	    
    	    const flighttimeDive = document.createElement("div");
    	    flighttimeDive.className = "half";
    	    

    	    // Create and add the flight number and flight time
    	    const flightNoP = document.createElement("p");
    	    flightNoP.textContent = flight.flightNo;
    	    const flightTimeP = document.createElement("p");
    	    flightTimeP.textContent = flight.flightTime;
    	    flightNoDiv.appendChild(flightNoP);
    	    flighttimeDive.appendChild(flightTimeP);
    	    cdeDiv2.appendChild(flightNoDiv);
    	    cdeDiv2.appendChild(flighttimeDive);

    	    // Create the third 'cde' div
    	    const cdeDiv3 = document.createElement("div");
    	    cdeDiv3.className = "cde";

    	    // Create and add the price
    	    const priceP = document.createElement("p");
    	    priceP.textContent = "Price";
    	    
    	    const pricenameDiv = document.createElement("div");
    	    pricenameDiv.className = "half";
    	    
    	    const priceValueDiv = document.createElement("div");
    	    priceValueDiv.className = "half";
    	    
    	    const currencyIcon = document.createElement("i");
    	    currencyIcon.className = "fa fa-inr";
    	    currencyIcon.style = "font-size:20px;padding-right: 5px;margin-top: -10px;";
    	    const priceValueP = document.createElement("p");
    	    priceValueP.textContent = flight.price;
    	    priceValueDiv.appendChild(currencyIcon);
    	    priceValueDiv.appendChild(priceValueP);
    	    pricenameDiv.appendChild(priceP);
    	    cdeDiv3.appendChild(pricenameDiv);
    	    cdeDiv3.appendChild(priceValueDiv);
    	    
    	   
    	    
    	    
    	    // Create and add the seat count
    	    const seatCountValueDiv = document.createElement("div");
    	    seatCountValueDiv.className = "half";
    	    const seatCountImage = document.createElement("img");
    	    seatCountImage.src = "https://iili.io/JH5AIig.md.png";
    	    seatCountImage.style = "padding-right: 5px; margin-top: -15px;height:20px;";
    	    const seatCountValueP = document.createElement("p");
    	    
    	

    	    // Create the fourth 'cde' div
    	    const cdeDiv4 = document.createElement("div");
    	    cdeDiv4.className = "cde";

    	    getTickets()

    	    async function getTickets() {
    	    	
    	    	  const datee = document.getElementById("date").value;
    	          

    	          const requestData = {
    	              "flightId": flight.id,
    	              "date": datee
    	          };

    	          const url = "<%=request.getContextPath() %>/tickets/booked";

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
    	            	  
    	            	 
    	                  const ticketsDetails = (await response.json()).data;
    	                  
    	                
    	                  seatCountValueP.textContent = flight.noOfSeats-ticketsDetails;
    	                  console.log(ticketsDetails);
    	                
    	                 
    	              } else {
    	                  console.log("Error in fetch:", response.statusText);
    	              }
    	          } catch (err) {
    	              console.error(err);
    	          }
    	      }
    	    
    	   
    	    seatCountValueDiv.appendChild(seatCountImage);
    	    seatCountValueDiv.appendChild(seatCountValueP);

    	    // Create and add the "Book now" button
    	    const bookNowDiv = document.createElement("div");
    	    bookNowDiv.className = "half";
    	    
    	    const booknowa = document.createElement("a");
    	    booknowa.setAttribute("href","booking/new?flightId="+flight.id+"&date="+date.value);
    	    bookNowDiv.appendChild(booknowa);
    	    
    	    const bookButton = document.createElement("button");
    	    bookButton.className = "book-bn";
    	    bookButton.style.width="130%";
    	    bookButton.textContent = "Book now";
    	    booknowa.appendChild(bookButton);

    	    cdeDiv4.appendChild(seatCountValueDiv);
    	    cdeDiv4.appendChild(bookNowDiv);

    	    // Append all the 'cde' divs to the 'rcard' div
    	    rcardDiv.appendChild(cdeDiv1);
    	    rcardDiv.appendChild(cdeDiv2);
    	    rcardDiv.appendChild(cdeDiv3);
    	    rcardDiv.appendChild(cdeDiv4);

    	    // Append the flight card to the flightResult element
    	    document.getElementById("flightResultdiv").appendChild(rcardDiv);
    	}
    	
    	
    	// hide the option which selected
    	
    	document.getElementById("source").addEventListener("change", function() {
    let value1 = document.getElementById("source").value;
    let selectElement = document.getElementById('destination');
    
    if(value1 === selectElement.value){
    selectElement.value="";
    }
    for (let i = 0; i < selectElement.options.length; i++) {
      let option = selectElement.options[i];
      
      if (option.value === value1) {
        option.style.display = 'none';
      } else {
        option.style.display = 'block'; 
      }
    }
  });
    	
    	// swap location
    	document.getElementById("locationSwap").addEventListener("click", function() {
    		console.log("swap");
    		 let value1 = document.getElementById("source").value;
    		 let value2 = document.getElementById("destination").value;
    		 
    		 document.getElementById("source").value=value2;
    		 document.getElementById("destination").value=value1;
    		 
    		 document.getElementById("flightResult").classList.add("d-none");
       	  document.getElementById("flightLoading").classList.add("d-none");
             document.getElementById("noFlightFound").classList.add("d-none");
    	})
    	
    	//show hide swap
    	
    	document.getElementById("source").addEventListener("change", function() {
    		
    		 let value1 = document.getElementById("source").value;
    		 let value2 = document.getElementById("destination").value;
    		 
    		 if(value1 === value2 || value2 === ""){
    			 document.getElementById("locationSwap").classList.add("deactivate");
    		 }else{
    			 document.getElementById("locationSwap").classList.remove("deactivate");
    		 }
    		 
    		 
    		
    	})
    	
    	document.getElementById("destination").addEventListener("change", function() {
    		
    		 let value1 = document.getElementById("source").value;
    		 let value2 = document.getElementById("destination").value;
    		 
    		 if(value1 === value2 || value2 === ""){
    			 document.getElementById("locationSwap").classList.add("deactivate");
    		 }else{
    			 document.getElementById("locationSwap").classList.remove("deactivate");
    		 }
    	})
    	
    	
      </script>
      

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>


</html>