package com.beyond.mvc.common.filter;

import com.beyond.mvc.user.model.vo.User;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * <p>
 *
 * <p>packageName    : com.beyond.mvc.common.filter
 * <p>fileName       : LoginCheckFilter
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

@WebFilter(filterName = "loginCheckFilter",
        // urlPatterns = {"/login"}
        servletNames = {"infoServlet", "updateServlet", "deleteServlet"}
)
public class LoginCheckFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {

        HttpSession session = ((HttpServletRequest) request).getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if (loginUser == null) {
            request.setAttribute("msg", "로그인 후 사용해주세요.");
            request.setAttribute("location", "/");

            request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

            return;
        }

        filterChain.doFilter(request, response);
    }

}
