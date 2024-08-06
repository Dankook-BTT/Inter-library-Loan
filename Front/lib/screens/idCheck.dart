import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final url = Uri.parse('https://dankook2021.azurewebsites.net/id-check'); // 아이디 찾기 API 엔드포인트
class IdCheckScreen extends StatefulWidget {
  @override
  _IdCheckScreenState createState() => _IdCheckScreenState();
}

class _IdCheckScreenState extends State<IdCheckScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _message;

  void _sendEmailForId() {
    // 이메일 발송 로직을 구현합니다.
    // 예를 들어, 서버로 이메일을 보내 아이디를 찾는 요청을 합니다.
    // 여기에서는 성공 여부를 시뮬레이션합니다.

    bool emailSentSuccessfully = true; // 실제 이메일 발송 결과에 따라 설정

    if (emailSentSuccessfully) {
      // 이메일 발송이 성공하면 로그인 화면으로 이동
      Navigator.pushNamed(context, '/');
    } else {
      // 이메일 발송 실패 시 사용자에게 메시지를 표시
      setState(() {
        _message = '아이디 발송에 실패했습니다. 다시 시도하세요.';
      });
    }
  }


  Future<void> _sendToEmailForId() async {
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': _email ?? ''}),
      );

      if (response.statusCode == 200) {
        // 이메일 발송 성공
        setState(() {
          _message = '입력하신 이메일로 아이디가 발송되었습니다.';
        });
      } else {
        // 이메일 발송 실패
        final errorData = json.decode(response.body);
        setState(() {
          _message = errorData['message'] ?? '아이디 발송에 실패했습니다.';
        });
      }
    } catch (e) {
      setState(() {
        _message = '서버와의 통신 중 오류가 발생했습니다.';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아이디 찾기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '이메일을 입력하세요',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일을 입력하세요';
                  }
                  // 간단한 이메일 형식 검증
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return '유효한 이메일을 입력하세요';
                  }
                  return null;
                },

              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _sendToEmailForId(); // 이메일로 아이디 발송 요청
                  }
                },
                child: Text('아이디 발송'),
              ),
              SizedBox(height: 20),
              if (_message != null)
                Text(
                  _message!,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
