//비밀번호가 맞는지 확인하는 화면
import 'package:flutter/material.dart';

class PwCheckScreen extends StatefulWidget {
  @override
  _PwCheckScreenState createState() => _PwCheckScreenState();
}

class _PwCheckScreenState extends State<PwCheckScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _enteredPassword;
  final String _correctPassword = 'password123'; // 예시용 실제 비밀번호 대체

  void _checkPassword() {
    if (_formKey.currentState!.validate()) {
      // 비밀번호가 맞는지 확인
      if (_enteredPassword == _correctPassword) {
        // 비밀번호가 맞으면 성공 메시지 또는 다음 화면으로 이동
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('비밀번호가 확인되었습니다.')),
        );
        // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
      } else {
        // 비밀번호가 틀리면 오류 메시지 표시
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('비밀번호가 틀립니다. 다시 시도하세요.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 확인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  '비밀번호를 입력하세요',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, // 비밀번호 입력 숨기기
                onChanged: (value) {
                  setState(() {
                    _enteredPassword = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력하세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _checkPassword,
                    child: Text(
                      '확인',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
