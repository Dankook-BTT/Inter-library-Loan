//loginScreen.dart와 main.dart의 차이점:
//main.dart: 파일 전체적인 구조 설정한다고 보면 됨
//loginScreen.dart: 로그인 화면의 UI 설정

import 'package:flutter/material.dart';//material 패키지를 가져오는데, 이 material 패키지의 요소에는 대략
//위젯, 화면 스타일, 네비게이션 및 라우팅, 상호작용 등의 기능이 있음
import 'package:inter_library_loan_new/main.dart'; //파일의 진입점을 구현한 메인 다트 파일 소환
import 'package:inter_library_loan_new/screens/signupScreen.dart';//회원가입 화면을 구현한 다트 파일 소환
import 'package:inter_library_loan_new/screens/book_request_screen.dart';//도서 요청 화면을 구현한 다트 파일 소환
import 'package:inter_library_loan_new/screens/request_list_screen.dart';//도서 목록 화면을 구현한 다트 파일 소환
import 'package:inter_library_loan_new/screens/ai_recommendation_screen.dart'; //ai가 추천하는 도서 화면을 구현한 다트 파일 소환
import 'package:inter_library_loan_new/screens/mypage.dart'; //사서 개인의 마이페이지 화면을 구현한 다트 파일 소환
import 'package:inter_library_loan_new/screens/idCheck.dart'; //아이디 찾기 화면을 구현한 다트 파일 소환
import 'package:inter_library_loan_new/screens/pwCheck.dart'; //비번 찾기 화면을 구현한 다트 파일 소환

//애플리케이션의 루트 위젯을 정의하는 클래스
class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //초기 경로를 '/login'으로 설정하여 앱이 시작될 때 LoginScreen을 표시
      initialRoute: '/login',
      //라우팅을 설정하여 경로와 화면을 연결
      routes: {
        '/login': (context) =>
            Scaffold(
              appBar: AppBar(
                title: Text('XX도서관'),
              ),
              body: LoginScreen(),
            ),
        //추가적인 경로를 필요에 따라 여기에 추가할 수 있음
        // 예: '/home': (context) => HomeScreen(),
        //home 속성을 사용하지 않고 모든 경로를 routes로 관리하도록 변경함으로써
        //경로 설정을 명확하게 하고 충돌을 피하도록 수정을 했음
      },
    );
  }
}

//로그인 화면을 정의하는 StatefulWidget 클래스
//StatefulWidget은 상태를 가질 수 있는 위젯으로
//화면에서 사용자 상호작용이나 데이터에 따라 변화를 관리함
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
  //createState() 메서드는 StatefulWidget이 처음 생성될 때 호출,
  //이 메서드는 해당 위젯의 상태를 관리할 객체를 반환함
  //여기서는 _LoginScreenState 객체를 반환하여 상태를 관리하도록 함
}

//로그인 화면의 상태를 관리하는 State 클래스
// _LoginScreenState 클래스는 LoginScreen의 상태와 UI를 관리함
// 주로 사용자 입력 처리, 화면 업데이트 등을 담당
class _LoginScreenState extends State<LoginScreen> {
  //클래스의 구현 내용은 여기서 추가됨
  
  //로그인 폼의 상태를 관리하기 위한 키
  // _formKey는 Form 위젯의 상태를 관리하고, 폼 검증 등을 수행할 때 사용됨
  final _formKey = GlobalKey<FormState>();
  
  //사용자가 입력한 아이디와 비밀번호를 저장하는 변수
  //둘 다 초기값은 null이며, 사용자가 입력한 값이 할당됨
  String? _id;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), //모든 방향으로 16픽셀 패딩 추가
      child: Form(
        key: _formKey, //Form 위젯의 상태를 관리하는 키 설정
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //수직으로 중앙 정렬
          crossAxisAlignment: CrossAxisAlignment.start, //수평으로 왼쪽 정렬
          children: [
            Center(
              child: Text(
                '로그인', //로그인 화면 제목 텍스트
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40), //40 픽셀의 간격 추가
            TextFormField(
              decoration: InputDecoration(
                labelText: 'ID', //입력 필드 레이블 설정
                border: OutlineInputBorder(), //필드의 외곽선 스타일 설정
              ),
              onChanged: (value) {
                setState(() {
                  _id = value; //입력된 값을 _id 변수에 저장
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ID를 입력하세요'; //입력 검증: 값이 비어있으면 오류 메시지 반환
                }
                return null; //값이 유효하면 null 반환
              },
            ),
            SizedBox(height: 20), //20픽셀의 간격 추가
            TextFormField(
              decoration: InputDecoration(
                labelText: '비밀번호', //입력 필드 레이블 설정
                border: OutlineInputBorder(), //필드의 외곽선 스타일 설정
              ),
              obscureText: true, //비밀번호 입력 시 텍스트 숨기기
              onChanged: (value) {
                setState(() {
                  _password = value; //입력한 값을 _password 변수에 저장
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '비밀번호를 입력하세요'; //입력 검증: 값이 비어있으면 오류 메시지 반환
                }
                return null; //값이 유효하면 null 반환
              },
            ),
            SizedBox(height: 40), //40픽셀의 간격 추가
            Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      // '아이디/비밀번호 찾기' 버튼 클릭 시 로직 추가
                      print('아이디/비밀번호 찾기 버튼 클릭됨');
                      // 예: 비밀번호 찾기 페이지로 이동
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
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
                        backgroundColor: Color(0xF5F5F5), //버튼 배경 색상 설정
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), //버튼 모서리를 둥글게
                        ),// 버튼 색상 변경
                      ),
                    ),
                  ),

                  SizedBox(height: 10), //10픽셀의 간격 추가
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
                        backgroundColor: Color(0xF5F5F5),//버튼 배경 색상 설정
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
