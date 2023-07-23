/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.users;

import com.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class UserDAO {
    public UserDTO checkLogin(String userID, String password) throws SQLException{
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            String sql = "SELECT fullName, roleID "
                    + " FROM tblUsers "
                    + " WHERE [userID]=? AND [password]=?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()){
                String fullName = rs.getString("fullName");
                String roleID = rs.getString("roleID");
                user = new UserDTO(userID, fullName, roleID, "");
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if (rs!=null) rs.close();
            if (stm!=null) stm.close();
            if (conn!=null) conn.close();
        }
        return user;
    }
    
    public List<UserDTO> getListUser(String search) throws SQLException{
        List<UserDTO> list = new ArrayList<UserDTO>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "SELECT userID, fullName, roleID "
                        + " FROM tblUsers "
                        + "WHERE [fullName] like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                System.out.println(rs);
                while(rs.next()){
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String password = "***";
                    list.add(new UserDTO(userID, fullName, roleID, password));
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
    
    public boolean deleteUser(String userID) throws SQLException{
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "DELETE tblUsers "
                        + "WHERE userID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
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
    
    public boolean updateUser(UserDTO user) throws SQLException{
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "UPDATE tblUsers "
                        + " SET fullName=?, roleID=? "
                        + " WHERE userID=? ";
                stm=conn.prepareStatement(sql);
                stm.setString(1, user.getFullName());
                stm.setString(2, user.getRoleID());
                stm.setString(3, user.getUserID());
                result = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        }
        return result;
    }
    
    public boolean checkDuplicate(String userID) throws SQLException{
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
                stm.setString(1, userID);
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
    
    public boolean insert(UserDTO user) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO tblUsers(userID, fullName, roleID, password) "
                      + " VALUES(?,?,?,?) ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getFullName());
                stm.setString(3, user.getRoleID());
                stm.setString(4, user.getPassword());
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
    
    public UserDTO getUserByID(String userID) throws SQLException{
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "SELECT userID, fullName, roleID "
                        + " FROM tblUsers "
                        + " WHERE userID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()){
                    String userID_raw = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String password = "***";
                    user = new UserDTO(userID_raw, fullName, roleID, password);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) conn.close();
            if (stm != null) stm.close();
            if (rs != null) rs.close();
        }
        return user;
    }
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        try {
            dao.getListUser("");
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
