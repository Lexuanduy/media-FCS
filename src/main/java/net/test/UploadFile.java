package net.test;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.file.Paths;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.appengine.tools.cloudstorage.GcsFileMetadata;
import com.google.appengine.tools.cloudstorage.GcsFileOptions;
import com.google.appengine.tools.cloudstorage.GcsFilename;
import com.google.appengine.tools.cloudstorage.GcsOutputChannel;
import com.google.appengine.tools.cloudstorage.GcsService;
import com.google.appengine.tools.cloudstorage.GcsServiceFactory;

/**
 * Servlet implementation class UploadFile
 */
@WebServlet("/hello/*")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger log = Logger.getLogger(HelloAppEngine.class.getName());
	GcsService gcsService = GcsServiceFactory.createGcsService();
	public static final String SAVE_DIRECTORY = "uploadDir";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		log.warning("upload sound");
		Enumeration<String> paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();
			log.warning(paramName);
			String param = request.getParameter(paramName);
			log.warning(param);
		}
		long now = 0;
		String id = null;
		List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName()))
				.collect(Collectors.toList()); // Retrieves <input type="file" name="file" multiple="true">

		for (Part filePart : fileParts) {
			try {
				log.warning("co file moi");
				String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
				InputStream fileContent = filePart.getInputStream();

				byte[] buffer = new byte[fileContent.available()];
				fileContent.read(buffer);

				GcsOutputChannel outputChannel;
				now = System.currentTimeMillis();
				now = now / 1000;
				id = Long.toString(now, Character.MAX_RADIX);
				GcsFilename fileName2 = new GcsFilename("mymedia-218206.appspot.com", id + ".wav");
				log.warning(fileName2.getBucketName());
				GcsFileMetadata metadata = gcsService.getMetadata(fileName2);

				byte[] audioByte = buffer;
				ByteBuffer buf = ByteBuffer.wrap(audioByte);
				GcsFileOptions options = new GcsFileOptions.Builder().acl("public-read").build();
				outputChannel = gcsService.createOrReplace(fileName2, options);

				outputChannel.write(buf);
				log.warning("close");

				outputChannel.close();

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			response.getWriter().println(id);
		}
	}
}
