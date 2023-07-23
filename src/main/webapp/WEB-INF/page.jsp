<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <LINK href="/cas_css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function validateNumber(obj){
            if (isNaN(obj.value)){alert("invalid"); obj.value= ''; return false;}
            if (obj.value.length > 9){alert("number is too long"); obj.value = ''; return false;}
            if (obj.value.indexOf("e") !== -1){alert("e is still not a number - change my mind"); obj.value = ''; return false;}
            if (obj.value < -5 || obj.value > 5){alert("invalid"); obj.value= ''; return false;}
            return true;
        }
    </script>
    <meta charset="UTF-8">
    <title>Web Lab № 2</title>
    ФИО: Жуков Дмитрий Александрович <br>
    № группы: R32403 <br>
    № варианта: 1 <br>
</head>
<body>
<div id="pictureDiv">
    <form action="control">
        <input type="image" name="imageInput" src="/images" formmethod="post">
    </form>

</div>

<div id="formDiv"><form id="mainForm" action="control" method="post" name="form">
    <div id="xDiv"><label for="inputX">X: </label><select id="inputX" name="X" required>
        <option value="-3">-3</option>
        <option value="-2">-2</option>
        <option value="-1">-1</option>
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select></div>
    <div id="yDiv"><label for="inputY">Y: </label><input id="inputY" name="Y" type="text" onblur="validateNumber(this)" required/></div>
    <div id="rDiv"><label for="inputR">R: </label><select id="inputR" name="R" required>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select></div>
    <div id="submitDiv"><button type="submit">submit</button></div>
</form></div>

<c:if test="${count!=null}">
    <table>
        <thead>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>res</th>
        </thead>
        <tbody>
        <%
            int count = (int) request.getAttribute("count");
            List<List<Integer>> results = (List<List<Integer>>) request.getAttribute("results");

            for (int i = 0; i < count; ++i) {
                out.println("<tr>");

                out.println("<td>" + results.get(i).get(0) + "</td>");
                out.println("<td>" + results.get(i).get(1) + "</td>");
                out.println("<td>" + results.get(i).get(2) + "</td>");
                out.println("<td>" + results.get(i).get(3) + "</td>");


                out.println("</tr>");
            }
        %>
        </tbody>
    </table>
</c:if>
</body>
</html>