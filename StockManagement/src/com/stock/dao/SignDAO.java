package com.stock.dao;

import java.sql.*;

import com.stock.bean.SignBean;
import com.stock.util.DBUtil;

public class SignDAO {
	
	public boolean isUserNamePresent(String name) throws ClassNotFoundException, SQLException{
		Connection c = DBUtil.getDBConnection();
		boolean res = false;
		if(c!=null){
			PreparedStatement ps = c.prepareStatement("select * from users where name='"+name+"'");
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				res=true;
			}
			else{
				res=false;
			}
		}
		return res;
	}
	
	public String createUser(SignBean sbean) throws ClassNotFoundException, SQLException{
		Connection c = DBUtil.getDBConnection();
		int res = 0;
		if(c!=null){
			PreparedStatement ps = c.prepareStatement("insert into users values(nextval('uid_seq'),?,?)");
			ps.setString(1, sbean.getName());
			ps.setString(2, sbean.getPass());
			
			res=ps.executeUpdate();
		}
		if(res!=0){
			return "OK";
		}
		else{
			return "Fail";
		}
		
	}
	
	
	public String checkUser(String name,String pass) throws ClassNotFoundException, SQLException{
		
		Connection c = DBUtil.getDBConnection();
		String res = new String();
		if(c!=null){
			PreparedStatement ps = c.prepareStatement("select * from users where name='"+name+"' and password ='"+pass+"'" );
			ResultSet rs = ps.executeQuery();
			System.out.println(rs.getRow());
			if(rs.next()){
				res="CUSTOMER";
			}
			else{
				res="FAIL";
			}
		}
		return res;
	}
}
