package in.fssa.aviease.servlet.home;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		    
		    
		    RequestDispatcher rd = request.getRequestDispatcher("/booking_details.jsp");
		    rd.forward(request, response);
	}

}
