package com.btt.ill;

import com.btt.ill.model.UserModel;
import com.btt.ill.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class DatabaseInitializer implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {
        UserModel admin = new UserModel();
        admin.setEmail("admin@example.com");
        admin.setLib("admin_lib");
        admin.setName("admin");
        admin.setPw(passwordEncoder.encode("1234"));
        admin.setRole("ROLE_ADMIN");

        userRepository.save(admin);
    }
}

