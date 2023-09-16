package in.fssa.aviease.servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.protobuf.ServiceException;

import in.fssa.aviease.exception.ValidationException;
import in.fssa.aviease.model.User;
import in.fssa.aviease.service.UserService;

/**
 * Servlet implementation class GetUserById
 */
@WebServlet("/GetUserById")
public class GetUserById extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUserById() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");

			int id2 = Integer.parseInt(id);

			try {
				UserService userService = new UserService();
				
				User user=new User();
				
				try {
					user=userService.findUserById(id2);
				} catch (in.fssa.aviease.exception.ServiceException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				 
				  request.setAttribute("user", user);

				    RequestDispatcher dispatcher = request.getRequestDispatcher("/User_cards.jsp");
				    dispatcher.forward(request, response);

			} catch (ValidationException e) {
				e.printStackTrace();
				out.println(e.getMessage());
			}

	}

	

}
