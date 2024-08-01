import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PwCheckScreen extends StatefulWidget {
  @override
  _PwCheckScreenState createState() => _PwCheckScreenState();
}

class _PwCheckScreenState extends State<PwCheckScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _id;
  String? _message;

  Future<void> _checkAndProvidePassword() async {
    final url = Uri.parse('https://example.com/api/check-user'); // 사용자 확인 API 엔드포인트
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'id': _id ?? ''}),
      );

      if (response.statusCode == 200) {
        // 사용자 존재 확인
        final responseData = json.decode(response.body);
        final userExists = responseData['exists'];

        if (userExists) {
          // 예시용 비밀번호 부여 (실제로는 서버에서 생성하여 반환하는 것이 바람직)
          final tempPassword = "example123"; // 예시용 임시 비밀번호
          setState(() {
            _message = '임시 비밀번호: $tempPassword';
          });
        } else {
          // 사용자가 존재하지 않음
          setState(() {
            _message = '존재하지 않는 사용자입니다.';
          });
        }
      } else {
        setState(() {
          _message = '사용자 확인 중 오류가 발생했습니다. 다시 시도해주세요.';
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
        title: Text('비밀번호 찾기'),
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
                '아이디를 입력하세요',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _checkAndProvidePassword(); // 아이디 확인 및 임시 비밀번호 부여
                  }
                },
                child: Text('확인'),
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
