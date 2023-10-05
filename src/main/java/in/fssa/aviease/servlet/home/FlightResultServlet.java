package in.fssa.aviease.servlet.home;

import java.io.BufferedReader;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import in.fssa.aviease.exception.ServiceException;
import in.fssa.aviease.exception.ValidationException;
import in.fssa.aviease.model.Flight;
import in.fssa.aviease.model.ResponseEntity;
import in.fssa.aviease.service.FlightService;

/**
 * Servlet implementation class FlightResult
 */
@WebServlet("/flight/result")
public class FlightResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlightResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
 
//	        	 String source = request.getParameter("source");
//	 	        String destination = request.getParameter("destination");
//	 	       String date = request.getParameter("date");
//	 	    
//	 	      
//				request.setAttribute("src", source);
//				request.setAttribute("des", destination);
//				request.setAttribute("date", date);
//			
//				
//				RequestDispatcher rd = request.getRequestDispatcher("/flight_result.jsp");
//				rd.forward(request, response);
//			
//	        
//		doGet(request, response);
		
		/////////////////////////////////
		
FlightService flightService = new FlightService();
		
		List<Flight> flights=new ArrayList<Flight>();

		BufferedReader reader = request.getReader();
	    StringBuilder requestBody = new StringBuilder();
	    String line;
	    while ((line = reader.readLine()) != null) {
	        requestBody.append(line);
	    }

	    // Parse the JSON data using 
	    Gson gson = new Gson();
	    JsonObject requestData = JsonParser.parseString(requestBody.toString()).getAsJsonObject();
	    
	    // Extract the phone number from the JSON data
	    String source = requestData.get("source").getAsString();
	     String destination = requestData.get("destination").getAsString();
	     String date = requestData.get("date").getAsString();
	     
	     request.getSession().setAttribute("bookingDate", date);

		try {

			flights = flightService.findAllFlightBySourcAndDestination(source, destination);

		} catch (Exception e) {
			e.printStackTrace();
			 request.setAttribute("errorMessage", e.getMessage());
	            RequestDispatcher rd = request.getRequestDispatcher("/pages/home.jsp");
				rd.forward(request, response);
		}

		ResponseEntity responseEntity = new ResponseEntity(200, flights, "flights Retrieved Successfully :)");

		
		String reponseJson = gson.toJson(responseEntity);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(reponseJson);
		} 
	

}
