package in.fssa.aviease.servlet.home;

import java.io.IOException;
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
		 
	  
	        	 String source = request.getParameter("source");
	 	        String destination = request.getParameter("destination");
	 	       String date = request.getParameter("date");
	 	    
	 	      
				request.setAttribute("src", source);
				request.setAttribute("des", destination);
				request.setAttribute("date", date);
			
				
				RequestDispatcher rd = request.getRequestDispatcher("/flight_result.jsp");
				rd.forward(request, response);
			
	        
		doGet(request, response);
	}

}
