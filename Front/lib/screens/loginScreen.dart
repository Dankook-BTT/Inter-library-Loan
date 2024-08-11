//loginScreen.dart와 main.dart의 차이점:
//main.dart: 파일 전체적인 구조 설정한다고 보면 됨
//loginScreen.dart: 로그인 화면의 UI 설정

import 'package:flutter/material.dart';//material 패키지를 가져오는데, 이 material 패키지의 요소에는 대략
//위젯, 화면 스타일, 네비게이션 및 라우팅, 상호작용 등의 기능이 있음
import 'package:http/http.dart' as http; // http 패키지 임포트
import 'dart:convert'; // JSON 파싱을 위해 사용
import 'package:inter_library_loan_new/utils/path.dart';
import 'package:inter_library_loan_new/screens/idCheck.dart'; //아이디 찾기 화면을 구현한 다트 파일 소환
import 'package:inter_library_loan_new/screens/pwCheck.dart'; //비번 찾기 화면을 구현한 다트 파일 소환
import 'package:inter_library_loan_new/screens/book_request_screen.dart';

final url = Uri.parse(AppPath.baseUrl); // 서버의 로그인 엔드포인트 URL

//애플리케이션의 루트 위젯을 정의하는 클래스
class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //라우팅을 설정하여 경로와 화면을 연결
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.bookRequest: (context) => BookRequestScreen(),
        AppRoutes.idCheck: (context) => IdCheckScreen(),
        AppRoutes.pwCheck: (context) => PwCheckScreen(),
        // 추가적인 경로를 필요에 따라 여기에 추가할 수 있음
        // 예: '/home': (context) => HomeScreen(),
        // home 속성을 사용하지 않고 모든 경로를 routes로 관리하도록 변경함으로써
        // 경로 설정을 명확하게 하고 충돌을 피하도록 수정을 했음
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
  String? _userRole = "user";

  Future<void> login() async {
    try {
      final response = await http.post(
        Uri.parse(AppPath.baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'id': 'admin', 'password': 1234}),
      );

      if (response.statusCode == 200) {
        // 로그인 성공
        final UserModel = json.decode(response.body);
        // 예: 토큰 저장, 사용자 정보 저장 등
        Navigator.pushNamed(context, AppRoutes.login); // 홈 화면으로 이동
      } else {
        // 로그인 실패
        final errorData = json.decode(response.body);
        _showErrorDialog(errorData['message'] ?? '로그인에 실패했습니다.');
      }
    } catch (e) {
      _showErrorDialog('로그인 중 오류가 발생했습니다. 다시 시도해주세요.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('오류'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('확인'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XX도서관'),
      ),
      body: Padding(
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
                    //아이디 찾기 버튼
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.idCheck);
                      },
                      child: Text('아이디 찾기', style: TextStyle(fontSize: 15, color: Colors.grey)),
                    ),
                    // 비밀번호 찾기 버튼
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.pwCheck);
                      },
                      child: Text('비밀번호 찾기', style: TextStyle(fontSize: 15, color: Colors.grey)),
                    ),
                    SizedBox(
                      width: 500, // 화면 너비에 맞게 버튼을 키움
                      height: 50, // 버튼 높이를 설정
                      child: ElevatedButton(
                       onPressed: () async {
                         if (_formKey.currentState!.validate()) {
                           try {
                             final response = await http.post(
                                Uri.parse('https://dankook2021.azurewebsites.net/api/login'), // 실제 API 엔드포인트로 변경
                                headers: <String, String>{
                                   'Content-Type': 'application/json; charset=UTF-8',
                                },
                                body: jsonEncode(<String, String>{
                                  'id': _id ?? '', // 사용자가 입력한 ID
                                  'password': _password ?? '', // 사용자가 입력한 비밀번호
                                }),
                              );

                              if (response.statusCode == 200) {
                                    // 로그인 성공
                                  final responseData = json.decode(response.body);
                                  final token = responseData['token']; // 서버에서 반환한 토큰
                                    // 예: 토큰을 안전하게 저장하는 로직 (로컬 스토리지, 세션 등)
                                    // 로그인 성공 후 홈 화면으로 이동
                                  Navigator.pushNamed(context, AppRoutes.bookRequest);
                                } else {
                                    // 로그인 실패
                                  final errorResponse = json.decode(response.body);
                                  _showErrorDialog(errorResponse['message'] ?? '로그인에 실패했습니다.');
                                }
                              } catch (error) {
                                _showErrorDialog('로그인 중 오류가 발생했습니다. 다시 시도해주세요.');
                              }
                            }
                          },
                          child: Text('로그인',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xF5F5F5), //버튼 배경 색상 설정
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15.0), //버튼 모서리를 둥글게
                          ), // 버튼 색상 변경
                        ),
                      ),
                    ),

                    SizedBox(height: 10), //10픽셀의 간격 추가
                    //조건에 따라 회원가입 버튼을 표시
                    if (_userRole == "admin")
                      SizedBox(
                        width: 500, // 화면 너비에 맞게 버튼을 키움
                        height: 50, // 버튼 높이를 설정
                        child: ElevatedButton(
                          onPressed: () {
                            // 회원가입 버튼 클릭 시 로직 추가
                            Navigator.pushNamed(
                                context, AppPath.signUpUrl); // 회원가입 화면으로 이동
                          },
                          child: Text('회원가입',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xF5F5F5), //버튼 배경 색상 설정
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ), // 버튼 색상 변경
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
