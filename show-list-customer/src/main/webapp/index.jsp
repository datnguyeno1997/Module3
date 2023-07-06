<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="container border border-info">
    <table class="table ">
        <header>
            <tr >
                <h2 style="text-align: center;" scope="col-1">Danh sách khách hàng</h2>
            </tr>
        </header>
        <body >
        <tr >
            <th scope="col-1">Tên</th>
            <th scope="col-1">Ngày sinh</th>
            <th scope="col-1">Địa chỉ</th>
            <th scope="col-1">Ảnh</th>
        </tr>
        <tr>
            <td scope="col-1">Mai Văn Hoàn</td>
            <td scope="col-1">20-08-1983</td>
            <td scope="col-1">Hà Nội</td>
            <td scope="col-1"><img style="width: 50px;" src="https://designs.vn/wp-content/images/30-07-2015/chup-anh-nguoi-xa-la-1_resize.jpg" alt=""></td>
        </tr>
        <tr>
            <td scope="col-1">Nguyễn Văn Nam</td>
            <td scope="col-1">21-08-1983</td>
            <td scope="col-1">Bắc Giang</td>
            <td scope="col-1"><img style="width: 50px;" src="https://designs.vn/wp-content/images/30-07-2015/chup-anh-nguoi-xa-la-1_resize.jpg" alt=""></td>
        </tr>
        <tr>
            <td scope="col-1">Nguyễn Thái Hòa</td>
            <td scope="col-1">22-08-1983</td>
            <td scope="col-1">Bắc Giang</td>
            <td scope="col-1"><img style="width: 50px;" src="https://designs.vn/wp-content/images/30-07-2015/chup-anh-nguoi-xa-la-1_resize.jpg" alt=""></td>
        </tr>
        <tr>
            <td scope="col-1">Trần Đăng Khoa</td>
            <td scope="col-1">17-08-1983</td>
            <td scope="col-1">Hà Tây</td>
            <td scope="col-1"><img style="width: 50px;" src="https://designs.vn/wp-content/images/30-07-2015/chup-anh-nguoi-xa-la-1_resize.jpg" alt=""></td>
        </tr>
        <tr>
            <td scope="col-1">Nguyễn Đình Thi</td>
            <td scope="col-1">19-08-1983</td>
            <td scope="col-1">Hà Nội</td>
            <td scope="col-1"><img style="width: 50px;" src="https://designs.vn/wp-content/images/30-07-2015/chup-anh-nguoi-xa-la-1_resize.jpg" alt=""></td>
        </tr>
        </body>
    </table>
</div>
</body>
</html>