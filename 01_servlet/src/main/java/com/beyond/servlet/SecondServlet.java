package com.beyond.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;


/**
 * <p>
 *
 * <p>packageName    : com.beyond.servlet
 * <p>fileName       : SecondServlet
 * <p>author         : hjsong
 * <p>date           : 2025-02-03
 * <p>description    :
 */
/*
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-02-03        hjsong             최초 생성
 */
// @WebServlet(name = "second", urlPatterns = "/second.do")
@WebServlet(name = "second", urlPatterns = {"/second.do", "/second2.do"})
public class SecondServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getContextPath());
        System.out.println(request.getServletPath());
        System.out.println(request.getServerName());
        System.out.println(request.getServerPort());
        System.out.println(request.getRemoteUser());


        // 자바 코드로 응답 화면 작성
        response.setContentType("text/html;charset=utf-8");

        // 1. 응답 화면을 출력하기 위한 출력 스트림 얻어온다.
        PrintWriter out = response.getWriter();

        // 2. 응답 화면 작성
        out.println("<!DOCTYPE html>");

        out.println("<html>");
        out.println("<head>");
        out.println("<title>SecondServlet</title>");
        out.println("</head>");

        out.println("<body>");
        out.println("<h2>두 번째 서블릿의 변환 내용</h2>");
        out.println("<p>현재 시간 : " + LocalDateTime.now() + "</p>");
        out.println("</body>");

        out.println("</html>");
    }

}
