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
        <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
        <script type="application/javascript" src='<c:url value="/resources/js/jquery-3.1.1.min.js"/>'></script>
        <script type="application/javascript" src='<c:url value="/resources/js/script.js"/>'></script>
        <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
        <script type="application/javascript" src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
    </head>

    <body>
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h3 id="title">Chicken List</h3>
            <c:if test="${!empty listChicken}">
                <table id="chickenTable" class="table table-striped table-hover">
                    <tr>
                        <th>Chicken ID</th>
                        <th>Chicken Name</th>
                        <th>Amount of eggs</th>
                    </tr>
                    <c:forEach items="${listChicken}" var="chicken">
                        <tr>
                            <td id="id">${chicken.id}</td>
                            <td id="name">${chicken.name}</td>
                            <td id="num_egg">${chicken.num_egg}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
            <br>
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add Chicken</button>
            <br>
            <button type="button" class="btn btn-info btn-lg" onclick="listChicken()">call</button>

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
                            </table>	
                        
                    </div>
                    <div class="modal-footer">
                        <input type="submit" value="<spring:message text="Add Chicken"/>" />
                    </div>
                    </form:form>
                </div>

            </div>
        </div>
                        
                        
        <div id="myModalEditRemove" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Edit a Chicken</h4>
                    </div>
                    <div class="modal-body">
                        <c:url var="addAction" value="/chicken/edit" ></c:url>
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
                                    </td>
                                </tr>
                            </table>	
                        </form:form>
                    </div>
                    <div class="modal-footer">
                        <button id="edit" type="button" class="btn btn-info btn-sm">Edit</button>
                        <button id="delete" type="button" class="btn btn-danger btn-sm">Delete</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>                
    </body>

</html>
