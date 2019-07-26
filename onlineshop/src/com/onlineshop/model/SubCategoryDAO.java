package com.onlineshop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.onlineshop.bean.SubCategoryData;
import com.onlineshop.utils.DBConnection;

public class SubCategoryDAO {
	Connection con = null;
	ResultSet rs = null;
	String sql = "";
	PreparedStatement pst = null;
	DBConnection db =new DBConnection();
	boolean sts = false;
	public List<SubCategoryData> viewSubCategory() throws SQLException
	{
		List<SubCategoryData> subcategory = new ArrayList<>();
		
		con = db.createConnection();
		sql ="select sub_categories.sub_id,sub_categories.sub_name,categories.cat_name, sub_categories.sub_status from sub_categories INNER JOIN categories ON categories.cat_id = sub_categories.cat_id";
		pst = con.prepareStatement(sql);
		rs = pst.executeQuery();
		while(rs.next())
		{
			int id = rs.getInt(1);
			String subcatname = rs.getString(2);
			String catname = rs.getString(3);
			String subcatsts = rs.getString(4);
			SubCategoryData subcatdata = new SubCategoryData(id,subcatname,catname,subcatsts);
			subcategory.add(subcatdata);
		}
		rs.close();
		pst.close();
		con.close();
		return subcategory;
	}
	public boolean addSubCategory(SubCategoryData subcategory) throws SQLException
	{
		con = db.createConnection();
		sql = "INSERT INTO sub_categories (sub_name,sub_status,cat_id) VALUES (?,?,?)";
		pst = con.prepareStatement(sql);
		pst.setString(1, subcategory.getSubCatName());
		pst.setString(2, subcategory.getSubCatStatus());
		pst.setInt(3, subcategory.getCatId());
		
		sts = pst.executeUpdate() > 0;
		pst.close();
		con.close();
		return sts;
	}
	
	public SubCategoryData getSubCategoryInfo( int sid) throws SQLException
	{
		SubCategoryData subcatdata = null;
		con = db.createConnection();
		sql = "SELECT * FROM sub_categories WHERE sub_id = ?";
		pst = con.prepareStatement(sql);
		pst.setInt(1, sid);
		rs = pst.executeQuery();
		while(rs.next())
		{
			int id = rs.getInt(1);
			String name = rs.getString(2);
			String subcatsts = rs.getString(3);
			int catId = rs.getInt(4);
			subcatdata = new SubCategoryData(id,name,subcatsts,catId);
			
		}
		
		return subcatdata;
	}
	
	public boolean updateSubCategoryInfo( int sId,SubCategoryData subdata) throws SQLException
	{
		System.out.println(sId + " in dao update");
		con = db.createConnection();
		sql = "UPDATE sub_categories SET sub_name = ? , sub_status = ? , cat_id = ? WHERE sub_id = ?";
		pst = con.prepareStatement(sql);
		pst.setString(1, subdata.getSubCatName());
		pst.setString(2, subdata.getSubCatStatus());
		pst.setInt(3, subdata.getCatId());
		pst.setInt(4, sId);
		sts = pst.executeUpdate() > 0;
		pst.close();
		con.close();
		return sts;
	}
	
	public boolean deleteSubCategoryInfo( int sId) throws SQLException
	{
		System.out.println(sId + " in dao update");
		con = db.createConnection();
		sql = "DELETE FROM sub_categories WHERE sub_id = ?";
		pst = con.prepareStatement(sql);
		pst.setInt(1, sId);
		sts = pst.executeUpdate() > 0;
		pst.close();
		con.close();
		return sts;
	}
	
}
