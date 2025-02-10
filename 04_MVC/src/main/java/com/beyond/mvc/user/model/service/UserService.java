package com.beyond.mvc.user.model.service;

import com.beyond.mvc.user.model.vo.User;

import java.sql.Connection;

/**
 * <p>
 *
 * <p>packageName    : com.beyond.mvc.user.model.service
 * <p>fileName       : UserService
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
public interface UserService {
    User login(String userId, String password);

    int save(User user);
}
