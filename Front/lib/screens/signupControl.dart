//admin인지 확인한 후
//권한이 있을 경우에만 회원가입 화면에 접근이 가능하도록 만든 파일
import 'package:flutter/material.dart';
import 'package:inter_library_loan_new/models/user_model.dart'; // UserModel을 가져옵니다.

class signupControl extends StatelessWidget {
  final UserModel user; // 현재 사용자 정보

  signupControl({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 회원가입 버튼
            ElevatedButton(
              onPressed: () {
                if (user.isAdmin()) {
                  // 사용자가 admin일 때만 SignUpScreen으로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                } else {
                  // admin이 아닌 경우, 접근 거부 메시지 표시
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('접근 권한이 없습니다.')),
                  );
                }
              },
              child: Text('회원가입 화면으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Screen'),
      ),
      body: Center(
        child: Text('Sign Up Form Here'),
      ),
    );
  }
}