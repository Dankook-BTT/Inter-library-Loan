import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inter_library_loan_new/utils/path.dart';

class AdminCreationScreen extends StatefulWidget {
  @override
  _AdminCreationScreenState createState() => _AdminCreationScreenState();
}

class _AdminCreationScreenState extends State<AdminCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _name;
  String? _errorMessage;

  Future<void> _createAdminAccount() async {
    if (!_formKey.currentState!.validate()) return;

    final url = Uri.parse('https://example.com/api/create-admin'); // 실제 API 엔드포인트로 변경
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': _email,
          'password': _password,
          'name': _name,
        }),
      );

      if (response.statusCode == 200) {
        // 어드민 계정 생성 성공
        setState(() {
          _errorMessage = '어드민 계정이 성공적으로 생성되었습니다.';
        });
      } else {
        // 어드민 계정 생성 실패
        setState(() {
          _errorMessage = '어드민 계정 생성에 실패했습니다. 다시 시도해주세요.';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = '서버와의 통신 중 오류가 발생했습니다.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('어드민 계정 생성'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: '이메일',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일을 입력하세요';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return '유효한 이메일을 입력하세요';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '이름',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이름을 입력하세요';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력하세요';
                  }
                  if (value.length < 6) {
                    return '비밀번호는 최소 6자 이상이어야 합니다';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createAdminAccount,
                child: Text('계정 생성'),
              ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


class CreateAdminScreen extends StatefulWidget {
  @override
  _CreateAdminScreenState createState() => _CreateAdminScreenState();
}

class _CreateAdminScreenState extends State<CreateAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Admin'),
      ),
      body: Column(
        children: [
          // 페이지의 콘텐츠를 여기에 추가
          Expanded(
            child: Center(
              child: Text('Create Admin 페이지의 콘텐츠를 여기에 추가하세요'),
            ),
          ),
          // 네비게이션 버튼 추가
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Book Request'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/main/request-list');
                  },
                  child: Text('Request List'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/main/ai-recommendation');
                  },
                  child: Text('AI Recommendation'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/main/my-page');
                  },
                  child: Text('My Page'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/admin/admin_approval');
                  },
                  child: Text('Admin Approval'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
