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
import in.fssa.aviease.model.UserEntity;
import in.fssa.aviease.service.UserService;
import in.fssa.aviease.util.PasswordUtil;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/user/login")
public class UserLoginServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        RequestDispatcher rd = request.getRequestDispatcher("/pages/index.jsp");
	        rd.forward(request, response);  
	    }
	    
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        try {
	            Long phoneNumber = Long.parseLong(request.getParameter("phone_number"));
	            String password = request.getParameter("password");

	            UserService userService = new UserService();
	            User user = userService.findUserByMobileNo(phoneNumber);

	            if (user == null) {
	                String message = "User not found";
	                request.setAttribute("errorMessage", message);
	               
	                RequestDispatcher rd = request.getRequestDispatcher("/pages/index.jsp");
	    			rd.forward(request, response);
	            } else {
	                String decryptedPassword = PasswordUtil.passwordDecrypt(phoneNumber, user.getPassword());

	                if (!password.equals(decryptedPassword)) {
	                    String message = "Incorrect Phone number or Password:(";
	                    request.setAttribute("errorMessage", message);
	                    RequestDispatcher rd = request.getRequestDispatcher("/pages/index.jsp");
	        			rd.forward(request, response);
	                } else {
	                    System.out.println("Login Successful:)");
	                    int id = user.getId();
	                    request.getSession().setAttribute("userId", id);
	                    response.sendRedirect(request.getContextPath() + "/flight/search");
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("errorMessage", e.getMessage());
	            RequestDispatcher rd = request.getRequestDispatcher("/pages/index.jsp");
				rd.forward(request, response);
	        }
	    }

}
