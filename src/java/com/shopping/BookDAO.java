/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shopping;

import com.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class BookDAO {
    
    public List<BookDTO> getListBook() throws SQLException{
        List<BookDTO> list = new ArrayList<BookDTO>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "SELECT bookID, bookName, bookPrice "
                        + " FROM tblBooks ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()){
                    String bookID = rs.getString("bookID");
                    String bookName = rs.getString("bookName");
                    float bookPrice = Float.parseFloat(rs.getString("bookPrice"));
                    list.add(new BookDTO(bookID, bookName, bookPrice, 0));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if (rs!=null) rs.close();
            if (stm!=null) stm.close();
            if (conn!=null) conn.close();
        }
        return list;
    }
    
    public boolean deleteBook(String bookID) throws SQLException{
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "DELETE tblBooks "
                        + "WHERE bookID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, bookID);
                int value = stm.executeUpdate();
                result = value > 0 ? true : false;
            }
        } catch (Exception e){
            
        } finally {
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        }
        return result;
    }
    
    public boolean updateBook(BookDTO book) throws SQLException{
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "UPDATE tblBooks "
                        + " SET bookName=?, bookPrice=? "
                        + " WHERE bookID=? ";
                stm=conn.prepareStatement(sql);
                stm.setString(1, book.getBookName());
                stm.setFloat(2, book.getBookPrice());
                stm.setString(3, book.getBookID());
                result = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        }
        return result;
    }
    
    public boolean checkDuplicate(String bookID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "SELECT userID "
                        + " FROM tblUsers "
                        + " WHERE userID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, bookID);
                rs = stm.executeQuery();
                if (rs.next()){
                    check = true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (conn != null) conn.close();
            if (stm != null) stm.close();
            if (rs != null) rs.close();
        }
        return check;
    }
    
    public boolean insert(BookDTO book) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO tblBooks(bookID, bookName, bookPrice) "
                      + " VALUES(?,?,?) ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, book.getBookID());
                stm.setString(2, book.getBookName());
                stm.setFloat(3, book.getBookPrice());
                check = stm.executeUpdate() > 0;   
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    
    public BookDTO getBookByID(String bookID) throws SQLException{
        BookDTO book = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "SELECT bookID, bookName, bookPrice "
                        + " FROM tblBooks "
                        + " WHERE bookID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, bookID);
                rs = stm.executeQuery();
                if (rs.next()){
                    String userID_raw = rs.getString("bookID");
                    String fullName = rs.getString("bookName");
                    float roleID = Float.parseFloat(rs.getString("bookPrice"));
                    book = new BookDTO(userID_raw, fullName, roleID, 0);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) conn.close();
            if (stm != null) stm.close();
            if (rs != null) rs.close();
        }
        return book;
    }
}
