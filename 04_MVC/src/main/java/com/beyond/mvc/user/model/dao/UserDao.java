package com.beyond.mvc.user.model.dao;

import com.beyond.mvc.user.model.vo.User;

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
    User getUserById(String userId);
}
