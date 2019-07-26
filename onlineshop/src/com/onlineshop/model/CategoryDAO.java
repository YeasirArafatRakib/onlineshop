package com.onlineshop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.onlineshop.bean.CategoryData;
import com.onlineshop.utils.DBConnection;

public class CategoryDAO {
	Connection con = null;
	ResultSet rs = null;
	String sql = "";
	PreparedStatement pst = null;
	DBConnection db =new DBConnection();
	boolean sts = false;
	public List<CategoryData> viewCategory() throws SQLException
	{
		List<CategoryData> category = new ArrayList<>();
		
		con = db.createConnection();
		sql ="SELECT * FROM categories";
		pst = con.prepareStatement(sql);
		rs = pst.executeQuery();
		while(rs.next())
		{
			int id = rs.getInt(1);
			String name = rs.getString(2);
			String catsts = rs.getString(3);
			CategoryData catdata = new CategoryData(id,name,catsts);
			category.add(catdata);
		}
		rs.close();
		pst.close();
		con.close();
		return category;
	}
	public boolean addCategory(CategoryData category) throws SQLException
	{
		con = db.createConnection();
		sql = "INSERT INTO categories (cat_name,cat_status) VALUES (?,?)";
		pst = con.prepareStatement(sql);
		pst.setString(1, category.getCatName());
		pst.setString(2, category.getCatStatus());
		
		sts = pst.executeUpdate() > 0;
		pst.close();
		con.close();
		return sts;
	}
	
	public CategoryData getCategoryInfo( int cid) throws SQLException
	{
		CategoryData catdata = null;
		con = db.createConnection();
		sql = "SELECT * FROM categories WHERE cat_id = ?";
		pst = con.prepareStatement(sql);
		pst.setInt(1, cid);
		rs = pst.executeQuery();
		while(rs.next())
		{
			int id = rs.getInt(1);
			String name = rs.getString(2);
			String catsts = rs.getString(3);
			catdata = new CategoryData(id,name,catsts);
		}
		
		return catdata;
	}
	
	public boolean updateCategoryInfo( int cid,CategoryData catdata) throws SQLException
	{
		System.out.println(cid + " in dao update");
		con = db.createConnection();
		sql = "UPDATE categories SET cat_name = ? , cat_status = ? WHERE cat_id = ?";
		pst = con.prepareStatement(sql);
		pst.setString(1, catdata.getCatName());
		pst.setString(2, catdata.getCatStatus());
		pst.setInt(3, cid);
		sts = pst.executeUpdate() > 0;
		pst.close();
		con.close();
		return sts;
	}
	
	public boolean deleteCategoryInfo( int cid) throws SQLException
	{
		System.out.println(cid + " in dao update");
		con = db.createConnection();
		sql = "DELETE FROM categories WHERE cat_id = ?";
		pst = con.prepareStatement(sql);
		pst.setInt(1, cid);
		sts = pst.executeUpdate() > 0;
		pst.close();
		con.close();
		return sts;
	}
	
}
