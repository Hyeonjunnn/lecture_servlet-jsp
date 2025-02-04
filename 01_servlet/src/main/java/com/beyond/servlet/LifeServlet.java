package com.beyond.servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * <p>
 *
 * <p>packageName    : com.beyond.servlet
 * <p>fileName       : LifeServlet
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

@WebServlet("/life.do")
public class LifeServlet extends HttpServlet {
    public LifeServlet() {
        System.out.println("LifeServlet 서블릿 생성");
    } // public LifeServlet() - END

    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("LifeServlet init() 메소드 호출");
    } // public void init(....) - END

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("LifeServlet service() 메소드 호출");

        // 요청 방식에 다라 doGet(), doPost(), .... 메소드 호출
        super.service(request, response);
    } // protected void service(....) - END

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("LifeServlet doGet() 메소드 호출");
    } // protected void doGet(....) - END

    @Override
    public void destroy() {
        System.out.println("LifeServlet destroy() 메소드 호출");
    } // public void destroy() - END

}
