package com.beyond.mvc.user.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

/**
 * <p>
 *
 * <p>packageName    : com.beyond.mvc.user.model.vo
 * <p>fileName       : User
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

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private int no;

    private String id;

    private String password;

    private String role;

    private String name;

    private String phone;

    private String email;

    private String address;

    private String hobby;

    private String status;

    private Date enrollDate;

    private Date modifyDate;
}
