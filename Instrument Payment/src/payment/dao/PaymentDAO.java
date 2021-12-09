package payment.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import payment.model.Payment;

//This DAO class provides CRUD database operations for the table payments in the database
public class PaymentDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/instrument?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";
	
	private static final String INSERT_PAYMENT_SQL = "INSERT INTO payment" + " (instrument, name, card, cvv, expire, amount) VALUES " + " (?, ?, ?, ?, ?, ?);";
	private static final String SELECT_PAYMENT_BY_ID = "select id, instrument, name, card, cvv, expire, amount from payment where id = ?";
	private static final String SELECT_ALL_PAYMENT = "select * from payment";
	private static final String DELETE_PAYMENT_SQL = "delete from payment where id = ?;";
	private static final String UPDATE_PAYMENT_SQL = "update payment set instrument = ?, name = ?, card = ?, cvv = ?, expire = ?, amount = ? where id = ?;";
	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	
			//insert payment
			public void insertPayment(Payment payment) throws SQLException {
				System.out.println(INSERT_PAYMENT_SQL);
				try(Connection connection = getConnection();
						PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PAYMENT_SQL);){
					preparedStatement.setString(1, payment.getInstrument());
					preparedStatement.setString(2, payment.getName());
					preparedStatement.setString(3, payment.getCard());
					preparedStatement.setString(4, payment.getCvv());
					preparedStatement.setString(5, payment.getExpire());
					preparedStatement.setString(6, payment.getAmount());
					System.out.println(preparedStatement);
					preparedStatement.executeUpdate();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			
			
			//update payment
			public boolean updatePayment(Payment payment) throws SQLException {
				boolean rowUpdated;
				try (Connection connection = getConnection();
						PreparedStatement statement = connection.prepareStatement(UPDATE_PAYMENT_SQL);){
					statement.setString(1, payment.getInstrument());
					statement.setString(2, payment.getName());
					statement.setString(3, payment.getCard());
					statement.setString(4, payment.getCvv());
					statement.setString(5, payment.getExpire());
					statement.setString(6, payment.getAmount());
					statement.setInt(7, payment.getId());
						
					rowUpdated = statement.executeUpdate() > 0;
				}
				return rowUpdated;
			}
			
			//select payment by id
			public Payment selectPayment(int id) {
				Payment payment = null;
					
				try (Connection connection = getConnection();
						PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PAYMENT_BY_ID);){
					preparedStatement.setInt(1, id);
					System.out.println(preparedStatement);
						
					ResultSet rs = preparedStatement.executeQuery();
						
					while (rs.next()) {
						String instrument = rs.getString("instrument");
						String name = rs.getString("name");
						String card = rs.getString("card");
						String cvv = rs.getString("cvv");
						String expire = rs.getString("expire");
						String amount = rs.getString("amount");
						payment = new Payment(id, instrument, name, card, cvv, expire, amount);
					}
				}catch (SQLException e) {
					e.printStackTrace();
				}
				return payment;
			}
			
			
			//select all payment
			public List<Payment> selectAllPayment() {
				List<Payment> payment = new ArrayList<>();
					
				try (Connection connection = getConnection();
						PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PAYMENT);){
					System.out.println(preparedStatement);
						
					ResultSet rs = preparedStatement.executeQuery();
						
					while (rs.next()) {
						int id = rs.getInt("id");
						String instrument = rs.getString("instrument");
						String name = rs.getString("name");
						String card = rs.getString("card");
						String cvv = rs.getString("cvv");
						String expire = rs.getString("expire");
						String amount = rs.getString("amount");
						payment.add(new Payment(id, instrument, name, card, cvv, expire, amount));
					}
				}catch (SQLException e) {
					e.printStackTrace();
				}
				return payment;
			}
			
			
			//delete payment
			public boolean deletePayment(int id) throws SQLException {
				boolean rowDeleted;
				try (Connection connection = getConnection();
						PreparedStatement statement = connection.prepareStatement(DELETE_PAYMENT_SQL);){
					statement.setInt(1, id);
					rowDeleted = statement.executeUpdate() > 0;
				}
				return rowDeleted;
			}

}
