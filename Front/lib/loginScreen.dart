import 'package:flutter/material.dart';
import 'package:inter_library_loan_new/main2.dart';
import 'signupScreen.dart';
import 'package:inter_library_loan_new/screens/book_request_screen.dart';
import 'package:inter_library_loan_new/screens/request_list_screen.dart';
import 'package:inter_library_loan_new/screens/ai_recommendation_screen.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('XX도서관'),
        ),
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _id;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '로그인',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'ID',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _id = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ID를 입력하세요';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '비밀번호를 입력하세요';
                }
                return null;
              },
            ),
            SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      // 회원가입 버튼 클릭 시 로직 추가
                      print('아이디/비밀번호 찾기 버튼 클릭됨');
                      // 예: 회원가입 페이지로 이동
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },
                    child: Text('아이디/비밀번호 찾기', style: TextStyle(fontSize: 15,color: Colors.grey)),
                  ),
                  SizedBox(
                    width: 500, // 화면 너비에 맞게 버튼을 키움
                    height: 50, // 버튼 높이를 설정
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // 여기에 로그인 로직 추가
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        }
                      },
                      child: Text('로그인',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xF5F5F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),// 버튼 색상 변경
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  SizedBox(
                    width: 500, // 화면 너비에 맞게 버튼을 키움
                    height: 50, // 버튼 높이를 설정
                    child: ElevatedButton(
                      onPressed: () {
                        // 회원가입 버튼 클릭 시 로직 추가
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text('회원가입',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xF5F5F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),// 버튼 색상 변경

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
