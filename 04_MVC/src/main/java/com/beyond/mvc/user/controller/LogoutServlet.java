package com.beyond.mvc.user.controller;

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
 * <p>fileName       : LogoutServlet
 * <p>author         : hjsong
 * <p>date           : 2025-02-10
 * <p>description    :
 */
/*
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-02-10        hjsong             최초 생성
 */
@WebServlet(name = "logoutServlet", urlPatterns = "/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 로그아웃 순서
        // 1. 세션 객체를 열어온다.
        HttpSession session = request.getSession();;

        // 2. 세션 삭제한다.
        session.invalidate();

        // 3. 삭제 후 메인 화면으로 리다이렉트
        response.sendRedirect(request.getContextPath() + "/");
    }

}
