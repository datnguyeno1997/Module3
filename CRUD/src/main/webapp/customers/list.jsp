<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/10/2023
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
        integrity="sha512-t4GWSVZO1eC8BM339Xd7Uphw5s17a86tIZIj8qRxhnKub6WoyhnrxeCIMeAqBPgdZGlCcG2PrZjMc+Wr78+5Xg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.12/sweetalert2.css" integrity="sha512-K0TEY7Pji02TnO4NY04f+IU66vsp8z3ecHoID7y0FSVRJHdlaLp/TkhS5WDL3OygMkVns4bz0/ah4j8M3GgguA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.12/sweetalert2.min.js" integrity="sha512-JbRQ4jMeFl9Iem8w6WYJDcWQYNCEHP/LpOA11LaqnbJgDV6Y8oNB9Fx5Ekc5O37SwhgnNJdmnasdwiEdvMjW2Q=="
          crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<div class="container">
  <div class="head-control d-flex justify-content-between mt-5">
    <a><button class="btn btn-primary">Create</button></a>
    <a><button class="btn btn-dark">Back</button></a>
  </div>
  <div class="content">
    <c:if test="${sessionScope.messageEdit !=null}">
        <script>
          window.onload = ()=>{
          Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Sửa thành công',
            showConfirmButton: false,
            timer: 1500
          })
        }
      </script>
<%--        <c:set scope="session" var="messageEdit" value="null"></c:set>--%>
      <% session.setAttribute("messageEdit", null);%>
    </c:if>

    <c:if test="${sessionScope.messageDelete !=null}">
      <script>
        window.onload = ()=>{
          Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Xóa thành công',
            showConfirmButton: false,
            timer: 1500
          })
        }
      </script>
      <%--        <c:set scope="session" var="messageEdit" value="null"></c:set>--%>
      <% session.setAttribute("messageDelete", null);%>
    </c:if>
    <table class="table table-striped">
      <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
        <th>Action></th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${requestScope.customers}" var="c">
          <tr>
            <td>${c.getName()}</td>
            <td>${c.getEmail()}</td>
            <td>${c.getAddress()}</td>
            <td>
              <a href="/customers?action=edit&id=${c.getId()}"><i class="fa-solid fa-pen-to-square"></i></a>
              <a href="javascript:void(0)" onclick="handleDeleteClick(${c.getId()}, '${c.getName()}')"><i class="fa-solid fa-trash"></i></a>
            </td>
          </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
  <script>
    function handleDeleteClick(id, name){
        Swal.fire({
          title: 'Are you sure?',
          text: "Bạn có muốn xóa " + name + " hay ko",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
          console.log(result);
          if (result.isConfirmed) {
            // /customers?action=delete&id=
            location.assign("/customers?action=delete&id=" + id);
          }
        })
    }
  </script>
</body>
</html>