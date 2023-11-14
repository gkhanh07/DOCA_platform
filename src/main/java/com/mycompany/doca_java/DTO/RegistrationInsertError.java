/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DTO;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class RegistrationInsertError implements Serializable{
    private String usernameLengthErr;
    private String emailErr;
    private String phoneLengthErr;
    private String passwordLengthErr;
    private String confirmNotMatch;

    /**
     * @return the usernameLengthErr
     */
    public String getUsernameLengthErr() {
        return usernameLengthErr;
    }

    /**
     * @param usernameLengthErr the usernameLengthErr to set
     */
    public void setUsernameLengthErr(String usernameLengthErr) {
        this.usernameLengthErr = usernameLengthErr;
    }

    /**
     * @return the emailErr
     */
    public String getEmailErr() {
        return emailErr;
    }

    /**
     * @param emailErr the emailErr to set
     */
    public void setEmailErr(String emailErr) {
        this.emailErr = emailErr;
    }

    /**
     * @return the phoneLengthErr
     */
    public String getPhoneLengthErr() {
        return phoneLengthErr;
    }

    /**
     * @param phoneLengthErr the phoneLengthErr to set
     */
    public void setPhoneLengthErr(String phoneLengthErr) {
        this.phoneLengthErr = phoneLengthErr;
    }

    /**
     * @return the passwordLengthErr
     */
    public String getPasswordLengthErr() {
        return passwordLengthErr;
    }

    /**
     * @param passwordLengthErr the passwordLengthErr to set
     */
    public void setPasswordLengthErr(String passwordLengthErr) {
        this.passwordLengthErr = passwordLengthErr;
    }

    /**
     * @return the confirmNotMatch
     */
    public String getConfirmNotMatch() {
        return confirmNotMatch;
    }

    /**
     * @param confirmNotMatch the confirmNotMatch to set
     */
    public void setConfirmNotMatch(String confirmNotMatch) {
        this.confirmNotMatch = confirmNotMatch;
    }
    
    
}
