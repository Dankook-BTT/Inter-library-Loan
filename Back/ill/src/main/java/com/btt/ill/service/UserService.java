package com.btt.ill.service;

import com.btt.ill.model.UserModel;
import com.btt.ill.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserModel user = userRepository.findByName(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with username: " + username);
        }
        return user;
    }

    public Optional<UserModel> loadUserById(Long id) throws UsernameNotFoundException {
        return userRepository.findById(id);
    }

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
