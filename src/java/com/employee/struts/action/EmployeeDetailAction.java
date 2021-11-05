/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Struts/StrutsAction.java to edit this template
 */
package com.employee.struts.action;

import com.employee.ejb.db.DBImpl;
import com.employee.ejb.model.Employees;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.util.Date;
        
/**
 *
 * @author shand
 */
public class EmployeeDetailAction extends org.apache.struts.action.Action {

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
        
        String method = request.getParameter("method");
        
        DBImpl dbimpl = new DBImpl();
        if(method == "see") {
            Integer employee_no = Integer.parseInt(request.getParameter("employee_no"));
            Employees emp = dbimpl.getEmployeeById(employee_no);

            if(emp != null) {
                request.setAttribute("employee", emp);
                return mapping.findForward(SUCCESS);
            } else {
                return mapping.findForward(FAILED);
            }
        } else if(method == "modify") {
            Integer employee_no = Integer.parseInt(request.getParameter("employee_no"));
            Employees emp_in = new Employees(
                    request.getParameter("firstName"),
                    request.getParameter("lastName"),
                    request.getParameter("gender"),
                    new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birthDate")),
                    new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birthDate"))
            );
            Employees emp = dbimpl.editEmployee(employee_no, emp_in);
        } else {
            return mapping.findForward(FAILED);
        }
        
        
    }
}
