package in.fssa.aviease.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.aviease.exception.ServiceException;
import in.fssa.aviease.exception.ValidationException;
import in.fssa.aviease.model.User;
import in.fssa.aviease.service.UserService;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/admin/user/update")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String id=request.getParameter("id");
	      	String firstName = request.getParameter("firstName");
	        String lastName = request.getParameter("lastName");
	       

	        Integer idInt = Integer.parseInt(id);
	        
	        User user = new User();
	        user.setFirstname(firstName);
	        user.setLastname(lastName);
	        

	        UserService us=new UserService();
	        
	       try {
	    	  
			us.updateUser(idInt, user);
			response.sendRedirect(request.getContextPath()+"/admin/list_all_user");
		} catch (ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		} catch (ValidationException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}
	}

}
