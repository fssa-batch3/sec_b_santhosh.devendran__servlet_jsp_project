package in.fssa.aviease.servlet.home;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import in.fssa.aviease.exception.ServiceException;
import in.fssa.aviease.exception.ValidationException;
import in.fssa.aviease.model.ResponseEntity;
import in.fssa.aviease.model.User;
import in.fssa.aviease.service.UserService;

/**
 * Servlet implementation class UpdateProfileServelet
 */
@WebServlet("/profile/update")
public class UpdateProfileServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
        User user = new User();
        String message = "Name updated successfully"; 

        Gson gson = new Gson();
        try {
            // Read the JSON data from the request body
            BufferedReader reader = request.getReader();
            StringBuilder requestBody = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                requestBody.append(line);
            }

            // Parse the JSON data using Gson
            
            JsonObject requestData = JsonParser.parseString(requestBody.toString()).getAsJsonObject();

            // Extract the fields from the JSON data
            String id = requestData.get("id").getAsString();
            String firstName = requestData.get("firstName").getAsString();
            String lastName = requestData.get("lastName").getAsString();

            int userId = Integer.parseInt(id);
            user.setId(userId);
            user.setFirstname(firstName);
            user.setLastname(lastName);

            // Call the service method to update the user
            userService.updateUser(userId, user);
        } catch (ServiceException e) {
            e.printStackTrace();
            message = e.getMessage(); 
        }catch ( ValidationException e) {
            e.printStackTrace();
            message = e.getMessage(); 
        }

        // Create a ResponseEntity to send as JSON response
        ResponseEntity responseEntity = new ResponseEntity(200, message, "User Retrieved Successfully :)");

        // Convert the ResponseEntity to JSON and write it to the response
        String jsonResponse = gson.toJson(responseEntity);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
    }
}
