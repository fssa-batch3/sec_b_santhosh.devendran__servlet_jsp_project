package in.fssa.aviease.servlet.home;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import in.fssa.aviease.exception.ServiceException;
import in.fssa.aviease.exception.ValidationException;
import in.fssa.aviease.model.Flight;
import in.fssa.aviease.model.Tickets;
import in.fssa.aviease.model.User;
import in.fssa.aviease.service.FlightService;
import in.fssa.aviease.service.TicketsService;
import in.fssa.aviease.service.UserService;

/**
 * Servlet implementation class NewFlightBook
 */
@WebServlet("/flight/booking/new")
public class NewFlightBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewFlightBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		    Integer userIdInteger = (Integer) session.getAttribute("userId");
		    
		  
		        request.setAttribute("userId", userIdInteger);
		    
		        
		        int flightId=(Integer) Integer.parseInt(request.getParameter("flightId"));

		        String date=(String) request.getParameter("date"); 
		        String pattern = "yyyy-MM-dd"; // Replace with your date format
		        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern(pattern);

		        LocalDate fdate = LocalDate.parse(date, dateFormatter);

		        int userId = Integer.parseInt(request.getAttribute("userId").toString());


		       
		        try {
		        	User user=new UserService().findUserById(userId);
					Flight flight=new FlightService().findByFlightId(flightId);
					  List<Integer> bookedTickets=new TicketsService().findSeatByFlightIdTravelDate(flightId, fdate);
					  
					  Gson gson = new Gson();
					  String jsonob = gson.toJson(bookedTickets);
			
					  request.setAttribute("date", fdate);
					  request.setAttribute("user", user);
					  request.setAttribute("flight", flight);
					  request.setAttribute("bookedTickets", jsonob);
					  
				} catch (Exception e) {
					e.printStackTrace();
					 request.setAttribute("errorMessage", e.getMessage());
			            RequestDispatcher rd = request.getRequestDispatcher("/pages/home.jsp");
						rd.forward(request, response);
				} 
		      
		    
		    RequestDispatcher rd = request.getRequestDispatcher("/pages/confirm_booking.jsp");
		    rd.forward(request, response);
	}

}
