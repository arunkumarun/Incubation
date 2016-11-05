package com.stock.service;

import java.sql.*;

import com.stock.bean.SignBean;
import com.stock.dao.SignDAO;

public class Administrator {
	
	public boolean isAdmin(String name){
		
		if(name.equalsIgnoreCase("admin")){
			return true;
		}
		return false;
	}
	
	public String addUser(SignBean sBean) throws ClassNotFoundException, SQLException{
		String res = new String();
		SignDAO s = new SignDAO();
		if(sBean == null){
			return "INVALID INPUT";
		}
		if(sBean.getName().isEmpty() || sBean.getPass().isEmpty() || sBean.getRepass().isEmpty()){
			return "INVALID INPUT";
		}
		if(s.isUserNamePresent(sBean.getName())){
			return "NAME EXISTS";
		}
		if(sBean.getPass().equals(sBean.getRepass()) && !isAdmin(sBean.getName())){
			res = s.createUser(sBean);
		}
		else{
			return "Password not match";
		}
		return res;
	}
	
	public String checkUser(String name,String pass) throws ClassNotFoundException, SQLException{
		SignDAO s = new SignDAO();
		String res = new String();
		if(!isAdmin(name)){
			res = s.checkUser(name,pass);
		}
		else{
			res =s.checkUser(name,pass);
			//System.out.println(res);
			if(!res.equals("FAIL")){
				res = "ADMIN";
			}
			//System.out.println(res);
		}
		return res;
	}
}
