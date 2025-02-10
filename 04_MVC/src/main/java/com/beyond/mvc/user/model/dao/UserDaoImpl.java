package com.beyond.mvc.user.model.dao;

import static com.beyond.mvc.common.jdbc.JDBCTemplate.close;

import com.beyond.mvc.user.model.vo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * <p>
 *
 * <p>packageName    : com.beyond.mvc.user.model.dao
 * <p>fileName       : UserDaoImpl
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
public class UserDaoImpl implements UserDao{
    @Override
    public User getUserById(Connection connection, String userId){
        User user = null;
        // Statement statement = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        // String query = "SELECT * FROM user WHERE id = '" + userId + "' AND status = 'Y'";
        String query = "SELECT * FROM user WHERE id = ? AND status='Y'";

        try {
            // statement = connection.createStatement();
            // resultSet = statement.executeQuery(query);

            statement = connection.prepareStatement(query);
            statement.setString(1, userId);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                user = new User();

                user.setNo(resultSet.getInt("no"));
                user.setId(resultSet.getString("id"));
                user.setPassword(resultSet.getString("password"));
                user.setRole(resultSet.getString("role"));
                user.setName(resultSet.getString("name"));
                user.setPhone(resultSet.getString("phone"));
                user.setEmail(resultSet.getString("email"));
                user.setAddress(resultSet.getString("address"));
                user.setHobby(resultSet.getString("hobby"));
                user.setStatus(resultSet.getString("status"));
                user.setEnrollDate(resultSet.getDate("enroll_date"));
                user.setModifyDate(resultSet.getDate("modify_date"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // JDBCTemplate.close(resultSet);
            close(resultSet);
            // JDBCTemplate.close(statement);
            close(statement);
        }

        return user;
    }

    @Override
    public int insertUser(Connection connection, User user){
        int result = 1;

        PreparedStatement statement = null;

        String query = "INSERT INTO user(id, password, name, phone, email, address, hobby) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?)";

        // String query = "INSERT INTO user" +
        //         "VALUES (NULL, ?, ?, DEFAULT, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";

        try {

            // connection.setAutoCommit(false);

            statement = connection.prepareStatement(query);

            statement.setString(1, user.getId());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getName());
            statement.setString(4, user.getPhone());
            statement.setString(5, user.getEmail());
            statement.setString(6, user.getAddress());
            statement.setString(7, user.getHobby());

            result = statement.executeUpdate();

            // if (result > 0) {
            //     connection.commit();
            // } else {
            //     connection.rollback();
            // }

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            close(statement);

        }

        return result;
    }

}
