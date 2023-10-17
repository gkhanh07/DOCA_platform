/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.registration;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class RegistrationCreateError  implements Serializable{
    private String usernameLengthErr;
    private String passwordLengthErr;
    private String fullnameLengthErr;
    private String comfirmMatched;
    private String usernameIsExisted;

    public RegistrationCreateError() {
    }

    public RegistrationCreateError(String usernameLengthErr, String passwordLengthErr, String fullnameLengthErr, String comfirmMatched, String usernameIsExisted) {
        this.usernameLengthErr = usernameLengthErr;
        this.passwordLengthErr = passwordLengthErr;
        this.fullnameLengthErr = fullnameLengthErr;
        this.comfirmMatched = comfirmMatched;
        this.usernameIsExisted = usernameIsExisted;
    }

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
     * @return the fullnameLengthErr
     */
    public String getFullnameLengthErr() {
        return fullnameLengthErr;
    }

    /**
     * @param fullnameLengthErr the fullnameLengthErr to set
     */
    public void setFullnameLengthErr(String fullnameLengthErr) {
        this.fullnameLengthErr = fullnameLengthErr;
    }

    /**
     * @return the comfirmMatched
     */
    public String getComfirmMatched() {
        return comfirmMatched;
    }

    /**
     * @param comfirmMatched the comfirmMatched to set
     */
    public void setComfirmMatched(String comfirmMatched) {
        this.comfirmMatched = comfirmMatched;
    }

    /**
     * @return the usernameIsExisted
     */
    public String getUsernameIsExisted() {
        return usernameIsExisted;
    }

    /**
     * @param usernameIsExisted the usernameIsExisted to set
     */
    public void setUsernameIsExisted(String usernameIsExisted) {
        this.usernameIsExisted = usernameIsExisted;
    }
    
}
