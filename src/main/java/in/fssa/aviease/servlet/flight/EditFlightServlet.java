package in.fssa.aviease.servlet.flight;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.aviease.model.Flight;
import in.fssa.aviease.model.User;
import in.fssa.aviease.service.FlightService;
import in.fssa.aviease.service.UserService;
import in.fssa.aviease.servlet.home.FlightSearchServlet;

/**
 * Servlet implementation class EditFlightServlet
 */
@WebServlet("/admin/flight/edit")
public class EditFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditFlightServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		try {
//			String id = request.getParameter("id");		
//			Flight flightDetails =new FlightService().findByFlightId(Integer.parseInt(id));
//			
//			request.setAttribute("flight", flightDetails);
//			
			RequestDispatcher rd = request.getRequestDispatcher("/edit_flight.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			
		}
	}



}
