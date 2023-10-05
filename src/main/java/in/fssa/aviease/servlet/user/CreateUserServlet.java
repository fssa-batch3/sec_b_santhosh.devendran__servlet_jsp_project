package in.fssa.aviease.servlet.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import in.fssa.aviease.exception.ServiceException;
import in.fssa.aviease.exception.ValidationException;
import in.fssa.aviease.model.User;
import in.fssa.aviease.service.UserService;
import in.fssa.aviease.util.PasswordUtil;
import in.fssa.aviease.validator.UserValidator;

/**
 * Servlet implementation class CreateUserServlet
 */
@WebServlet("/user/create")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String mobileNumber = request.getParameter("mobileNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        long mobileNumberLong = Long.parseLong(mobileNumber);
        
        User user = new User();
        user.setFirstname(firstName);
        user.setLastname(lastName);
        user.setMobileNo(mobileNumberLong);
        user.setEmail(email);
        user.setPassword(password);

        UserService us=new UserService();
        
       try {
    	  
		us.createUser(user);
		String message="Thank you for filling out your information! ...";
		request.setAttribute("sucessMessage", message);
		System.out.println(message);
		response.sendRedirect(request.getContextPath()+"/pages/index.jsp");
		
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("errorMessage", e.getMessage());
        RequestDispatcher rd = request.getRequestDispatcher("/pages/register.jsp");
		rd.forward(request, response);
	} 

       
	}

}
