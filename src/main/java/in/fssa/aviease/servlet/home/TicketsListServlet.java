package in.fssa.aviease.servlet.home;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
import in.fssa.aviease.service.FlightService;
import in.fssa.aviease.service.TicketsService;

/**
 * Servlet implementation class TicketsList
 */
@WebServlet("/ticket/list")
public class TicketsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TicketsListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		
		try {
			List<Tickets> tickets=new TicketsService().findByUserId(userId);
			List<Flight> flights=new FlightService().findAllFlight();
			

			
			request.setAttribute("tickets", tickets);
			request.setAttribute("flights", flights);
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		}
		
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/pages/ticketlist.jsp");
        rd.forward(request, response); 
	}


}
