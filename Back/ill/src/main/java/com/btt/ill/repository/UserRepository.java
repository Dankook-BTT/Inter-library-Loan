package com.btt.ill.repository;

import com.btt.ill.model.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserModel, Long> {
    UserModel findByUid(Long uid);
    UserModel findByName(String name);
    UserModel findByEmail(String email);
}
