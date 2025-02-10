package com.beyond.mvc.user.model.service;

import com.beyond.mvc.user.model.dao.UserDao;
import com.beyond.mvc.user.model.dao.UserDaoImpl;
import com.beyond.mvc.user.model.vo.User;

import java.sql.Connection;

import static com.beyond.mvc.common.jdbc.JDBCTemplate.close;
import static com.beyond.mvc.common.jdbc.JDBCTemplate.commit;
import static com.beyond.mvc.common.jdbc.JDBCTemplate.rollback;
import static com.beyond.mvc.common.jdbc.JDBCTemplate.getConnection;

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
    public User login(String userId, String userPwd){
        Connection connection = getConnection();
        User user = userDao.getUserById(connection, userId);

        if (user == null || !user.getPassword().equals(userPwd)) {
            return null;
        }

        close(connection);

        return user;
    }

    @Override
    public int save(User user){
        int result = 0;

        Connection connection = getConnection();
        result = userDao.insertUser(connection, user);

        if (result > 0) {
            commit(connection);
        } else {
            rollback(connection);
        }

        close(connection);

        return result;
    }

}
