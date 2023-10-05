package in.fssa.aviease.servlet.flight;

import java.io.IOException;
import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.aviease.exception.ServiceException;
import in.fssa.aviease.exception.ValidationException;
import in.fssa.aviease.model.Flight;
import in.fssa.aviease.service.FlightService;

/**
 * Servlet implementation class UpdateFlightServlet
 */
@WebServlet("/admin/flight/update")
public class UpdateFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFlightServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String src = request.getParameter("src");
	        String destination = request.getParameter("destination");
	        String airlineCode = request.getParameter("airlineCode");
	        String flightNo = request.getParameter("flightNo");
	        String flightStatus = request.getParameter("flightStatus");
	        String flightTimeStr = request.getParameter("flightTime");
	        int noOfSeats = Integer.parseInt(request.getParameter("noOfSeats"));
	        int id=Integer.parseInt(request.getParameter("id"));
	        double price = Double.parseDouble(request.getParameter("price"));
	        
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		    Flight flight = new Flight();
		 
		        LocalTime localTime = LocalTime.parse(flightTimeStr, formatter);
		        Time sqlTime = Time.valueOf(localTime);

		        flight.setId(id);
			    flight.setSrc(src);
			    flight.setDestination(destination);
			    flight.setAirlineCode(airlineCode);
			    flight.setFlightNo(flightNo);
			    flight.setFlightStatus(Boolean.parseBoolean(flightStatus));
			    flight.setFlightTime(sqlTime);
			    flight.setNoOfSeats(noOfSeats);
			    flight.setPrice(price);
			    
			    
			    FlightService flightService = new FlightService();
		        try {
					flightService.updateFlight(flight.getId(), flight);
				    response.sendRedirect(request.getContextPath()+"/admin/flight/list");
				} catch (Exception e) {
					
					e.printStackTrace();
					request.setAttribute("errorMessage", e.getMessage());
		            RequestDispatcher rd = request.getRequestDispatcher("/edit_flight.jsp?id="+id);
					rd.forward(request, response);
				}
		    
	        
	}

}
