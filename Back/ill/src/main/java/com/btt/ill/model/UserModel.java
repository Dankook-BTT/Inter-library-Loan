package com.btt.ill.model;


import jakarta.persistence.*;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@Entity
@Data
@Table(name="users")
public class UserModel implements UserDetails {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String pw;

    @Column
    private String lib;

    @Column
    private String email;

    @Column
    private String name;

    @Column
    private String role;
    
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // 권한 설정
        return List.of();
    }

    @Override
    public String getPassword() {
        return pw;
    }

    @Override
    public String getUsername() {
        return name;
    }
}
