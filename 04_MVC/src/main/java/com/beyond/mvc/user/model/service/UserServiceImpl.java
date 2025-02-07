package com.beyond.mvc.user.model.service;

import com.beyond.mvc.user.model.dao.UserDao;
import com.beyond.mvc.user.model.dao.UserDaoImpl;
import com.beyond.mvc.user.model.vo.User;

/**
 * <p>
 *
 * <p>packageName    : com.beyond.mvc.user.model.service
 * <p>fileName       : UserServiceImpl
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
public class UserServiceImpl implements UserService{

    private final UserDao userDao;
    public UserServiceImpl() {
        userDao = new UserDaoImpl();
    }

    @Override
    public User login(String userId, String password){
        User user = null;

        user = userDao.getUserById(userId);

        return user;
    }

}
