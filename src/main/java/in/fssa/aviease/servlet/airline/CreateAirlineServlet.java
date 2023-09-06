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
import in.fssa.aviease.service.AirLineService;

/**
 * Servlet implementation class CreateAirlineServlet
 */
@WebServlet("/admin/airline/create")
public class CreateAirlineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAirlineServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String airlineName = request.getParameter("airlineName");
        String airlineCode = request.getParameter("airlineCode");
        
        AirLine airline=new AirLine();
        airline.setAirLineName(airlineName);
        airline.setAirLineCode(airlineCode);
        
        AirLineService as=new AirLineService();
        
        try {
			as.create(airline);
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
