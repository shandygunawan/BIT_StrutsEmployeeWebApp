/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Struts/StrutsAction.java to edit this template
 */
package com.employee.struts.action;

import com.employee.struts.form.SearchEmployeeActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.employee.ejb.db.DBImpl;
import com.employee.ejb.model.Employees;
import java.util.List;

/**
 *
 * @author shand
 */
public class SearchEmployeeAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAILED = "failed";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        SearchEmployeeActionForm searchForm = (SearchEmployeeActionForm) form;
        
        ActionErrors errors = searchForm.validate(mapping, request);
        
        if(errors.isEmpty()) {
            
            DBImpl dbimpl = new DBImpl();
            List<Employees> emps = dbimpl.getEmployeesByName(searchForm.getName());
            request.setAttribute("employees", emps);
            
            return mapping.findForward(SUCCESS);
        } else {
            saveErrors(request, errors);
            return mapping.findForward(FAILED);
        }
    }
}
