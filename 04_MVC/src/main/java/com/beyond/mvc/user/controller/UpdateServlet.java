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

/**
 * <p>
 *
 * <p>packageName    : com.beyond.mvc.user.controller
 * <p>fileName       : UpdateServlet
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

@WebServlet(name = "updateServlet", urlPatterns = "/user/update")
public class UpdateServlet extends HttpServlet {

    private final UserService userService;

    public UpdateServlet() {
        this.userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int result = 0;
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        System.out.println(loginUser);

        loginUser.setName(request.getParameter("userName"));
        loginUser.setPhone(request.getParameter("phone"));
        loginUser.setEmail(request.getParameter("email"));
        loginUser.setAddress(request.getParameter("address"));

        String hobbies = request.getParameterValues("hobby") != null ?
                String.join(",", request.getParameterValues("hobby")) : null;

        loginUser.setHobby(hobbies);

        System.out.println(loginUser);

        result = userService.save(loginUser);

        if (result > 0) {
            request.setAttribute("msg", "회원 정보 수정이 완료되었습니다.");
            request.setAttribute("location", "/user/info");
        } else {
            request.setAttribute("msg", "회원 정보 수정을 실패하였습니다.");
            request.setAttribute("location", "/user/info");
        }

        request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    }

}
