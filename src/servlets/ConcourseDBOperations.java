package servlets;

import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cinchapi.concourse.Concourse;
import com.cinchapi.concourse.thrift.Operator;

/**
 * Servlet implementation class ConcourseDBOperations
 * 
 * @author Viraj Shah
 * 
 */

public class ConcourseDBOperations extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ConcourseDB Connector
		Concourse concourse = Concourse.connect("localhost", 1717, "admin", "admin");

		RequestDispatcher dispatcher = request.getRequestDispatcher("View.jsp");
		String result_message;

		// Add the id as a value for key "id" and primary key as id
		int record = Integer.parseInt(request.getParameter("id"));
		// Inserting into Concourse database and assign corresponding result
		// message
		if (concourse.add("id", request.getParameter("id").toString(), record)
				&& concourse.add("name", request.getParameter("name"), record)
				&& concourse.add("age", request.getParameter("age"), record)
				&& concourse.add("email", request.getParameter("email"), record)
				&& concourse.add("zip", request.getParameter("zip").toString(), record))
			result_message = "Successfully added student";
		else
			result_message = "Student record insertion failed.";
		// Set acknowledgement message to request scope
		request.setAttribute("acknowldgement", result_message);

		// select all the records through "id"
		Set<Long> allRecordIds = new HashSet<Long>();
		allRecordIds = concourse.find("id", Operator.GREATER_THAN, 0);

		// Collect the required keys in a Set
		Set<String> keys = new HashSet<String>();
		keys.add("name");
		keys.add("age");
		keys.add("email");
		keys.add("zip");
		// The following comment code is to clear the database on every run
		/**
		 * concourse.clear(keys, allRecordIds);
		 * 
		 */
		// Fetch all existing records matching the required keys
		Map<Long, Map<String, String>> allRecords = concourse.get(keys, allRecordIds);

		// Set all records to request scope
		request.setAttribute("allrecords", allRecords);
		dispatcher.forward(request, response);

	}

}
