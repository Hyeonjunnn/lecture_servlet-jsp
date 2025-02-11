package com.beyond.mvc.user.controller;

import com.beyond.mvc.user.model.vo.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * <p>
 *
 * <p>packageName    : com.beyond.mvc.user.controller
 * <p>fileName       : InfoServlet
 * <p>author         : hjsong
 * <p>date           : 2025-02-11
 * <p>description    :
 */
/*
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-02-11        hjsong             최초 생성
 */

@WebServlet(name = "infoServlet", urlPatterns = "/user/info")
public class InfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/user/info.jsp").forward(request, response);

    }

}
