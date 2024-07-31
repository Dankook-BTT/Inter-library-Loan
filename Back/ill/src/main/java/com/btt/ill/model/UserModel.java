package com.btt.ill.model;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@Setter @Getter
@Entity
public class UserModel implements UserDetails {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long uid;

    @Column(nullable = false, unique = true)
    private String id;

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

    //TODO 이게 뭔지 주석 달아놓기
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of();
    }

    @Override
    public String getPassword() {
        return pw;
    }

    @Override
    public String getUsername() {
        return id;
    }
}
