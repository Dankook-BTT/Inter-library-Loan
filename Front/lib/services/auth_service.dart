import 'package:flutter/material.dart';

class AuthService {
  // 예시로 사용할 사용자 데이터
  Map<String, String> _users = {
    'test@example.com': 'password123',
  };

  // 현재 로그인된 사용자의 이메일
  String? _currentUser;

  // 사용자 로그인 메서드
  Future<bool> login(String email, String password) async {
    if (_users.containsKey(email) && _users[email] == password) {
      _currentUser = email;
      return true; // 로그인 성공
    }
    return false; // 로그인 실패
  }

  // 사용자 로그아웃 메서드
  void logout() {
    _currentUser = null;
  }

  // 현재 로그인된 사용자 확인 메서드
  String? getCurrentUser() {
    return _currentUser;
  }

  // 회원가입 메서드
  Future<bool> signUp(String email, String password) async {
    if (!_users.containsKey(email)) {
      _users[email] = password;
      return true; // 회원가입 성공
    }
    return false; // 회원가입 실패 (이미 존재하는 사용자)
  }

  // 인증 여부 확인
  bool isAuthenticated() {
    return _currentUser != null;
  }
}
