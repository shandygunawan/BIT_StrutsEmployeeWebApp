<%-- 
    Document   : detail_employee
    Created on : Nov 5, 2021, 1:57:27 PM
    Author     : shand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Employee Detail</title>
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
            <div class="container">
                <h2 class="text-center">
                    Employee No: <bean:write name="employee" property="empNo"></bean:write>
                </h2>
                <html:form action="employee-detail-action.do?method=modify" method="post">
                    <div class="row mt-4">
                        <div class="col-6">
                            <label for="employee_firstname" class="form-label">First Name</label>
                            <html:text styleClass="form-control" styleId="employee_firstname" 
                                       property="firstName" value="${employee.firstName}" />
                            
                        </div>
                        <div class="col-6">
                            <label for="employee_lastname" class="form-label">Last Name</label>
                            <html:text styleClass="form-control" styleId="employee_lastname" 
                                       property="lastName" value="${employee.lastName}" />
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-6">
                            <label for="employee_birthdate" class="form-label">Birth Date</label>
                            <html:text styleClass="form-control" styleId="employee_birthdate" 
                                       property="birthDate" value="${employee.birthDate}" />
                        </div>
                        <div class="col-6">
                            <label for="employee_gender" class="form-label">Gender (M/F)</label>
                            <html:text styleClass="form-control" styleId="employee_gender" 
                                       property="gender" value="${employee.gender}" />
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-12">
                            <button type="button" class="btn btn-primary" id="button_edit">Edit</button>
                            <html:submit styleClass="btn btn-primary" styleId="button_save" value="Save" />
                        </div>
                    </div>
                    <input type="hidden" name="employee_no" value="${employee.empNo}" />
                </html:form>
                
                <div class="row mt-5">
                    <div class="col-12">
                        <h4>Title History</h4>
                    </div>
                    <div class="col-6">
                        <table style="width: 100%">
                            <tr>
                                <th>Title</th>
                                <th>From Date</th>
                                <th>To Date</th>
                            </tr>
                            <c:forEach items="${employee.titlesList}" var="title">
                                <tr>
                                    <td><c:out value="${title.titlesPK.title}" /></td>
                                    <td><c:out value="${title.titlesPK.fromDate}" /></td>
                                    <td><c:out value="${title.toDate}" /></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    </body>
    
    <script>
        var isDetailEditable = false;
        
        $(document).ready(function() {
           $("input").prop('disabled', true);
           $("#button_save").hide();
        });
        
        $("#button_edit").click(function() {
            if(isDetailEditable === false) {
                $("#button_edit").text("Cancel");
                $("#button_edit").removeClass();
                $("#button_edit").addClass("btn btn-danger");
                
                $("input").prop('disabled', false);
                $("#button_save").show();
                isDetailEditable = true;
            } else {
                $("#button_edit").text("Edit");
                $("#button_edit").removeClass();
                $("#button_edit").addClass("btn btn-primary");
                
                $("input").prop('disabled', true);
                $("#button_save").hide();
                isDetailEditable = false;
            }
        });
    </script>
</html>
