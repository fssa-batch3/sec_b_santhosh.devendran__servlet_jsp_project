package in.fssa.aviease.servlet.airline;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.aviease.exception.ServiceException;
import in.fssa.aviease.exception.ValidationException;
import in.fssa.aviease.model.AirLine;
import in.fssa.aviease.model.User;
import in.fssa.aviease.service.AirLineService;
import in.fssa.aviease.service.UserService;

/**
 * Servlet implementation class UpdateAirlineServlet
 */
@WebServlet("/admin/airline/update")
public class UpdateAirlineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAirlineServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("id");
      	String airlineName = request.getParameter("airlineName");
        String airlineCode = request.getParameter("airlineCode");
       

        Integer idInt = Integer.parseInt(id);
        
      AirLine airline=new AirLine();
      
      airline.setId(idInt);
      airline.setAirLineName(airlineName);
      airline.setAirLineCode(airlineCode);
        

        AirLineService as=new AirLineService();
        
       try {
    	  
		as.update(idInt, airline);
		response.sendRedirect(request.getContextPath()+"/admin/airline/list");
	} catch (ServiceException e) {
		e.printStackTrace();
		throw new ServletException(e.getMessage());
	} catch (ValidationException e) {
		e.printStackTrace();
		throw new ServletException(e.getMessage());
	}
	}
	
}

