/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.users;

/**
 *
 * @author Dell
 */
public class UserError {
    private String userIDError;
    private String passwordError;
    private String fullNameError;
    private String roleIDError;

    public UserError() {
    }

    public UserError(String userIDError, String passwordError, String fullNameError, String roleIDError) {
        this.userIDError = userIDError;
        this.passwordError = passwordError;
        this.fullNameError = fullNameError;
        this.roleIDError = roleIDError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIdError) {
        this.userIDError = userIdError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }
    
    
}
