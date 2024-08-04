package com.btt.ill.service;

import com.btt.ill.model.UserModel;
import com.btt.ill.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    /*==검색 기능--
     * uid
     * id
     * 이름
     * 이메일
     */
    public UserDetails loadUserByUid(Long uid) throws UsernameNotFoundException {
        UserModel user = userRepository.findByUid(uid);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return user;
    }
    public UserModel loadUserById(String id) throws UsernameNotFoundException {
        UserModel user = userRepository.findById(id);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with userId: " + id);
        }
        return user;
    }
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserModel user = userRepository.findByName(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with username: " + username);
        }
        return user;
    }
    public UserDetails loadUserByEmail(String email) throws UsernameNotFoundException {
        UserModel user = userRepository.findByEmail(email);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with email: " + email);
        }
        return user;
    }

    // password 비교 기능
    public boolean checkPassword(UserModel user, String rawPassword) {
        return passwordEncoder.matches(rawPassword, user.getPassword());
    }

    /*--생성기능--
     *
     */
    public UserModel createUser(UserModel user) {
        return userRepository.save(user);
    }

//    public UserModel updateUser(Long id, UserModel user) {
//        return userRepository.findById(id).map(user -> {
//            user.setName(updatedUser.getName());
//            if (!updatedUser.getPassword().isEmpty()) {
//                user.setPassword(passwordEncoder.encode(updatedUser.getPassword()));
//            }
//            user.setRoles(updatedUser.getRoles());
//            user.setId(updatedUser.getId());
//            return userRepository.save(user);
//        }).orElseThrow(() -> new RuntimeException("User not found with id " + uid));
//    }
}
