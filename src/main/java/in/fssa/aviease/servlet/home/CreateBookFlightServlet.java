package in.fssa.aviease.servlet.home;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import in.fssa.aviease.exception.ServiceException;
import in.fssa.aviease.exception.ValidationException;
import in.fssa.aviease.model.Tickets;
import in.fssa.aviease.service.TicketsService;

/**
 * Servlet implementation class CreateBookFlightServlet
 */
@WebServlet("/flight/booking/create")
public class CreateBookFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateBookFlightServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String flightId=request.getParameter("flightId");
		
        String dateString = request.getParameter("date");
        LocalDate localDate = LocalDate.parse(dateString);
        
        int userId = (Integer) request.getSession().getAttribute("userId");
      	
      	int flight=Integer.parseInt(flightId);
      
      	
      	Tickets ticket=new Tickets();
      	ticket.setFlightId(flight);
      	ticket.setUserId(userId);
      	ticket.setTravelDate(localDate);
      	
      	TicketsService ts=new TicketsService();
      	
      	try {
			ts.create(ticket);
			   session.setAttribute("alertMessage", "Ticket booked successfully!");
			 response.sendRedirect(request.getContextPath() + "/flight/search");
		} catch (ServiceException e) {
			e.printStackTrace();
			 throw new ServletException(e.getMessage());
		} catch (ValidationException e) {
			e.printStackTrace();
			 throw new ServletException(e.getMessage());
		}
		
      	
	}

}
