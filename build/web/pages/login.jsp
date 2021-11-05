<%-- 
    Document   : login
    Created on : Nov 4, 2021, 1:26:41 PM
    Author     : shand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Login</title>
    </head>
    <body>
        <div class="container p-3">
            <div class="row">
                <div class="col-12">
                    <h3 class="text-center">Login</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card shadow bg-light">
                        <div class="card-body">
                            <html:form action="login-action.do" method="post">
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <html:text styleClass="form-control" styleId="username" property="username" />
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <html:text styleClass="form-control" styleId="password" property="password" />
                                </div>
                                <html:submit styleClass="btn btn-primary" value="Login" />
                            </html:form>
                            <html:errors />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
