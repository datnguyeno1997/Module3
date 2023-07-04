package com.example.simple_login;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface HttpServlet {
    void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
