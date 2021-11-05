<%-- 
    Document   : home
    Created on : Nov 4, 2021, 2:00:05 PM
    Author     : shand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Home</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">EmployeeWebApp</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Search <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Create</a>
                    </li>
                </ul>
            </div>
        </nav>
        
        <div class="p-5" id="main_div">
            <div class="row">
                <div class="col-12">
                    <h3>Search Employee</h3>
                </div>  
            </div>
            <div class="row">
                <div class="col-12">
                    <html:form action="search-employee-action.do">
                        <div class="input-group mb-3">
                            <html:text styleClass="form-control" styleId="input_employee_name" property="name" />
                            <div class="input-group-append">
                                <html:submit styleClass="btn btn-outline-secondary" styleId="button-search" value="Search" />
                            </div>
                        </div>
                    </html:form>
                    <html:errors />
                </div>  
            </div>
                
            
            <logic:notEmpty name="employees">
                <logic:iterate name="employees" id="emp">
                    <div class="row mt-3">
                        <div class="col-5">
                            <div class="card shadow-sm">
                                <div class="row g-0">
                                    <div class="col-4">
                                        <img src="https://www.pngitem.com/pimgs/m/421-4212617_person-placeholder-image-transparent-hd-png-download.png" 
                                             class="img-fluid rounded-start" alt="Image">
                                    </div>
                                    <div class="col-8 position-relative">
                                        <div class="card-body">
                                            <div class="card-title mt-2">
                                                <h4>
                                                    <bean:write name="emp" property="firstName" ></bean:write>
                                                    <bean:write name="emp" property="lastName" ></bean:write>
                                                </h4>
                                            </div>
                                            <div class="card-text">
                                                <p>
                                                    Employee No: <bean:write name="emp" property="empNo"></bean:write>
                                                </p>
                                                <a href="
/EmployeeWebApp/employee-detail-action.do?method=see&employee_no=${emp.empNo}">See Details</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </logic:iterate>
            </logic:notEmpty>
            
        </div>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    </body>
    
    <script>
        $(document).ready(function() {
           $("#input_employee_name").attr("aria-describedby", "button-search");
           $("#input_employee_name").attr("placeholder", "Employee's Name");
        });
    </script>
</html>
