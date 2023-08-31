package in.fssa.aviease.servlet.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.aviease.model.User;
import in.fssa.aviease.service.UserService;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/user/edit")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");		

		try {
			
			User userDetails =new UserService().findUserById(Integer.parseInt(id));
			
			request.setAttribute("user", userDetails);
			
			RequestDispatcher rd = request.getRequestDispatcher("/edit_user.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			
		}
		
		
	}


}
