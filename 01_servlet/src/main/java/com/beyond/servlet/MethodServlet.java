package com.beyond.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

/**
 * <p>
 *
 * <p>packageName    : com.beyond.servlet
 * <p>fileName       : MethodServlet
 * <p>author         : hjsong
 * <p>date           : 2025-02-04
 * <p>description    :
 */
/*
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-02-04        hjsong             최초 생성
 */

@WebServlet("/method.do")
public class MethodServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 사용자가 보낸 데이터들은 request 객체를 통해서 얻어올 수 있다.
        // request.getParameter("input 태그의 name 속성의 값");
        String userName = request.getParameter("userName");
        String userAge = request.getParameter("userAge");
        String gender = request.getParameter("gender");
        // String food = request.getParameter("food");
        String[] foods = request.getParameterValues("food");

        System.out.println(userName);
        System.out.println(userAge);
        System.out.println(gender);
        System.out.println(Arrays.toString(foods));

        // 응답 화면 출력
        response.setContentType("text/html;charset=utf-8");
        
        PrintWriter out = response.getWriter();
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>개인 정보 출력</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2>개인 정보 출력</h2>");
        out.printf("%s님은 %s세 %s입니다.<br/>\n", userName, userAge, gender);
        out.print("좋아하는 음식은 ");
        Arrays.stream(foods).forEach((food) -> out.print(food + " "));
        out.println("입니다.");
        out.println("</body>");
        out.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

}
