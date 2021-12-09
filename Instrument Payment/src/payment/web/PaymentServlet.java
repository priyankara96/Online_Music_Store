package payment.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.dao.PaymentDAO;
import payment.model.Payment;


/* Servlets are the Java programs that runs on the Java-enabled web server or
   application server which make web page dynamical. */

/* They are used to handle the request obtained from the web server, process the request, 
   produce the response, then send response back to the web server */

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PaymentDAO paymentDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
    	this.paymentDAO = new PaymentDAO();
    }
    
    
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	// create switch to all actions
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		switch (action) {
		case "/new":
			showNewForm(request, response);
			break;
		case "/insert":
			insertPayment(request, response);
			break;
		case "/delete":
			deletePayment(request, response);
			break;
		case "/edit":
			showEditForm(request, response);
			break;
		case "/update":
			updatePayment(request, response);
			break;
		default:
			//handle list
			listPayment(request, response);
			break;
		}
		
	}
	
	// show all values in table
	private void listPayment(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			List<Payment> listPayment = paymentDAO.selectAllPayment();
			request.setAttribute("listPayment", listPayment);
			RequestDispatcher dispatcher = request.getRequestDispatcher("payment-list.jsp");
			dispatcher.forward(request, response);
		}
	
	// updating values and pass response to list
	private void updatePayment(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String instrument = request.getParameter("instrument");
		String name = request.getParameter("name");
		String card = request.getParameter("card");
		String cvv = request.getParameter("cvv");
		String expire = request.getParameter("expire");
		String amount = request.getParameter("amount");
		
		Payment payment = new Payment(id, instrument, name, card, cvv, expire, amount);
		try {
			paymentDAO.updatePayment(payment);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("list");
	}
	
	// delete user when id is get and response pass to list	
	private void deletePayment(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			paymentDAO.deletePayment(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("list");
	}
	
	// edit form
	private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Payment existingPayment = paymentDAO.selectPayment(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("payment-form.jsp");
		request.setAttribute("payment", existingPayment);
		dispatcher.forward(request, response);
	}
	
	// form display when requested
	private void showNewForm(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("payment-form.jsp");
		dispatcher.forward(request, response);
	}
	
	// when inserting pass response to list
	private void insertPayment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String instrument = request.getParameter("instrument");
		String name = request.getParameter("name");
		String card = request.getParameter("card");
		String cvv = request.getParameter("cvv");
		String expire = request.getParameter("expire");
		String amount = request.getParameter("amount");
		
		Payment newPayment = new Payment(instrument, name, card, cvv, expire, amount);
		try {
			paymentDAO.insertPayment(newPayment);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("list");
	}

	

}
