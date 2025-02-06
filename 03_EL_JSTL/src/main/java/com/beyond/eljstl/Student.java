package com.beyond.eljstl;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * <p>
 *
 * <p>packageName    : com.beyond.eljstl
 * <p>fileName       : Student
 * <p>author         : hjsong
 * <p>date           : 2025-02-05
 * <p>description    :
 */
/*
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-02-05        hjsong             최초 생성
 */
@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class Student {

    private String name;

    private int age;

    private int math;

    private int english;

}
