package in.fssa.aviease.servlet;




import java.io.IOException;

import java.security.SecureRandom;
import java.util.Random;

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
 * Servlet implementation class UserCreateservlet
 */
@WebServlet("/UserCreateServlet")
public class UserCreateservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCreateservlet() {
        super();
        
    }
    
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    
    public static String generateRandomString(int length) {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);
        
        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(randomIndex);
            sb.append(randomChar);
        }
        
        return sb.toString();
    }
    
    public static long generateRandomLong() {
         Random random = new Random();
        long min = 6000000000L; // 10-digit minimum value (1000000000)
        long max = 9999999999L; // 10-digit maximum value (9999999999)
        long range = max - min + 1;
        long randomNumber = (long) (random.nextDouble() * range) + min;
        return randomNumber;
    }
    
    
    
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserService userService=new UserService();
		  User newUser = new User();
	       
		  try {
			newUser=userService.findUserById(3);
		} catch (ServiceException e) {
			
			throw new ServletException(e.getMessage());
		} catch (ValidationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
		response.getWriter().write(newUser.toString());
	}

	

}
