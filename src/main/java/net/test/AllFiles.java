package net.test;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.ObjectifyService;

@WebServlet("/u/*")
public class AllFiles extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static {
		ObjectifyService.register(Files.class);
	};
	static Logger log = Logger.getLogger(HelloAppEngine.class.getName());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		List<Files> listFiles = ofy().load().type(Files.class).limit(30).list();
		log.warning("message");
		if (listFiles == null) {
			log.warning("listFiles null");
			resp.setStatus(400);
			resp.getWriter().print("null");
			return;
		}
		req.setAttribute("urlList",listFiles);
		RequestDispatcher dispatcher = req.getServletContext().getRequestDispatcher("/WEB-INF/jsps/allFiles.jsp");
		
		try {
			dispatcher.forward(req, resp);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
