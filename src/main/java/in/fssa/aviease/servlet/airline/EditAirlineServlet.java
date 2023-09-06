package in.fssa.aviease.servlet.airline;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.aviease.model.AirLine;
import in.fssa.aviease.model.User;
import in.fssa.aviease.service.AirLineService;
import in.fssa.aviease.service.UserService;

/**
 * Servlet implementation class EditAirlineServlet
 */
@WebServlet("/admin/airline/edit")
public class EditAirlineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAirlineServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        String id = request.getParameter("id");
	        
	        
	        System.out.println("Request URL: " + request.getRequestURL().toString());
	        System.out.println("ID Parameter: " + id);

	        AirLine airline = new AirLineService().findById(Integer.parseInt(id));
	        request.setAttribute("airline", airline);
	        
	        RequestDispatcher rd = request.getRequestDispatcher("/edit_airline.jsp");
	        rd.forward(request, response);
	        
	    } catch (Exception e) {
	        e.printStackTrace(); 
	        
	    }
		
	}



}
