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
import in.fssa.aviease.model.ResponseEntity;
import in.fssa.aviease.service.TicketsService;

/**
 * Servlet implementation class CancelTicketServlet
 */
@WebServlet("/ticket/cancel")
public class CancelTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelTicketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TicketsService ts=new TicketsService();
		
		Gson gson = new Gson();
		String message="ticket cancelled";
		
		
		BufferedReader reader = request.getReader();
        StringBuilder requestBody = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            requestBody.append(line);
        }
        
        JsonObject requestData = JsonParser.parseString(requestBody.toString()).getAsJsonObject();

        int id = requestData.get("id").getAsInt();
        
        try {
			ts.delete(id);
		} catch (ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}
		
        ResponseEntity responseEntity = new ResponseEntity(200, message, "Ticket cancelled Successfully :)");

        // Convert the ResponseEntity to JSON and write it to the response
        String jsonResponse = gson.toJson(responseEntity);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
	}

}
