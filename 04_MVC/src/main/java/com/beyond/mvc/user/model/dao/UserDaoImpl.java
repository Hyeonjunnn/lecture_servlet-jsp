package com.beyond.mvc.user.model.dao;

import com.beyond.mvc.user.model.vo.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
    public User getUserById(String userId){
        User user = null;
        Connection connection = null;
        // Statement statement = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        // String query = "SELECT * FROM user WHERE id = '" + userId + "' AND status = 'Y'";
        String query = "SELECT * FROM user WHERE id = ? AND status='Y'";

        try {
            Class.forName("org.mariadb.jdbc.Driver");

            connection = DriverManager.getConnection(
                    "jdbc:mariadb://localhost:3306/web",
                    "beyond",
                    "0000"
            );
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

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                resultSet.close();
                statement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return user;
    }

}
