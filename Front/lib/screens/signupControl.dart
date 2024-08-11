//admin인지 확인한 후
//권한이 있을 경우에만 회원가입 화면에 접근이 가능하도록 만든 파일
import 'package:flutter/material.dart';
import 'package:inter_library_loan_new/models/user_model.dart'; // UserModel을 가져옵니다.
import 'package:inter_library_loan_new/utils/path.dart';
class SignUpControl extends StatelessWidget {
  final UserModel user; // 현재 사용자 정보

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Control'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            SizedBox(height: 20),
            // 여기에 가입 관리 관련 콘텐츠를 추가할 수 있습니다.
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.myPage);
              },
              child: Text('Go to My Page'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.requestList);
              },
              child: Text('Go to Request List'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.aiRecommendation);
              },
              child: Text('Go to AI Recommendation'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.data);
              },
              child: Text('Go to Data Screen'),
            ),
          ],
        ),
      ),
    );
  }


  SignUpControl({required this.user});

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