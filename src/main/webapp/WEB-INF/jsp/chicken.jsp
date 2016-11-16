<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">	
        <title>Farm Information</title>
        <!--<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">-->
        <script src='<c:url value="/resources/js/jquery-3.1.1.min.js"/>'></script>
        <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
        <script src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
    </head>

    <body>
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h3 id="title">Chicken List</h3>
            <c:if test="${!empty listChicken}">
                <table class="table table-striped">
                    <tr>
                        <th width="80">Chicken ID</th>
                        <th width="120">Chicken Name</th>
                        <th width="120">Amount of eggs</th>
                        <th width="60">Edit</th>
                        <th width="60">Delete</th>
                    </tr>
                    <c:forEach items="${listChicken}" var="chicken">
                        <tr>
                            <td>${chicken.id}</td>
                            <td>${chicken.name}</td>
                            <td>${chicken.num_egg}</td>
                            <td><a href="<c:url value='/edit/${chicken.id}' />" >Edit</a></td>
                            <td><a href="<c:url value='/remove/${chicken.id}' />" >Delete</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
            <br>
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add Chicken</button>



        </div>

        <div class="col-md-2"></div>
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add a Chicken</h4>
                    </div>
                    <div class="modal-body">
                        <c:url var="addAction" value="/chicken/add" ></c:url>
                        <form:form action="${addAction}" commandName="chicken">
                            <table>
                                <c:if test="${!empty chicken.name}">
                                    <tr>
                                        <td>
                                            <form:label path="id">
                                                <spring:message text="ID"/>
                                            </form:label>
                                        </td>
                                        <td>
                                            <form:input path="id" readonly="true" size="8"  disabled="true" />
                                            <form:hidden path="id" />
                                        </td> 
                                    </tr>
                                </c:if>
                                <tr>
                                    <td>
                                        <form:label path="name">
                                            <spring:message text="Name"/>
                                        </form:label>
                                    </td>
                                    <td>
                                        <form:input path="name" />
                                    </td> 
                                </tr>
                                <tr>
                                    <td>
                                        <form:label path="num_egg">
                                            <spring:message text="Amount of eggs"/>
                                        </form:label>
                                    </td>
                                    <td>
                                        <form:input path="num_egg" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <c:if test="${!empty chicken.name}">
                                            <input type="submit"
                                                   value="<spring:message text="Edit Chicken"/>" />
                                        </c:if>
                                        <c:if test="${empty chicken.name}">
                                            <input type="submit"
                                                   value="<spring:message text="Add Chicken"/>" />
                                        </c:if>
                                    </td>
                                </tr>
                            </table>	
                        </form:form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
    </body>

</html>
