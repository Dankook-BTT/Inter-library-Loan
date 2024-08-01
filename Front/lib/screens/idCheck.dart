//아이디를 확인하는 화면
import 'package:flutter/material.dart';

class IdCheckScreen extends StatefulWidget {
  @override
  _IdCheckScreenState createState() => _IdCheckScreenState();
}

class _IdCheckScreenState extends State<IdCheckScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _enteredId;
  final String _correctId = 'admin'; // 예시용 실제 아이디 대체

  void _checkId() {
    if (_formKey.currentState!.validate()) {
      // 아이디가 맞는지 확인
      if (_enteredId == _correctId) {
        // 아이디가 맞으면 성공 메시지 또는 다음 화면으로 이동
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('아이디가 확인되었습니다.')),
        );
        // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
      } else {
        // 아이디가 틀리면 오류 메시지 표시
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('아이디가 틀립니다. 다시 시도하세요.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아이디 확인'),
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
                  '아이디를 입력하세요',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '아이디',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _enteredId = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '아이디를 입력하세요';
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
                    onPressed: _checkId,
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
