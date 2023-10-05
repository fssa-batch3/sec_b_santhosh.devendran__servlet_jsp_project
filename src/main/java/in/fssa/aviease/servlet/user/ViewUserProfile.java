package in.fssa.aviease.servlet.user;

import java.io.IOException;
import java.time.LocalDate;
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
import in.fssa.aviease.model.AirLine;
import in.fssa.aviease.model.Flight;
import in.fssa.aviease.model.Tickets;
import in.fssa.aviease.model.User;
import in.fssa.aviease.service.AirLineService;
import in.fssa.aviease.service.FlightService;
import in.fssa.aviease.service.TicketsService;
import in.fssa.aviease.service.UserService;

/**
 * Servlet implementation class ViewUserProfile
 */
@WebServlet("/profile/view")
public class ViewUserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewUserProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 RequestDispatcher rd = request.getRequestDispatcher("/pages/Profile.jsp");
	        rd.forward(request, response);  
	}

	
}
