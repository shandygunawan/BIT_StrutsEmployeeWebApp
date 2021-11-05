/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Struts/StrutsActionForm.java to edit this template
 */
package com.employee.struts.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author shand
 */
public class LoginActionForm extends org.apache.struts.action.ActionForm {
    
    private String username;
    private String password;

    /**
     * @return
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param string
     */
    public void setUsername(String name) {
        this.username = name;
    }

    /**
     * @return
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param i
     */
    public void setPassword(String pwd) {
        this.password = pwd;
    }

    /**
     *
     */
    public LoginActionForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        
        if (getUsername() == null || getUsername().length() < 1) {
            errors.add("username", new ActionMessage("login.error.username.required"));
        }
        if (getPassword() == null || getPassword().length() < 1) {
            errors.add("password", new ActionMessage("login.error.password.required"));
        }
        
        return errors;
    }
}
