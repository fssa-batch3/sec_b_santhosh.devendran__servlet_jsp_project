package in.fssa.aviease.servlet.flight;

import java.io.IOException;
import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.aviease.model.Flight;
import in.fssa.aviease.service.FlightService;

/**
 * Servlet implementation class CreateFlightServlet
 */
@WebServlet("/admin/flight/create")
public class CreateFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateFlightServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String source = request.getParameter("src");
		    String destination = request.getParameter("destination");
		    String airlineCode = request.getParameter("airlineCode");
		    String flightNo = request.getParameter("flightNo");
		    String flightStatus = request.getParameter("flightStatus");
		    String flightTimeStr = request.getParameter("flightTime");
		    int numberOfSeats = Integer.parseInt(request.getParameter("noOfSeats"));
		    double price = Double.parseDouble(request.getParameter("price"));

		    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
		    Flight flight = new Flight();
		    try {
		        
		        LocalTime localTime = LocalTime.parse(flightTimeStr, formatter);
		        Time sqlTime = Time.valueOf(localTime);

		       
			    flight.setSrc(source);
			    flight.setDestination(destination);
			    flight.setAirlineCode(airlineCode);
			    flight.setFlightNo(flightNo);
			    flight.setFlightStatus(Boolean.parseBoolean(flightStatus));
			    flight.setFlightTime(sqlTime);
			    flight.setNoOfSeats(numberOfSeats);
			    flight.setPrice(price);
		    } catch (Exception e) {
		        
		        e.printStackTrace(); 
		    }
		   
		  

		    
		    try {
		        FlightService flightService = new FlightService();
		        flightService.createFlight(flight);
		        response.sendRedirect(request.getContextPath()+"/admin/flight/list");
		        
		    } catch (Exception e) {
		       
		        e.printStackTrace();
		        throw new ServletException(e.getMessage());
		    }
	}

}
