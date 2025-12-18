package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.food.DAO.UserDAO;
import com.food.DBUtils.DBUtils;
import com.food.model.User;

public  class UserDAOImpl implements UserDAO {

 Connection con;
 
private PreparedStatement pstmt; 
private Statement stmt;
private ResultSet resultSet;

ArrayList<User>userList=new ArrayList<User>();
User user;
private static final String ADD_USER =
"INSERT INTO user (username, email, phonenumber, password, address) VALUES (?, ?, ?, ?, ?)";

private static final String SELECT_ALL = "SELECT * FROM user";

private static final String SELECT_ON_EMAIL = "SELECT * FROM user WHERE email = ?";

private static final String UPDATE_ON_EMAIL =
"UPDATE user SET username=?, phonenumber=?, password=?, address=? WHERE email=?";

private static final String DELETE_ON_EMAIL = "DELETE FROM user WHERE email=?";

 int status=0;

	public UserDAOImpl() {
		try {
con=DBUtils.myConnect();
	}
catch(Exception e) {
	e.printStackTrace();
}
}

	@Override
	public int addUser(User u) {
	try {
		pstmt=con.prepareStatement(ADD_USER);
		pstmt.setString(1, u.getUsername());
		pstmt.setString(2, u.getEmail());
		pstmt.setString(3, u.getPhonenumber());
		pstmt.setString(4, u.getPassword());
		pstmt.setString(5, u.getAddress());
		
		status=pstmt.executeUpdate();
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return status;
	}

	
	//
	@Override
	public ArrayList<User> getAllUser() {
	try {
		stmt=con.createStatement();
		resultSet=stmt.executeQuery(SELECT_ALL);
	userList=extractUserfromResultSet(resultSet);
	
	
	} catch (SQLException e) {
		e.printStackTrace();
	}
return userList;
		
	}

	@Override
	public User getUser(String email) {
	    User user = null;
	    try {
	        pstmt = con.prepareStatement(SELECT_ON_EMAIL);
	        pstmt.setString(1, email);
	        resultSet = pstmt.executeQuery();

	        if (resultSet.next()) {
	            user = new User(
	                resultSet.getInt("userId"),
	                resultSet.getString("username"),
	                resultSet.getString("email"),
	                resultSet.getString("phonenumber"),
	                resultSet.getString("password"),
	                resultSet.getString("address")
	            );
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return user;
	}


	@Override
	public int  updateUser(User u) {
		try {
	pstmt=	con.prepareStatement(UPDATE_ON_EMAIL);
		pstmt.setString(1, u.getUsername());
		pstmt.setString(2, u.getEmail());
		pstmt.setString(3, u.getPhonenumber());
		pstmt.setString(4, u.getPassword());
		pstmt.setString(5, u.getAddress());
		
		status=pstmt.executeUpdate();
		}catch(Exception e) {
		e.printStackTrace();
	}
	return status;	
	}
	
	//
	@Override
	public int deleteUser(String email) {
		try {
		pstmt=con.prepareStatement(DELETE_ON_EMAIL);
		pstmt.setString(1, email);
		
		status=pstmt.executeUpdate();
	}catch(Exception e) {
		e.printStackTrace();
	}
		return status;
	}
	
	ArrayList<User> extractUserfromResultSet(ResultSet resultSet){
		try {
			while(resultSet.next()) {
		userList.add(new User(resultSet.getInt("userId"),
			 resultSet.getString("username"),
			 resultSet.getString("email"),
			 resultSet.getString("phonenumber"),
			 resultSet.getString("password"),
			 resultSet.getString("address")));
			 
		}
	}catch(Exception e){
		e.printStackTrace();
	}
		return userList;
}}