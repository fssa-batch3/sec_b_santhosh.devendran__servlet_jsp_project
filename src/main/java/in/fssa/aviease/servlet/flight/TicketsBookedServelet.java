package in.fssa.aviease.servlet.flight;

import java.io.BufferedReader;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import in.fssa.aviease.exception.ServiceException;

import in.fssa.aviease.model.ResponseEntity;
import in.fssa.aviease.model.Tickets;
import in.fssa.aviease.service.TicketsService;

/**
 * Servlet implementation class TicketsBooked
 */
@WebServlet("/tickets/booked")
public class TicketsBookedServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TicketsBookedServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
TicketsService ticketsService = new TicketsService();
		
		List<Tickets> tickets=new ArrayList<Tickets>();

		BufferedReader reader = request.getReader();
	    StringBuilder requestBody = new StringBuilder();
	    String line;
	    while ((line = reader.readLine()) != null) {
	        requestBody.append(line);
	    }

	    Gson gson = new Gson();
	    JsonObject requestData = JsonParser.parseString(requestBody.toString()).getAsJsonObject();
	    
	
	    int flightId = requestData.get("flightId").getAsInt();
	     String date = requestData.get("date").getAsString();

	     DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 

	         LocalDate formatDate = LocalDate.parse(date, dateFormatter);
	        

		try {
			System.out.println(flightId+" tic "+formatDate);
			tickets = ticketsService.findByFlightIdTravelDate(flightId, formatDate);

		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ResponseEntity responseEntity = new ResponseEntity(200, tickets, "tickets Retrieved Successfully :)");

		
		String reponseJson = gson.toJson(responseEntity);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(reponseJson);
		} 
	

	

}

