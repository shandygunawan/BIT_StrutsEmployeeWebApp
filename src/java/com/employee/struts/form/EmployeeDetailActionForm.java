/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Struts/StrutsActionForm.java to edit this template
 */
package com.employee.struts.form;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author shand
 */
public class EmployeeDetailActionForm extends org.apache.struts.action.ActionForm {
    
    private String firstName;
    private String lastName;
    private String gender;
    private Date birthDate;

    /**
     * @return
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param string
     */
    public void setFirstName(String name) {
        firstName = name;
    }
    
    public String getLastName() {
        return lastName;
    }
    
    public void setLastName(String name) {
        lastName = name;
    }
    
    public String getGender() {
        return gender;
    }
    
    public void setGender(String gen) {
        gender = gen;
    }
    
    public Date getBirthDate() {
        return birthDate;
    }
    
    public void setBirthDate(Date date) {
        birthDate = date;
    }

    /**
     *
     */
    public EmployeeDetailActionForm() {
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
        if (getFirstName() == null || getFirstName().length() < 1) {
            errors.add("First Name", new ActionMessage("employee.error.firstname.required"));
        }
        if (getLastName() == null || getLastName().length() < 1) {
            errors.add("Last Name", new ActionMessage("employee.error.lastname.required"));
        }
        if (getGender() == null || getGender().length() < 1) {
            errors.add("Gender", new ActionMessage("employee.error.gender.required"));
        }
        return errors;
    }
}
