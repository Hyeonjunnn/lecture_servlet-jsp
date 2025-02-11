package com.beyond.mvc.user.model.dao;

import com.beyond.mvc.user.model.vo.User;

import java.sql.Connection;

/**
 * <p>
 *
 * <p>packageName    : com.beyond.mvc.user.model.dao
 * <p>fileName       : UserDao
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
public interface UserDao {
    User getUserById(Connection connection, String userId);

    int insertUser(Connection connection, User user);

    int updateUser(Connection connection, User user);

    int deleteUser(Connection connection, int no);

    int updateUserStatus(Connection connection, int no, String status);
}
