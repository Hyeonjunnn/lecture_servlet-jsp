package com.beyond.mvc.common.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.sql.Wrapper;

/**
 * <p>
 *
 * <p>packageName    : com.beyond.mvc.user.common.filter
 * <p>fileName       : EncryptFilter
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
/*
   서블릿 필터
    - Request, Response가 서블릿이나 JSP에 도달하기 전에 필요한 전/후 처리 작업을 실행한다.
    - FilterChain을 통해서 여러 개의 필터를 연속적으로 사용할 수 있다.

   서블릿 필터를 구현하는 방법
    - Filter 인터페이스를 구현하는 클래스를 생성한다.
    - doFilter() 추상 메소드를 재정의한다.

   서블릿 필터를 등록하는 방법
    - web.xml 파일에 필터를 등록해서 사용할 수 있다.
    - @WebFilter 어노테이션으로 필터를 등록해서 사용할 수 있다.
 */
@WebFilter(filterName = "encryptFilter",
           // urlPatterns = {"/login", "/user/enroll"}
            servletNames = {"loginServlet", "enrollServlet"}
)
public class EncryptFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 컨테이너가 필터를 생성할 때, 초기화를 위해서 호출한다.
        System.out.println(filterConfig.getFilterName() + " 필터가 생성되어 초기화 진행");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("서블릿 동작 전 코드 실행");

        // 사용자가 보낸 요청과 응답 객체를 임의로 수정할 수 없지만
        // 요청과 응답을 감싸는 래퍼 클래스를 만들면 수정할 수 있다.
        EncryptPasswordWrapper wrapper = new EncryptPasswordWrapper((HttpServletRequest) request);
        
        // 다음 필터를 호출하거나, 서블릿, JSP를 호출한다.
        filterChain.doFilter(wrapper, response);

        // System.out.println(((HttpServletRequest) request).getMethod());

        System.out.println("서블릿 동작 후 코드 실행");
    }

    @Override
    public void destroy() {
        // 컨테이너가 필터를 제거할 때 호출한다.
        System.out.println("필터가 제거 됨");
    }

}
