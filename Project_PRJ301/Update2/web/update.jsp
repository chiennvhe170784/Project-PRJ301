

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>A new category</h1>
        <c:set var="c" value="${requestScope.cat}"/>
        <form action="update" method="post">
            Enter id: <input type="number" readonly name="id" value="${c.id}"/><br/>
            Enter name: <input type="text" name="name" value="${c.name}"/><br/>
            Enter describe: <textarea name="desc"  >${c.describe}</textarea><br/>
            <button type="submit">UPDATE</button>
        </form>
    </body>
</html>
