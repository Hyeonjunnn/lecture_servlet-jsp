package com.beyond.mvc.user.controller;

import com.beyond.mvc.user.model.service.UserService;
import com.beyond.mvc.user.model.service.UserServiceImpl;
import com.beyond.mvc.user.model.vo.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * <p>
 *
 * <p>packageName    : com.beyond.mvc
 * <p>fileName       : LoginServlet
 * <p>author         : hjsong
 * <p>date           : 2025-02-07
 * <p>description    :
 */
/*
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-02-07        hjsong             최초 생성
 */
@WebServlet(name = "loginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    private final UserService userService;

    public LoginServlet() {
         userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = null;
        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");

        System.out.println(userId + ", " + userPwd);

        User loginUser = userService.login(userId, userPwd);

        if (loginUser != null) {
            // loginUser 객체를 세션에 저장
            session = request.getSession();

            session.setAttribute("loginUser", loginUser);

            // 로그인이 완료되면 메인 화면으로 이동시킨다.
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            // 로그인 실패에 대한 메시지를 띄워주고 메인 화면으로 이동

            // 1. 공용으로 사용하는 에러 메시지 출력 페이지에
            //    전달할 메시지와 메시지 출력 후 이동할 페이지를 request 객체에 저장한다.
            request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다.");
            request.setAttribute("location", "/");

            // 2. request 객체의 데이터를 유지해서
            //    에러 메세지 출력 페이지에 전달하기 위해서 forward를 실행한다.
            request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

        }

    }

}
