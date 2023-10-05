package in.fssa.aviease.servlet.home;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.aviease.exception.ServiceException;
import in.fssa.aviease.exception.ValidationException;
import in.fssa.aviease.model.Flight;
import in.fssa.aviease.model.Tickets;
import in.fssa.aviease.model.User;
import in.fssa.aviease.service.FlightService;
import in.fssa.aviease.service.TicketsService;
import in.fssa.aviease.service.UserService;

/**
 * Servlet implementation class TicketDetails
 */
@WebServlet("/ticket/details")
public class TicketDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TicketDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id= Integer.parseInt(request.getParameter("id"));
		int userId=(Integer)request.getSession().getAttribute("userId");
		
		try {
			Tickets ticket=new TicketsService().findById(id);
			Flight flight=new FlightService().findByFlightId(ticket.getFlightId());
			User user=new UserService().findUserById(userId);
			
			request.setAttribute("ticket", ticket);
			request.setAttribute("flight", flight);
			request.setAttribute("user", user);
			
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/pages/ticketdetails.jsp");
        rd.forward(request, response); 
		
	}

}
